const mongoose = require("mongoose");

const statusschema = new mongoose.Schema({
    statusText: {
        type: String,
        default: "",
    },
    statusImage: {
        type: String,
        default: "",
    },
    statusVideo: {
        type: String,
        default: "",
    },
    createdBy: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "users",
    },
});
statusschema.virtual("statusID").get(function () {
    return this._id.toHexString();
});

statusschema.set("toJSON", {
    virtuals: true,
    versionKey: false,
    transform: function (doc, ret) {
        delete ret.id;
    },
});

exports.Status = mongoose.model("status", statusschema);

exports.statusschema = statusschema;
