
if (process.env.NODE_ENV === "test")
    require("dotenv").config({ path: __dirname + "/.env.test" });
if (process.env.NODE_ENV !== "test")
    require("dotenv").config({ path: __dirname + "/.env", debug: true });
// MODELS
const User = require("./src/models/userModel");
const Channel = require("./src/models/channelModel");
const Post = require("./src/models/postModel");
const Comment = require("./src/models/commentModel");
const Story = require("./src/models/storyModel");
const Report = require("./src/models/reportModel");

// UTILS

const getUserId = require("./src/utils/getId");
const catchErrors = require("./src/utils/catchErrors");
const { log } = require("./src/modules/logModule");
const authorizeUser = require("./src/utils/authorizeUser");

// ENVIRONMENT VARIABLES

const {
    SECRET_KEY,
    SECRET_KEY_REFRESH,
    MONGODBCONNECTIONSTRING,
    AUTHSERVICE,
    CHANNELSERVICE,
    POSTSERVICE,
    COMMENTSERVICE,
    STORYSERVICE,
    REPORTSERVICE,
    REDISURL,
    REDISPASSWORD,
    SECRET_KEY_PERMISSION,
    SESSION_SECRET,
} = process.env;

module.exports = {
    User,
    Channel,
    Comment,
    Post,
    Story,
    Report,
    getUserId,
    catchErrors,
    authorizeUser,
    SECRET_KEY,
    SECRET_KEY_REFRESH,
    MONGODBCONNECTIONSTRING,
    AUTHSERVICE,
    CHANNELSERVICE,
    POSTSERVICE,
    COMMENTSERVICE,
    STORYSERVICE,
    REPORTSERVICE,
    log,
    REDISURL,
    REDISPASSWORD,
    SECRET_KEY_PERMISSION,
    SESSION_SECRET,
};
