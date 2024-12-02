const { getUserId } = require("@TolgaYld/core-buzzup");
const createError = require("http-errors");
const axios = require("axios");
const errorHandler = require("../../../errors/errorHandler");
const { catchGraphQLResolverErrors } = require("../../../core/utils/graphqlUtils");

module.exports = {
  createPost: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.post(
      `${process.env.POSTSERVICE}/create`,
      {
        type: "CreatePost",
        data: {
          ...args.data,
        },
      },
      { headers }
    );

    if (response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),


  updatePost: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.patch(
      `${process.env.POSTSERVICE}/update/${args.id}`,
      {
        type: "UpdatePost",
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


  likeOrDislikePost: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.patch(
      `${process.env.POSTSERVICE}/likeOrDislike/${args.id}`,
      {
        type: "UpdatePost",
        data: {
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

  deletePostFromDb: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.delete(
      `${process.env.POSTSERVICE}/delete/${args.id}`,
      {
        headers,
        data: {
          type: "DeletePostFromDb",
        },
      }
    );

    if (response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),
};
