const authController = require("../controllers/authController");
module.exports = function (fastify, opts, done) {
  fastify.get("/findAll", authController.findAll);
  fastify.get("/find/:id", authController.findOne);
  fastify.get("/findWithUsername/:username", authController.findWithUsername);
  fastify.get("/findWithEmail/:email", authController.findWithEmail);
  fastify.post("/create", authController.createUser);
  fastify.post("/signIn", authController.signInUser);
  fastify.patch("/update/:id", authController.updateUser);
  fastify.patch("/updatePassword/:id", authController.updateUserPassword);
  fastify.delete("/delete/:id", authController.deleteUser);
  done();
};
