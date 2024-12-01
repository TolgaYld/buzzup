const { catchErrors, authorizeUser } = require("@TolgaYld/core-buzzup");
const errorHandler = require("../errors/errorHandler");
const channelController = require("../controllers/channelController");
const router = require("express").Router();

const authorize = authorizeUser(errorHandler);

router.get("/findAll", authorize, catchErrors(channelController.findAll, errorHandler));
router.get(
  "/findAllChannelsFromUser/:id", authorize,
  catchErrors(channelController.findAllChannelsFromUser, errorHandler),
);
router.get("/find/:id", authorize, catchErrors(channelController.findOne, errorHandler));
router.post("/create", authorize, catchErrors(channelController.createChannel, errorHandler));
router.patch("/update/:id", authorize, catchErrors(channelController.updateChannel, errorHandler));
router.patch(
  "/entryOrLeave/:id", authorize,
  catchErrors(channelController.entryOrLeaveChannel, errorHandler),
);
router.delete(
  "/delete/:id", authorize,
  catchErrors(channelController.deleteChannel, errorHandler),
);

module.exports = router;
