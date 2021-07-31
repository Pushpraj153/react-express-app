#Get the base node image
FROM node

#build frontend
RUN mkdir -p /app/client
WORKDIR /app/client/
COPY ["client/package.json", "client/package-lock.json", "./"]

# Install frontend dependencies
RUN npm install

#build backend
WORKDIR /app
COPY ["package.json", "package-lock.json", "./"]

# Install backend dependencies
RUN npm install

# Copy everything from current local directory to working directory of image
COPY . .

# Expose port 3000
EXPOSE 3000

# Command to start the application
CMD ["npm", "start"]
