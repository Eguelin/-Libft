# LIBFT


<!-- ABOUT THE PROJECT -->
## About The Project

This project is the first project of the 42 cursus.
The goal is to recreate some of the functions of the standard C library.
The functions are divided in several categories:
<ul>
	<li><a href="#character-functions">Character functions</a></li>
	<li><a href="#memory-functions">Memory functions</a></li>
	<li><a href="#output-functions">Output functions</a></li>
	<li><a href="#string-functions">String functions</a></li>
	<li><a href="#other-functions">Other functions</a></li>
	<li><a href="#bonus-functions--list-functions">Bonus functions / List functions</a></li>
</ul>
The project is a good way to learn how to use pointers and memory allocation in C.


<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

You need to have the gcc compiler installed on your computer. If you don't have it, you can install it with the following command deb-based systems:
	```sh
	sudo apt-get install gcc
	```
or arch-based systems:
	```sh
	sudo pacman -S gcc
	```
or rpm-based systems:
	```sh
	sudo yum install gcc
	```
or macos:
	```sh
	brew install gcc
	```

### Installation

1. Clone the repo
	```sh
	git clone https://github.com/Eguelin/Libft.git
	```

### Compilation

2. Compile the library
	```sh
	make
	```

3. Use the library in your project
	```c
	#include "libft.h"
	```

4. Compile your project with the library
	```sh
	gcc -o my_project my_project.c libft.a
	```

5. Run your project
	```sh
	./my_project
	```


<!-- FUNCTIONS -->
## Functions

### Character functions
* ft_isalnum: ```int	ft_isalnum(int c);```
* ft_isalpha: ```int	ft_isalpha(int c);```
* ft_isascii: ```int	ft_isascii(int c);```
* ft_isdigit: ```int	ft_isdigit(int c);```
* ft_isprint: ```int	ft_isprint(int c);```
* ft_tolower: ```int	ft_tolower(int c);```
* ft_toupper: ```int	ft_toupper(int c);```

### Memory functions
* ft_bzero: ```void	ft_bzero(void *s, size_t n);```
* ft_calloc: ```void	*ft_calloc(size_t count, size_t size);```
* ft_memchr: ```void	*ft_memchr(const void *s, int c, size_t n);```
* ft_memcmp: ```int	ft_memcmp(const void *s1, const void *s2, size_t n);```
* ft_memcpy": ```void	*ft_memcpy(void *dst, const void *src, size_t n);```
* ft_memmove: ```void	*ft_memmove(void *dst, const void *src, size_t len);```
* ft_memset: ```void	*ft_memset(void *b, int c, size_t len);```

### Output functions
* ft_putchar_fd: ```void	ft_putchar_fd(char c, int fd);```
* ft_putendl_fd: ```void	ft_putendl_fd(char *s, int fd);```
* ft_putnbr_fd: ```void	ft_putnbr_fd(int n, int fd);```
* ft_putstr_fd: ```void	ft_putstr_fd(char *s, int fd);```

### String functions
* ft_strchr: ```char	*ft_strchr(const char *s, int c);```
* ft_strdup: ```char	*ft_strdup(const char *s1);```
* ft_striteri: ```void	ft_striteri(char *s, void (*f)(unsigned int, char*));```
* ft_strjoin: ```char	*ft_strjoin(char const *s1, char const *s2);```
* ft_strlcat: ```size_t	ft_strlcat(char *dst, const char *src, size_t dstsize);```
* ft_strlcpy: ```size_t	ft_strlcpy(char *dst, const char *src, size_t dstsize);```
* ft_strlen: ```size_t	ft_strlen(const char *s);```
* ft_strmapi: ```char	*ft_strmapi(char const *s, char (*f)(unsigned int, char));```
* ft_strncmp: ```int	ft_strncmp(const char *s1, const char *s2, size_t n);```
* ft_strnstr: ```char	*ft_strnstr(const char *haystack, const char *needle, size_t len);```
* ft_strrchr: ```char	*ft_strrchr(const char *s, int c);```
* ft_strtrim: ```char	*ft_strtrim(char const *s1, char const *set);```
* ft_substr: ```char	*ft_substr(char const *s, unsigned int start, size_t len);```

### Other functions
* ft_atoi: ```int	ft_atoi(const char *str);```
* ft_itoa: ```char	*ft_itoa(int n);```
* ft_split: ```char	**ft_split(char const *s, char c);```

### Bonus functions / List functions

The following functions are part of the bonus functions of the project.
They are functions that are not part of the standard C library.

The structure of the list is as follows:
```c
typedef struct	s_list
{
	void				*content;
	struct s_list	*next;
}				t_list;
```

The functions are:
* ft_lstnew: ```t_list	*ft_lstnew(void *content);```
* ft_lstadd_front: ```void	ft_lstadd_front(t_list **lst, t_list *new);```
* ft_lstsize: ```int	ft_lstsize(t_list *lst);```
* ft_lstlast: ```t_list	*ft_lstlast(t_list *lst);```
* ft_lstadd_back: ```void	ft_lstadd_back(t_list **lst, t_list *new);```
* ft_lstdelone: ```void	ft_lstdelone(t_list *lst, void (*del)(void*));```
* ft_lstclear: ```void	ft_lstclear(t_list **lst, void (*del)(void*));```
* ft_lstiter: ```void	ft_lstiter(t_list *lst, void (*f)(void *));```
* ft_lstmap: ```t_list	*ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *));```
