FROM mysql
VOLUME /var/lib/mysql
EXPOSE 3306 33060

FROM wordpress
VOLUME /var/www/html
EXPOSE 80
