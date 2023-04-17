const mongoose = require("mongoose");

const shareNewsFeedSchema = new mongoose.Schema(
  {
    newsFeedId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "newsFeed",
    },
    sharedBy: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "user",
    }
  },
  { timestamps: true }
);

const shareNewsFeedModel = mongoose.model("shareNewsFeed", shareNewsFeedSchema);

module.exports = shareNewsFeedModel;