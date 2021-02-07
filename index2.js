const io = require("socket.io-client");
const socket = io("127.0.0.1:5000");

while (true) {
  socket.emit("loc", "location of gps");
}
