const jwt = require("jsonwebtoken");
const { SECRET_KEY, SECRET_KEY_REFRESH } = require("@TolgaYld/core-buzzup")

const token = {
  generate: ({ id }, expiresIn) => {
    return jwt.sign(
      {
        id,
      },
      SECRET_KEY,
      { expiresIn },
    );
  },
};

const refreshToken = {
  generate: ({ id }, expiresIn) => {
    return jwt.sign(
      {
        id,
      },
      SECRET_KEY_REFRESH,
      { expiresIn },
    );
  },
};

module.exports = { token, refreshToken };
