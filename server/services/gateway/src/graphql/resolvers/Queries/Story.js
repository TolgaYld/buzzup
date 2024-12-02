const createError = require("http-errors");
const errorHandler = require("../../../errors/errorHandler");
const axios = require("axios");
const { getUserId } = require("@TolgaYld/core-buzzup");
const { catchGraphQLResolverErrors } = require("../../../core/utils/graphqlUtils");

const Story = {
  created_by: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);
    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const response = await axios.get(
      `${process.env.AUTHSERVICE}/find/${parent.user._id}`,
      {
        type: "FindUser",
        headers: { Authorization: id },
      }
    );

    if (response.status < 200 || response.status >= 400 || !response.data.success) {
      throw { statusCode: response.status, message: response.data.msg };
    }

    return response.data.data;
  }, errorHandler),


  channels: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    return parent.channels;
  }, errorHandler),

  comments: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    return parent.comments;
  }, errorHandler),
};

module.exports = Story;
