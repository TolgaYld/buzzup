const { catchErrors, authorizeUser } = require("@TolgaYld/core-buzzup");
const errorHandler = require("../errors/errorHandler");
const commentController = require("../controllers/commentController");
const router = require("express").Router();
const authorize = authorizeUser(errorHandler);
router.get("/findAll", authorize, catchErrors(commentController.findAll, errorHandler));
router.get("/find/:id", authorize, catchErrors(commentController.findOne, errorHandler));
router.get(
  "/findAllCommentsFromUser/:id",
  authorize,
  catchErrors(commentController.findAllCommentsFromUser, errorHandler),
);
router.post("/create", authorize, catchErrors(commentController.createComment, errorHandler));
router.patch("/update/:id", authorize, catchErrors(commentController.updateComment, errorHandler));
router.delete(
  "/delete/:id",
  authorize,
  catchErrors(commentController.deleteComment, errorHandler),
);

module.exports = router;
