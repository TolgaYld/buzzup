# Build-Stage
FROM node:lts-alpine as build-stage

WORKDIR /app

ARG GITHUB_TOKEN

RUN npm install -g corepack
RUN corepack enable
RUN corepack prepare yarn@stable --activate  # Installiert die neueste stabile Version von Yarn

COPY ../../package.json ./
COPY ../../.yarnrc.yml ./

RUN yarn install --frozen-lockfile --ignore-workspace-root-check

COPY ./package.json ./

RUN yarn install --frozen-lockfile --ignore-workspace-root-check

FROM node:lts-alpine

WORKDIR /app

COPY --from=build-stage /app /app

COPY . .

EXPOSE 8004

CMD ["yarn", "start"]
