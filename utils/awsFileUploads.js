const AWS = require('aws-sdk');
const fs = require('fs');
const path = require('path');

// AWS S3 Bucket Config
const s3 = new AWS.S3({
  accessKeyId: process.env.AWS_ACCESS_KEY_ID,
  secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
  region: process.env.AWS_REGION,
});

// Upload File to S3
const uploadFile = (fileName) => {
  // Read content from the file
  const fileContent = fs.readFileSync(path.join(__dirname, fileName));

  // Setting up S3 upload parameters
  const params = {
    Bucket: process.env.AWS_BUCKET_NAME,
    Key: fileName, // File name you want to save as in S3
    Body: fileContent,
  };

  // Uploading files to the bucket
  s3.upload(params, function (err, data) {
    if (err) {
      throw err;
    }
    console.log(`File uploaded successfully. ${data.Location}`);
  });
}
// Upload File to S3 Folder With Folder Name
const uploadFileWithFolder = async (fileName, folderName, fileContent) => {
  // Read content from the file
  // const fileContent = fs.readFileSync(path.join("public", "uploads", fileName));
  // Setting up S3 upload parameters
  const params = {
    Bucket: process.env.AWS_BUCKET_NAME,
    Key: `${folderName}/${fileName}`, // File name you want to save as in S3
    Body: fileContent,
  };

  // Uploading files to the bucket
  const data = await s3.upload(params).promise();
  return data.Location;

}



// Exporting the functions
module.exports = {
  uploadFile,
  uploadFileWithFolder,
};