FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install adminer -y
# RUN apt-get install php-fpm -y 
# COPY tools/script.sh .
# RUN chmod +x script.sh
# CMD ["./script.sh"]

WORKDIR /usr/share/adminer/
RUN mv adminer.php index.php
CMD ["php" ,"-S",  "0.0.0.0:1111"]