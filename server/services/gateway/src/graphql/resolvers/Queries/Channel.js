const errorHandler = require("../../../errors/errorHandler");

const Channel = {
  subscriptions: async (parent, args, { req }) => {
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
