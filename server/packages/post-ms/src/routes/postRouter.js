const postController = require("../controllers/postController");
module.exports = function (fastify, opts, done) {
  fastify.get("/findAll", postController.findAll);
  fastify.get("/findAllPostsFromUser/:id", postController.findAllPostsFromUser);
  fastify.get("/find/:id", postController.findOne);
  fastify.post("/create", postController.createPost);
  fastify.post("/findInRadius", postController.findInRadius);
  fastify.patch("/update/:id", postController.updatePost);
  fastify.patch("/likeOrDislike/:id", postController.likeOrDislikePost);
  fastify.delete("/delete/:id", postController.deletePost);
  done();
};
