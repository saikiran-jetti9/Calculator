# stage1 as builder
FROM node:18.16-alpine as builder

ARG ENV

# Set working directory
WORKDIR /.


# install node modules and build assets
COPY package*.json .

RUN npm install
# Copy all files from current directory to working dir in image
COPY . .



# env can have values 'dev' or 'prod'
RUN npm run build

EXPOSE 3000 80

# Containers run nginx with global directives and daemon off
# ENTRYPOINT [ "npm" , "start:${ENV}" ] 
CMD npm run start