const jwt = require("jsonwebtoken");

const getUserId = async (req, requireAuth = true) => {
    const header = await req.headers.authorization;

    if (header) {
        try {
            const token = header.split(" ")[1];
            const decoded = jwt.verify(token, process.env.SECRET_KEY);
            return decoded.id;
        } catch (e) {
            throw new Error("JWT Error: " + e);
        }
    }
    if (requireAuth) {
        throw new Error("No token retrieved");
    }
    return null;
};

module.exports = getUserId;