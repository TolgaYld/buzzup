const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const SchemaTypes = Schema.Types;
const { addMetadataHooks, metadatafields } = require("../utils/metadata");

const StreamDataSchema = new Schema({
    title: {
        type: SchemaTypes.String,
        required: false
    },
    description: {
        type: SchemaTypes.String,
        required: false
    },
    channel: {
        type: SchemaTypes.ObjectId,
        ref: "Channels",
        required: true,
    },
    streamer: {
        type: SchemaTypes.ObjectId,
        ref: "Users",
        required: true
    },
    viewers: [{
        type: SchemaTypes.ObjectId,
        ref: "Users",
    }],
    gifts: [{
        type: SchemaTypes.ObjectId,
        ref: "Gifts",
    }],
    status: {
        type: SchemaTypes.String,
        enum: ["LIVE", "ENDED", "SCHEDULED"],
        default: "LIVE",
    },
    start_time: {
        type: SchemaTypes.Date,
        default: Date.now
    },
    end_time: {
        type: SchemaTypes.Date,
    },
    viewer_count: {
        type: SchemaTypes.Number,
        default: 0,
    },
    gift_summary: {
        total_gifts: {
            type: SchemaTypes.Number,
            default: 0,
        },
        total_value: {
            type: SchemaTypes.Number,
            default: 0,
        },
    },
    interactions: [
        {
            user: {
                type: SchemaTypes.ObjectId,
                ref: "Users"
            },
            message: {
                type: SchemaTypes.String
            },
            timestamp: {
                type: SchemaTypes.Date,
                default: Date.now
            },
        },
    ],
    tags: [{
        type: SchemaTypes.String
    }],
    category: {
        type: SchemaTypes.String,
        enum: [
            "Gaming",
            "Music",
            "Education",
            "Lifestyle",
            "Sports",
            "News",
            "Entertainment",
            "Other",
        ],
        required: false
    },
    ...metadatafields,
}, { collection: "StreamData" });

addMetadataHooks(StreamDataSchema);

const StreamData = mongoose.model("StreamData", StreamDataSchema);

module.exports = StreamData;