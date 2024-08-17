const redis = require("redis");
const { log, REDISURL, REDISPASSWORD } = require("core-buzzup")

const client = redis.createClient({
    url: REDISURL,
    password: REDISPASSWORD,
});

client.connect();

client.on("connect", () => {
    log("Redis client successfully connected");
});

client.on("error", (err) => {
    log("Redis client could not connect to the redis server: " + err);
});

module.exports = client;
