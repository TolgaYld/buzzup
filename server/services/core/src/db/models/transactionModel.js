const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const SchemaTypes = Schema.Types;
const { addMetadataHooks, metadatafields } = require("../utils/metadata");

const TransactionSchema = new Schema({
    from_user: {
        type: SchemaTypes.ObjectId,
        ref: "Users",
        required: true
    },
    to_user: {
        type: SchemaTypes.ObjectId,
        ref: "Users",
        required: function () { return this.type === "gift"; },
    },
    gift: {
        type: SchemaTypes.ObjectId,
        ref: "Gifts",
        required: function () { return this.type === "gift"; },
    },
    type: {
        type: SchemaTypes.String,
        enum: ["purchase", "gift"],
        required: true
    },
    amount: {
        type: SchemaTypes.Number,
        required: true
    },
    ...metadatafields,
}, { collection: "Transactions" });

addMetadataHooks(TransactionSchema);

const Transaction = mongoose.model("Transaction", TransactionSchema);

module.exports = Transaction;
