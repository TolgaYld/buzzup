const commentController = require("../controllers/commentController");
const router = require("express").Router();

router.get("/findAll", commentController.findAll);
router.get("/find/:id", commentController.findOne);
router.get(
  "/findAllCommentsFromUser/:id",
  commentController.findAllCommentsFromUser,
);
router.post("/create", commentController.createComment);
router.patch("/update/:id", commentController.updateComment);
router.delete(
  "/delete/:id",
  commentController.deleteComment,
);

module.exports = router;
