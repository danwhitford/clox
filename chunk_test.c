#include <stdio.h>
#include <assert.h>

#include "chunk.h"
#include "common.h"

int main()
{
    printf("=== Chunk test ===\n");

    Chunk chunk;
    initChunk(&chunk);

    assert(chunk.capacity == 0);
    assert(chunk.count == 0);
    assert(chunk.code == NULL);

    writeChunk(&chunk, OP_CONSTANT, 123);
    assert(chunk.capacity == 8);
    assert(chunk.count == 1);
    assert(chunk.code != NULL);

    return 0;
}
