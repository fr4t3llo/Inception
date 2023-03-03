FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install curl -y

RUN apt-get install -y php-fpm php-mysql

COPY ./requirements/wordpress/tools/script.sh  .

RUN ["./script.sh"]