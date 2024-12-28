// Query Resolvers
const Query = require("./Queries/Query");
const User = require("./Queries/User");
const Channel = require("./Queries/Channel");
const Post = require("./Queries/Post");
const Story = require("./Queries/Story");
const Comment = require("./Queries/Comment");

//Mutation Resolvers
const Mutation = require("./Mutations/index");

//Subscription Resolvers
const Subscription = require("./Subscriptions/index");

module.exports = {
  Query,
  Mutation,
  User,
  Channel,
  Post,
  Story,
  Comment,
  Subscription,
};
