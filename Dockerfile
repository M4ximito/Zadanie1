# Используем базовый образ Node.js
FROM node:14-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package.json package-lock.json ./

# Устанавливаем зависимости
RUN npm install --production

# Копируем остальные файлы
COPY . .

# Указываем порт
EXPOSE 3000

# Запускаем сервер
CMD ["node", "server.js"]
