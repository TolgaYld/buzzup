const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const SchemaTypes = Schema.Types;

const EngagementLogSchema = new Schema({
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
    comment: {
        type: SchemaTypes.ObjectId,
        ref: "Comments",
        required: false,
    },
    interactionType: {
        type: SchemaTypes.String,
        enum: ["like", "dislike", "comment", "share"],
        required: true,
    },
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
    created_by: {
        type: SchemaTypes.ObjectId,
        ref: "Users",
        required: true,
    },
    udated_by: {
        type: SchemaTypes.ObjectId,
        ref: "Users",
        required: true,
    }
}, { collection: "EngagementLogs", timestamps: { createdAt: "created_at", updatedAt: "updated_at" }, });

const EngagementLog = mongoose.model("EngagementLog", EngagementLogSchema);

module.exports = EngagementLog;