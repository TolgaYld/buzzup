if (process.env.NODE_ENV === "test") {
  require("dotenv").config({ path: `.env.${process.env.NODE_ENV}` });
}
const express = require("express");
const path = require("path");
const i18next = require("i18next");
const Backend = require("i18next-fs-backend");
const i18nextMiddleware = require("i18next-http-middleware");

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

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Routes

const postRouter = require("./routes/postRouter");

// Use routes

app.use("/", postRouter);

app.get("/hc", (req, res) => {
  res.json({ hello: "world" });
});

app.use(i18nextMiddleware.handle(i18next));

// Run the server!

module.exports = app;
