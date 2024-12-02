const createError = require("http-errors");
const errorHandler = require("../../../errors/errorHandler");
const axios = require("axios");
const { getUserId } = require("@TolgaYld/core-buzzup");
const { catchGraphQLResolverErrors } = require("../../../core/utils/graphqlUtils");

const Report = {
  reported_by_user: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    if (await getUserId(req) == null) {
      throw { statusCode: 401, message: req.t("unauthorized") };
    }

    const response = await axios.get(
      `${process.env.AUTHSERVICE}/find/${parent.reported_by_user._id}`,
      {
        type: "FindUser",
        headers: { Authorization: await getUserId(req) },
      }
    );

    if (response.status < 200 || response.status >= 400 || response.data.success == false) {
      throw { statusCode: response.status, message: response.data.msg };
    }

    return response.data.data;
  }, errorHandler),


  reported_user: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    if (await getUserId(req) == null) {
      throw { statusCode: 401, message: req.t("unauthorized") };
    }

    const response = await axios.get(
      `${process.env.AUTHSERVICE}/find/${parent.reported_user._id}`,
      {
        type: "FindUser",
        headers: { Authorization: await getUserId(req) },
      }
    );

    if (response.status < 200 || response.status >= 400 || response.data.success == false) {
      throw { statusCode: response.status, message: response.data.msg };
    }

    return response.data.data;
  }, errorHandler),


  post: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    if (await getUserId(req) == null) {
      throw { statusCode: 401, message: req.t("unauthorized") };
    }

    const response = await axios.get(
      `${process.env.POSTSERVICE}/find/${parent.post._id}`,
      {
        type: "FindPost",
        headers: { Authorization: await getUserId(req) },
      }
    );

    if (response.status < 200 || response.status >= 400 || response.data.success == false) {
      throw { statusCode: response.status, message: response.data.msg };
    }

    return response.data.data;
  }, errorHandler),

  comment: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    if (await getUserId(req) == null) {
      throw { statusCode: 401, message: req.t("unauthorized") };
    }

    const response = await axios.get(
      `${process.env.COMMENTSERVICE}/find/${parent.comment._id}`,
      {
        type: "FindComment",
        headers: { Authorization: await getUserId(req) },
      }
    );

    if (response.status < 200 || response.status >= 400 || response.data.success == false) {
      throw { statusCode: response.status, message: response.data.msg };
    }

    return response.data.data;
  }, errorHandler),

  story: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    if (await getUserId(req) == null) {
      throw { statusCode: 401, message: req.t("unauthorized") };
    }

    const response = await axios.get(
      `${process.env.STORYSERVICE}/find/${parent.story._id}`,
      {
        type: "FindStory",
        headers: { Authorization: await getUserId(req) },
      }
    );

    if (response.status < 200 || response.status >= 400 || response.data.success == false) {
      throw { statusCode: response.status, message: response.data.msg };
    }

    return response.data.data;
  }, errorHandler),

};

module.exports = Report;
