# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: skasmi <skasmi@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/27 17:23:32 by skasmi            #+#    #+#              #
#    Updated: 2023/03/07 18:15:43 by skasmi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


.PHONEY : up down re fclean

up:
	cd srcs && docker-compose up -d --build

down:
	cd srcs && docker-compose down

re:
	cd srcs && docker-compose down
	cd srcs && docker-compose up -d --build

fclean:
	docker system prune --all --force