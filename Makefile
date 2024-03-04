CFLAGS=-Wall -Werror

TARGET = clox
OBJS = chunk.o memory.o debug.o value.o
TESTS = chunk_test

$(TARGET): main.c $(OBJS)
	gcc $(CFLAGS) -o $(TARGET) $(OBJS) main.c

%.o: %.c %.h
	gcc $(CFLAGS) -c -o $@ $<

%_test: $(OBJS) %_test.c %.c %.h
	gcc $(CFLAGS) -o $@ $(OBJS) $@.c

.PHONY: test
test: $(TESTS)
	./chunk_test
