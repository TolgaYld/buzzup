FROM node:lts-alpine

WORKDIR /app

# Kopiere die `package.json` und `yarn.lock` aus dem `server`-Verzeichnis, um alle Abhängigkeiten des Workspaces zu berücksichtigen.
COPY ../../package.json  ./

# Kopiere die spezifische `package.json` und `yarn.lock` von `auth-ms`, um sicherzustellen, dass die spezifischen Abhängigkeiten korrekt installiert werden.
COPY ./package.json ./

# Installiere die Abhängigkeiten. 
# `--ignore-workspace-root-check` ignoriert die Warnung über das Root-Verzeichnis eines Workspaces.
RUN echo "//npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}" > .npmrc && yarn install --production --frozen-lockfile --ignore-workspace-root-check

# Entferne die `.npmrc`-Datei aus Sicherheitsgründen.
RUN rm .npmrc

COPY . .

EXPOSE 8001

CMD ["yarn", "start"]
