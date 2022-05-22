FROM node:14-buster-slim as BUILD

WORKDIR /app
COPY ./package*.json /app/
RUN npm i
COPY ./* /app/
RUN npm run build
RUN npm prune

FROM node:14-buster-slim as PRODUCT

WORKDIR /app
COPY --from=BUILD /app/node_modules /app/node_modules
COPY --from=BUILD /app/dist /app/dist

CMD ["node", "dist/hello-world.js"]
