const app = require("./src/app");
const { log } = require("@TolgaYld/core-buzzup");
const port = parseInt(process.env.PORT) || 8002;

// Run the server!
app.listen({ port }, () => {
  log(`${process.env.CURRENTSERVICE} Server Up!}`);
});

require("./src/db/dbConnection");
