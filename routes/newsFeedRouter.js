const express = require("express");
const router = express.Router();
const auth = require("../middleware/auth");
const newsFeedController = require("../controllers/newsFeedController");

router.post("/createNewsFeed", auth, newsFeedController.addNewsFeed);
router.post("/updateNewsFeed", auth, newsFeedController.updateNewsFeed);
router.post("/deleteNewsFeed", auth, newsFeedController.deleteNewsFeed);
router.get("/getNewsFeed", auth, newsFeedController.getNewsFeed);
router.get("/shareNewsFeed/:newsFeedId", auth, newsFeedController.shareNewsFeed);
router.get("/getNewsFeedById/:id", auth, newsFeedController.getNewsFeedById);
router.get("/likeNewsFeed/:newsFeedId", auth, newsFeedController.likePost);
router.post("/commentNewsFeed", auth, newsFeedController.commentNewsFeed);
router.post("/updateCommentNewsFeed", auth, newsFeedController.updateCommentNewsFeed);
router.post("/deleteCommentNewsFeed", auth, newsFeedController.deleteCommentNewsFeed);
router.get("/newsFeedComment/:id", auth, newsFeedController.getCommentsOfFeed);

module.exports = router;
