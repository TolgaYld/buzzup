const user = require("./user.mutation");
const channel = require("./channel.mutation");
const post = require("./post.mutation");
const comment = require("./comment.mutation");
const report = require("./report.mutation");

const Mutation = {
  ...user,
  ...channel,
  ...post,
  ...comment,
  ...report,
};

module.exports = Mutation;
