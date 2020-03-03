FROM wordpress:latest

RUN apt-get update -y

COPY sources/ /var/www/html/wp-content/plugins/
