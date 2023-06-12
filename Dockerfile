FROM node:14-alpine

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci --only=production

COPY ./src ./src

EXPOSE 3000

CMD ["node", "src/server.js"]