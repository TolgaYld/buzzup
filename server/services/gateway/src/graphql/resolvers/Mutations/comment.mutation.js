const { getUserId } = require("@TolgaYld/core-buzzup");
const createError = require("http-errors");
const axios = require("axios");
const errorHandler = require("../../../errors/errorHandler");
const { catchGraphQLResolverErrors } = require("../../../core/utils/graphqlUtils");

module.exports = {
  createComment: async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw Error(createError(401, req.t("unauthorized")));
    } else {
      const headers = { Authorization: id };
      try {
        const response = await axios.post(
          process.env.COMMENTSERVICE + "/create",
          {
            type: "CreateComment",
            data: {
              ...args.data,
            },
          },
          { headers },
        );

        if (response.data.success) {
          return response.data.data;
        } else {
          errorHandler(response.status, response.data.msg);
          throw Error(createError(response.status, response.data.msg));
        }
      } catch (error) {
        errorHandler(error.response.status, error.response.data.msg);
        throw Error(error.response.data.msg);
      }
    }
  },

  updateComment: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.patch(
      `${process.env.COMMENTSERVICE}/update/${args.id}`,
      {
        type: "UpdateComment",
        data: {
          ...args.data,
          last_update_from_user: id,
        },
      },
      { headers }
    );

    if (response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),


  likeOrDislikeComment: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.patch(
      `${process.env.COMMENTSERVICE}/update/${args.id}`,
      {
        type: "LikeOrDislikeComment",
        data: {
          user_id: id,
          like: args.like,
        },
      },
      { headers }
    );

    if (response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),


  deleteCommentFromDb: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.delete(
      `${process.env.COMMENTSERVICE}/delete/${args.id}`,
      {
        headers,
      }
    );

    if (response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),
};
