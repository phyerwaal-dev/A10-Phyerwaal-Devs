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
      "insert into tickets (email_phone,start_loc,dest_loc,fare,payment_status,transaction_time,date,timestamp, txnid) values (${email_phone},${start_loc},${dest_loc},${fare},${payment_status},${transaction_time},${date},${timestamp},${txnid})";
    await pdb.any(query, {
      email_phone: req.user.email_phone,
      start_loc: req.body.start_loc,
      dest_loc: req.body.dest_loc,
      fare: req.body.fare,
      payment_status: req.body.payment_status,
      transaction_time: transaction_time1,
      date: new Date(),
      timestamp: "null",
      txnid:req.body.txnid
    });
    res.status(200).json({
      status: 200,
      customMessage: "ticket updated/added successfully",
    });
  } catch (err) {
    next(err);
  }
});

router.get("/ticketPayStatus/:id", async (req, res, next) => {
  try {
    
    const query =
      "select * tickets where ticket_no = ${ticket_no};
    let result = await pdb.any(query, {
      ticket_no:req.params.ticket_no
    });
    if (result.length === 0) {
      throw {
        statusCode: 404,
        customMessage: "No ticket found",
      };
    }
    var config = {
      method: 'get',
      url: `https://api.razorpay.com/v1/payments/${result[0].txnid}`,
      headers: { 
        'Authorization': 'Basic cnpwX3Rlc3RfaTNhZWlNMG5BQkt2RHo6ODVCV0w1NVVDbUZvODk0Q1ZGaWhGdGtM'
      }
    };
    let result2 = await axios(config)
    if (result2.data.error) {
      throw {
        statusCode: 404,
        customMessage: result2.data.error.message,
      };
    }
    let status = result2.data.status
    if (status === "authorized" || status === "captured") {
     await  pdb.any(`update tickets set txnid=${val} where ticket_no=${id}`,{val:result2.data, id:req.params.id})
    return res.status(200).json({
        status: 200,
        data:result
    });   
    }
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
