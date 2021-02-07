module.exports = (err, req, res, next) => {
  console.log(err);
  res.status(err.statusCode ? err.statusCode : 500).send({
    err: err,
    message: err.customMessage ? err.customMessage : "Please contact the ADMIN",
  });
};
