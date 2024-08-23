
require("dotenv").config();
// MODELS
const User = require("./src/models/userModel");
const Channel = require("./src/models/channelModel");
const Post = require("./src/models/postModel");
const Comment = require("./src/models/commentModel");
const Story = require("./src/models/storyModel");
const Report = require("./src/models/reportModel");

// UTILS

const getUserId = require("./src/utils/getId");
const { log } = require("./src/modules/logModule");



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
} = process.env;

module.exports = {
    User,
    Channel,
    Comment,
    Post,
    Story,
    Report,
    getUserId,
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
};
