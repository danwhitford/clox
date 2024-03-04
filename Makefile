CFLAGS=-Wall -Werror

clox: main.c
	gcc $(CFLAGS) -o clox main.c
