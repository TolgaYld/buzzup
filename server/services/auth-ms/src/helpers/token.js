const jwt = require("jsonwebtoken");
const { SECRET_KEY, SECRET_KEY_REFRESH } = require("@TolgaYld/core-buzzup")
const crypto = require("crypto");

const token = {
  generate: ({ id }, expiresIn) => {
    return jwt.sign(
      {
        id,
        jti: crypto.randomUUID(),
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
        jti: crypto.randomUUID(),
      },
      SECRET_KEY_REFRESH,
      { expiresIn },
    );
  },
};

module.exports = { token, refreshToken };
