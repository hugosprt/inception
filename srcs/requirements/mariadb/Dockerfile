FROM debian:buster
RUN apt update -y
RUN apt upgrade -y

RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/db_creation.sh /tmp/db_creation.sh

ENTRYPOINT [ "sh", "/tmp/db_creation.sh" ]
