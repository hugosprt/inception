FROM debian:buster
RUN apt update -y
RUN apt upgrade -y
RUN apt-get -y install wget

RUN apt-get install -y php7.3 \
php-fpm \
php-mysql \
mariadb-client
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xvf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp-cli.phar

COPY /tools/auto_config.sh /tmp/auto_config.sh

RUN mkdir /run/php
ENTRYPOINT [ "sh", "/tmp/auto_config.sh" ]
