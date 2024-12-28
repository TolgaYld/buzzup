const postController = require("../controllers/postController");
const router = require("express").Router();
const { catchErrors, authorizeUser } = require("@TolgaYld/core-buzzup");
const errorHandler = require("../errors/errorHandler");
const authorize = authorizeUser(errorHandler);

router.get("/findAll", authorize, catchErrors(postController.findAll, errorHandler));
router.get(
  "/findAllPostsFromUser/:id", authorize,
  catchErrors(postController.findAllPostsFromUser, errorHandler),
);
router.get("/find/:id", authorize, catchErrors(postController.findOne, errorHandler));
router.post("/create", authorize, catchErrors(postController.createPost, errorHandler));
router.post("/findInRadius", authorize, catchErrors(postController.findInRadius, errorHandler));
router.patch("/update/:id", authorize, catchErrors(postController.updatePost, errorHandler));
router.patch(
  "/likeOrDislike/:id",
  authorize,
  catchErrors(postController.likeOrDislikePost, errorHandler),
);
router.patch(
  "/togglePublicVote/:id",
  authorize,
  catchErrors(postController.togglePublicVote, errorHandler),
);
router.delete("/delete/:id", authorize, catchErrors(postController.deletePost, errorHandler));

module.exports = router;
