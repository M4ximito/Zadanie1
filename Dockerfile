# Stage 1: Build the application
FROM node:14 AS build
WORKDIR /app
COPY src/package.json src/package-lock.json ./
RUN npm install
COPY src ./

# Stage 2: Create the container image
FROM node:14-alpine
LABEL author="Maksim Maltsau"

# Copy the built application from the previous stage
COPY --from=build /app /app

# Set the working directory
WORKDIR /app

# Install the required dependencies
RUN npm install

# Set the environment variables
ENV TZ=Europe/Warsaw

# Expose the port
EXPOSE 3000

# Start the server
CMD ["node", "server.js"]
