const crypto = require("crypto");
const client = require("../../db/redis/connection");
const errorHandler = require("../../errors/errorHandler");
const { SECRET_KEY_PERMISSION } = require("@TolgaYld/core-buzzup");

const SECRET_KEY = SECRET_KEY_PERMISSION;

const verifyFingerprint = async (req, reply) => {
    const receivedFingerprint = req.headers["x-fingerprint"];
    const timestamp = req.headers["x-timestamp"];
    const nonce = req.headers["x-nonce"];
    const now = Date.now();
    const timeDiff = now - parseInt(timestamp, 10);

    let isFingerprintValid = true;

    // Verify that the timestamp is within the acceptable time-span
    const expirationTimeOfTimestamp = 3 * 60 * 1000; // 3 minutes in ms
    if (timeDiff < 0 || timeDiff > expirationTimeOfTimestamp) {
        isFingerprintValid = false; // fingerprint is expired
    }
    const nonceExists = await client.exists(nonce);
    if (nonceExists) {
        isFingerprintValid = false; // nonce already used
    }

    const data = `${timestamp}|${nonce}|${SECRET_KEY}`;
    const expectedFingerprint = crypto
        .createHash("sha256")
        .update(data)
        .digest("hex");

    // Mark nonce as used with an expiration time
    await client.setEx(nonce, 30 * 60, "used"); // 30 minutes exp time
    if (receivedFingerprint !== expectedFingerprint) {
        isFingerprintValid = false;
    }
    if (isFingerprintValid) {
        return;
    } else {
        errorHandler(401, "unauthorized");
        reply.code(401).send({ msg: "Unauthorized", success: false, });
    }
};

module.exports = verifyFingerprint;
