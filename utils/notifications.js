const FCM = require("fcm-node");
const { config } = require('dotenv');
config();

const fcm = new FCM("AAAA4-BSA-w:APA91bFNzZBxKwTygTYdtGiYyNrNiiRyr3ZRd9J6rJuHNTmPH1yalPYSlNUUHVGkNx4ri8dSoBHPfzFJuvOibo8ViCj8GfUuUL9N3lJn1DAEIGEu1ngINGwXgWOBnxDgKAbtyJ-YOSjV");

const sendNotification = (token, title, body) => {
  // console.log(firebase.serverKey);
  const message = {
    to: token,
    notification: {
      title: title,
      body: body,
    },
  };
  fcm.send(message, function (err, response) {
    if (err) {
      console.log("Something has gone wrong!", err);
    } else {
      console.log("Successfully sent with response: ", response);
    }
  });
};

module.exports = sendNotification;