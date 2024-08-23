const channelController = require("../controllers/channelController");
module.exports = function (fastify, opts, done) {
  fastify.get("/findAll", channelController.findAll);
  fastify.get(
    "/findAllChannelsFromUser/:id",
    channelController.findAllChannelsFromUser,
  );
  fastify.get("/find/:id", channelController.findOne);
  fastify.post("/create", channelController.createChannel);
  fastify.patch("/update/:id", channelController.updateChannel);
  fastify.patch("/entryOrLeave/:id", channelController.entryOrLeaveChannel);
  fastify.delete("/delete/:id", channelController.deleteChannel);
  done();
};
