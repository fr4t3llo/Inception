FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y 

COPY tools/script.sh .
# COPY ./requirements/mariadb/tools/script.sh .

# RUN chown -R mysql:mysql /var/lib/mysql
# RUN chmod -R 0700 /var/lib/mysql
RUN chmod +x script.sh

CMD ["./script.sh"]
