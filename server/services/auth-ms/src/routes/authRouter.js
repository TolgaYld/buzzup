const authController = require("../controllers/authController");

const router = require("express").Router();

router.get("/findAll", authController.findAll);
router.get("/find/:id", authController.findOne);
router.get(
  "/findWithUsername/:username",
  authController.findWithUsername,
);
router.get(
  "/findWithEmail/:email",
  authController.findWithEmail,
);

router.get(
  "/checkUsername/:username",
  authController.checkIfUsernameExists,
);

router.get(
  "/checkEmail/:email",
  authController.checkIfEmailExists,
);
router.get("/refreshToken", authController.tokenService);
router.post("/signUp", authController.createUser);
router.post(
  "/authWithProvider",
  authController.authUserWithProvider,
);
router.post("/signIn", authController.signInUser);
router.post("/resetPassword", authController.resetPassword);
router.patch("/update/:id", authController.updateUser);
router.patch(
  "/updatePassword/:id",
  authController.updateUserPassword,
);
router.get("/updatePw/:id/:token", authController.updatePasswordWebContent);
router.get("/verify", authController.verifyEmail);
router.delete("/delete/:id", authController.deleteUser);
router.delete(
  "/deleteFromDb/:id",
  authController.deleteUserFromDb,
);

module.exports = router;
