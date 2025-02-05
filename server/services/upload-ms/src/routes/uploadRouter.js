const { catchErrors, authorizeUser } = require("@TolgaYld/core-buzzup");
const errorHandler = require("../errors/errorHandler");
const uploadController = require("../controllers/uploadController");
const router = require("express").Router();

const authorize = authorizeUser(errorHandler);

router.get("/presigned-url", authorize, catchErrors(uploadController.generate, errorHandler));

router.post("/upload/:key", authorize, catchErrors(uploadController.upload, errorHandler));


module.exports = router;
