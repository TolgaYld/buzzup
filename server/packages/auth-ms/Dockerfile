FROM node:lts-alpine

# Installiere Yarn
RUN apk add --no-cache yarn

# Setze das Arbeitsverzeichnis auf den Microservice-Ordner
WORKDIR /app

# Kopiere die zentrale package.json und yarn.lock aus dem Root des Workspaces
COPY ../../package.json ../../yarn.lock ./

# Installiere globale Abhängigkeiten
RUN yarn install --production --frozen-lockfile --ignore-workspace-root-check

# Kopiere die spezifische package.json des Microservices und den gesamten Code
COPY ./package.json ./
COPY . .

# Installiere spezifische Abhängigkeiten für den Microservice
RUN yarn install --production --frozen-lockfile

EXPOSE 8001

# Starte den Service
CMD ["yarn", "start"]