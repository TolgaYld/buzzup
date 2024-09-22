const commentController = require("../controllers/commentController");
const router = require("express").Router();
const permissionHandler = require("../middlewares/persmissionHandler");

router.get("/findAll", permissionHandler, commentController.findAll);
router.get("/find/:id", permissionHandler, commentController.findOne);
router.get(
  "/findAllCommentsFromUser/:id",
  permissionHandler,
  commentController.findAllCommentsFromUser,
);
router.post("/create", permissionHandler, commentController.createComment);
router.patch("/update/:id", permissionHandler, commentController.updateComment);
router.delete(
  "/delete/:id",
  permissionHandler,
  commentController.deleteComment,
);

module.exports = router;
