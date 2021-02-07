const express = require("express");
const router = express.Router();
const pdb = require("../../../db_init/dbConn").pdb;
const bcrypt = require("bcrypt");
const nodemailer = require("nodemailer");
const generateToken = require("../../../middlewares/token").generateToken;

router.post("/ticketDetails", async (req, res, next) => {
  try {
    const query = "insert into tickets () value ticket_no=${ticket_no}";
    let result1 = await pdb.any(query, { ticket_no: req.body.ticket_no });
    if (result1.length === 0) {
      throw {
        statusCode: 404,
        customMessage: "No such ticket found",
      };
    } else {
      const query =
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
        var plate_no = result2[0];
        const query = "select bus_no from vehicle where plate_no=${plate_no}";
        let result3 = await pdb.any(query, {
          plate_no,
        });
        if (result3.length === 0) {
          throw {
            statusCode: 404,
            customMessage: "No such bus no found",
          };
        } else {
          var transcation_time;
          var bus_no = result3[0];
          if (req.body.payment_status == "Not Paid") {
            transcation_time = new Date();
          } else {
            transcation_time = req.body.transcation_time;
          }
          query =
            "update tickets set payment_status=${payment_status},timestamp=${timestamp},transcation_time$={transcation_time},conductor_id=${conductor_id},plate_no=${plate_no},bus_no=${bus_no},verified=${verified} where ticket_no=${ticket_no}";
          await pdb.any(query, {
            paymentstatus: "paid",
            timestamp: new Date(),
            transcation_time: transcation_time,
            conductor_id: req.body.conductor_id,
            plate_no: plate_no,
            bus_no: bus_no,
            verified: true,
            ticket_no: req.body.ticket_no,
          });
          query = "update vehicle set passenger_count=passenger_count + 1 ";
          await pdb.any(query);
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
