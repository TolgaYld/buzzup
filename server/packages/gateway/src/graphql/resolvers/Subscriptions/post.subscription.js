const { withFilter } = require("graphql-subscriptions");
module.exports = {
  post: {
    subscribe: withFilter(
      (parent, args, { pubsub }) => {
        return pubsub.asyncIterator("post added");
      },
      (payload, variables) => {
        return variables.device_id
          ? String(payload.post.device_id) === variables.device_id
          : true;
      },
    ),
  },
};
