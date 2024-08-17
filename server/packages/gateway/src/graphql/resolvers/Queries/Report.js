const createError = require("http-errors");
const errorHandler = require("../../../errors/errorHandler");
const axios = require("axios");
const { getUserId } = require("core-buzzup");

const Report = {
  reported_by_user: async (parent, args, { req }) => {
    const id = await getUserId(req);
    try {
      const headers = { Authorization: id };
      const response = await axios.get(
        process.env.AUTHSERVICE + "/find/" + parent.reported_by_user._id,
        {
          type: "FindUser",
          headers,
        },
      );
      if (response.status < 400 && response.data.success) {
        return response.data.data;
      } else {
        errorHandler(response.status, response.data.msg);
        throw Error(createError(response.status, response.data.msg));
      }
    } catch (error) {
      errorHandler(error.response.status, error.response.data.msg);
      throw Error(error.response.data.msg);
    }
  },

  reported_user: async (parent, args, { req }) => {
    const id = await getUserId(req);
    try {
      const headers = { Authorization: id };
      const response = await axios.get(
        process.env.AUTHSERVICE + "/find/" + parent.reported_user._id,
        {
          type: "FindUser",
          headers,
        },
      );
      if (response.status < 400 && response.data.success) {
        return response.data.data;
      } else {
        errorHandler(response.status, response.data.msg);
        throw Error(createError(response.status, response.data.msg));
      }
    } catch (error) {
      errorHandler(error.response.status, error.response.data.msg);
      throw Error(error.response.data.msg);
    }
  },

  post: async (parent, args, { req }) => {
    const id = await getUserId(req);
    try {
      const headers = { Authorization: id };
      const response = await axios.get(
        process.env.POSTSERVICE + "/find/" + parent.post._id,
        {
          type: "FindPost",
          headers,
        },
      );
      if (response.status < 400 && response.data.success) {
        return response.data.data;
      } else {
        errorHandler(response.status, response.data.msg);
        throw Error(createError(response.status, response.data.msg));
      }
    } catch (error) {
      errorHandler(error.response.status, error.response.data.msg);
      throw Error(error.response.data.msg);
    }
  },
  comment: async (parent, args, { req }) => {
    const id = await getUserId(req);
    try {
      const headers = { Authorization: id };
      const response = await axios.get(
        process.env.COMMENTSERVICE + "/find/" + parent.comment._id,
        {
          type: "FindComment",
          headers,
        },
      );
      if (response.status < 400 && response.data.success) {
        return response.data.data;
      } else {
        errorHandler(response.status, response.data.msg);
        throw Error(createError(response.status, response.data.msg));
      }
    } catch (error) {
      errorHandler(error.response.status, error.response.data.msg);
      throw Error(error.response.data.msg);
    }
  },
  story: async (parent, args, { req }) => {
    const id = await getUserId(req);
    try {
      const headers = { Authorization: id };
      const response = await axios.get(
        process.env.STORYSERVICE + "/find/" + parent.story._id,
        {
          type: "FindStory",
          headers,
        },
      );
      if (response.status < 400 && response.data.success) {
        return response.data.data;
      } else {
        errorHandler(response.status, response.data.msg);
        throw Error(createError(response.status, response.data.msg));
      }
    } catch (error) {
      errorHandler(error.response.status, error.response.data.msg);
      throw Error(error.response.data.msg);
    }
  },
};

module.exports = Report;
