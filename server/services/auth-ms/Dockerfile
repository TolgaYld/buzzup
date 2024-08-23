# Build-Stage
FROM node:lts-alpine as build-stage

WORKDIR /app

ARG GITHUB_TOKEN

COPY ../../package.json ./
COPY ../../yarn.lock ./

COPY ./package.json ./packages/auth-ms/package.json

RUN yarn install --pure-lockfile --ignore-scripts --production

COPY . .

RUN rm -rf ./node_modules

RUN yarn workspace auth-ms add bcrypt --build-from-source -W

# Production-Stage
FROM node:lts-alpine

WORKDIR /app

COPY --from=build-stage /app /app

EXPOSE 8001

CMD ["yarn", "workspace", "auth-ms", "start"]