const mongoose = require("mongoose");
mongoose.set("strictQuery", false);
const { MONGODBCONNECTIONSTRING, log } = require("@TolgaYld/core-buzzup");

mongoose
  .connect(MONGODBCONNECTIONSTRING)
  .then(() => {
    log(
      `Connected to ${process.env.CURRENTSERVICE}-Mongo-${process.env.NODE_ENV}-DB!`,
    );
  })
  .catch((error) => {
    log(
      `Connection to ${process.env.CURRENTSERVICE}-Mongo-${process.env.NODE_ENV}-DB failed!: ` +
      error,
    );
  });