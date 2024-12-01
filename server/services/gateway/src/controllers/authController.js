const { User } = require("@TolgaYld/core-buzzup");
const errorHandler = require("../errors/errorHandler");
const axios = require("axios");
const loadVariablesFromI18 = require("../core/config/loadFromi18");
const jwt = require("jsonwebtoken");
const { validationResult } = require("express-validator");

const gatewayAuthEndpoint = "/api/v1.0/auth";

const tokenService = async (req, res, next) => {
  const { authorization: header, refresh } = req.headers;

  if (refresh == null || header == null) {
    throw { statusCode: 401, message: "unauthorized" };
  }
  const headers = req.headers;
  const response = await axios.get(
    process.env.AUTHSERVICE + "/refreshToken",
    {
      type: "refreshToken",
      headers,
    },
  );
  if (response.status >= 400 || response.data.success == false) {
    throw {
      statusCode: 404,
      message: `${response.data.msg.name}: ${response.data.msg.message}`,
    };
  }
  await res.status(200).json({
    success: response.data.success,
    token: response.data.token,
    refreshToken: response.data.refreshToken,
  });
};

const verifyEmail = async (req, res, next) => {
  try {
    const token = req.query.id;
    if (token == null) {
      return res.redirect(`${gatewayAuthEndpoint}/tokeninvalid`);
    }
    const response = await axios.get(`${process.env.AUTHSERVICE}/verify`, {
      params: { id: token },
      headers: { type: "ActivateEmail" },
    });
    if (response.status < 400 && response.data.success) {
      return res.redirect(`${gatewayAuthEndpoint}/emailActivated`);
    }
    res.redirect(`${gatewayAuthEndpoint}/tokeninvalid`);
  } catch (error) {
    res.redirect(gatewayAuthEndpoint + "/tokeninvalid");
  }
};

const updatePasswordWebContent = async (req, res) => {
  const token = req.params.token?.trim();
  const id = req.params.id?.trim();
  try {
    if (token == null || id == null) {
      return res.redirect(`${gatewayAuthEndpoint}/tokeninvalid`);
    }
    const headers = {
      permission: req.headers.permission,
    };

    const response = await axios.get(
      `${process.env.AUTHSERVICE}/updatePw/${id}/${token}`,
      {
        type: "RenderForgetPw",
        headers,
      }
    );

    if (response.status < 400 && response.data.success) {
      return res.render("forgetPassword", {
        id: response.data.data.id,
        token: response.data.data.token,
        layout: "./layout/standardLayout.ejs",
      });
    }

    res.redirect(`${gatewayAuthEndpoint}/tokeninvalid`);
  } catch (error) {
    res.redirect(`${gatewayAuthEndpoint}/tokeninvalid`);
  }
};


const savePassword = async (req, res) => {
  const validationErrors = validationResult(req);
  const id = req.body.id?.trim();
  const token = req.body.token?.trim();

  if (!validationErrors.isEmpty()) {
    req.flash("validation_error", validationErrors.array());
    req.flash("password", req.body.password);
    req.flash("repeatPassword", req.body.repeatPassword);

    return res.redirect(`${gatewayAuthEndpoint}/updatePw/${id}/${token}`);
  }

  try {
    const findUser = await User.findById(id).exec();
    if (findUser == null) {
      return res.redirect(`${gatewayAuthEndpoint}/passwordError`);
    }

    const headers = {
      Authorization: id,
      permission: process.env.PERMISSION_KEY,
    };

    const response = await axios.patch(
      `${process.env.AUTHSERVICE}/updatePassword/${id}`,
      {
        type: "updatePassword",
        data: {
          password: req.body.password,
          repeat_password: req.body.repeatPassword,
          last_update_from_user: id,
        },
      },
      { headers }
    );

    if (response.data.success) {
      return res.redirect(`${gatewayAuthEndpoint}/passwordsvd`);
    }

    res.redirect(`${gatewayAuthEndpoint}/passwordError`);
  } catch (error) {
    res.redirect(`${gatewayAuthEndpoint}/passwordError`);
  }
};

const tokenInvalid = async (req, res) => {
  res.render("./tokenInvalid", {
    layout: "./layout/standardLayout",
  });
};

const passwordSaved = async (req, res) => {
  res.render("./passwordSavedSuccessfully", {
    layout: "./layout/standardLayout",
  });
};

const emailActivated = async (req, res) => {
  res.render("./emailActivated", {
    layout: "./layout/standardLayout",
  });
};

const passwordSaveError = async (req, res) => {
  res.render("./passwordSaveFailed", {
    layout: "./layout/standardLayout",
  });
};

module.exports = {
  tokenService,
  verifyEmail,
  updatePasswordWebContent,
  savePassword,
  tokenInvalid,
  passwordSaved,
  emailActivated,
  passwordSaveError,
};
