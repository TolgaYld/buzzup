const mongoose = require("mongoose");
const { log, MONGODBCONNECTIONSTRING } = require("@TolgaYld/core-buzzup");
mongoose.set("strictQuery", false);

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