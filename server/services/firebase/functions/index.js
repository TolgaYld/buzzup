import { REGION } from "./config.js";
import { onTaskDispatched } from "firebase-functions/v2/tasks";
import { onObjectFinalized } from "firebase-functions/v2/storage";

import { trackUploadProgressHandler } from "./handlers/upload/trackUploadProgress.js";
import { transformMediaQueueHandler } from "./handlers/upload/processUpload.js";
import { createUserInFirestoreHandler, deleteUserInFirestoreHandler } from "./handlers/auth/authProcess.js";

export const onMediaUploaded = onObjectFinalized(
    { region: REGION },
    trackUploadProgressHandler,
);

export const transformMediaQueue = onTaskDispatched(
    {
        region: REGION,
        timeoutSeconds: 10 * 60 - 1,
        memory: "8GiB",
        cpu: 4,
        concurrency: 1,
        retryConfig: {
            maxAttempts: 1
        }
    },
    transformMediaQueueHandler,
);

export const createUserInFirestore = createUserInFirestoreHandler;

export const deleteUserInFirestore = deleteUserInFirestoreHandler;