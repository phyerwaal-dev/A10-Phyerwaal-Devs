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
      "select conductor_id,password from conductor where conductor_id=${conductor_id}";
    let result = await pdb.any(query, {
      conductor_id: req.body.email,
    });
    if (result.length === 0) {
      throw {
        statusCode: 404,
        customMessage: "No conductor_id found",
      };
    } else if (!bcrypt.compareSync(req.body.password, result[0].password)) {
      throw {
        statusCode: 404,
        customMessage: "Invalid conductor_id and password",
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
    next(err);
  }
});

module.exports = router;
