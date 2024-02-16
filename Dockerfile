# Base image
FROM node:20-slim

LABEL authors="Tahar"

# Create app directory
WORKDIR /usr/src/app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./
# Bundle app source
COPY ./dist ./dist

# Install app dependencies
RUN npm install  --omit=dev

# Expose the port on which the app will run
EXPOSE 3000

# Start the server using the production build
CMD ["npm", "run", "start:prod"]