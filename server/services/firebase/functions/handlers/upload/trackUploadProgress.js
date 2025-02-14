import { FieldValue } from "firebase-admin/firestore";
import { getFunctions } from "firebase-admin/functions";

import { db } from "../../init.js";


/**
 * @param {import("firebase-functions/v2/storage").StorageEvent} event
 */
export const trackUploadProgressHandler = async (event) => {
    const filePath = event.data.name;
    const matches = filePath.match(/^users\/([^/]+)\/media\/tmp\/pipeline\/([^/]+)$/);

    if (!matches) return;

    const userId = matches[1];
    const mediaId = matches[2];

    console.log(`file: ${filePath}`);

    const userRef = db.collection("users").doc(userId);
    const userDoc = await userRef.get();

    if (!userDoc.exists) {
        console.warn(`User ${userId} is not exists.`);
        return;
    }

    const jobRef = db.collection("users").doc(userId).collection("uploadJobs").doc(mediaId);
    const jobDoc = await jobRef.get();

    if (!jobDoc.exists) {
        console.warn(`UploadJob ${mediaId} is not exists for user: ${userId}.`);
        return;
    }

    const jobData = jobDoc.data();

    if (jobData.status === "processing" || jobData.status === "done") return;

    // `completedFiles` is incremented by 1
    const fileUri = `gs://${event.bucket}/${filePath}`;
    await jobRef.update({
        completedFiles: FieldValue.increment(1),
        fileUris: FieldValue.arrayUnion([fileUri]),
        status: "uploading",
        progress: 50 * (jobData.completedFiles + 1) / jobData.totalFiles,
        updatedAt: new Date(),
    });

    console.log(`progress updated: ${jobData.completedFiles + 1}/${jobData.totalFiles}`);

    if (jobData.completedFiles + 1 === jobData.totalFiles) {
        console.log(`all files uploaded for ${mediaId}`);
        await jobRef.update({ status: "uploaded" });

        const queue = getFunctions().taskQueue("transformVideoQueue");
        await queue.enqueue({ userId, uploadedJobId: mediaId });
    }
}