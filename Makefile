CFLAGS=-Wall -Werror

TARGET = clox
OBJS = chunk.o memory.o debug.o

$(TARGET): main.c $(OBJS)
	gcc $(CFLAGS) -o clox $(OBJS) main.c

%.o: %.c %.h
	$(CC) $(CFLAGS) -c -o $@ $<
