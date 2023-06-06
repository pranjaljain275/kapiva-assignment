const express = require("express");
const { bookRoute } = require("./routes/book.route");
const { connection } = require("./config/db");
require("dotenv").config();
const cors = require("cors");

const app = express();

app.use(cors());
app.use(express.json());
app.use("/book", bookRoute);

app.get("/", (req, res) => {
  res.send("Welcome to Youth India Foundation");
});

app.listen(process.env.port, async () => {
  try {
    await connection;
    console.log("DB Connected");
  } catch (err) {
    console.log("DB not connected");
  }
  console.log(`Server is running on port ${process.env.port}`);
});
