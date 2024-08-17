FROM node:lts-alpine

# Installiere Yarn
RUN apk add --no-cache yarn

WORKDIR /app

ARG NPM_TOKEN
ENV NPM_TOKEN=${NPM_TOKEN}

# Kopiere die package.json des Core
COPY package.json ./

# Erstelle die .npmrc-Datei mit dem NPM-Token und installiere die Produktionsabhängigkeiten
RUN echo "//npm.pkg.github.com/:_authToken=${NPM_TOKEN}" > .npmrc && yarn install --production --frozen-lockfile --ignore-workspace-root-check

# Kopiere den restlichen Code des Core
COPY . .

EXPOSE 8000

# Verwende Yarn, um den Core zu starten (falls der Core eine Startdatei hat)
CMD ["yarn", "start"]
