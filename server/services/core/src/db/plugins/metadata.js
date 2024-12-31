const mongoose = require("mongoose");

function metadataPlugin(schema) {
    schema.add({
        is_active: { type: Boolean, default: true, required: true },
        is_deleted: { type: Boolean, default: false, required: true },
        created_by: { type: mongoose.Schema.Types.ObjectId, ref: "Users", required: true },
        updated_by: { type: mongoose.Schema.Types.ObjectId, ref: "Users" },
    });

    schema.set("timestamps", { createdAt: "created_at", updatedAt: "updated_at" });

    schema.pre("save", function (next) {
        if (this.isNew) {
            if (this.created_by == null) {
                throw new Error("created_by is required");
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
}

module.exports = metadataPlugin;
