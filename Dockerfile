# Use an official NodeJs runtime as a parent image
FROM node:14-alpine AS build 

#Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# build the application
RUN npm run build

# Use an official Nginx image to server the build
FROM nginx:alpine

# Copy the build output to the Nginx HTML directory

COPY --from=build /app/build /usr/share/nginx/HTML

# Expost the port 80
EXPOSE 80


# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]