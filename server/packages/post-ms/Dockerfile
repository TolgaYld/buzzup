FROM node:lts-alpine

WORKDIR /app

ARG NPM_TOKEN
ENV NPM_TOKEN=${NPM_TOKEN}

COPY package.json ./

RUN if [ -n "$NPM_TOKEN" ]; then echo "//npm.pkg.github.com/:_authToken=${NPM_TOKEN}" > .npmrc; fi && yarn install --production --frozen-lockfile --ignore-workspace-root-check

RUN if [ -n "$NPM_TOKEN" ]; then rm .npmrc; fi

COPY . .

EXPOSE 8004

CMD ["yarn", "start"]
