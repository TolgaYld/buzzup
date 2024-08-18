# Build-Stage
FROM node:lts-alpine as build-stage

WORKDIR /app

ARG GITHUB_TOKEN

# Kopiere die zentrale package.json und yarn.lock aus dem Root des Workspaces
COPY ../../package.json ./
COPY ../../.yarnrc.yml ./

# Installiere die globalen Abhängigkeiten
RUN yarn install --production --frozen-lockfile --ignore-workspace-root-check

# Kopiere die spezifische package.json des auth-ms Projekts
COPY ./package.json ./

# Installiere die projektspezifischen Abhängigkeiten
RUN yarn install --production --frozen-lockfile --ignore-workspace-root-check

# Production-Stage
FROM node:lts-alpine

WORKDIR /app

# Kopiere das Ergebnis aus der Build-Stage in das aktuelle Image
COPY --from=build-stage /app /app

# Kopiere den restlichen Quellcode des auth-ms Projekts
COPY . .

EXPOSE 8001

CMD ["yarn", "start"]
