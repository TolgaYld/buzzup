const permissionHandler = (req) => {
  const getPermissionKey = req.headers.permission;
  const permissionKey = process.env.PERMISSION_KEY;

  return getPermissionKey === permissionKey;
};
module.exports = permissionHandler;
