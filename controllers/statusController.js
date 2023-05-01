
const { Status } = require("../model/status");
const multer = require("multer");
const { uploadFileWithFolder } = require("../utils/awsFileUploads");


const uploadOptions = multer({
    storage: multer.memoryStorage(),
    limits: {
        fileSize: 10 * 1024 * 1024,
    },
});

const createStatus = async (req, res) => {
    try {
        const { text } = req.body;
        const { files } = req;
        const { user_id } = req.user;
        const images = [];
        // if (title == undefined || description == undefined || title == "" || description == "" || title == null || description == null) {
        //   return res.status(400).json({
        //     success: false,
        //     message: "Title and Description are required",
        //   });
        // }
        imageLocation = "";
        videoLocaiton = "";

        if (files.image) {
            const file = files.image[0];
            const fileName = file.originalname;
            const fileContent = file.buffer;
            imageLocation = await uploadFileWithFolder(
                fileName,
                "newsFeed",
                fileContent
            );
        }


        if (files.video) {
            const file = files.video[0];
            const fileName = file.originalname;
            const fileContent = file.buffer;
            videoLocaiton = await uploadFileWithFolder(
                fileName,
                "newsFeed",
                fileContent
            );
        }

        const status = await Status.create({
            statusText: text,
            statusImage: imageLocation,
            statusVideo: videoLocaiton,
            createdBy: user_id
        });
        console.log(status)

        res.status(200).json({
            success: true,
            message: "Status Added Successfully",
            data: status,
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

const getStatus = async (req, res) => {
    try {

        const status = await Status.find().populate(['createdBy']);
        console.log(status)

        res.status(200).json({
            success: true,
            message: "Successfully",
            data: status,
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
    createStatus: [uploadOptions.fields([{
        name: 'image', maxCount: 1
    }, {
        name: 'video', maxCount: 1
    }]), createStatus],
    getStatus
};
