FROM ubuntu

LABEL maintainer="alvsanand@gmail.com"

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6 \
    && echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list

RUN apt-get update \
	&& apt-get install -y mongodb-org

COPY files/commands.js /tmp/

ENV MONGO_HOSTNAME "mongodb-service.default"
ENV MONGO_PORT "27017"
ENV MONGO_DB "test"
ENV MONGO_URI "${MONGO_HOSTNAME}:${MONGO_PORT}/${MONGO_DB}"
ENV MONGO_USER "admin"
ENV MONGO_PASSWORD "admin"

CMD "/usr/bin/mongo" "-u" "$MONGO_USER" "-p" "$MONGO_PASSWORD" "$MONGO_URI" "/tmp/commands.js"