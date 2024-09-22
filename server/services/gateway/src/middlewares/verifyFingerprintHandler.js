const crypto = require("crypto");
const client = require("../db/redis/connection");

const SECRET_KEY = process.env.SECRET_KEY_PERMISSION;

async function verifyFingerprint(receivedFingerprint, timestamp, nonce) {
  const now = Date.now();
  const timeDiff = now - timestamp;

  // Verify that the timestamp is within the acceptable time-span
  const expirationTimeOfTimestamp = 3 * 60 * 1000; // 3 minutes in ms
  if (timeDiff < 0 || timeDiff > expirationTimeOfTimestamp) {
    return false; // Der Fingerprint ist abgelaufen oder liegt in der Zukunft
  }
  const nonceExists = await client.exists(nonce);
  if (nonceExists) {
    return false; // nonce already used
  }

  const data = `${timestamp}|${nonce}|${SECRET_KEY}`;
  const expectedFingerprint = crypto
    .createHash("sha256")
    .update(data)
    .digest("hex");

  // Mark nonce as used with an expiration time
  await client.setEx(nonce, 30 * 60, "used"); // 30 minutes expiration time

  return receivedFingerprint === expectedFingerprint;
}
module.exports = verifyFingerprint;
