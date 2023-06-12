# Stage 1: Установка зависимостей и сборка приложения
FROM node:14 AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Запуск приложения в контейнере
FROM node:14-alpine
WORKDIR /app
COPY --from=build /app/package.json /app/package-lock.json ./
RUN npm install --only=production
COPY --from=build /app/dist ./dist

# Запуск сервера
CMD ["node", "dist/server.js"]
