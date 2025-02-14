import { db, storage } from "../../init.js";
import sharp from "sharp";
import ffmpeg from "fluent-ffmpeg";
import fs from "fs";
import path from "path";
import { promisify } from "util";
import { FieldValue } from "firebase-admin/firestore";

const unlink = promisify(fs.unlink);
const MAX_VIDEO_DURATION = 180; // 3 minutes

/**
 * checks the file type of given file.
 * @param {string} filePath - local path of file
 * @returns {Promise<"video" | "image" | "unknown">} - returns "video" if file is video, "image" if file is image, "unknown" if file is neither video nor image.
 */
export const getFileType = async (filePath) => {
    const isVideo = await new Promise((resolve) => {
        ffmpeg.ffprobe(filePath, (err, metadata) => {
            if (err || !metadata.streams.some(s => s.codec_type === "video")) {
                resolve(false);
            } else {
                resolve(true);
            }
        });
    });

    if (isVideo) return "video";



    const isImage = await sharp(filePath)
        .metadata()
        .then(() => true)
        .catch(() => false);

    if (isImage) return "image";

    return "unknown";
};

/**
 * check die duration of video.
 * @param {string} filePath - local path of video.
 * @returns {Promise<number>} - duration of video in seconds.
 */
export const getVideoDuration = async (filePath) => {
    return new Promise((resolve, reject) => {
        ffmpeg.ffprobe(filePath, (err, metadata) => {
            if (err) {
                reject(err);
            } else {
                const duration = metadata.format.duration || 0;
                resolve(duration);
            }
        });
    });
};

/**
 * @param {import("firebase-functions/v2/tasks").Request} task
 */
export const transformMediaQueueHandler = async (task) => {
    console.log(`start transformation upload job: ${task.data.uploadJobId}`);

    const { userId, uploadJobId } = task.data;
    const jobRef = db.collection("users").doc(userId).collection("uploadJobs").doc(uploadJobId);
    const jobDoc = await jobRef.get();

    if (!jobDoc.exists) {
        console.warn(`upload job: ${uploadJobId} doesn't exists.`);
        return;
    }

    const jobData = jobDoc.data();
    const bucket = storage.bucket();
    const processedFiles = [];

    try {
        await jobRef.update({ status: "transformation" });
        for (const fileUri of jobData.fileUris) {
            console.log(`load data from: ${fileUri}`);

            const filePath = fileUri.replace(`gs://${bucket.name}/`, ""); // path of storage
            const file = bucket.file(filePath);
            const tempFilePath = path.join("/tmp", path.basename(filePath));

            // download from bucket
            await file.download({ destination: tempFilePath });

            const fileType = path.extname(filePath).toLowerCase();
            const originalFileName = path.basename(filePath, fileType); // remove extension for file
            let processedFilePath = tempFilePath;
            let processedFileName = `${originalFileName}_720p.${fileType}`;
            let newStoragePath = "";

            const fileCategory = await getFileType(tempFilePath);

            if (fileCategory === "image") {
                console.log(`transform image: ${filePath}`);
                processedFilePath = path.join("/tmp", processedFileName);

                await sharp(tempFilePath)
                    .resize(800)
                    .jpeg({ quality: 80 })
                    .toFile(processedFilePath);

                newStoragePath = `users/${userId}/media/images/quality/${processedFileName}`;

            } else if (fileCategory === "video") {
                const duration = await getVideoDuration(tempFilePath);
                if (duration > MAX_VIDEO_DURATION) {
                    console.warn(`video too long (${duration} sec.). skip this video.`);
                    continue;
                }

                console.log(`transform video with max height of 720p: ${filePath}`);
                processedFilePath = path.join("/tmp", processedFileName);

                const metadata = await new Promise((resolve, reject) => {
                    ffmpeg.ffprobe(tempFilePath, (err, metadata) => {
                        if (err) {
                            reject(err);
                        } else {
                            resolve(metadata);
                        }
                    });
                });

                const { width, height } = metadata.streams.find(s => s.codec_type === "video") || {};
                console.log(`video dimensions: ${width}x${height}`);

                let scaleOption;
                if (width > height) {
                    // landscape
                    scaleOption = "-vf scale=720:-1";
                } else {
                    // portrait
                    scaleOption = "-vf scale=-1:720";
                }

                await new Promise((resolve, reject) => {
                    ffmpeg(tempFilePath)
                        .output(processedFilePath)
                        .videoCodec("libx264")
                        .audioCodec("aac")
                        .outputOptions([
                            scaleOption,
                            "-preset fast",
                            "-crf 23"
                        ])
                        .on("end", () => {
                            console.log(`video successfully transformed: ${processedFilePath}`);
                            resolve();
                        })
                        .on("error", (err) => {
                            console.error(`failure during transformation:`, err);
                            reject(err);
                        })
                        .run();
                });

                newStoragePath = `users/${userId}/media/videos/quality/${processedFileName}`;
            } else {
                console.warn(`unknown file type... skip file: ${filePath}`);
                continue;
            }

            // upload to bucket
            const newFile = bucket.file(newStoragePath);
            await newFile.save(fs.readFileSync(processedFilePath));

            console.log(`file saved in bucket: ${newStoragePath}`);
            processedFiles.push(`gs://${bucket.name}/${newStoragePath}`);

            // CLEANUP 

            // delete originalfiles from bucket

            await file.delete();

            // delete temp files from local
            await unlink(tempFilePath);
            await unlink(processedFilePath);
        }

        // update firestore with processed files
        await jobRef.update({
            status: "transformed",
            fileUris: processedFiles,
            updatedAt: FieldValue.serverTimestamp(),
        });

        console.log(`UploadJob ${uploadJobId} successful.`);
    } catch (error) {
        console.error(`failure during UploadJob ${uploadJobId}:`, error);
        await jobRef.update({ status: "error", errorMessage: error.message });
    }
};
