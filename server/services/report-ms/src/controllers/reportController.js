const { User, Report } = require("@TolgaYld/core-buzzup");
const errorHandler = require("../errors/errorHandler");

const findAll = async (req, res) => {
  try {
    const id = req.headers.authorization;
    if (id == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findUser = await User.findById(id).exec();

      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const findAllReports = await Report.find().exec();
        if (!findAllReports) {
          return await errorHandler(404, "reports-not-found", true, req, res);
        }

        await res.status(200).json({
          success: true,
          data: findAllReports,
        });
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const findOne = async (req, res) => {
  try {
    const userId = req.headers.authorization;
    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findUser = await User.findById(userId).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const { id } = req.params;
        const findOneReport = await Report.findById(id).exec();

        if (!findOneReport) {
          return await errorHandler(404, "report-not-found", true, req, res);
        }
        await res.status(200).json({
          success: true,
          data: findOneReport,
        });
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const findAllReportsFromUser = async (req, res) => {
  try {
    const userId = req.headers.authorization;
    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findUser = await User.findById(userId).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const { id } = req.params;
        const findAllReports = await Report.find({
          created_by: id,
        }).exec();

        if (!findAllReports) {
          return await errorHandler(404, "reports-not-found", true, req, res);
        }
        await res.status(200).json({
          success: true,
          data: findAllReports,
        });
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const findAllReportedsFromUser = async (req, res) => {
  try {
    const userId = req.headers.authorization;
    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findUser = await User.findById(userId).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const { id } = req.params;
        const findAllReports = await Report.find({
          reported_user: id,
        }).exec();
        if (!findAllReports) {
          return await errorHandler(404, "reports-not-found", true, req, res);
        } else {
          await res.status(200).json({
            success: true,
            data: findAllReports,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const createReport = async (req, res) => {
  try {
    const userId = req.headers.authorization;

    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findUser = await User.findById(userId).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const createdReport = await Report.create({
          ...req.body.data,
          created_by: userId,
        });

        if (!createdReport) {
          return await errorHandler(400, "report-not-created", true, req, res);
        } else {
          await res.status(201).json({
            success: true,
            data: createdReport,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(400, error, false, req, res);
  }
};

const updateReport = async (req, res) => {
  try {
    const userId = req.headers.authorization;
    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findUser = await User.findById(userId).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const { id } = req.params;
        const findReport = await Report.findById(id).exec();

        if (!findReport) {
          return await errorHandler(404, "report-not-found", true, req, res);
        } else {
          const updatedReport = await Report.findByIdAndUpdate(
            findReport._id,
            {
              ...req.body,
            },
            { new: true },
          ).exec();

          if (!updatedReport) {
            return await errorHandler(
              400,
              "report-update-failed",
              true,
              req,
              res,
            );
          } else {
            await res.status(200).json({
              success: true,
              data: updatedReport,
            });
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

module.exports = {
  findAll,
  findOne,
  findAllReportsFromUser,
  findAllReportedsFromUser,
  createReport,
  updateReport,
};
