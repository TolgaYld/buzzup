const { User } = require("@TolgaYld/core-buzzup");
const errorHandler = require("../errors/errorHandler");
const axios = require("axios");
const loadVariablesFromI18 = require("../core/config/loadFromi18");
const jwt = require("jsonwebtoken");
const { validationResult } = require("express-validator");

const gatewayAuthEndpoint = "/api/v1.0/auth";

const tokenService = async (req, res, next) => {
  const header = await req.headers.authorization;
  const refresh = await req.headers.refresh;

  if (refresh != null && header != null) {
    let id;

    try {
      const tkn = await header.split(" ")[1]; //split or u can use replace('Bearer', '')
      const decodedToken = jwt.verify(tkn, process.env.SECRET_KEY);
      id = decodedToken.id;

      const findUser = await User.findById(id).exec();

      if (!findUser) {
        return errorHandler(
          401,
          "unauthorized",
          loadVariablesFromI18,
          req,
          res,
        );
      } else {
        const headers = await req.headers;

        const response = await axios.get(
          process.env.AUTHSERVICE + "/refreshToken",
          {
            type: "refreshToken",
            headers,
          },
        );
        if (response.status < 400 && response.data.success) {
          await res.status(200).json({
            success: response.data.success,
            token: response.data.token,
            refreshToken: response.data.refreshToken,
          });
        } else {
          return errorHandler(
            404,
            "user-not-found",
            loadVariablesFromI18,
            req,
            res,
          );
        }
      }
    } catch (error) {
      if (Error(error).message == "TokenExpiredError: jwt expired") {
        try {
          const reftoken = await refresh.split(" ")[1]; //split or u can use replace('Bearer', '')
          const decoded = jwt.verify(reftoken, process.env.SECRET_KEY_REFRESH);

          id = await decoded.id;

          const findUser = await User.findById(id).exec();

          if (!findUser) {
            return errorHandler(
              401,
              "unauthorized",
              loadVariablesFromI18,
              req,
              res,
            );
          } else {
            const headers = await req.headers;

            const response = await axios.get(
              process.env.AUTHSERVICE + "/refreshToken",
              {
                type: "refreshToken",
                headers,
              },
            );
            if (response.status < 400 && response.data.success) {
              await res.status(200).json({
                success: response.data.success,
                token: response.data.token,
                refreshToken: response.data.refreshToken,
              });
            } else {
              return errorHandler(
                404,
                "user-not-found",
                loadVariablesFromI18,
                req,
                res,
              );
            }
          }
        } catch (e) {
          return await errorHandler(401, "Permission denied", false, req, res);
        }
      }
    }
  } else {
    return errorHandler(401, "unauthorized", loadVariablesFromI18, req, res);
  }
};

const verifyEmail = async (req, res, next) => {
  try {
    const token = req.query.id;
    if (token) {
      const response = await axios.get(
        process.env.AUTHSERVICE + "/verify?id=" + token,
        {
          type: "ActivateEmail",
        },
      );
      if (response.status < 400 && response.data.success) {
        res.redirect(gatewayAuthEndpoint + "/emailActivated");
      } else {
        res.redirect(gatewayAuthEndpoint + "/tokeninvalid");
      }
    } else {
      res.redirect(gatewayAuthEndpoint + "/tokeninvalid");
    }
  } catch (error) {
    res.redirect(gatewayAuthEndpoint + "/tokeninvalid");
  }
};

const updatePasswordWebContent = async (req, res) => {
  try {
    const tkn = req.params.token.trim();
    const id = req.params.id.trim();

    if (tkn && id) {
      const headers = {
        permission: req.headers.permission,
      };
      const response = await axios.get(
        process.env.AUTHSERVICE + `/updatePw/${id}/${tkn}`,
        {
          type: "RenderForgetPw",
          headers,
        },
      );
      if (response.status < 400 && response.data.success) {
        res.render("forgetPassword", {
          id: response.data.data.id,
          token: response.data.data.token,
          layout: "./layout/standardLayout.ejs",
        });
      } else {
        res.redirect(gatewayAuthEndpoint + "/tokeninvalid");
      }
    } else {
      res.redirect(gatewayAuthEndpoint + "/tokeninvalid");
    }
  } catch (error) {
    res.redirect(gatewayAuthEndpoint + "/tokeninvalid");
  }
};

const savePassword = async (req, res) => {
  const validationErrors = validationResult(req);
  const id = req.body.id.trim();
  if (!validationErrors.isEmpty()) {
    req.flash("validation_error", validationErrors.array());
    req.flash("password", req.body.password);
    req.flash("repeatPassword", req.body.repeatPassword);

    res.redirect(
      gatewayAuthEndpoint + "/updatePw/" + id + "/" + req.body.token.trim(),
    );
  } else {
    const id = req.body.id.trim();
    const findUser = await User.findById(id).exec();

    if (!findUser) {
      res.redirect(gatewayAuthEndpoint + "/passwordError");
    } else {
      const id = req.body.id.trim();
      const headers = {
        Authorization: id,
        permission: process.env.PERMISSION_KEY,
      };

      const response = await axios.patch(
        process.env.AUTHSERVICE + "/updatePassword/" + id,
        {
          type: "updatePassword",
          data: {
            password: req.body.password,
            repeat_password: req.body.repeatPassword,
            last_update_from_user: id,
          },
        },
        { headers },
      );
      if (response.data.success) {
        res.redirect(gatewayAuthEndpoint + "/passwordsvd");
      } else {
        res.redirect(gatewayAuthEndpoint + "/passwordError");
      }
    }
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
