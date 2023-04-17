const mongoose = require("mongoose");

const likeNewsFeedSchema = new mongoose.Schema(
  {
    newsFeedId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "newsFeed",
    },
    likedBy: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "user",
    }
  },
  { timestamps: true }
);

const likeNewsFeedModel = mongoose.model("likeNewsFeed", likeNewsFeedSchema);

module.exports = likeNewsFeedModel;
