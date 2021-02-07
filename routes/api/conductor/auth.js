const express = require("express");
const router = express.Router();
const pdb = require("../../../db_init/dbConn").pdb;
const bcrypt = require("bcrypt");
const nodemailer = require("nodemailer");
const generateToken = require("../../../middlewares/token").generateToken;

// conductor sign in
router.post("/signin", async (req, res, next) => {
  try {
    const query =
      "select conductor_id,password from conductor where conductor_id=${conductor_id} and password=${password}";
    let result = await pdb.any(query, {
      conductor_id: req.body.conductor_id,
      password: req.body.password,
    });
    if (result.length === 0) {
      throw {
        statusCode: 404,
        customMessage: "Conductor id or password is wrong",
      };
    } else {
      let data = result[0];
      delete data.password;
      data["role"] = "conductor";
      const token = generateToken({
        ...data,
      });
      res.status(200).json({
        status: 200,
        token: `Bearer ${token}`,
      });
    }
  } catch (err) {
    console.log(err);
    next(err);
  }
});

module.exports = router;
