const { getUserId, POSTSERVICE } = require("@TolgaYld/core-buzzup");
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
      `${POSTSERVICE}/create`,
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
      `${POSTSERVICE}/update/${args.id}`,
      {
        type: "UpdatePost",
        data: {
          ...args.data,
          updated_by: id,
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
      `${POSTSERVICE}/likeOrDislike/${args.id}`,
      {
        type: "LikeOrDislikePost",
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

  togglePublicVotePost: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.patch(
      `${POSTSERVICE}/togglePublicVote/${args.id}`,
      {
        type: "TogglePublicVotePost",
        data: {
          vote: args.vote,
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
      `${POSTSERVICE}/delete/${args.id}`,
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
