const jwt = require("jsonwebtoken");
const config = require("config");
const jwtPrivateKey = config.get("jwtPrivateKey");

module.exports.generateToken = (payload, expiresIn) => {
  return jwt.sign(payload, jwtPrivateKey, { expiresIn: 3600 });
};
