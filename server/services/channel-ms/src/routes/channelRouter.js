const channelController = require("../controllers/channelController");
const router = require("express").Router();
const permissionHandler = require("../middlewares/persmissionHandler");
router.get("/findAll", channelController.findAll);
router.get(
  "/findAllChannelsFromUser/:id",
  channelController.findAllChannelsFromUser,
);
router.get("/find/:id", permissionHandler, channelController.findOne);
router.post("/create", permissionHandler, channelController.createChannel);
router.patch("/update/:id", permissionHandler, channelController.updateChannel);
router.patch(
  "/entryOrLeave/:id",
  permissionHandler,
  channelController.entryOrLeaveChannel,
);
router.delete(
  "/delete/:id",
  permissionHandler,
  channelController.deleteChannel,
);

module.exports = router;
