const { getUserId } = require("@TolgaYld/core-buzzup");
const createError = require("http-errors");
const errorHandler = require("../../../errors/errorHandler");
const axios = require("axios");
const { catchGraphQLResolverErrors } = require("../../../core/utils/graphqlUtils");

const Query = {
  //User Service
  user: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.get(
      `${process.env.AUTHSERVICE}/find/${args.id}`,
      {
        type: "FindUser",
        headers,
      },
    );

    if (response.data.success && response.status < 400) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),

  users: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };

    const response = await axios.get(process.env.AUTHSERVICE + "/findAll", {
      type: "FindAllUsers",
      headers,
    });

    if (response.status >= 200 && response.status < 400 && response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),


  userWithUsername: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };

    const response = await axios.get(
      `${process.env.AUTHSERVICE}/findWithUsername/${args.username}`,
      {
        type: "FindUserWithUsername",
        headers,
      }
    );

    if (response.status >= 200 && response.status < 400 && response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),

  userWithEmail: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };

    const response = await axios.get(
      `${process.env.AUTHSERVICE}/findWithEmail/${args.email}`,
      {
        type: "FindUserWithEmail",
        headers,
      }
    );

    if (response.status >= 200 && response.status < 400 && response.data.success) {
      return response.data.data;
    }
    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),


  checkIfEmailExists: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const headers = req.headers;

    const response = await axios.get(
      `${process.env.AUTHSERVICE}/checkEmail/${args.email}`,
      {
        type: "CheckIfEmailExists",
        headers,
      }
    );

    if (response.status >= 200 && response.status < 400 && response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),


  checkIfUsernameExists: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const response = await axios.get(
      `${process.env.AUTHSERVICE}/checkUsername/${args.username}`,
      {
        type: "CheckIfUsernameExists",
      }
    );

    if (response.status >= 200 && response.status < 400 && response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),


  //Channel Service
  channel: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.get(
      `${process.env.CHANNELSERVICE}/find/${args.id}`,
      {
        type: "FindChannel",
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
      `${process.env.CHANNELSERVICE}/findAll`,
      {
        type: "FindAllChannels",
        headers,
      }
    );

    if (response.status >= 200 && response.status < 400 && response.data.success) {
      return response.data.data;
    }
    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),


  //Post Service
  post: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.get(
      `${process.env.POSTSERVICE}/find/${args.id}`,
      {
        type: "FindPost",
        headers,
      }
    );

    if (response.status >= 200 && response.status < 400 && response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),

  posts: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.get(`${process.env.POSTSERVICE}/findAll`, {
      type: "FindAllPosts",
      headers,
    });

    if (response.status >= 200 && response.status < 400 && response.data.success) {
      return response.data.data;
    }
    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),

  getNearContents: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };

    const postsResponse = await axios.post(
      `${process.env.POSTSERVICE}/findInRadius`,
      {
        type: "FindPostsInMyRadius",
        data: args.data,
      },
      { headers }
    );

    if (response.status < 200 || response.status >= 400 || response.data.success == false) {
      throw { statusCode: response.status, message: response.data.msg };
    }

    const posts = postsResponse.data.data;

    const storyResponse = await axios.post(
      `${process.env.STORYSERVICE}/findInRadius`,
      {
        type: "FindStorysInMyRadius",
        data: args.data,
      },
      { headers }
    );

    if (response.status < 200 || response.status >= 400 || response.data.success == false) {
      throw { statusCode: response.status, message: response.data.msg };
    }
    return {
      posts,
      storys: storyResponse.data.data,
    };
  }, errorHandler),


  //Comment Service
  comment: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.get(
      `${process.env.COMMENTSERVICE}/find/${args.id}`,
      {
        type: "FindComment",
        headers,
      }
    );

    if (response.status < 200 || response.status >= 400 || response.data.success == false) {
      throw { statusCode: response.status, message: response.data.msg };
    }

    return response.data.data;
  }, errorHandler),


  comments: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.get(
      `${process.env.COMMENTSERVICE}/findAll`,
      {
        type: "FindAllComments",
        headers,
      }
    );

    if (response.status < 200 || response.status >= 400 || response.data.success == false) {
      throw { statusCode: response.status, message: response.data.msg };
    }


    return response.data.data;
  }, errorHandler),


  //Story Service
  story: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: req.t("unauthorized") };
    }

    const headers = { Authorization: id };
    const response = await axios.get(
      `${process.env.STORYSERVICE}/find/${args.id}`,
      {
        type: "FindStory",
        headers,
      }
    );

    if (response.status < 200 || response.status >= 400 || response.data.success == false) {
      throw { statusCode: response.status, message: response.data.msg };
    }

    return response.data.data;
  }, errorHandler),

  storys: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: req.t("unauthorized") };
    }

    const headers = { Authorization: id };
    const response = await axios.get(`${process.env.STORYSERVICE}/findAll`, {
      type: "FindAllStorys",
      headers,
    });

    if (response.status < 200 || response.status >= 400 || response.data.success == false) {
      throw { statusCode: response.status, message: response.data.msg };
    }

    return response.data.data;
  }, errorHandler),


  //Report Service
  report: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: req.t("unauthorized") };
    }

    const headers = { Authorization: id };
    const response = await axios.get(
      `${process.env.REPORTSERVICE}/find/${args.id}`,
      {
        type: "FindReport",
        headers,
      }
    );

    if (response.status < 200 || response.status >= 400 || response.data.success == false) {
      throw { statusCode: response.status, message: response.data.msg };
    }

    return response.data.data;
  }, errorHandler),

  reports: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: req.t("unauthorized") };
    }

    const headers = { Authorization: id };
    const response = await axios.get(`${process.env.REPORTSERVICE}/findAll`, {
      type: "FindAllReports",
      headers,
    });

    if (response.status < 200 || response.status >= 400 || !response.data.success) {
      throw { statusCode: response.status, message: response.data.msg };
    }

    return response.data.data;
  }, errorHandler),
};

module.exports = Query;
