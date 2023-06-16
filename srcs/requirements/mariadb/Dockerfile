FROM debian:buster
RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server mariadb-client -y
COPY ./conf/mycnf.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/create_db.sh /create_db.sh
ENTRYPOINT ["bash" , "create_db.sh"]