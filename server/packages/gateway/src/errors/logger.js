const { createLogger, transports, format } = require("winston");
const { MONGODBCONNECTIONSTRING, log } = require("core-buzzup")
require("winston-mongodb");

let service = process.env.CURRENTSERVICE;

log(MONGODBCONNECTIONSTRING)
service = service.toLowerCase();

const customerLogger = createLogger({
  transports: [
    new transports.MongoDB({
      db: MONGODBCONNECTIONSTRING,
      filename: `${service.toLowerCase()}-error.log`,
      level: "error",
      collection: "error_logs",
      options: { useUnifiedTopology: true },
      format: format.combine(format.timestamp(), format.json()),
    }),
  ],
});

module.exports = customerLogger;
