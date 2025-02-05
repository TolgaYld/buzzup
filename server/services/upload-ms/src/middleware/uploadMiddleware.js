const multer = require("multer");
const storage = multer.memoryStorage();
const uploadMiddleware = multer({ storage }).array("files", 12);

module.exports = uploadMiddleware;
