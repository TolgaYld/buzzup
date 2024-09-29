const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const SchemaTypes = Schema.Types;

const PostSchema = new Schema(
  {
    text: {
      type: SchemaTypes.String,
      maxLength: 999,
      required: false,
    },
    media: {
      type: [SchemaTypes.String],
      required: false,
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
    city: {
      type: SchemaTypes.String,
    },
    type: {
      type: SchemaTypes.String,
    },
    likes: [
      {
        type: SchemaTypes.ObjectId,
        ref: "Users",
      },
    ],
    dislikes: [
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
      default: false,
      required: true,
    },
    comments: [
      {
        type: SchemaTypes.ObjectId,
        ref: "Comments",
      },
    ],
    user: {
      type: SchemaTypes.ObjectId,
      ref: "Users",
      required: true,
    },
    channels: {
      type: [{
        type: SchemaTypes.ObjectId,
        ref: "Channels",
        required: true,
      }],
      validate: [arrayLimit, "{PATH} exceeds the limit of 3"]
    },
    last_update_from_user: {
      type: SchemaTypes.ObjectId,
    },
  },
  { collection: "Posts", timestamps: { createdAt: "created_at", updatedAt: "updated_at" }, },
);

function arrayLimit(val) {
  return val.length <= 3;
}

PostSchema.index({ location: "2dsphere" });


const Post = mongoose.model("Post", PostSchema);

module.exports = Post;
