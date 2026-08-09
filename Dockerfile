FROM node:18-alpine

WORKDIR /usr/app

COPY package.json ./

RUN npm install

COPY . .

ARG MONGODB_URI
ARG JWT_SECRET

ENV MONGODB_URI=$MONGODB_URI
ENV JWT_SECRET=$JWT_SECRET

RUN echo "MONGODB_URI=${MONGODB_URI}" > .env
RUN echo "JWT_SECRET=${JWT_SECRET}" > .env

RUN npm i -g pnpm

RUN pnpm build

EXPOSE 3010

CMD ["node", "dist/main.js"]