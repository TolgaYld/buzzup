const createError = require("http-errors");
const errorHandler = require("../../../errors/errorHandler");
const axios = require("axios");
const { getUserId } = require("@TolgaYld/core-buzzup");
const { catchGraphQLResolverErrors } = require("../../../core/utils/graphqlUtils");

const Post = {
  created_by: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.get(
      `${process.env.AUTHSERVICE}/find/${parent.user._id}`,
      {
        type: "FindUser",
        headers,
      }
    );

    if (response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),


  channels: catchGraphQLResolverErrors(async (parent) => {
    return parent.channels;
  }, errorHandler),

  comments: catchGraphQLResolverErrors(async (parent) => {
    return parent.comments;
  }, errorHandler),

  likes: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    return parent.likes;
  }, errorHandler),

  dislikes: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    return parent.dislikes;
  }, errorHandler),
};

module.exports = Post;
