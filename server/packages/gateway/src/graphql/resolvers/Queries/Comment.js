const createError = require("http-errors");
const errorHandler = require("../../../errors/errorHandler");
const axios = require("axios");
const { getUserId } = require("core-buzzup");

const Comment = {
  user: async (parent, args, { req }) => {
    const id = await getUserId(req);
    try {
      const headers = { Authorization: id };
      const response = await axios.get(
        process.env.AUTHSERVICE + "/find/" + parent.user._id,
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

  likes: async (parent, args, { req }) => {
    try {
      return await parent.likes;
    } catch (error) {
      errorHandler(400, error);
      throw Error(error);
    }
  },

  dislikes: async (parent, args, { req }) => {
    try {
      return await parent.dislikes;
    } catch (error) {
      errorHandler(400, error);
      throw Error(error);
    }
  },
};

module.exports = Comment;
