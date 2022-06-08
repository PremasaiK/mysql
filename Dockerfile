FROM mysql
VOLUME /var/lib/mysql
EXPOSE 3306 33060

FROM wordpress
VOLUME /var/www/html
COPY --chown=www-data:www-data wp-config-docker.php /usr/src/wordpress/
EXPOSE 80
