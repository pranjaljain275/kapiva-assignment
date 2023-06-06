const mongoose = require("mongoose");

const bookSchema = mongoose.Schema(
  {
    bookName: String,
    authorName: String,
  },
  {
    versionKey: false,
  }
);

const Bookmodel = mongoose.model("book", bookSchema);

module.exports = {
  Bookmodel,
};
