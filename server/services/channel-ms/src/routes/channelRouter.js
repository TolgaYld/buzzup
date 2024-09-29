const channelController = require("../controllers/channelController");
const router = require("express").Router();
router.get("/findAll", channelController.findAll);
router.get(
  "/findAllChannelsFromUser/:id",
  channelController.findAllChannelsFromUser,
);
router.get("/find/:id", channelController.findOne);
router.post("/create", channelController.createChannel);
router.patch("/update/:id", channelController.updateChannel);
router.patch(
  "/entryOrLeave/:id",
  channelController.entryOrLeaveChannel,
);
router.delete(
  "/delete/:id",
  channelController.deleteChannel,
);

module.exports = router;
