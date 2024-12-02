const storyController = require("../controllers/storyController");
const router = require("express").Router();
const { catchErrors, authorizeUser } = require("@TolgaYld/core-buzzup");
const errorHandler = require("../errors/errorHandler");
const authorize = authorizeUser(errorHandler);

router.get("/findAll", authorize, catchErrors(storyController.findAll, errorHandler));
router.get(
  "/findAllStorysFromUser/:id",
  authorize,
  catchErrors(storyController.findAllStorysFromUser, errorHandler),
);
router.get("/find/:id", authorize, catchErrors(storyController.findOne, errorHandler));
router.post("/create", authorize, catchErrors(storyController.createStory, errorHandler));
router.post("/findInRadius", authorize, catchErrors(storyController.findInRadius, errorHandler));
router.patch("/update/:id", authorize, catchErrors(storyController.updateStory, errorHandler));
router.patch(
  "/likeOrDislike/:id",
  authorize,
  catchErrors(storyController.likeOrDislikeStory, errorHandler),
);
router.delete("/delete/:id", authorize, catchErrors(storyController.deleteStory, errorHandler));

module.exports = router;
