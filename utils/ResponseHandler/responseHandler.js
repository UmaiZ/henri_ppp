const { ValidationError } = require('express-validation');
const { customError } = require('./CustomError');

const responseHandler = (err, req, res, next) => {
  let StatusCode = 500;
  let Data = {
    message: err.message,
    status: false,
  };
  if (err instanceof ValidationError) {
    StatusCode = 400;
    Data = {
      message: err.message,
      status: false,
    };
  }
  if (err instanceof customError) {
    StatusCode = err.status;
    Data = {
      message: err.message,
      status: false,
    };
  }

  return res.status(StatusCode).json(Data);
};

module.exports = responseHandler;