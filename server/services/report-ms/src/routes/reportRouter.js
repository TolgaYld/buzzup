const reportController = require("../controllers/reportController");
const router = require("express").Router();

router.get("/findAll", reportController.findAll);
router.get("/find/:id", reportController.findOne);
router.get(
  "/findAllReportsFromUser/:id",
  reportController.findAllReportsFromUser,
);
router.get(
  "/findAllReportedsFromUser/:id",
  reportController.findAllReportedsFromUser,
);
router.post("/create", reportController.createReport);
router.patch("/update/:id", reportController.updateReport);

module.exports = router;
