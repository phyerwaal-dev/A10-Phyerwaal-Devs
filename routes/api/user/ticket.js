const express = require("express");
const router = express.Router();
const pdb = require("../../../db_init/dbConn").pdb;
const bcrypt = require("bcrypt");
const nodemailer = require("nodemailer");
const generateToken = require("../../../middlewares/token").generateToken;

router.post("/bookTicket", async (req, res, next) => {
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
      email_phone: req.user.email_phone,
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

router.get("/view/:id", async (req, res, next) => {
  try {
    const query = "select * from tickets where ticket_no = ${ticket_no}";
    let result = await pdb.any(query, {
      ticket_no: req.params.ticket_no,
    });
    res.status(200).json({
      status: 200,
      data: result[0],
    });
  } catch (err) {
    next(err);
  }
});

router.get("/", async (req, res, next) => {
  try {
    const query = "select * from tickets where email_phone = ${email_phone}";
    let result = await pdb.any(query, {
      email_phone: req.user.phone_no,
    });
    res.status(200).json({
      status: 200,
      data: result,
    });
  } catch (err) {
    next(err);
  }
});

module.exports = router;
