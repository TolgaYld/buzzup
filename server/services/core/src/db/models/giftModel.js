const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const SchemaTypes = Schema.Types;
const { addMetadataHooks, metadatafields } = require("../utils/metadata");

const GiftSchema = new Schema(
    {
        name: {
            type: SchemaTypes.String,
            unique: true,
            required: true,
        },
        description: {
            type: SchemaTypes.String,
            required: false,
        },
        price: {
            type: SchemaTypes.Number,
            required: true,
            validate: {
                validator: Number.isInteger,
                message: "{VALUE} is not an integer value",
            },
        },
        icon: {
            type: SchemaTypes.String,
            required: true,
        },
        animation: {
            type: SchemaTypes.String,
            required: false,
        },
        category: {
            type: SchemaTypes.String,
            enum: ["DEFAULT", "PREMIUM", "TRENDING", "EXCLUSIVE", "LIMITED", "FEATURED"],
            default: "DEFAULT",
        },
        duration: {
            type: SchemaTypes.Number,
            required: false,
        },
        discount: {
            type: SchemaTypes.Number,
            default: 0,
            validate: {
                validator: function (value) {
                    return value >= 0 && value <= 100;
                },
                message: "{VALUE} is not a valid discount percentage",
            },
        },
        featured_until: {
            type: SchemaTypes.Date,
            required: false,
        },
        ...metadatafields,
    },
    { collection: "Gifts" },
);

addMetadataHooks(GiftSchema);


const Gift = mongoose.model("Gift", GiftSchema);

module.exports = Gift;
