const mongoose = require("mongoose");
const { User, Post, Comment, Report, log } = require("@TolgaYld/core-buzzup");
const errorHandler = require("../errors/errorHandler");
const { token, refreshToken } = require("../helpers/token");
const bcrypt = require("bcrypt");
const validator = require("validator");
const generateRandomPassword = require('../helpers/pwdHandler');
const sendConfirmationEmail = require("../helpers/sendConfirmationEmail");

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
  const findAllUsers = await User.find().exec();

  if (findAllUsers == null) {
    throw { statusCode: 404, message: "users-not-found" };
  }

  res.status(200).json({
    success: true,
    data: findAllUsers,
  });
};

const findOne = async (req, res) => {
  const { id } = req.params;

  const findOneUser = await User.findById(id).exec();
  if (findOneUser == null) {
    throw { statusCode: 404, message: "user-not-found" };
  }

  return res.status(200).json({
    success: true,
    data: findOneUser,
  });
};

const findWithUsername = async (req, res) => {
  const { username } = req.params;

  const findOneUser = await User.findOne({ username }).exec();
  if (findOneUser == null) {
    throw { statusCode: 404, message: "user-not-found" };
  }

  return res.status(200).json({
    success: true,
    data: findOneUser,
  });
};

const findWithEmail = async (req, res) => {
  const { email } = req.params;

  const findOneUser = await User.findOne({ email }).exec();
  if (!findOneUser) {
    throw { statusCode: 404, message: "user-not-found" };
  }

  return res.status(200).json({
    success: true,
    data: findOneUser,
  });
};


const checkIfEmailExists = async (req, res) => {
  const { email } = req.params;
  const findOneUser = await User.findOne({ email }).exec();
  return res.status(200).json({
    success: true,
    data: !!findOneUser,
  });
};


const checkIfUsernameExists = async (req, res) => {
  const { username } = req.params;
  const findOneUser = await User.findOne({ username }).exec();
  await res.status(200).json({
    success: true,
    data: !!findOneUser,
  });


};

const createUser = async (req, res) => {
  const { email, password, repeat_password, username, coordinates } = req.body.data;

  if (validator.isEmail(email) === false) {
    throw { statusCode: 406, message: "not-valid-email" };
  }

  if (validator.isStrongPassword(password, validatePasswordOptions) === false) {
    throw { statusCode: 406, message: "pw-at-least-character" };
  }

  if (password !== repeat_password) {
    throw { statusCode: 406, message: "pw-not-match" };
  }

  const existingUser = await User.findOne({
    $or: [{ email }, { username }],
  }).exec();

  if (existingUser != null) {
    if (existingUser.email === email) {
      throw { statusCode: 406, message: "email-in-use" };
    }
    if (existingUser.username === username) {
      throw { statusCode: 406, message: "username-in-use" };
    }
  }

  // create new user
  const hashedPassword = await bcrypt.hash(password, saltValue);
  const newUserData = {
    email,
    username,
    password: hashedPassword,
    location: { coordinates },
  };

  const createdUser = await User.create(newUserData);
  if (createdUser === null) {
    throw { statusCode: 400, message: "user-not-created" };
  }

  // // send confirmation email
  // const transporter = nodemailer.createTransport({
  //   host: process.env.MAIL_HOST_SMTP,
  //   auth: {
  //     user: process.env.MAIL_USER,
  //     pass: process.env.MAIL_PW,
  //   },
  // });

  // await sendConfirmationEmail(
  //   createdUser,
  //   transporter,
  //   jwt,
  //   confirmEmailTemplate,
  //   errorHandler
  // );

  return sendSuccessResponseWithTokens(createdUser, res, 201);
};

const signInUser = async (req, res) => {
  const { emailOrUsername, password, coordinates } = req.body.data;
  const isEmail = validator.isEmail(emailOrUsername);
  const findUser = await User.findOne(
    isEmail ? { email: emailOrUsername } : { username: emailOrUsername }
  ).exec();

  if (findUser == null) {
    throw { statusCode: 406, message: "authentication-failed" };
  }

  if (findUser.provider != "LOCAL") {
    throw { statusCode: 406, message: "authentication-failed" };
  }

  if (findUser.is_banned) {
    throw { statusCode: 403, message: "user-is-banned" };
  }

  const validPassword = await bcrypt.compare(password, findUser.password);
  if (validPassword == false) {
    throw { statusCode: 406, message: "authentication-failed" };
  }
  if (findUser.is_deleted) {
    return await handleDeletedUserRestoration(findUser, { location: { coordinates } }, res);
  }

  findUser = await User.findByIdAndUpdate(
    findUser._id,
    { location: { coordinates } },
    { new: true }
  ).exec();

  if (findUser == null) {
    throw { statusCode: 406, message: "authentication-failed" };
  }

  return sendSuccessResponseWithTokens(findUser, res);
};

const authUserWithProvider = async (req, res) => {
  const { email, provider, provider_id, coordinates } = req.body.data;

  if (!validator.isEmail(email)) {
    throw { statusCode: 400, message: "invalid-email" };
  }

  const normalizedEmail = email.toLowerCase();
  let findUser = await User.findOne({ email: normalizedEmail }).exec();

  if (findUser == null) {
    const randomPassword = generateRandomPassword();
    const hashedPassword = await bcrypt.hash(randomPassword, saltValue);

    const uid = new ShortUniqueId({ length: 12 });

    const createdUser = await User.create({
      email,
      username: `user${uid}`,
      password: hashedPassword,
      provider,
      provider_id,
      location: { coordinates },
    });

    if (createdUser == null) {
      throw { statusCode: 400, message: "user-not-created" };
    }
    return sendSuccessResponseWithTokens(createdUser, res, 201);
  }

  if (findUser.is_banned) {
    throw { statusCode: 403, message: "user-is-banned" };
  }

  if (findUser.is_deleted) {
    return await handleDeletedUserRestoration(findUser, { provider, provider_id, location: { coordinates } }, res);
  }

  if (findUser.provider !== provider) {
    findUser = await User.findByIdAndUpdate(
      findUser._id,
      { provider, provider_id, location: { coordinates } },
      { new: true }
    ).exec();
  }
  return sendSuccessResponseWithTokens(findUser, res);
};

const updateUser = async (req, res) => {
  const { id } = req.params;
  const updateData = {
    ...req.body.data,
    location: {
      coordinates: req.body.coordinates,
    },
  };

  const userToUpdate = await User.findById(id).exec();

  if (userToUpdate == null) {
    throw { statusCode: 404, message: "user-not-found" };
  }

  const updatedUser = await User.findByIdAndUpdate(id, updateData, { new: true }).exec();

  if (updatedUser == null) {
    throw { statusCode: 400, message: "user-update-failed" };
  }

  if (req.body.data.is_deleted) {
    return res.status(200).send({
      success: true,
      data: updatedUser,
    });
  }

  return await sendSuccessResponseWithTokens(updatedUser, res);
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

// Helper Functions
const handleDeletedUserRestoration = async (user, updateData, res) => {
  const session = await mongoose.startSession();
  session.startTransaction();

  try {
    const updatedUser = await User.findByIdAndUpdate(
      user._id,
      { ...updateData, is_deleted: false },
      { new: true, session }
    ).exec();

    if (updatedUser == null) {
      throw { statusCode: 400, message: "user-update-failed" };
    }

    await Promise.all([
      Post.updateMany({ user: updatedUser._id }, { is_deleted: false }, { session }),
      Comment.updateMany({ user: updatedUser._id }, { is_deleted: false }, { session }),
      Report.updateMany({ reported_user: updatedUser._id }, { is_deleted: false }, { session }),
    ]);

    await session.commitTransaction();
    session.endSession();

    return sendSuccessResponseWithTokens(updatedUser, res);
  } catch (error) {
    await session.abortTransaction();
    session.endSession();
    throw error;
  }
};

const sendSuccessResponseWithTokens = (user, res, statusCode = 200) => {
  return res.status(statusCode).json({
    success: true,
    data: {
      user,
      tokens: {
        token: token.generate(user, tokenDuration),
        refreshToken: refreshToken.generate(user, refreshTokenDuration),
      },
    },
  });
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
