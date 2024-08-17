const { withFilter } = require("graphql-subscriptions");
module.exports = {
  comment: {
    subscribe: withFilter(
      (parent, args, { pubsub }) => {
        return pubsub.asyncIterator("comment added");
      },
      (payload, variables) => {
        return variables.device_id
          ? String(payload.comment.device_id) === variables.device_id
          : true;
      },
    ),
  },
};
