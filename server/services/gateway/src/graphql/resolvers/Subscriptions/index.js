const user = require("./user.subscription");
const channel = require("./channel.subscription");
const post = require("./post.subscription");
const comment = require("./comment.subscription");
const reports = require("./report.subscription");

const Subscription = {
  ...user,
  ...channel,
  ...post,
  ...comment,
  ...reports,
};

module.exports = Subscription;
