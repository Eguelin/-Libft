# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/17 15:15:24 by eguelin           #+#    #+#              #
#    Updated: 2023/02/12 15:29:14 by eguelin          ###   ########lyon.fr    #
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
FILES_IS = ft_isalnum ft_isalpha ft_isascii ft_isdigit ft_isprint
FILES_ALL = $(addprefix $(IS_DIR), $(FILES_IS))

MEM_DIR = mem/
FILES_MEM = ft_memchr ft_memcmp ft_memcpy ft_memmove ft_memset
FILES_ALL += $(addprefix $(MEM_DIR), $(FILES_MEM))

OTHER_DIR = other/
FILES_OTHER = ft_atoi ft_bzero ft_calloc ft_itoa ft_split ft_tolower \
			ft_toupper
FILES_ALL += $(addprefix $(OTHER_DIR), $(FILES_OTHER))

PUT_DIR = put/
FILES_PUT = ft_putchar_fd ft_putendl_fd ft_putnbr_fd ft_putstr_fd
FILES_PUT = $(addprefix $(PUT_DIR), $(FILES_PUT))

STR_DIR = str/
FILES_STR = ft_strchr ft_strdup ft_striteri ft_strjoin ft_strlcat \
			ft_strlcpy ft_strlen ft_strmapi ft_strncmp ft_strnstr \
			ft_strrchr ft_strtrim ft_substr
FILES_ALL += $(addprefix $(STR_DIR), $(FILES_STR))

BNS_DIR = lst/
FILES_BNS = ft_lstnew ft_lstadd_front ft_lstsize ft_lstlast \
			ft_lstadd_back ft_lstdelone ft_lstclear ft_lstiter \
			ft_lstmap

INC_FILES	= libft

OBJS		= $(addprefix $(OUT_DIR), $(addsuffix .o, $(FILES_ALL)))
OBJS_BNS	= $(addprefix $(OUT_DIR)$(BNS_DIR), $(addsuffix .o, $(FILES_BNS)))
HEADERS		= $(addprefix $(INC_DIR), $(addsuffix .h, $(INC_FILES)))

#Rules
.PHONY: all
all: $(NAME)

$(NAME): $(OUT_DIR) $(OBJS)
	@norminette | awk '$$NF!="OK!" {print "\033[0;31m" $$0 "\033[0m"}'
	@$(ARC) $(NAME) $(OBJS)
	@echo $(COMP_MSG)

$(OUT_DIR)%.o : $(SRC_DIR)%.c $(HEADERS) Makefile
	@$(CC) $(CFLAGS) -c $< -o $@

.PHONY: bonus
bonus: $(NAME) $(OBJS_BNS)
	@$(ARC) $(NAME) $(OBJS_BNS)
	@echo $(COMP_BNS_MSG)

.PHONY: clean
clean:
	@$(RM) $(OUT_DIR)
	@echo $(CLEAN_MSG)

.PHONY: fclean
fclean: clean
	@$(RM) $(NAME)
	@echo $(FULL_CLEAN_MSG)

.PHONY: re
re: fclean all

$(OUT_DIR):
	@mkdir -p $(OUT_DIR)
	@mkdir -p $(OUT_DIR)$(BNS_DIR)
	@mkdir -p $(OUT_DIR)$(IS_DIR)
	@mkdir -p $(OUT_DIR)$(LST_DIR)
	@mkdir -p $(OUT_DIR)$(MEM_DIR)
	@mkdir -p $(OUT_DIR)$(OTHER_DIR)
	@mkdir -p $(OUT_DIR)$(PUT_DIR)
	@mkdir -p $(OUT_DIR)$(STR_DIR)
