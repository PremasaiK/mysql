FROM mysql

EXPOSE 3306

FROM wordpress

COPY plugins/ /var/www/html/wp-content/plugins
COPY themes/ /var/www/html/wp-content/themes
COPY uploads/ /var/www/html/wp-content/uploads
