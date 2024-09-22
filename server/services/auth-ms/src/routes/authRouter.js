const authController = require("../controllers/authController");

const router = require("express").Router();
const permissionHandler = require("../middlewares/persmissionHandler");

router.get("/findAll", permissionHandler, authController.findAll);
router.get("/find/:id", permissionHandler, authController.findOne);
router.get(
  "/findWithUsername/:username",
  permissionHandler,
  authController.findWithUsername,
);
router.get(
  "/findWithEmail/:email",
  permissionHandler,
  authController.findWithEmail,
);

router.get(
  "/checkUsername/:username",
  permissionHandler,
  authController.checkIfUsernameExists,
);

router.get(
  "/checkEmail/:email",
  permissionHandler,
  authController.checkIfEmailExists,
);
router.get("/refreshToken", permissionHandler, authController.tokenService);
router.post("/signUp", permissionHandler, authController.createUser);
router.post(
  "/authWithProvider",
  permissionHandler,
  authController.authUserWithProvider,
);
router.post("/signIn", permissionHandler, authController.signInUser);
router.post("/resetPassword", permissionHandler, authController.resetPassword);
router.patch("/update/:id", permissionHandler, authController.updateUser);
router.patch(
  "/updatePassword/:id",
  permissionHandler,
  authController.updateUserPassword,
);
router.get("/updatePw/:id/:token", authController.updatePasswordWebContent);
router.get("/verify", authController.verifyEmail);
router.delete("/delete/:id", permissionHandler, authController.deleteUser);
router.delete(
  "/deleteFromDb/:id",
  permissionHandler,
  authController.deleteUserFromDb,
);

module.exports = router;
