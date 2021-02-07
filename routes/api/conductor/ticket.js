const express = require("express");
const router = express.Router();
const pdb = require("../../../db_init/dbConn").pdb;
const bcrypt = require("bcrypt");
const nodemailer = require("nodemailer");
const generateToken = require("../../../middlewares/token").generateToken;

// conductor validates the tickets
router.post("/verify", async (req, res, next) => {
  try {
    let query = "select ticket_no from tickets where ticket_no=${ticket_no}";
    let result1 = await pdb.any(query, { ticket_no: req.body.ticket_no });
    if (result1.length === 0) {
      throw {
        statusCode: 404,
        customMessage: "No such ticket found",
      };
    } else {
      let query =
        "select plate_no from conductor where conductor_id=${conductor_id}";
      let result2 = await pdb.any(query, {
        conductor_id: req.body.conductor_id,
      });
      if (result2.length === 0) {
        throw {
          statusCode: 404,
          customMessage: "No such plate no found",
        };
      } else {
        var plate_no1 = result2[0].plate_no;
        let query = "select bus_no from vehicle where plate_no=${plate_no}";
        let result3 = await pdb.any(query, {
          plate_no: plate_no1,
        });
        if (result3.length === 0) {
          throw {
            statusCode: 404,
            customMessage: "No such bus number found",
          };
        } else {
          var transcation_time;
          var bus_no = result3[0].bus_no;
          if (req.body.payment_status == "Not Paid") {
            transcation_time = new Date();
          } else {
            transcation_time = req.body.transcation_time;
          }
          let query =
            "update tickets set payment_status=${payment_status},timestamp=${timestamp},transaction_time=${transaction_time1},conductor_id=${conductor_id},plate_no=${plate_no},bus_no=${bus_no},verified=${verified} where ticket_no=${ticket_no}";
          await pdb.any(query, {
            payment_status: "Paid",
            timestamp: new Date(),
            transaction_time1: transcation_time,
            conductor_id: req.body.conductor_id,
            plate_no: plate_no1,
            bus_no: bus_no,
            verified: true,
            ticket_no: req.body.ticket_no,
          });
          let query2 =
            "update vehicle set passenger_count=cast(passenger_count AS int) + 1 ";
          await pdb.any(query2);
        }
      }
      res.status(200).json({
        status: 200,
        customMessage: "ticket updated/added successfully",
      });
    }
  } catch (err) {
    next(err);
  }
});

module.exports = router;
