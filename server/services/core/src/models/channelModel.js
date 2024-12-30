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
        ref: "Stories",
      },
    ],
    created_By: [
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

ChannelSchema.post("findOneAndDelete", async function () {
  const session = await mongoose.startSession();
  session.startTransaction();
  try {
    const channelId = this.getFilter()._id;

    await Post.deleteMany({ channels: channelId }, { session });
    await Story.deleteMany({ channels: channelId }, { session });
    await Report.deleteMany({ channel: channelId }, { session });

    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    log("Error in findOneAndDelete: " + error);
  } finally {
    await session.endSession();
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

ChannelSchema.post("findOneAndUpdate", async function () {
  const session = await mongoose.startSession();
  session.startTransaction();

  try {
    const channelId = this.getFilter()._id;
    const updateData = this.getUpdate().$set;

    if (updateData.is_deleted != null) {
      await Post.updateMany(
        { channels: channelId },
        { is_deleted: updateData.is_deleted },
        { session }
      );
      await Story.updateMany(
        { channels: channelId },
        { is_deleted: updateData.is_deleted },
        { session }
      );
      await Report.updateMany(
        { channel: channelId },
        { is_done: updateData.is_deleted },
        { session }
      );
    }

    if (updateData.is_active != null) {
      await Post.updateMany(
        { channels: channelId },
        { is_active: updateData.is_active },
        { session }
      );
      await Story.updateMany(
        { channels: channelId },
        { is_active: updateData.is_active },
        { session }
      );
      await Report.updateMany(
        { channel: channelId },
        { is_done: updateData.is_active },
        { session }
      );
    }

    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    log("Error in findOneAndUpdate: " + error);
  } finally {
    await session.endSession();
  }
});

const Channel = mongoose.model("Channel", ChannelSchema);

module.exports = Channel;
