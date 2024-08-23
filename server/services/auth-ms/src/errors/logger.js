const { createLogger, transports, format } = require("winston");
require("winston-mongodb");
const { MONGODBCONNECTIONSTRING, log, AUTHSERVICE } = require("@TolgaYld/core-buzzup");

let service = process.env.CURRENTSERVICE;
service = service.toLowerCase();

log(`Service: ${service}`);
log(`MongoDB Connection String: ${AUTHSERVICE}`);

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
