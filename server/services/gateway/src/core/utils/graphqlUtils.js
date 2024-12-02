const catchGraphQLResolverErrors = (fn, errorHandler) => {
    if (typeof errorHandler !== "function") {
        throw new Error("A valid errorHandler function must be provided.");
    }

    return async (parent, args, context, info) => {
        try {
            return await fn(parent, args, context, info);
        } catch (error) {
            const statusCode = error.statusCode || 500;
            const message = error.message || "unexpected-error";

            errorHandler(statusCode, message, context.req, context.res);

            throw new Error(message);
        }
    };
};

module.exports = {
    catchGraphQLResolverErrors,
};