const storyController = require("../controllers/storyController");
const router = require("express").Router();
const permissionHandler = require("../middlewares/persmissionHandler");

router.get("/findAll", permissionHandler, storyController.findAll);
router.get(
  "/findAllStorysFromUser/:id",
  permissionHandler,
  storyController.findAllStorysFromUser,
);
router.get("/find/:id", permissionHandler, storyController.findOne);
router.post("/create", permissionHandler, storyController.createStory);
router.post("/findInRadius", permissionHandler, storyController.findInRadius);
router.patch("/update/:id", permissionHandler, storyController.updateStory);
router.patch(
  "/likeOrDislike/:id",
  permissionHandler,
  storyController.likeOrDislikeStory,
);
router.delete("/delete/:id", permissionHandler, storyController.deleteStory);

module.exports = router;
