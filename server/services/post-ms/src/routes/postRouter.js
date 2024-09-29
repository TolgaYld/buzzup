const postController = require("../controllers/postController");
const router = require("express").Router();

router.get("/findAll", postController.findAll);
router.get(
  "/findAllPostsFromUser/:id",
  postController.findAllPostsFromUser,
);
router.get("/find/:id", postController.findOne);
router.post("/create", postController.createPost);
router.post("/findInRadius", postController.findInRadius);
router.patch("/update/:id", postController.updatePost);
router.patch(
  "/likeOrDislike/:id",
  postController.likeOrDislikePost,
);
router.delete("/delete/:id", postController.deletePost);

module.exports = router;
