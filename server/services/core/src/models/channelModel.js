const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const SchemaTypes = Schema.Types;
const Post = require("../models/postModel");
const Report = require("../models/reportModel");
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
  { collection: "Channels", timestamps: true },
);

ChannelSchema.post("findOneAndDelete", async function (next) {
  try {
    let channel = this;
    await Post.deleteMany({ channel: channel.getFilter()._id }, next).exec();
    await Report.deleteMany({ channel: channel.getFilter()._id }, next).exec();
  } catch (error) {
    log("error: " + error);
  }
});

const Channel = mongoose.model("Channel", ChannelSchema);

module.exports = Channel;
