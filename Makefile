# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: skasmi <skasmi@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/27 17:23:32 by skasmi            #+#    #+#              #
#    Updated: 2023/03/02 19:41:57 by skasmi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


.PHONEY : up down restart

up:
	cd srcs && docker-compose up -d

down:
	cd srcs && docker-compose down

restart:
	cd srcs && docker-compose down
	cd srcs && docker-compose up -d