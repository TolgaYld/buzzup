const mongoose = require("mongoose");
const SchemaTypes = mongoose.Schema.Types;
const metadatafields = {
    is_active: {
        type: SchemaTypes.Boolean,
        default: true,
        required: true,
    },
    is_deleted: {
        type: SchemaTypes.Boolean,
        default: false,
        required: true,
    },
    created_by: {
        type: SchemaTypes.ObjectId,
        ref: "Users",
        required: true,
    },
    updated_by: {
        type: SchemaTypes.ObjectId,
        ref: "Users",
    },
};

/**
 * Adds common hooks to an existing mongoose schema,
 * and automatically sets the `created_at` and `updated_at` timestamps
 * @param {mongoose.Schema} schema - The existing mongoose schema
 */
function addMetadataHooks(schema) {

    schema.set("timestamps", { createdAt: "created_at", updatedAt: "updated_at" });

    schema.pre("save", function (next) {
        if (this.isNew) {
            if (this.created_by == null) {
                this.created_by = this._id;
            }
        } else {
            if (this._updatedBy) {
                this.updated_by = this._updatedBy;
            }
        }
        next();
    });

    schema.pre("updateOne", function (next) {
        const update = this.getUpdate();

        if (!update.$set) {
            update.$set = {};
        }

        if (this.options.updatedBy) {
            update.$set.updated_by = this.options.updatedBy;
        }

        update.$set.updated_at = new Date();
        next();
    });

    schema.pre("findOneAndUpdate", function (next) {
        const update = this.getUpdate();

        if (!update.$set) {
            update.$set = {};
        }

        if (this.options.updatedBy) {
            update.$set.updated_by = this.options.updatedBy;
        }

        update.$set.updated_at = new Date();
        next();
    });

    schema.pre("updateMany", function (next) {
        const update = this.getUpdate();

        if (!update.$set) {
            update.$set = {};
        }

        if (this.options.updatedBy) {
            update.$set.updated_by = this.options.updatedBy;
        }

        update.$set.updated_at = new Date();
        next();
    });

    return schema;
}

module.exports = {
    metadatafields,
    addMetadataHooks,
};
