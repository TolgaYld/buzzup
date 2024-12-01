const authController = require("../controllers/authController");
const { catchErrors, authorizeUser } = require("@TolgaYld/core-buzzup");
const errorHandler = require("../errors/errorHandler");

const router = require("express").Router();

const authorize = authorizeUser(errorHandler);

router.get("/findAll", authorize, catchErrors(authController.findAll, errorHandler));
router.get("/find/:id", authorize, catchErrors(authController.findOne, errorHandler));
router.get(
  "/findWithUsername/:username", authorize,
  catchErrors(authController.findWithUsername, errorHandler),
);
router.get(
  "/findWithEmail/:email", authorize,
  catchErrors(authController.findWithEmail, errorHandler),
);

router.get(
  "/checkUsername/:username",
  catchErrors(authController.checkIfUsernameExists, errorHandler),
);

router.get(
  "/checkEmail/:email",
  catchErrors(authController.checkIfEmailExists, errorHandler),
);
router.get("/refreshToken", catchErrors(authController.tokenService, errorHandler));
router.post("/signUp", catchErrors(authController.createUser, errorHandler));
router.post(
  "/authWithProvider",
  catchErrors(authController.authUserWithProvider, errorHandler),
);
router.post("/signIn", catchErrors(authController.signInUser, errorHandler));
router.post("/resetPassword", catchErrors(authController.resetPassword, errorHandler));
router.patch("/update/:id", authorize, catchErrors(authController.updateUser, errorHandler));
router.patch(
  "/updatePassword/:id",
  catchErrors(authController.updateUserPassword, errorHandler),
);
router.get("/updatePw/:id/:token", catchErrors(authController.updatePasswordWebContent, errorHandler));
router.get("/verify", catchErrors(authController.verifyEmail, errorHandler));
router.delete("/delete/:id", authorize, catchErrors(authController.deleteUser, errorHandler));
router.delete(
  "/deleteFromDb/:id", authorize,
  catchErrors(authController.deleteUserFromDb, errorHandler),
);

module.exports = router;
