const errorHandler = require("../../../errors/errorHandler");
const { catchGraphQLResolverErrors } = require("../../../core/utils/graphqlUtils");

const Channel = {
  subscriptions: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    return parent.users;
  }, errorHandler),

  posts: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    return parent.posts;
  }, errorHandler),
};

module.exports = Channel;
