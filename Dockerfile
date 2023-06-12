# Stage 1: Установка зависимостей и сборка приложения
FROM node:14 AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY src ./src
RUN npm run build

# Stage 2: Запуск приложения в контейнере
FROM node:14-alpine
WORKDIR /app
COPY --from=build /app/package.json /app/package-lock.json ./
RUN npm install --only=production
COPY --from=build /app/src ./src
COPY --from=build /app/node_modules ./node_modules

# Запуск сервера
CMD ["node", "src/server.js"]
