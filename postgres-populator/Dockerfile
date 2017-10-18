FROM ubuntu

# Dockerfile author / maintainer 
MAINTAINER Name alvsanand@gmail.com

# Update application repository list and install the Redis server. 
RUN apt-get update && apt-get install -y postgresql-client

COPY commands.sql /tmp/

ENV PGPASSWORD "POSTGRES_IN_KUBERNETES"

# Set the default command
ENTRYPOINT ["/usr/bin/psql"]
CMD ["-h", "postgres-service.default", "-p", "15432", "-U", "postgres", "-d", "postgres", "-a", "-f", "/tmp/commands.sql"]