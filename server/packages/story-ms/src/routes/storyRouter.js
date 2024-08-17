const storyController = require("../controllers/storyController");
module.exports = function (fastify, opts, done) {
  fastify.get("/findAll", storyController.findAll);
  fastify.get(
    "/findAllStorysFromUser/:id",
    storyController.findAllStorysFromUser,
  );
  fastify.get("/find/:id", storyController.findOne);
  fastify.post("/create", storyController.createStory);
  fastify.post("/findInRadius", storyController.findInRadius);
  fastify.patch("/update/:id", storyController.updateStory);
  fastify.patch("/likeOrDislike/:id", storyController.likeOrDislikeStory);
  fastify.delete("/delete/:id", storyController.deleteStory);
  done();
};
