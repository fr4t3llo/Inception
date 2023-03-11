FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y 

COPY tools/script.sh .

# COPY ./requirements/mariadb/tools/script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]
