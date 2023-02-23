#base operaating sysetem b7al docker pull 
FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install nginx -y && apt-get -y install openssl

COPY index.html /var/www/html

CMD ["nginx", "-g", "daemon off;"]