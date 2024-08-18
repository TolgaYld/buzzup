# Build-Stage
FROM node:lts-alpine as build-stage

WORKDIR /app

ARG GITHUB_TOKEN

COPY ../../package.json ./
COPY ../../.yarnrc.yml ./

RUN yarn install --production --frozen-lockfile --ignore-workspace-root-check

COPY ./package.json ./

RUN yarn install --production --frozen-lockfile --ignore-workspace-root-check

FROM node:lts-alpine

WORKDIR /app

COPY --from=build-stage /app /app

COPY . .

EXPOSE 8005

CMD ["yarn", "start"]
