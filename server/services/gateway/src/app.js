if (process.env.NODE_ENV === "test")
  require("dotenv").config({ path: `.env.${process.env.NODE_ENV}` });
const Fastify = require("fastify");
const mercurius = require("mercurius");
const path = require("path");
const i18next = require("i18next");
const Backend = require("i18next-fs-backend");
const i18nextMiddleware = require("i18next-http-middleware");
const { loadSchemaSync, loadSchema } = require("@graphql-tools/load");
const { GraphQLFileLoader } = require("@graphql-tools/graphql-file-loader");
const { addResolversToSchema } = require("@graphql-tools/schema");
const resolvers = require("./graphql/resolvers/index");
const verifyFingerprint = require("./graphql/hooks/verifyFingerprint");

i18next
  .use(Backend)
  .use(i18nextMiddleware.LanguageDetector)
  .init({
    debug: process.env.NODE_ENV !== "production",
    fallbackLng: "en",
    backend: {
      loadPath:
        path.join(__dirname, "..") + "/locales/{{lng}}/translation.json",
    },
  });

const server = Fastify({
  logger: process.env.NODE_ENV !== "production",
  cors: true,
});

if (process.env.NODE_ENV === "production") {
  server.register(require("fastify-helmet"));
  server.register(require("fastify-rate-limit"), {
    max: 100,
    timeWindow: "1 minute",
  });
  server.addHook("onRequest", verifyFingerprint);
}

const schema = loadSchemaSync(
  path.join(__dirname, "./graphql/schema.graphql"),
  { loaders: [new GraphQLFileLoader()] },
);

const schemaWithResolvers = addResolversToSchema({ schema, resolvers });

server.register(mercurius, {
  schema: schemaWithResolvers,
  graphiql: process.env.NODE_ENV !== "production",
  subscription: true,
  context: async (req) => {
    return { req };
  },
});

server.register(i18nextMiddleware.plugin, { i18next });

const healthCheckPath = process.env.NODE_ENV === "production" ? "/hc" : "/api/v1.0/hc";

server.get(healthCheckPath, async (request, reply) => {
  reply.send({ hello: "world" });
});

module.exports = server;
