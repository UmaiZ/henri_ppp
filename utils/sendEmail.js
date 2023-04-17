const nodemailer = require("nodemailer");
const fs = require("fs");
require("dotenv").config();
const { emailConfig } = require('../config/emailConfig');
// create reusable transporter object using the default SMTP transport
const transporter = nodemailer.createTransport(emailConfig);

// Converting Stream to Buffer
const streamToBuffer = (stream) => {
  return new Promise((resolve, reject) => {
    const buffers = [];
    stream.on("data", (data) => buffers.push(data));
    stream.on("error", reject);
    stream.on("end", () => resolve(Buffer.concat(buffers)));
  });
};

// GetFile Content
const getFileContent = async (filePath) => {
  const fileStream = fs.createReadStream(filePath);
  const buffer = await streamToBuffer(fileStream);
  return buffer.toString();
};

// send mail with defined transport object
const sendEmails = (to, subject, content, next) => {
  try {
    const message = {
      from: {
        name: process.env.MAIL_FROM_NAME,
        address: process.env.MAIL_USERNAME,
      },
      to: to,
      subject: subject,
      html: content,
    };
    transporter.sendMail(message, next);
  } catch (error) {
    console.error(error);
  }
};

module.exports = {
  sendEmails,
  getFileContent,
};