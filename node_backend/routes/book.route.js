const express = require("express");
const { Bookmodel } = require("../models/book.model");

const bookRoute = express.Router();

// Add Book
bookRoute.post("/add", async (req, res) => {
  try {
    const data = req.body;
    const book = new Bookmodel(data);
    await book.save();
    res.send({ book, message: "Book Add Successfully" });
  } catch (err) {
    console.log({ message: err.message });
  }
});

// Get all Book
bookRoute.get("/", async (req, res) => {
  try {
    const books = await Bookmodel.find();
    res.send(books);
  } catch (err) {
    console.log({ message: err.message });
  }
});

// Get particular Book
bookRoute.get("/:id", async (req, res) => {
  try {
    const ID = req.params.id;
    const book = await Bookmodel.findOne({ _id: ID });
    res.send(book);
  } catch (err) {
    console.log({ message: err.message });
  }
});

// Update Book
bookRoute.put("/:id", async (req, res) => {
  try {
    const payload = req.body;
    const ID = req.params.id;
    await Bookmodel.findByIdAndUpdate({ _id: ID }, payload);
    res.send(`Book update with ID ${ID} is updated`);
  } catch (err) {
    console.log({ message: err.message });
  }
});

// Delete Book
bookRoute.delete("/:id", async (req, res) => {
  try {
    const ID = req.params.id;
    await Bookmodel.findByIdAndDelete({ _id: ID });
    res.send(`Book update with ID ${ID} is deleted`);
  } catch (err) {
    console.log({ message: err.message });
  }
});

module.exports = {
  bookRoute,
};
