const { withFilter } = require("graphql-subscriptions");
module.exports = {
  story: {
    subscribe: withFilter(
      (parent, args, { pubsub }) => {
        return pubsub.asyncIterator("story added");
      },
      (payload, variables) => {
        return variables.device_id
          ? String(payload.post.device_id) === variables.device_id
          : true;
      },
    ),
  },
};
