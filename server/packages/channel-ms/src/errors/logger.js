const { createLogger, transports, format } = require("winston");
require("winston-mongodb");

let service = process.env.CURRENTSERVICE;
service = service.toLowerCase();

const customerLogger = createLogger({
  transports: [
    new transports.MongoDB({
      db: process.env.MONGODBCONNECTIONSTRING,
      filename: `${service.toLowerCase()}-error.log`,
      level: "error",
      collection: "error_logs",
      options: { useUnifiedTopology: true },
      format: format.combine(format.timestamp(), format.json()),
    }),
  ],
});

module.exports = customerLogger;
