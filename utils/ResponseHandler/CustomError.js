class customError extends Error {
  constructor(message, status) {
    super(message);
    this.status = status;
    this.message = message;
  }
  static createError(message, status) {
    return new customError(message, status);
  }
  static notFound(message = "Not Found") {
    return new customError(message, 404);
  }
  static badRequest(message = "Bad Request") {
    return new customError(message, 400);
  }
  static unauthorized(message = "Unauthorized") {
    return new customError(message, 401);
  }
  static forbidden(message = "Forbidden") {
    return new customError(message, 403);
  }
  static internal(message = "Internal Server Error") {
    return new customError(message, 500);
  }
  static DataWithErrors(data, message, status) {
    return {
      user: data,
      message: message,
      status: status,
    };
  }
}

module.exports = { customError };