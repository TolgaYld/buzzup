const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const SchemaTypes = Schema.Types;
const { addMetadataHooks, metadatafields } = require("../utils/metadata");

const ReportSchema = new Schema(
  {
    reason: {
      type: SchemaTypes.String,
      required: true,
    },
    reported_by_user: {
      type: SchemaTypes.ObjectId,
      ref: "Users",
      required: true,
    },
    reported_user: {
      type: SchemaTypes.ObjectId,
      ref: "Users",
      required: false,
    },
    post: {
      type: SchemaTypes.ObjectId,
      ref: "Posts",
    },
    comment: {
      type: SchemaTypes.ObjectId,
      ref: "Comments",
    },
    channel: {
      type: SchemaTypes.ObjectId,
      ref: "Channels",
    },
    message: {
      type: SchemaTypes.ObjectId,
      ref: "Messages",
    },
    chat: {
      type: SchemaTypes.ObjectId,
      ref: "Chats",
    },
    is_done: {
      type: SchemaTypes.Boolean,
      default: false,
      required: true,
    },
    notes_from_us: {
      type: SchemaTypes.String,
    },
    ...metadatafields,
  },
  { collection: "Reports" },
);

addMetadataHooks(ReportSchema);

const Report = mongoose.model("Report", ReportSchema);

module.exports = Report;
