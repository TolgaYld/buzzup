const { User, Post, Comment, Report, log } = require("@TolgaYld/core-buzzup");
const errorHandler = require("../errors/errorHandler");
const { token, refreshToken } = require("../helpers/token");
const bcrypt = require("bcrypt");
const validator = require("validator");
const generatePwdCharset = require('../helpers/pwdCharset');

const saltValue = 12;
const tokenDuration = "3h";
const refreshTokenDuration = "30d";
const validatePasswordOptions = {
  minLength: 6,
  minLowercase: 0,
  minUppercase: 0,
  minNumbers: 0,
  minSymbols: 0,
  returnScore: false,
  pointsPerUnique: 0,
  pointsPerRepeat: 0,
  pointsForContainingLower: 0,
  pointsForContainingUpper: 0,
  pointsForContainingNumber: 0,
  pointsForContainingSymbol: 0,
};

const findAll = async (req, res) => {
  try {
    const id = req.headers.authorization;

    if (id == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findUser = await User.findById(id).exec();

      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const findAllUsers = await User.find().exec();
        if (!findAllUsers) {
          return await errorHandler(404, "users-not-found", true, req, res);
        } else {
          await res.status(200).json({
            success: true,
            data: findAllUsers,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const findOne = async (req, res) => {
  try {
    const userId = req.headers.authorization;

    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findUser = await User.findById(userId).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const { id } = req.params;
        const findOneUser = await User.findById(id).exec();

        if (!findOneUser) {
          return await errorHandler(404, "user-not-found", true, req, res);
        } else {
          await res.status(200).json({
            success: true,
            data: findOneUser,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const findWithUsername = async (req, res) => {
  try {
    const userId = req.headers.authorization;

    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findUser = await User.findById(userId).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const { username } = req.params;
        const findOneUser = await User.findOne({ username }).exec();

        if (!findOneUser) {
          return await errorHandler(404, "user-not-found", true, req, res);
        } else {
          await res.status(200).json({
            success: true,
            data: findOneUser,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const findWithEmail = async (req, res) => {
  try {
    const userId = req.headers.authorization;

    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findUser = await User.findById(userId).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const { email } = req.params;
        const findOneUser = await User.findOne({ email }).exec();

        if (!findOneUser) {
          return await errorHandler(404, "user-not-found", true, req, res);
        } else {
          await res.status(200).json({
            success: true,
            data: findOneUser,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const checkIfEmailExists = async (req, res) => {
  try {
    const { email } = req.params;
    const findOneUser = await User.findOne({ email }).exec();

    if (!findOneUser) {
      await res.status(200).json({
        success: true,
        data: false,
      });
    } else {
      await res.status(200).json({
        success: true,
        data: true,
      });
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const checkIfUsernameExists = async (req, res) => {
  try {
    const { username } = req.params;
    const findOneUser = await User.findOne({ username }).exec();

    if (!findOneUser) {
      await res.status(200).json({
        success: true,
        data: false,
      });
    } else {
      await res.status(200).json({
        success: true,
        data: true,
      });
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const createUser = async (req, res) => {
  log("aaaa");
  const isEmail = validator.isEmail(req.body.data.email);


  const isStrongPassword = validator.isStrongPassword(
    req.body.data.password,
    validatePasswordOptions,
  );

  if (!isEmail || !isStrongPassword) {
    if (!isEmail) {
      return await errorHandler(406, "not-valid-email", true, req, res);
    }
    if (!isStrongPassword) {
      return await errorHandler(406, "pw-at-least-character", true, req, res);
    }
  } else {
    if (req.body.data.password !== req.body.data.repeat_password) {
      return await errorHandler(406, "pw-not-match", true, req, res);
    } else {
      try {
        const findUserWithEmail = await User.findOne({
          email: req.body.data.email,
        }).exec();

        if (findUserWithEmail) {
          return await errorHandler(406, "email-in-use", true, req, res);
        } else {
          const findUserWithUsername = await User.findOne({
            username: req.body.data.username,
          }).exec();

          if (findUserWithUsername) {
            return await errorHandler(406, "username-in-use", true, req, res);
          } else {
            delete req.body.data.repeat_password;
            const createdUser = await User.create({
              ...req.body.data,

              password: await bcrypt.hash(req.body.data.password, saltValue),
              location: {
                coordinates: req.body.data.coordinates,
              },
            });

            if (!createdUser) {
              return await errorHandler(
                400,
                "user-not-created",
                true,
                req,
                res,
              );
            } else {
              //   let transporter = nodemailer.createTransport({
              //   host: process.env.MAIL_HOST_SMTP,
              //   auth: {
              //     user: process.env.MAIL_USER,
              //     pass: process.env.MAIL_PW,
              //   },
              // });

              // const jwtInfos = {
              //   id: createdUser.id,
              //   email: createdUser.email,
              // };

              // const jwtToken = jwt.sign(
              //   jwtInfos,
              //   process.env.CONFIRM_MAIL_SECRET_KEY,
              //   {
              //     expiresIn: "365d",
              //   },
              // );

              // const url = process.env.GATEWAY_URL + "/auth/verify?id=" + jwtToken;

              // await transporter.sendMail({
              //   from: process.env.MAIL_USER,
              //   to: createdUser.email.trim(),
              //   subject: "Confirm E-Mail",
              //   html: confirmEmailTemplate(url),
              // });

              await res.status(201).json({
                success: true,
                data: {
                  user: createdUser,
                  tokens: {
                    token: token.generate(createdUser, tokenDuration),
                    refreshToken: refreshToken.generate(
                      createdUser,
                      refreshTokenDuration,
                    ),
                  },
                },
              });
            }
          }
        }
      } catch (error) {
        log(error);
        return await errorHandler(400, error, false, req, res);
      }
    }
  }
};

const signInUser = async (req, res) => {
  const isEmail = validator.isEmail(req.body.data.emailOrUsername);

  try {
    let findUser;
    if (isEmail) {
      findUser = await User.findOne({
        email: req.body.data.emailOrUsername,
      }).exec();
    } else {
      findUser = await User.findOne({
        username: req.body.data.emailOrUsername,
      }).exec();
    }

    if (!findUser) {
      return await errorHandler(406, "authentication-failed", true, req, res);
    } else {
      if (findUser.provider !== "LOCAL") {
        return await errorHandler(406, "authentication-failed", true, req, res);
      } else {
        if (findUser.is_banned) {
          return await errorHandler(403, "user-is-banned", true, req, res);
        } else {
          const validPassword = await bcrypt.compare(
            req.body.data.password,
            findUser.password,
          );
          if (!validPassword) {
            return await errorHandler(
              406,
              "authentication-failed",
              true,
              req,
              res,
            );
          } else {
            if (findUser.is_deleted) {
              const updatedUser = await User.findByIdAndUpdate(
                findUser._id,
                {
                  is_deleted: false,
                },
                { new: true },
              ).exec();
              if (!updatedUser) {
                return await errorHandler(
                  400,
                  "user-update-failed",
                  true,
                  req,
                  res,
                );
              } else {
                await Post.updateMany(
                  { user: updatedUser._id },
                  { is_deleted: false },
                ).exec();

                await Comment.updateMany(
                  { user: updatedUser._id },
                  { is_deleted: false },
                ).exec();

                await Report.updateMany(
                  { reported_user: updatedUser._id },
                  { is_deleted: false },
                ).exec();

                await res.status(200).json({
                  success: true,
                  data: {
                    user: updatedUser,
                    tokens: {
                      token: token.generate(updatedUser, tokenDuration),
                      refreshToken: refreshToken.generate(
                        updatedUser,
                        refreshTokenDuration,
                      ),
                    },
                  },
                });
              }
            } else {
              await res.status(200).json({
                success: true,
                data: {
                  user: findUser,
                  tokens: {
                    token: token.generate(findUser, tokenDuration),
                    refreshToken: refreshToken.generate(
                      findUser,
                      refreshTokenDuration,
                    ),
                  },
                },
              });
            }
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(400, error, false, req, res);
  }
};

const authUserWithProvider = async (req, res) => {
  const isEmail = validator.isEmail(req.body.data.email);

  try {
    let findUser;
    if (isEmail) {
      findUser = await User.findOne({
        email: req.body.data.email.toLowerCase(),
      }).exec();

      if (!findUser) {
        //Create new User
        let pwdChars =
          generatePwdCharset(true, true, true, true, false);
        let pwdLen = 21;
        let randPassword = Array(pwdLen)
          .fill(pwdChars)
          .map(function (x) {
            return x[Math.floor(Math.random() * x.length)];
          })
          .join("");

        const uid = new ShortUniqueId({ length: 12 });

        const createdUser = await User.create({
          ...req.body.data,
          password: await bcrypt.hash(randPassword, saltValue),
          username: "user" + uid,
          location: {
            coordinates: req.body.data.coordinates,
          },
        });

        if (!createdUser) {
          return await errorHandler(400, "user-not-created", true, req, res);
        } else {
          //   let transporter = nodemailer.createTransport({
          //   host: process.env.MAIL_HOST_SMTP,
          //   auth: {
          //     user: process.env.MAIL_USER,
          //     pass: process.env.MAIL_PW,
          //   },
          // });

          // const jwtInfos = {
          //   id: createdUser.id,
          //   email: createdUser.email,
          // };

          // const jwtToken = jwt.sign(
          //   jwtInfos,
          //   process.env.CONFIRM_MAIL_SECRET_KEY,
          //   {
          //     expiresIn: "365d",
          //   },
          // );

          // const url = process.env.GATEWAY_URL + "/auth/verify?id=" + jwtToken;

          // await transporter.sendMail({
          //   from: process.env.MAIL_USER,
          //   to: createdUser.email.trim(),
          //   subject: "Confirm E-Mail",
          //   html: confirmEmailTemplate(url),
          // });

          await res.status(201).json({
            success: true,
            data: {
              user: createdUser,
              tokens: {
                token: token.generate(createdUser, tokenDuration),
                refreshToken: refreshToken.generate(
                  createdUser,
                  refreshTokenDuration,
                ),
              },
            },
          });
        }
      } else {
        if (findUser.is_banned) {
          return await errorHandler(403, "user-is-banned", true, req, res);
        } else {
          if (findUser.is_deleted) {
            const updatedUser = await User.findByIdAndUpdate(
              findUser._id,
              {
                is_deleted: false,
                provider: req.body.data.provider,
                provider_id: req.body.data.provider_id,
                location: {
                  coordinates: req.body.data.coordinates,
                },
              },
              { new: true },
            ).exec();
            if (!updatedUser) {
              return await errorHandler(
                400,
                "user-update-failed",
                true,
                req,
                res,
              );
            } else {
              await Post.updateMany(
                { user: updatedUser._id },
                { is_deleted: false },
              ).exec();

              await Comment.updateMany(
                { user: updatedUser._id },
                { is_deleted: false },
              ).exec();

              await Report.updateMany(
                { reported_user: updatedUser._id },
                { is_deleted: false },
              ).exec();

              await res.status(200).json({
                success: true,
                data: {
                  user: updatedUser,
                  tokens: {
                    token: token.generate(updatedUser, tokenDuration),
                    refreshToken: refreshToken.generate(
                      updatedUser,
                      refreshTokenDuration,
                    ),
                  },
                },
              });
            }
          } else {
            if (findUser.provider !== req.body.provider) {
              const updatedUser = await User.findByIdAndUpdate(
                findUser._id,
                {
                  provider: req.body.data.provider,
                  provider_id: req.body.data.provider_id,
                  location: {
                    coordinates: req.body.data.coordinates,
                  },
                },
                { new: true },
              ).exec();
              await res.status(200).json({
                success: true,
                data: {
                  user: updatedUser,
                  tokens: {
                    token: token.generate(updatedUser, tokenDuration),
                    refreshToken: refreshToken.generate(
                      updatedUser,
                      refreshTokenDuration,
                    ),
                  },
                },
              });
            } else {
              await res.status(200).json({
                success: true,
                data: {
                  user: findUser,
                  tokens: {
                    token: token.generate(findUser, tokenDuration),
                    refreshToken: refreshToken.generate(
                      findUser,
                      refreshTokenDuration,
                    ),
                  },
                },
              });
            }
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(400, error, false, req, res);
  }
};

const updateUser = async (req, res) => {
  try {
    const userId = req.headers.authorization;

    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findreqerId = await User.findById(userId).exec();
      if (!findreqerId) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const { id } = req.params;
        const findUser = await User.findById(id).exec();

        if (!findUser) {
          return await errorHandler(404, "user-not-found", true, req, res);
        } else {
          const updatedUser = await User.findByIdAndUpdate(
            id,
            {
              ...req.body.data,
              location: {
                coordinates: req.body.coordinates,
              },
            },
            { new: true },
          ).exec();

          if (!updatedUser) {
            return await errorHandler(
              400,
              "user-update-failed",
              true,
              req,
              res,
            );
          } else {
            if (req.body.data.is_deleted) {
              await res.status(200).send({
                success: true,
                data: updatedUser,
              });
            } else {
              await res.status(200).json({
                success: true,
                data: {
                  user: updatedUser,
                  tokens: {
                    token: token.generate(updatedUser, tokenDuration),
                    refreshToken: refreshToken.generate(
                      updatedUser,
                      refreshTokenDuration,
                    ),
                  },
                },
              });
            }
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const updateUserPassword = async (req, res) => {
  try {
    const userId = req.headers.authorization;
    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findRequesterId = await User.findById(userId).exec();
      if (!findRequesterId) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const isStrongPassword = validator.isStrongPassword(
          req.body.data.password,
          validatePasswordOptions,
        );
        if (!isStrongPassword) {
          return await errorHandler(
            406,
            "pw-at-least-character",
            true,
            req,
            res,
          );
        } else {
          if (req.body.data.password !== req.body.data.repeat_password) {
            return await errorHandler(406, "pw-not-match", true, req, res);
          } else {
            const { id } = req.params;
            const findUser = await User.findById(id).exec();

            if (!findUser) {
              return await errorHandler(404, "user-not-found", true, req, res);
            } else {
              const updatedUser = await User.findByIdAndUpdate(
                findUser._id,
                {
                  password: await bcrypt.hash(
                    req.body.data.password,
                    saltValue,
                  ),
                },
                { new: true },
              ).exec();

              if (!updatedUser) {
                return await errorHandler(
                  400,
                  "user-password-update-failed",
                  true,
                  req,
                  res,
                );
              } else {
                await res.status(200).json({
                  success: true,
                  data: {
                    user: updatedUser,
                    tokens: {
                      token: token.generate(updatedUser, tokenDuration),
                      refreshToken: refreshToken.generate(
                        updatedUser,
                        refreshTokenDuration,
                      ),
                    },
                  },
                });
              }
            }
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const deleteUser = async (req, res) => {
  try {
    const userId = req.headers.authorization;

    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findRequesterId = await User.findById(userId).exec();
      if (!findRequesterId) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const { id } = req.params;
        const findUser = await User.findById(id).exec();

        if (!findUser) {
          return await errorHandler(404, "user-not-found", true, req, res);
        } else {
          const deletedUser = await User.findByIdAndUpdate(
            id,
            {
              is_deleted: true,
            },
            { new: true },
          ).exec();

          if (!deletedUser) {
            return await errorHandler(
              400,
              "user-update-failed",
              true,
              req,
              res,
            );
          } else {
            await res.status(200).json({
              success: true,
              data: deletedUser,
            });
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const deleteUserFromDb = async (req, res) => {
  try {
    const userId = req.headers.authorization;

    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findRequesterId = await User.findById(userId).exec();
      if (!findRequesterId) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const { id } = req.params;
        const findUser = await User.findById(id).exec();

        if (!findUser) {
          return await errorHandler(404, "user-not-found", true, req, res);
        } else {
          const deletedUser = await User.findByIdAndDelete(id);

          if (!deletedUser) {
            return await errorHandler(
              400,
              "user-delete-failed",
              true,
              req,
              res,
            );
          } else {
            await res.status(200).json({
              success: true,
              data: findUser,
            });
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const tokenService = async (req, res) => {
  const tokenDuration = "3h";
  const refreshTokenDuration = "90d";
  const refresh = await req.headers.refresh;
  const authorization = await req.headers.authorization;

  if (refresh != null && authorization != null) {
    let id;

    try {
      const reftoken = await refresh.split(" ")[1]; //split or u can use replace('Bearer', '')
      const decoded = jwt.verify(reftoken, process.env.SECRET_KEY_REFRESH);

      id = await decoded.id;

      const findUser = await User.findById(id).exec();

      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        await res.status(200).json({
          success: true,
          tokens: {
            token: token.generate(findUser, tokenDuration),
            refreshToken: refreshToken.generate(findUser, refreshTokenDuration),
          },
        });
      }
    } catch (error) {
      return await errorHandler(404, error, false, req, res);
    }
  } else {
    return await errorHandler(401, "unauthorized", true, req, res);
  }
};

const resetPassword = async (req, res) => {
  const tokenDuration = "3h";

  try {
    const findUser = await User.findOne({ email: req.body.data.email }).exec();

    if (!findUser) {
      return await errorHandler(
        400,
        "Could not reset password",
        true,
        req,
        res,
      );
    } else {
      // const jwtInfos = {
      //   id: findUser.id,
      // };

      // const secret = process.env.UPDATE_PW_SECRET_KEY + "-" + findUser.password;
      // const jwtToken = jwt.sign(jwtInfos, secret, { expiresIn: tokenDuration });

      // const url =
      //   process.env.GATEWAY_URL +
      //   "/auth/updatePw/" +
      //   findUser.id +
      //   "/" +
      //   jwtToken;

      // let transporter = nodemailer.createTransport({
      //   host: process.env.MAIL_HOST_SMTP,
      //   auth: {
      //     user: process.env.MAIL_USER,
      //     pass: process.env.MAIL_PW,
      //   },
      // });
      // let emailSended = await transporter.sendMail({
      //   from: process.env.MAIL_USER,
      //   to: findUser.email.trim(),
      //   subject: "Reset Password",
      //   html: resetPasswordTemplate(url),
      // });

      // if (emailSended.accepted.length > 0) {
      await res.json({
        success: true,
        data: findUser.email,
      });
      // } else {
      //   return await errorHandler(
      //     400,
      //     "Could not reset password",
      //     true,
      //     req,
      //     res,
      //   );
      // }
    }
  } catch (error) {
    return await errorHandler(400, error, false, req, res);
  }
};

const verifyEmail = async (req, res, next) => {
  try {
    const token = req.query.id;
    if (token) {
      jwt.verify(
        token,
        process.env.CONFIRM_MAIL_SECRET_KEY,
        async (e, decoded) => {
          if (e) {
            return await errorHandler(404, e, false, req, res);
          } else {
            const idInToken = decoded.id;
            const findUser = await User.findOne({
              _id: idInToken,
              email_confirmed: false,
            }).exec();

            if (findUser) {
              const updatedUser = await User.findByIdAndUpdate(
                findUser._id,
                {
                  email_confirmed: true,
                },
                { new: true },
              );

              if (updatedUser) {
                await res.status(200).json({
                  success: true,
                  data: updatedUser,
                });
              } else {
                return await errorHandler(
                  404,
                  "Could not activate e-mail",
                  false,
                  req,
                  res,
                );
              }
            } else {
              return await errorHandler(
                404,
                "Could not activate e-mail",
                false,
                req,
                res,
              );
            }
          }
        },
      );
    } else {
      return await errorHandler(
        404,
        "Could not activate e-mail",
        false,
        req,
        res,
      );
    }
  } catch (error) {
    return await errorHandler(
      404,
      "Could not activate e-mail",
      false,
      req,
      res,
    );
  }
};

const updatePasswordWebContent = async (req, res) => {
  try {
    const tkn = req.params.token.trim();
    const id = req.params.id.trim();

    let findUser;
    if (tkn && id) {
      try {
        findUser = await User.findById(id).exec();
      } catch (error) {
        return await errorHandler(
          400,
          "Could not reset password",
          true,
          req,
          res,
        );
      }

      if (findUser) {
        const secret =
          process.env.UPDATE_PW_SECRET_KEY + "-" + findUser.password;
        jwt.verify(tkn, secret, async (e, decoded) => {
          if (e) {
            return await errorHandler(
              400,
              "Could not reset password",
              true,
              req,
              res,
            );
          } else {
            await res.status(200).json({
              success: true,
              data: {
                id: findUser.id,
                token: tkn,
              },
            });
          }
        });
      } else {
        return await errorHandler(
          400,
          "Could not reset password",
          true,
          req,
          res,
        );
      }
    } else {
      return await errorHandler(
        400,
        "Could not reset password",
        true,
        req,
        res,
      );
    }
  } catch (error) {
    return await errorHandler(400, "Could not reset password", true, req, res);
  }
};

module.exports = {
  findAll,
  findOne,
  findWithUsername,
  findWithEmail,
  createUser,
  signInUser,
  updateUser,
  updateUserPassword,
  deleteUser,
  deleteUserFromDb,
  tokenService,
  resetPassword,
  verifyEmail,
  updatePasswordWebContent,
  authUserWithProvider,
  checkIfEmailExists,
  checkIfUsernameExists,
};
