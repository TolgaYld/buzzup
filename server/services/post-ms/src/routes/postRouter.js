const postController = require("../controllers/postController");
const router = require("express").Router();
const permissionHandler = require("../middlewares/persmissionHandler");

router.get("/findAll", permissionHandler, postController.findAll);
router.get(
  "/findAllPostsFromUser/:id",
  permissionHandler,
  postController.findAllPostsFromUser,
);
router.get("/find/:id", permissionHandler, postController.findOne);
router.post("/create", permissionHandler, postController.createPost);
router.post("/findInRadius", permissionHandler, postController.findInRadius);
router.patch("/update/:id", permissionHandler, postController.updatePost);
router.patch(
  "/likeOrDislike/:id",
  permissionHandler,
  postController.likeOrDislikePost,
);
router.delete("/delete/:id", permissionHandler, postController.deletePost);

module.exports = router;
