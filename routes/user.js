const express = require("express");
const router = express.Router();
const userController = require("../controllers/user");

const limiter = require("../middleware/throttleservice");

router.post("/register", limiter, userController.registerUser);
router.post("/login", limiter, userController.loginUser);


module.exports = router;
