const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const SchemaTypes = Schema.Types;
const Post = require("./postModel");
const Story = require("./storyModel");
const Report = require("./reportModel");
const { log } = require("../modules/logModule");

const ChannelSchema = new Schema(
  {
    name: {
      type: SchemaTypes.String,
      unique: true,
      required: true,
    },
    users: [
      {
        type: SchemaTypes.ObjectId,
        ref: "Users",
      },
    ],
    posts: [
      {
        type: SchemaTypes.ObjectId,
        ref: "Posts",
      },
    ],
    storys: [
      {
        type: SchemaTypes.ObjectId,
        ref: "Storys",
      },
    ],
    createdBy: [
      {
        type: SchemaTypes.ObjectId,
        ref: "Users",
      },
    ],
    is_deleted: {
      type: SchemaTypes.Boolean,
      default: false,
      required: true,
    },
    is_active: {
      type: SchemaTypes.Boolean,
      default: true,
      required: true,
    },
    last_update_from_user: {
      type: SchemaTypes.ObjectId,
    },
  },
  { collection: "Channels", timestamps: { createdAt: "created_at", updatedAt: "updated_at" }, },
);

ChannelSchema.post("findOneAndDelete", async function (next) {
  try {
    let channel = this;
    await Post.deleteMany({ channels: channel.getFilter()._id }, next).exec();
    await Story.deleteMany({ channels: channel.getFilter()._id }, next).exec();
    await Report.deleteMany({ channel: channel.getFilter()._id }, next).exec();
  } catch (error) {
    log("error: " + error);
  }
});

ChannelSchema.post("findOneAndDelete", async function (next) {
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

ChannelSchema.post("findOneAndUpdate", async function (next) {
  try {
    let channel = this;

    if (channel.getUpdate().$set.is_deleted) {
      await Post.updateMany(
        { channels: channel.getFilter()._id },
        { is_deleted: channel.getUpdate().$set.is_deleted },
        next,
      ).exec();
      await Story.updateMany(
        { channels: channel.getFilter()._id },
        { is_deleted: channel.getUpdate().$set.is_deleted },
        next,
      ).exec();
      await Report.updateMany(
        { channel: channel.getFilter()._id },
        { is_done: channel.getUpdate().$set.is_deleted },
        next,
      ).exec();
    }

    if (channel.getUpdate().$set.is_active) {
      await Post.updateMany(
        { channels: channel.getFilter()._id },
        { is_active: channel.getUpdate().$set.is_active },
        next,
      ).exec();
      await Story.updateMany(
        { channels: channel.getFilter()._id },
        { is_active: channel.getUpdate().$set.is_active },
        next,
      ).exec();
      await Report.updateMany(
        { reported_user: channel.getFilter()._id },
        { is_done: channel.getUpdate().$set.is_active },
        next,
      ).exec();
    }
  } catch (error) {
    log("error: " + error);
  }
});

const Channel = mongoose.model("Channel", ChannelSchema);

module.exports = Channel;
