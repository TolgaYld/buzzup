import { REGION } from "../../config.js";
import { db, auth } from "../../init.js";
import * as functions from "firebase-functions/v1";

export const createUserInFirestoreHandler = functions.region(REGION).auth.user().onCreate(async (user) => {
    const userRecord = await auth.getUser(user.uid);
    const user_type = userRecord.customClaims?.user_type || "USER";
    return await db.collection("users").doc(user.uid).set({
        email: user.email,
        displayName: user.displayName,
        createdAt: new Date(),
        user_type,
    });
});

export const deleteUserInFirestoreHandler = functions.region(REGION).auth.user().onDelete(async (user) => await db.collection("users").doc(user.uid).delete());
