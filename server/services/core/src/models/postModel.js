const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const SchemaTypes = Schema.Types;
const EngagementLog = require("./engagementLogModel");

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
    public_votes: [
      {
        type: SchemaTypes.ObjectId,
        ref: "Users",
      },
    ],
    end_date: {
      type: SchemaTypes.Date,
      default: null,
    },
    linked_users: [
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

function extractHashtags(text) {
  return (text.match(/#[a-zA-Z0-9_]+/g) || []).map(tag => tag.toLowerCase());
}

PostSchema.pre("save", function (next) {
  if (this.text) {
    this.hashtags = extractHashtags(this.text);
  }
  next();
});

PostSchema.post("save", async function (doc) {
  const interactions = [];

  if (doc.likes && doc.likes.length > 0) {
    const lastLikeUser = doc.likes.slice(-1)[0];
    interactions.push({
      user: lastLikeUser,
      post: doc._id,
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
      post: doc._id,
      interactionType: "dislike",
      is_active: true,
      created_by: lastDislikeUser,
      updated_by: lastDislikeUser,
    });
  }

  if (doc.comments && doc.comments.length > 0) {
    const lastCommentUser = doc.comments.slice(-1)[0].user;
    interactions.push({
      user: lastCommentUser,
      post: doc._id,
      interactionType: "comment",
      is_active: true,
      created_by: lastCommentUser,
      updated_by: lastCommentUser,
    });
  }

  if (doc.shares && doc.shares.length > 0) {
    const lastShareUser = doc.shares.slice(-1)[0];
    interactions.push({
      user: lastShareUser,
      story: doc._id,
      interactionType: "share",
      is_active: true,
      created_by: lastShareUser,
      updated_by: lastShareUser,
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

const Post = mongoose.model("Post", PostSchema);

module.exports = Post;
