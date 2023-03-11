FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx

COPY tools/default /etc/nginx/sites-available

COPY tools/index.html /var/www/html

CMD ["nginx", "-g", "daemon off;"]