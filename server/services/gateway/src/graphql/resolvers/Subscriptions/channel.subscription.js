const { withFilter } = require("graphql-subscriptions");
module.exports = {
  channel: {
    subscribe: withFilter(
      (parent, args, { pubsub }) => {
        return pubsub.asyncIterator("channel added");
      },
      (payload, variables) => {
        return variables.device_id
          ? String(payload.post.device_id) === variables.device_id
          : true;
      },
    ),
  },
};
