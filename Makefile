##
## Makefile for  in /repo/Epitech/Empty_Project
## 
## Made by Nathan Poirier
## Login   <poirie_n@epitech.net>
## 
## Started on  Tue Feb 10 16:21:13 2015 Nathan Poirier
## Last update Wed Apr 15 19:22:38 2015 Onillon Lucas
##

SRCS		= btree_move.c		\
		  btree_init.c		\
		  btree_reset.c		\
		  btree_get.c		\
		  btree_node_add.c	\
		  btree_exec.c		\
		  main.c

OBJS		= $(addprefix src/, $(SRCS:.c=.o))

NAME		= Btree

RM		= rm -f

CC		= gcc -g3 # WARNING -g3 #

LIBS		=

CFLAGS		= -W -Wall -Wextra -Werror
CFLAGS		+= -Wno-variadic-macros -Wno-unused-parameter
CFLAGS		+= -pedantic -ansi
CFLAGS		+= -Ofast
CFLAGS		+= -Iinclude/
CFLAGS		+= $(LIBS)

LDFLAGS		= $(LIBS)

LIB_MYUTILS	= lib/C_Lib_MyUtils/libmyutils.a
LIB_MYUTILS_MK	= make -C lib/C_Lib_MyUtils/

$(NAME):	$(OBJS)
		$(CC) $(OBJS) -o $(NAME) $(LDFLAGS)

all:		$(NAME)

clean:
		$(RM) $(OBJS)

fclean:		clean
		$(RM) $(NAME)

re:		fclean all

.PHONY: re fclean clean all
