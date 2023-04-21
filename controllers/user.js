var jwt = require("jsonwebtoken");
var bcrypt = require("bcryptjs");
const { Users } = require("../model/user");

const registerUser = async (req, res) => {
    const usercheck = await Users.find({
        userEmail: req.body.userEmail,
    }).lean();
    if (usercheck.length != 0) {
        return res
            .status(200)
            .json({ message: "user email already exist", success: false });
    }
    // Const Match Regex for password 
    const passwordRegex = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
    if (!req.body.isSocial) {
        if (!passwordRegex.test(req.body.userPassword)) {
            return res.status(200).json({
                success: false,
                message: "Password must be 8 characters long and must contain at least one uppercase letter, one lowercase letter, one number and one special character.",
            });
        }
    }
    const user = Users({
        userEmail: req.body.userEmail,
        userName: req.body.userName,
        userPassword: req.body.isSocial
            ? ""
            : bcrypt.hashSync(req.body.userPassword, 8),
    });
    const token = jwt.sign({ user_id: user._id }, process.env.TOKEN_KEY, {
        expiresIn: "7d",
    });
    // save user token
    user.userToken = token;
    try {
        const usersave = await user.save();
        res.status(200).json({
            success: true,
            data: usersave,
            message: "User saved successfully",
        });
    } catch (err) {
        if (err.name === "ValidationError") {
            console.error(Object.values(err.errors).map((val) => val.message));
            return res.status(400).json({
                success: false,
                message: Object.values(err.errors).map((val) => val.message)[0],
            });
        }
        return res.status(400).json({ success: false, message: err });
    }
};

const loginUser = async (req, res) => {
    try {
        let user = null;
        if (req.body.userEmail) {
            user = await Users.findOne({ userEmail: req.body.userEmail }).lean();
        } else {
            user = await Users.findOne({ userNumber: req.body.userNumber }).lean();
        }
        if (!user) {
            return res.status(200).json({ message: "user not found", success: false });
        }

        if (user.userSocialToken) {
            const token = jwt.sign({ user_id: user._id }, process.env.TOKEN_KEY, {
                expiresIn: "7d",
            });
            user.userToken = token;
            return res
                .status(200)
                .json({ message: "user logged in as social", success: false });
        }
        if (user && bcrypt.compareSync(req.body.userPassword, user.userPassword)) {
            const token = jwt.sign({ user_id: user._id }, process.env.TOKEN_KEY, {
                expiresIn: "7d",
            });
            user.userToken = token;
            return res
                .status(200)
                .json({ message: "login successfully", data: user, success: true });
        }
        return res.status(200).json({ message: "login failed", success: false });
    } catch (err) {
        console.log(err);
        if (err.name === "ValidationError") {
            console.error(Object.values(err.errors).map((val) => val.message));
            return res.status(400).json({
                success: false,
                message: Object.values(err.errors).map((val) => val.message)[0],
            });
        }
        return res.status(400).json({ success: false, message: err });
    }
};

const updateUser = async (req, res) => {
    if (req.body.userNameChanged) {
        const usercheck = await Users.find({
            userName: req.body.userName,
        });
        if (usercheck.length != 0) {
            return res
                .status(200)
                .json({ message: "user name already exist", success: false });
        }

    }

    try {
        const updateUser = await Users.findByIdAndUpdate(
            req.user.user_id,
            {
                userEmail: req.body.userEmail,
                userName: req.body.userName,
                userCity: req.body.userCity,
                userAddress: req.body.userAddress,
                userCountry: req.body.userCountry,
                userNumber: req.body.userNumber,
                userSchool: req.body.userSchool,
                userTeam: req.body.userTeam,
                userCoaches: req.body.userCoaches,
                userBio: req.body.userBio,
                userSports: req.body.userSports,
            },
            {
                new: true,
            }
        );
        res.status(200).json({
            success: true,
            data: updateUser,
            message: "User saved successfully",
        });
    } catch (err) {
        if (err.name === "ValidationError") {
            console.error(Object.values(err.errors).map((val) => val.message));
            return res.status(400).json({
                success: false,
                message: Object.values(err.errors).map((val) => val.message)[0],
            });
        }
        return res.status(400).json({ success: false, message: err });
    }
};

module.exports = {
    registerUser,
    loginUser,
    updateUser
};
