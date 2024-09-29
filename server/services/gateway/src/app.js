if (process.env.NODE_ENV === "test") {
  require("dotenv").config({ path: `.env.${process.env.NODE_ENV}` });
}

const path = require("path");
const i18next = require("i18next");
const Backend = require("i18next-fs-backend");
const i18nextMiddleware = require("i18next-http-middleware");
const express = require("express");
const { ApolloServer } = require("apollo-server-express");
const { PubSub } = require("graphql-subscriptions");
const { SESSION_SECRET } = require("@TolgaYld/core-buzzup");
const session = require("express-session");
const flash = require("connect-flash");
const limitter = require("express-rate-limit");
const helmet = require("helmet");

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

i18next
  .use(Backend)
  .use(i18nextMiddleware.LanguageDetector)
  .init({
    debug: false,
    fallbackLng: "en",
    detection: {
      order: ['cookie', 'querystring', 'header'],
      caches: ['cookie'],
      lookupCookie: 'i18next',
    },
    backend: {
      loadPath:
        path.join(__dirname, "..") + "/locales/{{lng}}/translation.json",
    },
  });

app.use(
  session({
    secret: SESSION_SECRET,
    resave: false,
    saveUninitialized: false,
    cookie: {
      maxAge: 10000 * 6,
    },
  }),
);

app.use(flash());
app.use((req, res, next) => {
  res.locals.validation_error = req.flash("validation_error");
  res.locals.success_message = req.flash("success_message");
  res.locals.password = req.flash("password");
  res.locals.repeatPassword = req.flash("repeatPassword");
  next();
});
app.set("views", path.join(__dirname, ".", "views"));
app.set("view engine", "ejs");

if (process.env.NODE_ENV === "production") {
  app.use(helmet());
  app.use(
    limitter({
      windowMs: 60 * 1000, // 1 minute
      limit: 90,
      legacyHeaders: false,
    }),
  );
}

const { loadSchemaSync } = require("@graphql-tools/load");
const { GraphQLFileLoader } = require("@graphql-tools/graphql-file-loader");
const { addResolversToSchema } = require("@graphql-tools/schema");

const resolvers = require("./graphql/resolvers/index");
const schema = loadSchemaSync(
  path.join(__dirname, "./graphql/schema.graphql"),
  { loaders: [new GraphQLFileLoader()] },
);

const schemaWithResolvers = addResolversToSchema({ schema, resolvers });

const pubsub = new PubSub();

let apolloServer = null;
async function startServer() {
  apolloServer = new ApolloServer({
    schema: schemaWithResolvers,
    context: async ({ req, res }) => {
      return {
        req,
        res,
        pubsub,
      };
    },
    introspection: process.env.NODE_ENV !== "production",
  });
  await apolloServer.start();
  apolloServer.applyMiddleware({ app });
}
startServer();

// Routes

const authRouter = require("./routes/authRouter");

app.use(
  process.env.NODE_ENV === "production" ? "/v1.0/auth" : "/api/v1.0/auth",
  authRouter,
);

app.get(
  process.env.NODE_ENV === "production" ? "/v1.0/hc" : "/api/v1.0/hc",
  (req, res) => {
    res.json({ hello: "world" });
  },
);
app.use(i18nextMiddleware.handle(i18next));

module.exports = { app, apolloServer };