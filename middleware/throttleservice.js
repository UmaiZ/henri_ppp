const rateLimit = require('express-rate-limit')

const limiter = rateLimit({
    max: 5,
    windowMs: 10000
});

module.exports = limiter;