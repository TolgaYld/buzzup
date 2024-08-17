const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const SchemaTypes = Schema.Types;
const validator = require("validator");
const Post = require("./postModel");
const Comment = require("./commentModel");
const Report = require("./reportModel");
const Channel = require("./channelModel");
const { log } = require("../modules/logModule");

const UserSchema = new Schema(
  {
    email: {
      type: SchemaTypes.String,
      trim: true,
      lowercase: true,
      unique: true,
      validate: {
        validator: validator.isEmail,
      },
    },
    password: {
      type: SchemaTypes.String,
      minLength: 9,
      required: true,
    },
    username: {
      type: SchemaTypes.String,
      trim: true,
      unique: true,
      required: true,
    },
    points: {
      type: SchemaTypes.Number,
      required: true,
      default: 0,
      validate: {
        validator: Number.isInteger,
        message: "{VALUE} is not an integer value",
      },
    },
    location: {
      type: {
        type: SchemaTypes.String,
        enum: ["Point"],
        default: "Point",
      },
      coordinates: {
        type: [SchemaTypes.Number],
        required: true,
      },
    },
    distance: {
      type: SchemaTypes.Number,
      required: true,
      default: 9000,
    },
    official: {
      type: SchemaTypes.Boolean,
      default: false,
      required: true,
    },
    is_deleted: {
      type: SchemaTypes.Boolean,
      default: false,
      required: true,
    },
    is_banned: {
      type: SchemaTypes.Boolean,
      default: false,
      required: true,
    },
    email_confirmed: {
      type: SchemaTypes.Boolean,
      default: false,
      required: true,
    },
    is_admin: {
      type: SchemaTypes.Boolean,
      default: false,
      required: true,
    },
    last_update_from_user: {
      type: SchemaTypes.ObjectId,
    },
  },
  { collection: "Users", timestamps: true },
);

UserSchema.index({ location: "2dsphere" });

UserSchema.post("findOneAndDelete", async function (next) {
  try {
    let user = this;
    await Channel.updateMany(
      {},
      { $pull: { users: { _id: user.getFilter()._id } } },
      next,
    ).exec();
    await Channel.updateMany(
      {},
      { $pull: { created_by: { _id: user.getFilter()._id } } },
      next,
    ).exec();
    await Post.deleteMany({ user: user.getFilter()._id }, next).exec();
    await Comment.deleteMany({ user: user.getFilter()._id }, next).exec();
    await Report.deleteMany(
      { reported_user: user.getFilter()._id },
      next,
    ).exec();
  } catch (error) {
    log("error: " + error);
  }
});

UserSchema.post("findOneAndUpdate", async function (next) {
  try {
    let user = this;

    if (user.getUpdate().$set.is_deleted) {
      await Post.updateMany(
        { user: user.getFilter()._id },
        { is_deleted: true },
        next,
      ).exec();
      await Comment.updateMany(
        { user: user.getFilter()._id },
        { is_deleted: true },
        next,
      ).exec();
      await Report.updateMany(
        { reported_user: user.getFilter()._id },
        { is_deleted: true },
        next,
      ).exec();
    }

    if (user.getUpdate().$set.is_banned) {
      await Post.updateMany(
        { user: user.getFilter()._id },
        { is_active: false },
        next,
      ).exec();
      await Comment.updateMany(
        { user: user.getFilter()._id },
        { is_active: false },
        next,
      ).exec();
      await Report.updateMany(
        { reported_user: user.getFilter()._id },
        { is_active: false },
        next,
      ).exec();
    }
  } catch (error) {
    log("error: " + error);
  }
});

const User = mongoose.model("User", UserSchema);

module.exports = User;
