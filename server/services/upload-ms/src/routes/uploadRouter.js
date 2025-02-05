const { catchErrors, authorizeUser } = require("@TolgaYld/core-buzzup");
const errorHandler = require("../errors/errorHandler");
const uploadController = require("../controllers/uploadController");
const router = require("express").Router();

const authorize = authorizeUser(errorHandler);

router.get("/presigned-url", authorize, catchErrors(uploadController.generate, errorHandler));


module.exports = router;
