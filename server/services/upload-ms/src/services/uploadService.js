const { S3Client, PutObjectCommand } = require("@aws-sdk/client-s3");
// const { getSignedUrl } = require("@aws-sdk/s3-request-presigner");
const { v4: uuidv4 } = require("uuid");
const { UPLOADSERVICESUBDOMAIN, redis } = require("@TolgaYld/core-buzzup");
const sharp = require("sharp");
const ffmpeg = require("fluent-ffmpeg");
const fs = require("fs");
const path = require("path");
const { promisify } = require("util");
const writeFile = promisify(fs.writeFile);
const unlink = promisify(fs.unlink);

const getVideoMetadata = async (filePath) => {
    return new Promise((resolve, reject) => {
        ffmpeg.ffprobe(filePath, (err, metadata) => {
            if (err) {
                return reject(err);
            }
            const videoStream = metadata.streams.find(s => s.codec_type === "video");

            if (videoStream == null) {
                return reject(new Error("Kein Video-Stream in Datei gefunden."));
            }

            resolve({
                width: videoStream.width || 0,
                height: videoStream.height || 0
            });
        });
    });
};


class UploadService {
    static instance;
    constructor() {
        if (UploadService.instance) {
            return UploadService.instance;
        }

        this.s3Client = new S3Client({
            endpoint: process.env.SPACES_ENDPOINT,
            credentials: {
                accessKeyId: process.env.SPACES_ACCESS_KEY,
                secretAccessKey: process.env.SPACES_SECRET_KEY,
            },
        });
        this.bucketName = process.env.SPACES_BUCKET_NAME;

        UploadService.instance = this;
    }

    /**
     * Generate a presigned URL for uploading a file
     * @param {string} fileName - Name of the file
     * @param {string} fileType - MIME type of the file
     * @returns {Promise<{url: string, key: string}>}
     */
    async generatePresignedUrl() {
        const uniqueKey = uuidv4();

        // const command = new PutObjectCommand({
        //     Bucket: this.bucketName,
        //     Key: uniqueKey,
        //     ContentType: fileType,
        // });

        const expiresInMinutes = 9;
        const duration = minutes * 60;
        const expiryUnixTimestampInMs = Date.now() + (expiresInMinutes || 9) * 60 * 1000;

        const presignedUrl = `${UPLOADSERVICESUBDOMAIN}/upload/${uniqueKey}`;
        // const presignedUrl = await getSignedUrl(this.s3Client, command, {
        //     expiresIn: duration,
        // });

        try {
            await redis.set(uniqueKey, JSON.stringify({ url: presignedUrl, expiresAt: expiryUnixTimestampInMs }), { pxat: expiryUnixTimestampInMs });
        } catch (error) {
            console.error("❌ Error generating presigned URL (Redis-Error):", error);
            throw new Error("Failed to generate presigned URL");
        }
        return {
            url: presignedUrl,
            key: uniqueKey,
        };
    }

    /**
    * Upload multiple files directly to DigitalOcean Spaces and return their URLs
    * @param {Array} files - Array of files [{ data, fileType }]
    * @param {string} key - The unique key stored in Redis (same for all files)
    * @returns {Promise<Array<string>>} - List of uploaded file URLs
    */
    async uploadData(files, key) {
        if (files == null || files.length === 0) {
            throw new Error("no files provided for upload.");
        }
        try {
            const redisKeyEntry = await redis.get(key);
            if (redisKeyEntry == null) {
                throw new Error("presigned URL not found or expired.");
            }

            const { expiresAt } = JSON.parse(redisKeyEntry);
            if (Date.now() > expiresAt) {
                throw new Error("Presigned URL has expired.");
            }

            const uploadPromises = files.map(async ({ data, fileType }, index) => {
                const fileExtension = fileType.split("/")[1] || "bin";
                const uniqueKey = `${uuidv4()}.${fileExtension}`;
                let processedData = data;

                if (fileType.startsWith("image/")) {
                    console.log(`🖼️ Processing image: ${uniqueKey}`);
                    processedData = await sharp(data)
                        .resize(800)
                        .jpeg({ quality: 80 })
                        .toBuffer();
                }

                if (fileType.startsWith("video/")) {
                    const tempInputPath = path.join(__dirname, `temp_${uniqueKey}`);
                    await writeFile(tempInputPath, data);

                    const tempOutputPath = path.join(__dirname, `compressed_${uniqueKey}`);

                    await new Promise(async (resolve, reject) => {
                        try {
                            const { width, height } = await getVideoMetadata(tempInputPath);
                            if (width === 0 || height === 0) {
                                return reject(new Error("Invalid video dimensions."));
                            }
                            const maxWidth = 1280;
                            const maxHeight = 720;

                            ffmpeg(tempInputPath)
                                .output(tempOutputPath)
                                .videoCodec("libx264")
                                .audioCodec("aac")
                                .outputOptions([
                                    `-vf scale=${maxWidth}:${maxHeight}:force_original_aspect_ratio=decrease`,
                                    "-preset fast",
                                    "-crf 23"
                                ])
                                .on("end", () => {
                                    console.log(`video successfully edited: ${tempOutputPath}`);
                                    resolve();
                                })
                                .on("error", (err) => {
                                    console.error("error during editing:", err);
                                    reject(err);
                                })
                                .run();
                        } catch (error) {
                            reject(error);
                        }
                    });

                    processedData = await fs.promises.readFile(tempOutputPath);
                    await unlink(tempInputPath);
                    await unlink(tempOutputPath);
                }

                const command = new PutObjectCommand({
                    Bucket: this.bucketName,
                    Key: uniqueKey,
                    Body: processedData,
                    ContentType: fileType,
                });

                await this.s3Client.send(command);
                console.log(`file uploaded successfully: ${uniqueKey}`);

                const fileUrl = `https://${process.env.SPACES_BUCKET_NAME}.${process.env.SPACES_REGION}.digitaloceanspaces.com/${uniqueKey}`;
                return fileUrl;
            });
            await redis.del(key);
            return await Promise.all(uploadPromises);

        } catch (error) {
            console.error("❌ Error uploading files:", error);
            throw new Error("Failed to upload files.");
        }
    }

    /**
     * Factory method to create or retrieve the single instance of UploadService
     * @returns {UploadService}
     */
    static getInstance() {
        if (UploadService.instance == null) {
            UploadService.instance = new UploadService();
        }
        return UploadService.instance;
    }
}

module.exports = UploadService;
