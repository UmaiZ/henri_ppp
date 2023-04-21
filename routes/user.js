const express = require("express");
const router = express.Router();
const userController = require("../controllers/user");

const limiter = require("../middleware/throttleservice");
const auth = require("../middleware/auth");

router.post("/register", limiter, userController.registerUser);
router.post("/login", limiter, userController.loginUser);
router.post("/updateUser", limiter, auth, userController.updateUser);


module.exports = router;
