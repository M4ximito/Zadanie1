# Stage 1: Zbudowanie aplikacji
FROM node:14 AS build
WORKDIR /app
COPY src/package.json src/package-lock.json ./
RUN npm install
COPY src ./

# Stage 2: Tworzenie obrazu kontenera
FROM node:14-alpine
LABEL author="Maksim Maltsau"

# Kopiowanie zbudowanej aplikacji z poprzedniego etapu
COPY --from=build /app /app

# Ustaw katalog roboczy
WORKDIR /app

# Zainstalowanie wymagane zależności
RUN npm install

# Ustaw zmienne środowiskowe
ENV TZ=Europe/Warsaw

# Wystawienie portu
EXPOSE 3000

# Uruchomienie serwera
CMD ["node", "server.js"]
