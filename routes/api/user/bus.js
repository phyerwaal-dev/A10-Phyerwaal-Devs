const express = require("express");
const router = express.Router();
const pdb = require("../../../db_init/dbConn").pdb;
const bcrypt = require("bcrypt");

//  get bus details
router.get("/buses", async (req, res, next) => {
  try {
    const query =
      "SELECT bus_no,start_loc,dest_loc from bus where ${start_l} and ${dest_l} = ANY(route)";

    let result = await pdb.any(query, {
      start_l: req.params.start_loc,
      dest_l: req.params.dest_loc,
    });
    if (result.length === 0) {
      throw {
        statusCode: 404,
        customMessage: "No such bus found which follows the route",
      };
    } else {
      res.status(200).json({
        status: 200,
        data: result,
      });
    }
  } catch (err) {
    console.error(err);
    next(err);
  }
});

router.get("/:bus_no", async (req, res, next) => {
  try {
    const query = "SELECT * from bus where bus_no = ${bus_no} ";
    let result1 = await pdb.any(query, {
      bus_no: req.params.bus_no,
    });

    if (result1.length === 0) {
      throw {
        statusCode: 404,
        customMessage: "No such bus no. found",
      };
    } else {
      const query = "SELECT * from bus_stop where stop_id = any(${route})";
      let result2 = await pdb.any(query, {
        route: result1[0].route.map(Number),
      });
      res.status(200).json({
        status: 200,
        data: { bus: result1, bus_stop: result2 },
      });
    }
  } catch (err) {
    console.error(err);
    next(err);
  }
});

module.exports = router;
