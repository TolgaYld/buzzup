const { Channel, User } = require("@TolgaYld/core-buzzup")
const errorHandler = require("../errors/errorHandler");
const UploadService = require("../services/uploadService");
const uploadMiddleware = require("../middleware/uploadMiddleware");

const findAll = async (req, res) => {
  const findAllChannels = await Channel.find().exec();

  if (findAllChannels == null) {
    throw { statusCode: 404, message: "channels-not-found" };
  }

  return res.status(200).json({
    success: true,
    data: findAllChannels,
  });
};


const generateUrl = async (req, res) => {
  const uploadService = UploadService.getInstance();
  const { url, key } = await uploadService.generatePresignedUrl();

  return res.status(200).json({
    success: true,
    data: {
      url,
      key,
    },
  });
};


const upload = async (req, res) => {
  uploadMiddleware(req, res, async (err) => {
    if (err) {
      throw { err };
    }
    if (!req.files || req.files.length === 0) {
      throw { statusCode: 400, message: "No files uploaded" };
    }

    const { key } = req.body;

    if (key == null) {
      throw { statusCode: 400, message: "Missing key parameter" };
    }

    const uploadService = UploadService.getInstance();

    const files = req.files.map((file) => ({
      data: file.buffer,
      fileType: file.mimetype,
    }));

    const uploadedUrls = await uploadService.uploadData(files, key);

    return res.status(200).json({
      success: true,
      data: uploadedUrls,
    });

  });
}


module.exports = {
  generateUrl,
  upload,
};
