const catchErrors = (fn, errorHandler) => {
    if (typeof errorHandler !== "function") {
        throw new Error("A valid errorHandler function must be provided.");
    }

    return async (req, res, next) => {
        try {
            await fn(req, res, next);
        } catch (error) {
            const statusCode = error.statusCode || 500;
            const message = error.message || "unexpected-error";
            const loadi18next = !!req.t;
            await errorHandler(statusCode, message, loadi18next, req, res);
        }
    };
};

module.exports = catchErrors;