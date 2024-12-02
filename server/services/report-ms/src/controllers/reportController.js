const { User, Report } = require("@TolgaYld/core-buzzup");
const errorHandler = require("../errors/errorHandler");

const findAll = async (req, res) => {
  const findAllReports = await Report.find().exec();

  if (findAllReports == null) {
    throw { statusCode: 404, message: "reports-not-found" };
  }

  return res.status(200).json({
    success: true,
    data: findAllReports || [],
  });
};

const findOne = async (req, res) => {
  const { id } = req.params;

  const findOneReport = await Report.findById(id).exec();

  if (findOneReport == null) {
    throw { statusCode: 404, message: "reports-not-found" };
  }

  return res.status(200).json({
    success: true,
    data: findOneReport,
  });
};

const findAllReportsFromUser = async (req, res) => {

  const { id } = req.params;

  const findAllReports = await Report.find({
    created_by: id,
  }).exec();

  if (findAllReports == null) {
    throw { statusCode: 404, message: "reports-not-found" };
  }
  return res.status(200).json({
    success: true,
    data: findAllReports || [],
  });
};

const findAllReportedsFromUser = async (req, res) => {
  const { id } = req.params;

  const findAllReports = await Report.find({
    reported_user: id,
  }).exec();

  if (findAllReports == null) {
    throw { statusCode: 404, message: "reports-not-found" };
  }
  return res.status(200).json({
    success: true,
    data: findAllReports || [],
  });
};


const createReport = async (req, res) => {
  const user = req.user;
  const createdReport = await Report.create({
    ...req.body.data,
    created_by: user,
  });

  if (createdReport == null) {
    return res.status(400).json({
      success: false,
      message: "report-not-created",
    });
  }
  return res.status(201).json({
    success: true,
    data: createdReport,
  });
};

const updateReport = async (req, res) => {
  const { id } = req.params;

  const updatedReport = await Report.findByIdAndUpdate(
    id,
    { ...req.body },
    { new: true }
  ).exec();

  if (updatedReport == null) {
    return res.status(404).json({
      success: false,
      message: "report-update-failed",
    });
  }

  return res.status(200).json({
    success: true,
    data: updatedReport,
  });
};


module.exports = {
  findAll,
  findOne,
  findAllReportsFromUser,
  findAllReportedsFromUser,
  createReport,
  updateReport,
};
