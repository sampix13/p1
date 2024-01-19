# Use the node:10-alpine image as a base
FROM node:10-alpine

# Create a directory for the app and its node_modules with node as its owner
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

# Set the working directory
WORKDIR /home/node/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Switch to the node user
USER node`

# Install all packages in package.json
RUN npm install

# Expose port 8080 (matching the port used in the Docker Compose file)
EXPOSE 8080

# Copy the rest of your app's source code from your host to your image filesystem
COPY --chown=node:node . .

# Run the app on port 8080
CMD node app.js