FROM debian:buster

RUN apt-get update
RUN apt-get install curl \
    php7.3 \
    php7.3-fpm \
    php7.3-cli \
    php-mysql \
    mariadb-client -y

RUN mkdir -p /run/php/
RUN chmod 777 /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp
RUN mkdir -p /var/www/wordpress

COPY ./conf/wp-config.php /var/www/wordpress/wp-config.php
RUN chmod -R 777 /var/www/wordpress/wp-config.php
RUN chown -R www-data:www-data /var/www/wordpress/wp-config.php

COPY ./tools/auto-config.sh /auto-config.sh

ENTRYPOINT ["bash", "auto-config.sh"]
