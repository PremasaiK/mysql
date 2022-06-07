FROM mysql

EXPOSE 3306

FROM wordpress
ENV WORDPRESS_DB_HOST=wordpress-mysql \
    WORDPRESS_DB_NAME=wpsite \
    WORDPRESS_TABLE_PREFIX=wp_

COPY plugins/ /var/www/html/wp-content/plugins
COPY themes/ /var/www/html/wp-content/themes
COPY uploads/ /var/www/html/wp-content/uploads
