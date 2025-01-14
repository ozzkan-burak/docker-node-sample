const express = require("express");
const app = express();
const router = express.Router();

const path = __dirname + "/webfile/";
const port = 8080;

router.use(function (req, res, next) {
  console.log("/" + req.method);
  next();
});

router.get("/", function (req, res) {
  res.sendFile(path + "index.html");
});

router.get("gelburdayim", function () {
  res.sendFile(path + "gelburdayim.html");
});

app.use(express.static(path));
app.use("/", router);

app.listen(port, function () {
  console.log(`Uygullama ${port} portunda çalışmaya başladı`);
});
