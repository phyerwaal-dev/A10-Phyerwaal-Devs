const express = require("express");
const router = express.Router();
const pdb = require("../../../db_init/dbConn").pdb;
const bcrypt = require("bcrypt");
const nodemailer = require("nodemailer");
const generateToken = require("../../../middlewares/token").generateToken;

router.post("/ticketDetails", async (req, res, next) => {
  try {
    var transaction_time1;
    if (req.body.payment_status == "Paid") {
      transaction_time1 = new Date();
    } else {
      transaction_time1 = null;
    }
    console.log(req.body);
    const query =
      "insert into tickets (email_phone,start_loc,dest_loc,fare,payment_status,transaction_time,date,timestamp) values (${email_phone},${start_loc},${dest_loc},${fare},${payment_status},${transaction_time},${date},${timestamp})";
    await pdb.any(query, {
      email_phone: req.body.email_phone,
      start_loc: req.body.start_loc,
      dest_loc: req.body.dest_loc,
      fare: req.body.fare,
      payment_status: req.body.payment_status,
      transaction_time: transaction_time1,
      date: new Date(),
      timestamp: "null",
    });
    res.status(200).json({
      status: 200,
      customMessage: "ticket updated/added successfully",
    });
  } catch (err) {
    next(err);
  }
});

module.exports = router;
