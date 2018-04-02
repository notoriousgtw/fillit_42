# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gwood <gwood@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/13 13:41:04 by gwood             #+#    #+#              #
#    Updated: 2018/04/02 23:06:22 by mtajjiou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fillit
FUNCTS = fillit error checker
RM = /bin/rm -f
CFILES = $(patsubst %, %.c, $(FUNCTS))
OBJECTS = $(patsubst %, %.o, $(FUNCTS))
FLAGS = -Wall -Wextra -Werror

.PHONY = all clean fclean

FT_DIR = ./libft
FT_LIB = $(addprefix $(FT_DIR), /libft.a)
FT_INC = -I ./libft
FT_LNK = -L ./libft -l ft

all: $(NAME)

$(NAME): $(OBJECTS)
	gcc $(FLAGS) $(FT_LNK) $(OBJECTS) -o $(NAME)

$(OBJECTS):
	gcc $(FLAGS) -c $(CFILES)

lib:
	make -C $(FT_DIR) re

clean:
	$(RM) $(OBJECTS)

fclean: clean
	$(RM) $(NAME)

re: fclean all
