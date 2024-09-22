const { body } = require("express-validator");

const validateNewPassword = () => {
  return [
    body("password").isLength({ min: 6 }).withMessage("Minimum 6 Characters!"),

    body("repeatPassword").custom((value, { req }) => {
      if (value !== req.body.password) {
        throw new Error("Passwords not match!");
      }
      return true;
    }),
  ];
};

module.exports = {
  validateNewPassword,
};
