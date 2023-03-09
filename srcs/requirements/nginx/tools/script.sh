#!/bin/bash
yes "" | openssl req -newkey rsa:2048 -nodes -keyout /etc/nginx/skasmi.42.fr.key -x509 -days 365 -out /etc/nginx/skasmi.42.fr.crt