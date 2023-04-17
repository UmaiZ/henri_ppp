var axios = require("axios");
const { default: mongoose } = require("mongoose");
const multer = require("multer");
const commentNewsFeedModel = require("../model/commentNewsFeedModel");
const likeNewsFeedModel = require("../model/likeNewsFeedModel");
const newsFeedModel = require("../model/newsFeedModel");
const shareNewsFeedModel = require("../model/shareNewsFeedModel");
const { uploadFileWithFolder } = require("../utils/awsFileUploads");
require("dotenv/config");

const uploadOptions = multer({
  storage: multer.memoryStorage(),
  limits: {
    fileSize: 5 * 1024 * 1024, // no larger than 5mb, you can change as needed.
  },
});

const addNewsFeed = async (req, res) => {
  try {
    uploadOptions("images")(req, res, (err) => {
      if (err) {
        return res.status(400).json({
          success: false,
          message: "Image size should be less than 5MB",
        });
      }
    });
    const { title, description } = req.body;
    const { files } = req;
    const { user_id } = req.user;
    const images = [];
    if (title == undefined || description == undefined || title == "" || description == "" || title == null || description == null) {
      return res.status(400).json({
        success: false,
        message: "Title and Description are required",
      });
    }
    if (files.length == 0) {
      return res.status(400).json({
        success: false,
        message: "Image is required",
      });
    }

    for (let i = 0; i < files.length; i++) {
      const file = files[i];
      const fileName = file.originalname;
      const fileContent = file.buffer;
      const fileLocation = await uploadFileWithFolder(
        fileName,
        "newsFeed",
        fileContent
      );
      images.push(fileLocation);
    }

    const newsFeed = await newsFeedModel.create({
      title: title,
      description: description,
      images: images,
      createdBy: user_id,
    });

    res.status(200).json({
      success: true,
      message: "News Feed Added Successfully",
      data: newsFeed,
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      success: false,
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

const updateNewsFeed = async (req, res) => {
  try {
    const { newsFeedId } = req.params;
    const { title, description } = req.body;
    const { files } = req;
    const { user_id } = req.user;
    const images = [];

    for (let i = 0; i < files.length; i++) {
      const file = files[i];
      const fileName = file.originalname;
      const fileContent = file.buffer;
      const fileLocation = await uploadFileWithFolder(
        fileName,
        "newsFeed",
        fileContent
      );
      images.push(fileLocation);
    }

    const newsFeed = await newsFeedModel.findByIdAndUpdate(
      newsFeedId,
      {
        title: title,
        description: description,
        images: images,
      },
      { new: true }
    );

    res.status(200).json({
      success: true,
      message: "News Feed Updated Successfully",
      data: newsFeed,
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      success: false,
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

const deleteNewsFeed = async (req, res) => {
  try {
    const { newsFeedId } = req.params;
    const { user_id } = req.user;

    const newsFeed = await newsFeedModel.findByIdAndUpdate(
      newsFeedId,
      {
        isDeleted: true,
      },
      { new: true }
    );

    res.status(200).json({
      success: true,
      message: "News Feed Deleted Successfully",
      data: newsFeed,
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      success: false,
      message: "Internal Server Error",
      error: error.message,
    });

  }
}

const getNewsFeed = async (req, res) => {
  try {
    const { user_id } = req.user;
    const { page, limit } = req.query;
    // Default page and limit
    const defaultPage = 1;
    const defaultLimit = 10;
    // if page and limit is not defined then set default page and limit
    const currentPage = page ? parseInt(page) : defaultPage;
    const currentLimit = limit ? parseInt(limit) : defaultLimit;
    // if page and limit is defined then set skip and limit
    const skip = (currentPage - 1) * currentLimit;
    const limitData = currentLimit;

    const newsFeed = await newsFeedModel.find({}).sort({ createdAt: -1 }).skip(skip).limit(limitData).populate([
      {
        path: "like",
        model: "likeNewsFeed",
      },
      {
        path: "comment",
        model: "commentNewsFeed",
      },
      {
        path: "share",
        model: "shareNewsFeed",
        sort: { createdAt: -1 },
      },
    ]);




    res.status(200).json({
      success: true,
      message: "News Feed Fetched Successfully",
      data: newsFeed,
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

const getNewsFeedById = async (req, res) => {
  try {
    const { user_id } = req.user;
    const { newsFeedId } = req.params;

    const newsFeed = await newsFeedModel.findById(newsFeedId).populate([
      {
        path: "like",
        model: "likeNewsFeed",
      },
      {
        path: "comment",
        model: "commentNewsFeed",
      },
      {
        path: "share",
        model: "shareNewsFeed",
      }
    ]);/*  */
    res.status(200).json({
      success: true,
      message: "News Feed Fetched Successfully",
      data: newsFeed,
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

const shareNewsFeed = async (req, res) => {
  try {
    const { user_id } = req.user;
    const { newsFeedId } = req.params;

    const FindNewsFeed = await newsFeedModel.findById(newsFeedId).lean();
    if (!FindNewsFeed) {
      return res.status(400).json({
        success: false,
        message: "News Feed Not Found",
      });
    }
    // Check if newsfeed is already shared by user
    const isShared = await shareNewsFeedModel.findOne({
      newsFeedId: FindNewsFeed._id,
      sharedBy: user_id,
    }).lean();

    if (isShared) {
      return res.status(400).json({
        success: false,
        message: "News Feed Already Shared",
      });
    }

    const shareNewssFeed = await shareNewsFeedModel.create({
      newsFeedId: FindNewsFeed._id,
      sharedBy: user_id,
    });

    // Push Share NewsFeed Id in newsfeed model
    FindNewsFeed.share.push(shareNewssFeed._id);

    await newsFeedModel.findByIdAndUpdate(
      FindNewsFeed._id,
      FindNewsFeed,
      { new: true }
    );
    // if (!pushShareNewsFeed) {
    //   return res.status(400).json({
    //     success: false,
    //     message: "News Feed Not Found",
    //   });
    // }

    // Fetch newsfeed  
    const newsFeedShare = await newsFeedModel.find({}).sort({ createdAt: -1 }).populate([
      {
        path: "like",
        model: "likeNewsFeed",
      },
      {
        path: "comment",
        model: "commentNewsFeed",
      },
      {
        path: "share",
        model: "shareNewsFeed",
      },
    ]);


    res.status(200).json({
      success: true,
      message: "News Feed Shared Successfully",
      data: newsFeedShare,
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      success: false,
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

const likePost = async (req, res) => {
  try {
    const { user_id } = req.user;
    const { newsFeedId } = req.params;

    // Check if newsfeed is already liked by user

    const isLiked = await likeNewsFeedModel.findOne({
      newsFeedId: newsFeedId,
      likedBy: user_id,
    }).lean();

    if (isLiked) {
      return res.status(400).json({
        success: false,
        message: "News Feed Already Liked",
      });
    }

    const likeNewsFeed = await likeNewsFeedModel.create({
      newsFeedId: newsFeedId,
      likedBy: user_id,
    });

    // Push Like NewsFeed Id in newsfeed model
    const pushLikeNewsFeed = await newsFeedModel.findByIdAndUpdate(
      newsFeedId,
      {
        $push: {
          like: likeNewsFeed._id,
        },
      },
      { new: true }
    );

    if (!pushLikeNewsFeed) {
      return res.status(400).json({
        success: false,
        message: "News Feed Not Found",
      });
    }

    res.status(200).json({
      success: true,
      message: "News Feed Liked Successfully",
      data: pushLikeNewsFeed,
    });

  } catch (error) {
    console.log(error);
    res.status(500).json({
      success: false,
      message: "Internal Server Error",
      error: error.message,
    });
  }

};

const commentNewsFeed = async (req, res) => {
  try {
    const { user_id } = req.user;
    const { newsFeedId, commentDetail } = req.body;

    const commentNewsFeed = await commentNewsFeedModel.create({
      newsFeedId: newsFeedId,
      commentDetail: commentDetail,
      commentBy: user_id,
    });

    // Push Comment NewsFeed Id in newsfeed model
    const pushCommentNewsFeed = await newsFeedModel.findByIdAndUpdate(
      newsFeedId,
      {
        $push: {
          comment: commentNewsFeed._id,
        },
      },
      { new: true }
    );

    if (!pushCommentNewsFeed) {
      return res.status(400).json({
        success: false,
        message: "News Feed Not Found",
      });
    }

    res.status(200).json({
      success: true,
      message: "News Feed Commented Successfully",
      data: pushCommentNewsFeed,
    });

  } catch (error) {
    console.log(error);
    res.status(500).json({
      success: false,
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

const updateCommentNewsFeed = async (req, res) => {
  try {
    const { user_id } = req.user;
    const { comentID, commentDetail } = req.body;

    const commentNewsFeed = await commentNewsFeedModel.findByIdAndUpdate(
      comentID,
      {
        commentDetail: commentDetail,
      },
      { new: true }
    );

    if (!commentNewsFeed) {
      return res.status(400).json({
        success: false,
        message: "News Feed Not Found",
      });
    }

    res.status(200).json({
      success: true,
      message: "News Feed Commented Successfully",
      data: commentNewsFeed,
    });

  } catch (error) {
    console.log(error);
    res.status(500).json({
      success: false,
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

const deleteCommentNewsFeed = async (req, res) => {
  try {
    const { user_id } = req.user;
    const { comentID } = req.body;

    const commentNewsFeed = await commentNewsFeedModel.findByIdAndDelete(
      comentID
    );

    if (!commentNewsFeed) {
      return res.status(400).json({
        success: false,
        message: "News Feed Not Found",
      });
    }

    res.status(200).json({
      success: true,
      message: "Comment Deleted Successfully",
    });

  } catch (error) {
    console.log(error);
    res.status(500).json({
      success: false,
      message: "Internal Server Error",
      error: error.message,
    });
  }
};





module.exports = {
  addNewsFeed: [uploadOptions.array("images", 5), addNewsFeed],
  // addNewsFeed,
  updateNewsFeed: [uploadOptions.array("images", 5), updateNewsFeed],
  deleteNewsFeed,
  getNewsFeed,
  getNewsFeedById,
  shareNewsFeed,
  likePost,
  commentNewsFeed,
  updateCommentNewsFeed,
  deleteCommentNewsFeed,
};
