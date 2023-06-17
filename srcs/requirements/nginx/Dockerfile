FROM debian:buster
RUN apt update
RUN apt install nginx -y
RUN apt install vim -y
RUN apt install curl -y
RUN apt install openssl -y
RUN mkdir -p /etc/nginx/ssl
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN	openssl req \
	-newkey rsa:4096 -nodes \
	-keyout /etc/ssl/private/inception.key \
	-x509 -days 365 \
	-out /etc/ssl/certs/inception.crt \
	-subj "/C=FR/ST=IDF/L=Paris/O=./OU=./CN=localhost/UID=hspriet"
RUN mkdir -p /var/run/nginx
RUN chmod 755 /var/www/
RUN chown -R www-data:www-data /var/www/
CMD ["nginx", "-g", "daemon off;"]