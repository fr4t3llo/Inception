FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install curl -y

RUN apt-get install -y php-fpm php-mysql

COPY tools/script.sh  .

RUN chmod +x script.sh

CMD ["./script.sh"]