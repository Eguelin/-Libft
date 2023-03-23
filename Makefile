# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/17 15:15:24 by eguelin           #+#    #+#              #
#    Updated: 2023/03/23 13:53:15 by eguelin          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#Standard
OUT_DIR	= build/
SRC_DIR	= src/
INC_DIR	= include/
NAME	= libft.a
CC		= cc
CFLAGS	= -Wall -Werror -Wextra -I $(INC_DIR)
RM		= rm -rf
ARC		= ar rcs

#Colors
BLACK	= \033[0;30m
RED		= \033[0;31m
GREEN	= \033[0;32m
YELLOW	= \033[0;33m
BLUE	= \033[0;34m
PURPLE	= \033[0;35m
CYAN	= \033[0;36m
WHITE	= \033[0;37m

#Sentence
COMP_MSG		= "$(GREEN)Compilation $(NAME) $(WHITE)done on $(YELLOW)$(shell date +'%Y-%m-%d %H:%M:%S')$(WHITE)"
COMP_BNS_MSG	= "$(GREEN)Compilation of bonus files $(NAME) $(WHITE)done on $(YELLOW)$(shell date +'%Y-%m-%d %H:%M:%S')$(WHITE)"
CLEAN_MSG		= "$(RED)Cleaning $(NAME) $(WHITE)done on $(YELLOW)$(shell date +'%Y-%m-%d %H:%M:%S')$(WHITE)"
FULL_CLEAN_MSG	= "$(PURPLE)Full cleaning $(NAME) $(WHITE)done on $(YELLOW)$(shell date +'%Y-%m-%d %H:%M:%S')$(WHITE)"

#Sources
IS_DIR = is/
FILES_IS = ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c
FILES_ALL = $(addprefix $(IS_DIR), $(FILES_IS))

MEM_DIR = mem/
FILES_MEM = ft_memchr.c ft_memcmp.c ft_memcpy.c ft_memmove.c ft_memset.c
FILES_ALL += $(addprefix $(MEM_DIR), $(FILES_MEM))

OTHER_DIR = other/
FILES_OTHER = ft_atoi.c ft_bzero.c ft_calloc.c ft_itoa.c ft_split.c ft_tolower.c \
			ft_toupper.c
FILES_ALL += $(addprefix $(OTHER_DIR), $(FILES_OTHER))

PUT_DIR = put/
FILES_PUT = ft_putchar_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_putstr_fd.c
FILES_ALL += $(addprefix $(PUT_DIR), $(FILES_PUT))

STR_DIR = str/
FILES_STR = ft_strchr.c ft_strdup.c ft_striteri.c ft_strjoin.c ft_strlcat.c \
			ft_strlcpy.c ft_strlen.c ft_strmapi.c ft_strncmp.c ft_strnstr.c \
			ft_strrchr.c ft_strtrim.c ft_substr.c
FILES_ALL += $(addprefix $(STR_DIR), $(FILES_STR))

BNS_DIR = bonus/
FILES_BNS = ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c \
			ft_lstadd_back.c ft_lstdelone.c ft_lstclear.c ft_lstiter.c \
			ft_lstmap.c

INC_FILES	= libft.h

OBJS		= $(addprefix $(OUT_DIR), $(FILES_ALL:.c=.o))
OBJS_BNS	= $(addprefix $(OUT_DIR)$(BNS_DIR), $(FILES_BNS:.c=.o))
HEADERS		= $(addprefix $(INC_DIR), $(INC_FILES))

#Rules
all: $(NAME)

$(NAME): $(OUT_DIR) $(OBJS)
	$(ARC) $(NAME) $(OBJS)
	@echo $(COMP_MSG)
	@norminette | awk '$$NF!="OK!" {print "$(RED)" $$0 "$(WHITE)"}'

$(OUT_DIR)%.o : $(SRC_DIR)%.c $(HEADERS) Makefile
	$(CC) $(CFLAGS) -c $< -o $@

bonus: $(NAME) $(OBJS_BNS)
	$(ARC) $(NAME) $(OBJS_BNS)
	@echo $(COMP_BNS_MSG)

clean:
	$(RM) $(OUT_DIR)
	@echo $(CLEAN_MSG)

fclean: clean
	$(RM) $(NAME)
	@echo $(FULL_CLEAN_MSG)

re: fclean all

$(OUT_DIR):
	mkdir -p $(shell find $(SRC_DIR) -type d | awk -F "$(SRC_DIR)" '$$NF!="$(SRC_DIR)" {print "$(OUT_DIR)"$$(NF)}')

.PHONY: all bonus clean fclean re
#.SILENT:
