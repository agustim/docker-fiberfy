FROM node:argon


RUN useradd --user-group --create-home --shell /bin/false app &&\
  npm install --global npm

ENV HOME=/home/app

USER app

# Download sources 
RUN git clone https://github.com/agustim/fiberfy-server.git $HOME/fiberfy-server

# Workspace
WORKDIR $HOME/fiberfy-server

RUN npm install

# Build lib 
RUN npm run build 

EXPOSE 3000
CMD [ "npm", "start" ]

