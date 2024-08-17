const createError = require("http-errors");
const errorHandler = require("../../../errors/errorHandler");
const axios = require("axios");

const Channel = {
  users: async (parent, args, { req }) => {
    try {
      return await parent.users;
    } catch (error) {
      errorHandler(400, error);
      throw Error(error);
    }
  },

  posts: async (parent, args, { req }) => {
    try {
      return await parent.posts;
    } catch (error) {
      errorHandler(400, error);
      throw Error(error);
    }
  },
};

module.exports = Channel;
