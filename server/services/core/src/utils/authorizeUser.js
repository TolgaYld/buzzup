const User = require("../db/models/userModel");

const authorizeUser = (errorHandler) => {
    if (typeof errorHandler !== "function") {
        throw new Error("A valid errorHandler function must be provided.");
    }
    return async (req, res, next) => {
        const userId = req.headers.authorization;
        if (!userId) {
            return await errorHandler(401, "unauthorized", !!req.t, req, res);
        }
        try {
            const user = await User.findById(userId).exec();
            if (!user) {
                return await errorHandler(401, "unauthorized", !!req.t, req, res);
            }
            req.user = user;
            next();
        } catch (error) {
            await errorHandler(500, error.message || "unexpected-error", !!req.t, req, res);
        }
    };
};

module.exports = authorizeUser;