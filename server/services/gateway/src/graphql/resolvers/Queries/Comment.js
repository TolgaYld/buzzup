const createError = require("http-errors");
const errorHandler = require("../../../errors/errorHandler");
const axios = require("axios");
const { getUserId } = require("@TolgaYld/core-buzzup");
const { catchGraphQLResolverErrors } = require("../../../core/utils/graphqlUtils");

const Comment = {
  created_by: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);
    const headers = { Authorization: id };

    const response = await axios.get(
      `${process.env.AUTHSERVICE}/find/${parent.user._id}`,
      {
        type: "FindUser",
        headers,
      },
    );

    if (response.status >= 400 || !response.data.success) {
      throw {
        statusCode: response.status,
        message: response.data.msg,
      };
    }

    return response.data.data;
  }, errorHandler),


  post: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);
    const headers = { Authorization: id };

    const response = await axios.get(
      `${process.env.POSTSERVICE}/find/${parent.post._id}`,
      {
        type: "FindPost",
        headers,
      },
    );

    if (response.status >= 400 || !response.data.success) {
      throw {
        statusCode: response.status,
        message: response.data.msg,
      };
    }

    return response.data.data;
  }, errorHandler),


  likes: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    return parent.likes;
  }, errorHandler),

  dislikes: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    return parent.dislikes;
  }, errorHandler),
};

module.exports = Comment;
