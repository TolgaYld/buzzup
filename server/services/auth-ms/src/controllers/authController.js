const mongoose = require("mongoose");
const redis = require("../db/redis/dbConnection");
const { User, Post, Comment, Report, log, SECRET_KEY, SECRET_KEY_REFRESH } = require("@TolgaYld/core-buzzup");
const { token, refreshToken } = require("../helpers/token");
const bcrypt = require("bcrypt");
const crypto = require("crypto");
const validator = require("validator");
const generateRandomPassword = require('../helpers/pwdHandler');
const { sendConfirmationEmail, sendResetEmail } = require("../helpers/mailHandler");
const jwt = require("jsonwebtoken");

const saltValue = 12;
const tokenDuration = process.env.NODE_ENV.toString() === "production" ? "15m" : "1m";
const refreshTokenDuration = process.env.NODE_ENV.toString() === "production" ? "7d" : "1d";
const algorithm = 'sha256';
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
  // await sendConfirmationEmail(
  //   createdUser,
  //   confirmEmailTemplate,
  //   errorHandler
  // );

  return sendSuccessResponseWithTokens(createdUser, res, 201);
};

const signInUser = async (req, res) => {
  const { emailOrUsername, password, coordinates } = req.body.data;
  const isEmail = validator.isEmail(emailOrUsername);
  let findUser = await User.findOne(
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
    return await handleDeletedUserRestoration(findUser, { location: { type: "Point", coordinates } }, res);
  }

  findUser = await User.findByIdAndUpdate(
    findUser._id,
    { location: { type: "Point", coordinates } },
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
  const { id } = req.params;
  const { password, repeat_password } = req.body.data;

  if (validator.isStrongPassword(password, validatePasswordOptions) == false) {
    throw { statusCode: 406, message: "pw-at-least-character" };
  }

  if (password !== repeat_password) {
    throw { statusCode: 406, message: "pw-not-match" };
  }

  const findUser = await User.findById(id).exec();
  if (findUser == null) {
    throw { statusCode: 404, message: "user-not-found" };
  }

  const hashedPassword = await bcrypt.hash(password, saltValue);
  const updatedUser = await User.findByIdAndUpdate(
    findUser._id,
    { password: hashedPassword },
    { new: true }
  ).exec();

  if (updatedUser == null) {
    throw { statusCode: 400, message: "user-password-update-failed" };
  }

  return await sendSuccessResponseWithTokens(updatedUser, res);
};

const deleteUser = async (req, res) => {
  const { id } = req.params;
  const userToDelete = await User.findById(id).exec();

  if (userToDelete == null) {
    throw { statusCode: 404, message: "user-not-found" };
  }

  const deletedUser = await User.findByIdAndUpdate(
    id,
    { is_deleted: true },
    { new: true }
  ).exec();

  if (deletedUser == null) {
    throw { statusCode: 400, message: "user-update-failed" };
  }

  return res.status(200).json({
    success: true,
    data: deletedUser,
  });
};

const deleteUserFromDb = async (req, res) => {
  const { id } = req.params;
  const userToDelete = await User.findById(id).exec();

  if (userToDelete == null) {
    throw { statusCode: 404, message: "user-not-found" };
  }

  const deletedUser = await User.findByIdAndDelete(id).exec();

  if (deletedUser == null) {
    throw { statusCode: 400, message: "user-delete-failed" };
  }

  return res.status(200).json({
    success: true,
    data: userToDelete,
  });
};

const tokenService = async (req, res) => {
  const refresh = req.headers.refresh;
  const authorization = req.headers.authorization;

  if (refresh == null || authorization == null) {
    throw { statusCode: 401, message: "unauthorized" };
  }
  const refrToken = refresh.split(" ")[1];
  const accessToken = authorization.split(" ")[1];
  try {
    const decodedRefresh = jwt.verify(refrToken, SECRET_KEY_REFRESH);
    await blacklistValidation(refrToken, decodedRefresh.exp);
    const { id } = decodedRefresh;
    try {
      jwt.verify(accessToken, SECRET_KEY);
    } catch (err) {
      if (err.name === "TokenExpiredError") {
        log("access token expired but refresh token is valid");
      } else {
        throw { statusCode: 401, message: "unauthorized" };
      }
    }
    const findUser = await User.findById(id).exec();
    if (findUser == null) {
      throw { statusCode: 401, message: "unauthorized" };
    }
    return res.status(200).json({
      success: true,
      token: token.generate(findUser, tokenDuration),
      refreshToken: refreshToken.generate(findUser, refreshTokenDuration),
    });
  } catch (err) {
    throw { statusCode: 401, message: "unauthorized" };
  }
};


const signOut = async (req, res) => {
  const id = req.user._id;
  const findOneUser = await User.findById(id).exec();

  return res.status(200).json({
    success: true,
    data: findOneUser,
  });
};

const toggleTune = async (req, res) => {
  const { id } = req.params;
  const idOfToggler = req.user._id;

  const toggledUser = await User.findById(id).exec();
  const toggler = await User.findById(idOfToggler).exec();

  if (toggledUser == null || toggler == null) {
    return res.status(404).json({ message: "user-not-found" });
  }

  const isTuned = toggler.tunings && toggler.tunings.includes(toggledUser._id);
  try {
    const session = await mongoose.startSession();
    session.startTransaction();

    if (isTuned) {
      await User.findByIdAndUpdate(
        idOfToggler,
        { $pull: { tunings: toggledUser._id } },
        { session }
      ).exec();

      await User.findByIdAndUpdate(
        id,
        { $pull: { tuned_by: toggler._id } },
        { session }
      ).exec();
    } else {
      await User.findByIdAndUpdate(
        idOfToggler,
        { $addToSet: { tunings: toggledUser._id } },
        { session }
      ).exec();

      await User.findByIdAndUpdate(
        id,
        { $addToSet: { tuned_by: toggler._id } },
        { session }
      ).exec();
    }

    await session.commitTransaction();
    session.endSession();

    const updatedToggler = await User.findById(idOfToggler).exec();

    res.status(200).json({
      success: true,
      user: updatedToggler,
    });
  } catch (error) {
    await session.abortTransaction();
    const statusCode = error.statusCode || 500;
    const message = error.message || "unexpected-error";
    throw { statusCode: statusCode, message: message, success: false };
  }
};

const resetPassword = async (req, res) => {
  const { email } = req.body.data;
  const findUser = await User.findOne({ email }).exec();
  if (findUser == null) {
    throw { statusCode: 400, message: "Could not reset password" };
  }

  // const jwtInfos = { id: findUser.id };
  // const secret = `${process.env.UPDATE_PW_SECRET_KEY}-${findUser.password}`;
  // const jwtToken = jwt.sign(jwtInfos, secret, { expiresIn: "1h" });
  // const resetUrl = `${process.env.GATEWAY_URL}/auth/updatePw/${findUser.id}/${jwtToken}`;
  // const emailSent = await sendResetEmail(findUser.email.trim(), resetPasswordTemplate(resetUrl));

  // if (emailSent === false) {
  //   throw { statusCode: 400, message: "Could not reset password" };
  // }

  return res.json({
    success: true,
    data: findUser.email,
  });
};

const verifyEmail = async (req, res) => {
  const token = req.query.id;

  if (token == null) {
    throw { statusCode: 404, message: "Could not activate e-mail" };
  }

  const decoded = jwt.verify(token, process.env.CONFIRM_MAIL_SECRET_KEY);
  const idInToken = decoded.id;

  const findUser = await User.findOne({ _id: idInToken }).exec();
  if (findUser == null) {
    throw { statusCode: 404, message: "User not found" };
  }

  if (findUser.email_confirmed) {
    return await res.status(200).json({
      success: true,
    });
  }
  const updatedUser = await User.findByIdAndUpdate(
    findUser._id,
    { email_confirmed: true },
    { new: true }
  ).exec();

  if (updatedUser == null) {
    throw { statusCode: 400, message: "Could not activate e-mail" };
  }

  return await res.status(200).json({
    success: true,
    data: updatedUser,
  });
};

const updatePasswordWebContent = async (req, res) => {
  const token = req.params.token?.trim();
  const userId = req.params.id?.trim();

  if (token == null || userId == null) {
    throw { statusCode: 400, message: "could-not-reset-password" };
  }
  const findUser = await User.findById(userId).exec();

  if (findUser == null) {
    throw { statusCode: 400, message: "could-not-reset-password" };
  }
  const secret = process.env.UPDATE_PW_SECRET_KEY + "-" + findUser.password;
  jwt.verify(token, secret);

  return res.status(200).json({
    success: true,
    data: {
      id: findUser.id,
      token,
    },
  });
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
    await Post.updateMany({ user: updatedUser._id }, { is_deleted: false }, { session });
    await Comment.updateMany({ user: updatedUser._id }, { is_deleted: false }, { session });
    await Report.updateMany({ reported_user: updatedUser._id }, { is_deleted: false }, { session });

    await session.commitTransaction();
    await session.endSession();

    return await sendSuccessResponseWithTokens(updatedUser, res);
  } catch (error) {
    await session.abortTransaction();
    await session.endSession();
    throw error;
  }
};

const sendSuccessResponseWithTokens = async (user, res, statusCode = 200) => {
  return await res.status(statusCode).json({
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

async function isTokenBlacklisted(refreshToken) {
  const hashedToken = crypto.createHash(algorithm).update(refreshToken).digest('hex');
  const result = await redis.get(hashedToken);

  if (result) {
    return true;
  } else {
    return false;
  }
}

async function blacklistValidation(refreshToken, expiryUnixTimestampInSec) {
  const tokenIsBlacklisted = await isTokenBlacklisted(refreshToken);
  if (tokenIsBlacklisted) {
    console.log("token is blacklisted");
    throw { statusCode: 401, message: "unauthorized" };
  }
  const hashedToken = crypto.createHash(algorithm).update(refreshToken).digest('hex');
  await redis.set(hashedToken, 'blacklisted', { exat: expiryUnixTimestampInSec });
}

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
  signOut,
  tokenService,
  resetPassword,
  verifyEmail,
  updatePasswordWebContent,
  authUserWithProvider,
  checkIfEmailExists,
  checkIfUsernameExists,
  toggleTune,
};
