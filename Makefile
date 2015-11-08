
EXEC		= 

SRCS		= $(SOURCES)/main.c

CC		= gcc

SOURCES		= src

HEADER		= include

LIB		= lib/my/

RED		= \033[1;31m

GREEN		= \033[1;32m

BOLD		= \033[1m

RESET		= \033[0m

DEBUG		= no

SUCCESS		= $(ECHO) "Compile $@: [$(GREEN)$(BOLD)ok$(RESET)]"

FAIL		= $(ECHO) "Compile $@: [$(RED)$(BOLD)Fail$(RESET)]" >&2

ECHO		= echo -e

RM		= rm -rf

CFLAGS		+= -W -Wall -Wextra -ansi -pedantic -I $(HEADER)

OBJS		= $(SRCS:.c=.o)

ifeq ($(DEBUG),yes)
	CFLAGS +=  -g3
endif

$(EXEC):$(OBJS)
	@$(CC) -o $(EXEC) $(OBJS) -lmy -Llib/ && $(SUCCESS) || $(FAIL)

all:$(EXEC) lib

.c.o:
	@$(CC) -o $@ -c $< $(CFLAGS) && $(SUCCESS) || $(FAIL)

lib:
	make -C $(LIB)

clean:
	@$(RM) $(OBJS)
	@$(ECHO) "$(BOLD)$(RED)Delete$(RESET)$(BOLD) *.o: [$(GREEN)ok$(RESET)$(BOLD)]$(RESET)"

fclean:clean
	@$(RM) $(EXEC)
	@$(ECHO) "$(BOLD)$(RED)Delete$(RESET)$(BOLD) $(EXEC): [$(GREEN)ok$(RESET)$(BOLD)]$(RESET)"

re:fclean all
