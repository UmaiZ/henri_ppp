const mongoose = require("mongoose");

const userschema = new mongoose.Schema({
    userName: {
        type: String,
        require: true,
    },
    userFirstName: {
        type: String,
        default: "",
    },
    userLastName: {
        type: String,
        default: "",
    },
    userPassword: {
        type: String,
        require: true,
        // select: false
    },
    userEmail: {
        type: String,
        require: true,
        match:
            /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/,
    },
    userCity: {
        type: String,
        default: "",
    },
    userAddress: {
        type: String,
        default: "",
    },
    userCountry: {
        type: String,
        default: "",
    },
    userNumber: {
        type: String,
        default: "",
    },
    userImage: {
        type: String,
        default: "",
    },
    userCover: {
        type: String,
        default: "",
    },
    userSchool: {
        type: String,
        default: "",
    },
    userTeam: {
        type: String,
        default: "",
    },
    userCoaches: {
        type: String,
        default: "",
    },
    userBio: {
        type: String,
        default: "",
    },
    userSports: {
        type: String,
        default: "",
    },

});
userschema.virtual("userID").get(function () {
    return this._id.toHexString();
});

userschema.set("toJSON", {
    virtuals: true,
    versionKey: false,
    transform: function (doc, ret) {
        delete ret.id;
    },
});

exports.Users = mongoose.model("users", userschema);

exports.userschema = userschema;
