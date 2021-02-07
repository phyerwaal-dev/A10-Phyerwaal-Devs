const express = require("express");
const router = express.Router();
const pdb = require("../../../db_init/dbConn").pdb;
const bcrypt = require("bcrypt");
const nodemailer = require("nodemailer");
const generateToken = require("../../../middlewares/token").generateToken;

// seeker sign in
router.post("/signin", async (req, res, next) => {
  try {
    const query =
      "select phone_no,password from users where email=${email} or phone_no = ${phone_no}";
    let result = await pdb.any(query, {
      email: req.body.email,
      phone_no: req.body.phone_no,
    });
    if (result.length === 0) {
      throw {
        statusCode: 404,
        customMessage: "No user email/phone found",
      };
    } else if (!bcrypt.compareSync(req.body.password, result[0].password)) {
      throw {
        statusCode: 404,
        customMessage: "Invalid email/phone and password",
      };
    } else {
      let data = result[0];
      delete data.password;
      data["role"] = "user";
      const token = generateToken({
        ...data,
      });
      res.status(200).json({
        status: 200,
        token: `Bearer ${token}`,
      });
    }
  } catch (err) {
    next(err);
  }
});

// seeker signup
router.post("/signup", async (req, res, next) => {
  try {
    let query = "select phone_no from users where phone_no=${phone_no}";
    let result = await pdb.any(query, { phone_no: req.body.phone_no });
    if (result.length !== 0) {
      throw {
        statusCode: 404,
        customMessage: "User with the same phone no already exists",
      };
    }

    var salt = bcrypt.genSaltSync(10);
    var hashed_password = bcrypt.hashSync(req.body.password, salt);
    query =
      "insert into users(email,password,username,phone_no) values(${email},${password},${username},${phone_no})";
    await pdb.any(query, {
      email: req.body.email,
      password: hashed_password,
      username: req.body.username,
      phone_no: req.body.phone_no,
    });
    res.status(200).json({
      status: 200,
      customMessage: "User created successfully",
    });
  } catch (err) {
    next(err);
  }
});

module.exports = router;
