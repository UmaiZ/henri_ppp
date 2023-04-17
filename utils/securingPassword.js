const bcrypt = require('bcryptjs');

const hashPassword = (password) => {
  const salt = bcrypt.genSaltSync(10);
  const hash = bcrypt.hashSync(password, salt);
  return hash;
};

const comparePassword = (password, receivedPassword) => {
  return bcrypt.compareSync(password, receivedPassword);
};

module.exports = {
  hashPassword,
  comparePassword,
};
