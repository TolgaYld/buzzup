const createError = require("http-errors");
const errorHandler = require("../../../errors/errorHandler");
const axios = require("axios");
const { getUserId } = require("@TolgaYld/core-buzzup");
const { catchGraphQLResolverErrors } = require("../../../core/utils/graphqlUtils");

const User = {
  posts: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.get(
      `${process.env.POSTSERVICE}/findAllPostsFromUser/${parent._id}`,
      {
        type: "FindAllPostsFromUser",
        headers,
      }
    );

    if (response.status >= 200 && response.status < 400 && response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),


  storys: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.get(
      `${process.env.STORYSERVICE}/findAllStorysFromUser/${parent._id}`,
      {
        type: "FindAllStorysFromUser",
        headers,
      }
    );

    if (response.status >= 200 && response.status < 400 && response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),


  comments: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);
    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.get(
      `${process.env.COMMENTSERVICE}/findAllCommentsFromUser/${parent._id}`,
      {
        type: "FindAllCommentsFromUser",
        headers,
      }
    );

    if (response.status >= 200 && response.status < 400 && response.data.success) {
      return response.data.data;
    }
    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),


  reports: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.get(
      `${process.env.REPORTSERVICE}/findAllReportsFromUser/${parent._id}`,
      {
        type: "FindAllReportsFromUser",
        headers,
      }
    );

    if (response.status >= 200 && response.status < 400 && response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),


  reporteds: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.get(
      `${process.env.REPORTSERVICE}/findAllReportedsFromUser/${parent._id}`,
      {
        type: "findAllReportedsFromUser",
        headers,
      }
    );

    if (response.status >= 200 && response.status < 400 && response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),

  channels: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.get(
      `${process.env.REPORTSERVICE}/findAllChannelsFromUser/${parent._id}`,
      {
        type: "findAllChannelsFromUser",
        headers,
      }
    );

    if (response.status >= 200 && response.status < 400 && response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),

};

module.exports = User;
