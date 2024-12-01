const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const SchemaTypes = Schema.Types;
const validator = require("validator");
const Post = require("./postModel");
const Story = require("./storyModel");
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
    auto_generated_username: {
      type: SchemaTypes.Boolean,
      default: false,
      required: true,
    },
    username_change_counter: {
      type: SchemaTypes.Number,
      required: true,
      min: 0,
      default: 0,
      validate: {
        validator: Number.isInteger,
        message: "{VALUE} is not an integer value",
      },
    },
    provider: {
      type: SchemaTypes.String,
      required: true,
      default: "LOCAL",
    },
    provider_id: {
      type: SchemaTypes.String,
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
  {
    collection: "Users",
    timestamps: { createdAt: "created_at", updatedAt: "updated_at" },
  },
);

UserSchema.index({ location: "2dsphere" });

UserSchema.post("findOneAndDelete", async function () {
  const session = await mongoose.startSession();
  session.startTransaction();

  try {
    const userId = this.getFilter()._id;
    await Channel.updateMany({}, { $pull: { users: userId } }, { session });
    await Channel.updateMany({}, { $pull: { created_by: userId } }, { session });
    await Post.deleteMany({ user: userId }, { session });
    await Story.deleteMany({ user: userId }, { session });
    await Comment.deleteMany({ user: userId }, { session });
    await Report.deleteMany({ reported_user: userId }, { session });

    await session.commitTransaction();
  } catch (error) {
    // rollback the transaction
    await session.abortTransaction();
    log("error: " + error);
  } finally {
    await session.endSession();
  }
});


UserSchema.post("findOneAndUpdate", async function () {
  const session = await mongoose.startSession();
  session.startTransaction();

  try {
    const userId = this.getFilter()._id;
    const update = this.getUpdate().$set;

    if (update.is_deleted === true) {
      await Post.updateMany({ user: userId }, { is_deleted: true }, { session });
      await Story.updateMany({ user: userId }, { is_deleted: true }, { session });
      await Comment.updateMany({ user: userId }, { is_deleted: true }, { session });
      await Report.updateMany({ reported_user: userId }, { is_deleted: true }, { session });
    }

    if (update.is_banned === true) {
      await Post.updateMany({ user: userId }, { is_active: false }, { session });
      await Story.updateMany({ user: userId }, { is_active: false }, { session });
      await Comment.updateMany({ user: userId }, { is_active: false }, { session });
      await Report.updateMany({ reported_user: userId }, { is_done: true }, { session });
    }

    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    log("error: " + error);
  } finally {
    await session.endSession();
  }
});


const User = mongoose.model("User", UserSchema);

module.exports = User;
