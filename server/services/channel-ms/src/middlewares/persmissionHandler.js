const errorHandler = require("../errors/errorHandler");
const permissionHandler = async (req, res, next) => {
  const getPermissionKey = req.headers.permission;
  const permissionKey = process.env.PERMISSION_KEY;

  if (getPermissionKey === permissionKey) {
    next();
  } else {
    return await errorHandler(401, "unauthorized", true, req, res);
  }
};
module.exports = permissionHandler;
