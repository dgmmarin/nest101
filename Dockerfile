# Use the official Node.js image as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json into the container
COPY package*.json ./

# Install npm dependencies
RUN npm install

# Install NestJS CLI globally
RUN npm install -g @nestjs/cli

# Debug: Check versions of npm, node, and nest
RUN node -v
RUN npm -v
RUN nest --version  # Ensure nest is installed

# Copy the rest of the application code into the container
COPY . .

# Expose the application port
EXPOSE 3000

# Run the application (development mode)
CMD ["npx", "nest", "start", "--watch"]
