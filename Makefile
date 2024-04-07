# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/17 15:15:24 by eguelin           #+#    #+#              #
#    Updated: 2024/04/07 15:26:36 by eguelin          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY: all bonus clean fclean re
.SILENT:

# **************************************************************************** #
#                                   Variable                                   #
# **************************************************************************** #

NAME	= libft.a
OBJ_DIR	= build/
SRC_DIR	= src/
INC_DIR	= include/
CC		= gcc
CFLAGS	= -Wall -Werror -Wextra -MMD
INC		= -I $(INC_DIR)
RM		= rm -fr
ARC		= ar rcs

# **************************************************************************** #
#                                    Colors                                    #
# **************************************************************************** #

BLACK	= \033[30m
RED		= \033[31m
GREEN	= \033[32m
YELLOW	= \033[33m
BLUE	= \033[34m
PURPLE	= \033[35m
CYAN	= \033[36m
WHITE	= \033[37m
DEFAULT	= \033[0m

# **************************************************************************** #
#                                    Message                                   #
# **************************************************************************** #

COMP_MSG		= "$(GREEN)Compilation $(NAME) $(DEFAULT)done on $(YELLOW)$(shell date +'%Y-%m-%d %H:%M:%S')$(DEFAULT)"
COMP_BNS_MSG	= "$(GREEN)Compilation of bonus files $(NAME) $(DEFAULT)done on $(YELLOW)$(shell date +'%Y-%m-%d %H:%M:%S')$(DEFAULT)"
CLEAN_MSG		= "$(RED)Cleaning $(NAME) $(DEFAULT)done on $(YELLOW)$(shell date +'%Y-%m-%d %H:%M:%S')$(DEFAULT)"
FULL_CLEAN_MSG	= "$(PURPLE)Full cleaning $(NAME) $(DEFAULT)done on $(YELLOW)$(shell date +'%Y-%m-%d %H:%M:%S')$(DEFAULT)"


# **************************************************************************** #
#                                    Sources                                   #
# **************************************************************************** #

CHAR_DIR	= character/
FILES_IS	= ft_isalnum.c \
			  ft_isalpha.c \
			  ft_isascii.c \
			  ft_isdigit.c \
			  ft_isprint.c \
			  ft_tolower.c \
			  ft_toupper.c

FILES_ALL	= $(addprefix $(CHAR_DIR), $(FILES_CHAR))

MEM_DIR		= memory/
FILES_MEM	= ft_bzero.c \
			  ft_calloc.c \
			  ft_memchr.c \
			  ft_memcmp.c \
			  ft_memcpy.c \
			  ft_memmove.c \
			  ft_memset.c

FILES_ALL	+= $(addprefix $(MEM_DIR), $(FILES_MEM))

OTHER_DIR	= other/
FILES_OTHER	= ft_atoi.c \
			  ft_itoa.c \
			  ft_split.c

FILES_ALL	+= $(addprefix $(OTHER_DIR), $(FILES_OTHER))

PUT_DIR		= output/
FILES_PUT	= ft_putchar_fd.c \
			  ft_putendl_fd.c \
			  ft_putnbr_fd.c \
			  ft_putstr_fd.c

FILES_ALL	+= $(addprefix $(PUT_DIR), $(FILES_PUT))

STR_DIR		= string/
FILES_STR	= ft_strchr.c \
			  ft_strdup.c \
			  ft_striteri.c \
			  ft_strjoin.c \
			  ft_strlcat.c \
			  ft_strlcpy.c \
			  ft_strlen.c \
			  ft_strmapi.c \
			  ft_strncmp.c \
			  ft_strnstr.c \
			  ft_strrchr.c \
			  ft_strtrim.c \
			  ft_substr.c

FILES_ALL	+= $(addprefix $(STR_DIR), $(FILES_STR))

BNS_DIR		= bonus/
FILES_BNS	= ft_lstadd_back.c \
			  ft_lstadd_front.c \
			  ft_lstclear.c \
			  ft_lstdelone.c \
			  ft_lstiter.c \
			  ft_lstlast.c \
			  ft_lstmap.c \
			  ft_lstnew.c \
			  ft_lstsize.c

OBJ			= $(addprefix $(OBJ_DIR), $(FILES_ALL:.c=.o))
OBJ_BNS		= $(addprefix $(OBJ_DIR)$(BNS_DIR), $(FILES_BNS:.c=.o))

ALL_OBJ_DIR	= $(sort $(dir $(OBJ)))
ALL_OBJ_DIR_BNS	= $(sort $(dir $(OBJ_BNS)))

# **************************************************************************** #
#                                     Rules                                    #
# **************************************************************************** #

all: $(NAME)

$(NAME): $(OBJ)
	$(ARC) $(NAME) $(OBJ)
	@echo $(COMP_MSG)
	@norminette | awk '$$NF!="OK!" {print "$(RED)" $$0 "$(WHITE)"}'

$(OBJ_DIR)%.o : $(SRC_DIR)%.c | $(ALL_OBJ_DIR)
	$(CC) $(CFLAGS) $(INC) -c $< -o $@

bonus: $(ALL_OBJ_DIR_BNS) all $(OBJ_BNS)
	$(ARC) $(NAME) $(OBJ_BNS)
	@echo $(COMP_BNS_MSG)

clean:
	$(RM) $(OBJ_DIR)
	@echo $(CLEAN_MSG)

fclean: clean
	$(RM) $(NAME)
	@echo $(FULL_CLEAN_MSG)

re: fclean all

$(ALL_OBJ_DIR):
	mkdir -p $@

$(ALL_OBJ_DIR_BNS):
	mkdir -p $@

-include $(OBJ:.o=.d) $(OBJ_BNS:.o=.d)
