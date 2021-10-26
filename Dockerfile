# syntax=docker/dockerfile:1

FROM node:16-slim
WORKDIR /app
COPY package*.json ./
RUN npm install

COPY index.js ./

EXPOSE ${APP_INTERNAL_PORT}
CMD ["node","index"]
