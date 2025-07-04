# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nobu <nobu@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/07/05 01:36:01 by nobu              #+#    #+#              #
#    Updated: 2025/07/05 01:36:04 by nobu             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	libftprintf.a

SRC	=	ft_printf.c			\
		ft_putchar_p.c		\
		ft_putstr_p.c		\
		ft_putnbr_p.c		\
		ft_putptr_p.c		\
		ft_putnbr_hex_lw.c		\
		ft_putnbr_hex_up.c		\


OBJS = $(SRC:.c=.o)

CC = gcc
CFLAGS = -Wall -Werror -Wextra
RM = rm -rf
AR = ar crs

$(NAME): $(OBJS)
	$(AR) $(NAME) $(OBJS)

all: $(NAME)

clean:
	$(RM) $(OBJS)

fclean:	clean
	$(RM) $(NAME)		

re:	fclean all

.PHONY:	all clean fclean re