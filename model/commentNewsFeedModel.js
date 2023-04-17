const mongoose = require("mongoose");

const commentNewsFeedSchema = new mongoose.Schema(
  {
    newsFeedId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "newsFeed",
    },
    commentDetail: {
      type: String,
      required: true,
    },
    commentBy: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "user",
    },
  },
  { timestamps: true }
);

const commentNewsFeedModel = mongoose.model("commentNewsFeed", commentNewsFeedSchema);

module.exports = commentNewsFeedModel;
