
   FROM mysql:5.7
   VOLUME /var/lib/mysql
   ENV MYSQL_ROOT_PASSWORD=somewordpress \
       MYSQL_DATABASE=wordpress \
       MYSQL_USER=wordpress \
       MYSQL_PASSWORD=wordpress
   EXPOSE 3306 
   FROM  wordpress:latest
   VOLUME /var/www/html
   ENV WORDPRESS_DB_HOST=db \
       WORDPRESS_DB_USER=wordpress \
       WORDPRESS_DB_PASSWORD=wordpress \
       WORDPRESS_DB_NAME=wordpress
   EXPOSE 80
