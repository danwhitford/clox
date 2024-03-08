#include "vm.h"
#include <assert.h>

int main()
{
    initVM();

    Chunk chunk;
    initChunk(&chunk);
    int constant = addConstant(&chunk, 1.2);
    writeChunk(&chunk, OP_CONSTANT, 123);
    writeChunk(&chunk, constant, 123);
    writeChunk(&chunk, OP_RETURN, 124);

    InterpretResult result = interpret(&chunk);
    assert(result == INTERPRET_OK);

    freeVM();

    return 0;
}
