# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: skasmi <skasmi@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/27 17:23:32 by skasmi            #+#    #+#              #
#    Updated: 2023/03/03 16:34:20 by skasmi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


.PHONEY : up down re

up:
	cd srcs && docker-compose up -d --build

down:
	cd srcs && docker-compose down

re:
	cd srcs && docker-compose down
	cd srcs && docker-compose up -d --build