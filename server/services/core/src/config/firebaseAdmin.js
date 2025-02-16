const firebaseAdmin = require("firebase-admin");

let serviceAccount;

if (process.env.FIREBASE_JSON_BASE64) {
    serviceAccount = JSON.parse(Buffer.from(process.env.FIREBASE_JSON_BASE64, "base64").toString());
} else if (process.env.FIREBASE_JSON_PATH) {
    serviceAccount = require(process.env.FIREBASE_JSON_PATH);
} else {
    throw new Error("No Firebase config found");
}

firebaseAdmin.initializeApp({
    credential: firebaseAdmin.credential.cert(serviceAccount),
});

module.exports = firebaseAdmin;