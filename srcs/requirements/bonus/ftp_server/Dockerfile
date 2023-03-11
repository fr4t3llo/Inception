FROM debian:buster

RUN apt-get update && apt-get upgrade 

RUN apt install vsftpd -y 

COPY tools/script.sh .

RUN chmod +x ./script.sh

CMD ["./script.sh"]