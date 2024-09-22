const reportController = require("../controllers/reportController");
const router = require("express").Router();
const permissionHandler = require("../middlewares/persmissionHandler");

router.get("/findAll", permissionHandler, reportController.findAll);
router.get("/find/:id", permissionHandler, reportController.findOne);
router.get(
  "/findAllReportsFromUser/:id",
  permissionHandler,
  reportController.findAllReportsFromUser,
);
router.get(
  "/findAllReportedsFromUser/:id",
  permissionHandler,
  reportController.findAllReportedsFromUser,
);
router.post("/create", permissionHandler, reportController.createReport);
router.patch("/update/:id", permissionHandler, reportController.updateReport);

module.exports = router;
