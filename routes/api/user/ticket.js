const express = require("express");
const router = express.Router();
const pdb = require("../../../db_init/dbConn").pdb;
const bcrypt = require("bcrypt");
const nodemailer = require("nodemailer");
const generateToken = require("../../../middlewares/token").generateToken;
