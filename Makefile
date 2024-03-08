CFLAGS=-Wall -Werror

TARGET = clox
SOURCES := $(wildcard *.h)
OBJS = chunk.o memory.o debug.o value.o vm.o
TESTS = chunk_test vm_test

$(TARGET): main.c $(OBJS)
	gcc $(CFLAGS) -o $(TARGET) $(OBJS) main.c

%.o: %.c %.h
	gcc $(CFLAGS) -c -o $@ $<

%_test: $(OBJS) %_test.c %.c %.h
	gcc $(CFLAGS) -o $@ $(OBJS) $@.c

.PHONY: check
check: $(TESTS)
	@for script in *_test; do \
		echo "Running $$script..."; \
		./"$$script"; \
	done
