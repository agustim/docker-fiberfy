FROM node:argon

# Create app directory
RUN mkdir -p /usr/src

# Download sources 
RUN git clone https://github.com/agustim/fiberfy-server.git /usr/src/app

# Workspace
WORKDIR /usr/src/app

# Install dependencies
RUN npm install --unsafe-perm

# Build lib 
RUN npm run build 

EXPOSE 3000
CMD [ "npm", "start" ]

