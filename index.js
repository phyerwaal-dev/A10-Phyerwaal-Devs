const express = require("express");
const app = express();
const server = require("http").createServer(app);
const io = require("socket.io")(server);
// const bodyParser = require("body-parser");
const logger = require("morgan");
const error = require("./middlewares/error");
const cors = require("cors");
const config = require("config");
const auth = require("./middlewares/auth");

const userAuth = require("./routes/api/user/auth");
const userBus = require("./routes/api/user/bus");
const userTicket = require("./routes/api/user/ticket");
const conductorAuth = require("./routes/api/conductor/auth");
const conductorTicket = require("./routes/api/conductor/ticket");

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
app.use("/api/v1/user/auth", userAuth);
app.use("/api/v1/user/bus", userBus);
app.use("/api/v1/user/ticket", auth, userTicket);
app.use("/api/v1/conductor/auth", conductorAuth);
app.use("/api/v1/conductor/ticket", conductorTicket);

// error response middleware
app.use(error);

// node server port
const port = config.get("PORT");

io.on("connection", (socket) => {
  console.log("connect");
});

server.listen(port, () => {
  console.log(`Server is listening at http://localhost:${port}`);
});
io.on("connection", (socket) => {
  console.log("connect");
  socket.on("loc", (msg) => {
    console.log("location", msg);
  });
});

process.on("SIGINT", () => {
  console.log("App terminated!! Mongo connection closed");
  process.exit(0);
});
