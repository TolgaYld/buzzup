const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const SchemaTypes = Schema.Types;

const CommentSchema = new Schema(
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
    user: {
      type: SchemaTypes.ObjectId,
      ref: "Users",
      required: true,
    },
    post: {
      type: SchemaTypes.ObjectId,
      ref: "Posts",
      required: true,
    },
    last_update_from_user: {
      type: SchemaTypes.ObjectId,
    },
  },
  { collection: "Comments", timestamps: true },
);

const Comment = mongoose.model("Comment", CommentSchema);

module.exports = Comment;
