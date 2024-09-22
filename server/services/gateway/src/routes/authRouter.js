const router = require("express").Router();
const authController = require("../controllers/authController");
const validatorMiddleware = require("../middlewares/newPasswordMiddleware");

router.get(
  "/updatePw/:id/:token",
  validatorMiddleware.validateNewPassword(),
  authController.updatePasswordWebContent,
);
router.post(
  "/updatePw",
  validatorMiddleware.validateNewPassword(),
  authController.savePassword,
);

router.get("/passwordsvd", authController.passwordSaved);
router.get("/tokeninvalid", authController.tokenInvalid);
router.get("/emailActivated", authController.emailActivated);
router.get("/passwordError", authController.passwordSaveError);
router.get("/verify", authController.verifyEmail);

module.exports = router;
