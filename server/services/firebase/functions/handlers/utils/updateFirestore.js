import { db } from "../../init.js";

/**
 * updates the status of upload job in db.
 * @param {string} uploadJobId 
 * @param {string} status 
 */
export async function updateUploadStatus(userId, uploadJobId, status) {
    await db.collection(`users/${userId}uploadJobs`).doc(uploadJobId).update({ status: status });
    console.log(`status of ${uploadJobId} set to ${status}.`);
}
