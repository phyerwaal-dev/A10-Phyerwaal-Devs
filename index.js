const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const logger = require("morgan");
const error = require("./middlewares/error");
const cors = require("cors");
const config = require("config");
const auth = require("./middlewares/auth");
const userAuth = require("./routes/api/user/auth");
const conductorAuth = require("./routes/api/conductor/auth");

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
// morgan logging middleware
app.use(logger("common"));
// cors middleware
app.use(cors());

app.get("/", (req, res) =>
  res.status(200).json({
    status: 200,
    message: "Health check successful",
  })
);

app.use("/api/v1/user/auth/", userAuth);

app.use("/api/v1/conductor/auth/", conductorAuth);
// error response middleware
app.use(error);

// node server port
const port = config.get("PORT");

app.listen(port, () =>
  console.log(`Server is listening at http://localhost:${port}`)
);

process.on("SIGINT", () => {
  console.log("App terminated!! Mongo connection closed");
  process.exit(0);
});
