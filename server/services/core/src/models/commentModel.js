const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const SchemaTypes = Schema.Types;
const EngagementLog = require("./engagementLogModel");

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
    visibility: {
      type: SchemaTypes.String,
      enum: [
        "ANONYMOUS",
        "PUBLIC",
        "PRIVATE",
        "ONLY_FRIENDS",
        "ONLY_ME",
      ],
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
    hashtags: {
      type: [SchemaTypes.String],
      validate: {
        validator: function (tags) {
          return tags.every(tag => /^#[a-zA-Z0-9_]+$/.test(tag));
        },
        message: "Invalid hashtag format",
      },
      default: [],
    },
    shares: [
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
      required: false,
    },
    story: {
      type: SchemaTypes.ObjectId,
      ref: "Stories",
      required: false,
    },
    last_update_from_user: {
      type: SchemaTypes.ObjectId,
    },
  },
  { collection: "Comments", timestamps: { createdAt: "created_at", updatedAt: "updated_at" }, },
);

function extractHashtags(text) {
  return (text.match(/#[a-zA-Z0-9_]+/g) || []).map(tag => tag.toLowerCase());
}

CommentSchema.pre("save", function (next) {
  if (this.text) {
    this.hashtags = extractHashtags(this.text);
  }
  next();
});

CommentSchema.post("save", async function (doc) {
  const interactions = [];

  if (doc.likes && doc.likes.length > 0) {
    const lastLikeUser = doc.likes.slice(-1)[0];
    interactions.push({
      user: lastLikeUser,
      comment: doc._id,
      interactionType: "like",
      is_active: true,
      created_by: lastLikeUser,
      updated_by: lastLikeUser,
    });
  }

  if (doc.dislikes && doc.dislikes.length > 0) {
    const lastDislikeUser = doc.dislikes.slice(-1)[0];
    interactions.push({
      user: lastDislikeUser,
      comment: doc._id,
      interactionType: "dislike",
      is_active: true,
      created_by: lastDislikeUser,
      updated_by: lastDislikeUser,
    });
  }

  if (doc.text) {
    interactions.push({
      user: doc.user,
      comment: doc._id,
      interactionType: "comment",
      is_active: true,
      created_by: doc.user,
      updated_by: doc.user,
    });
  }

  try {
    if (interactions.length > 0) {
      await EngagementLog.insertMany(interactions);
    }
  } catch (error) {
    console.error("Error saving engagement logs:", error);
  }
});

const Comment = mongoose.model("Comment", CommentSchema);

module.exports = Comment;
