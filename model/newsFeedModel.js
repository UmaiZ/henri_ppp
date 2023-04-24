const mongoose = require("mongoose");

const newsFeedSchema = new mongoose.Schema(
  {
    createdBy: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "user",
    },
    title: {
      type: String,
      // required: true,
    },
    description: {
      type: String,
      required: true,
    },
    images: [
      {
        type: String,
        required: true,
      },
    ],
    like: [
      {
        'detail': {
          type: mongoose.Schema.Types.ObjectId,
          ref: "likeNewsFeed",
        },
        'rating': {
          type: Number,
        },
      }
    ],
    comment: [
      {
        type: mongoose.Schema.Types.ObjectId,
        ref: "commentNewsFeed",
      },
    ],
    share: [
      {
        type: mongoose.Schema.Types.ObjectId,
        ref: "shareNewsFeed",
      },
    ],
    isDeleted: {
      type: Boolean,
      default: false,
    },
    deletedAt: {
      type: Date,
    }
  },
  { timestamps: true }
);

const newsFeedModel = mongoose.model("newsFeed", newsFeedSchema);

module.exports = newsFeedModel;
