const app = require("./src/app");
const { log } = require("@TolgaYld/core-buzzup");
const port = parseInt(process.env.PORT) || 8000;

// Run the server!
app.app.listen(port, () => {
  log(`${process.env.CURRENTSERVICE} Server Up!`);
  log(`GraphQL Endpoint: http://localhost:${port}/graphql`);
});
require("./src/db/dbConnection");
