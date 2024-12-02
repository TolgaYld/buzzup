const reportController = require("../controllers/reportController");
const router = require("express").Router();
const { catchErrors, authorizeUser } = require("@TolgaYld/core-buzzup");
const errorHandler = require("../errors/errorHandler");
const authorize = authorizeUser(errorHandler);

router.get("/findAll",
  authorize,
  catchErrors(reportController.findAll, errorHandler),
);
router.get("/find/:id",
  authorize,
  catchErrors(reportController.findOne, errorHandler),
);
router.get(
  "/findAllReportsFromUser/:id",
  authorize,
  catchErrors(reportController.findAllReportsFromUser, errorHandler),
);
router.get(
  "/findAllReportedsFromUser/:id",
  authorize,
  catchErrors(reportController.findAllReportedsFromUser, errorHandler),
);
router.post("/create",
  authorize,
  catchErrors(reportController.createReport, errorHandler),
);
router.patch("/update/:id",
  authorize,
  catchErrors(reportController.updateReport, errorHandler),
);

module.exports = router;
