#base operaating sysetem b7al docker pull 
FROM debian:buster

# copy files in directory
COPY ./tools/script.sh /etc/nginx/

RUN apt-get update && apt-get upgrade -y && apt-get install nginx -y && apt-get -y install openssl

RUN chmod +x /etc/nginx/script.sh

RUN ./etc/nginx/script.sh
# cmd to execute 

CMD ["nginx", "-g", "daemon off;"]