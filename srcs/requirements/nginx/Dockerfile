FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install nginx -y && apt-get -y install openssl

COPY index.html /var/www/html

RUN rm -rf /etc/nginx/sites-available/*

COPY conf/default /etc/nginx/sites-available

COPY tools/script.sh etc/nginx

RUN chmod +x etc/nginx/script.sh

RUN ./etc/nginx/script.sh

CMD ["nginx", "-g", "daemon off;"]