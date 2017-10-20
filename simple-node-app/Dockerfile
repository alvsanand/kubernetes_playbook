FROM node:8

LABEL maintainer="alvsanand@gmail.com"

WORKDIR /usr/src/app

COPY files/package.json .

RUN npm install

COPY files/*.js ./
COPY files/views/*.ejs ./views/

ENV MONGO_HOSTNAME "mongodb-service.default"
ENV MONGO_PORT "27017"
ENV MONGO_DB "test"
ENV MONGO_URI "mongodb://${MONGO_HOSTNAME}:${MONGO_PORT}/${MONGO_DB}"
ENV MONGO_USER "admin"
ENV MONGO_PASSWORD "admin"

EXPOSE 8080
CMD [ "npm", "start" ]