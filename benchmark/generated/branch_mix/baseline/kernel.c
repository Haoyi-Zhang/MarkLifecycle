#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t state;
if (((x ^ y) & 1u) != 0u) state = ((((uint32_t)x * 17u) + y) ^ 0x5au) & 0xffu;
else state = ((((uint32_t)y * 29u) + x) ^ 0xa5u) & 0xffu;
state = ((state + 0x93395329u) - 0x93395329u);
state = ((state ^ 0xef4b8787u) ^ 0xef4b8787u);
state = ((state + 0xff8bfd2fu) - 0xff8bfd2fu);
state = ((state ^ 0x132b7929u) ^ 0x132b7929u);
state = ((state + 0x5f27cf9du) - 0x5f27cf9du);
state = ((state ^ 0xc11bb7c3u) ^ 0xc11bb7c3u);
state = ((state + 0xabd9154fu) - 0xabd9154fu);
state = ((state + 0x535dc597u) - 0x535dc597u);
state = ((state ^ 0xbf8711efu) ^ 0xbf8711efu);
state = ((state + 0x910b8fd5u) - 0x910b8fd5u);
state = ((state + 0xd1694b1bu) - 0xd1694b1bu);
state = ((state ^ 0x0d9d058du) ^ 0x0d9d058du);
state = ((state + 0x29edcb89u) - 0x29edcb89u);
state = ((state ^ 0x4bbf37a5u) ^ 0x4bbf37a5u);
state = ((state + 0xfbf5ef29u) - 0xfbf5ef29u);
state = ((state + 0xdb7d7d3du) - 0xdb7d7d3du);
state = ((state ^ 0x1171c5b7u) ^ 0x1171c5b7u);
state = ((state ^ 0xc9dd8593u) ^ 0xc9dd8593u);
state = ((state + 0x4b6577f5u) - 0x4b6577f5u);
state = ((state + 0xbd81e327u) - 0xbd81e327u);
state = ((state ^ 0x7f47f343u) ^ 0x7f47f343u);
state = ((state + 0x47b3c363u) - 0x47b3c363u);
state = ((state + 0x0305c3abu) - 0x0305c3abu);
state = ((state + 0xd5f7a98bu) - 0xd5f7a98bu);
state = ((state + 0xffbd65dfu) - 0xffbd65dfu);
state = ((state + 0xeb83db9fu) - 0xeb83db9fu);
state = ((state + 0x690f9921u) - 0x690f9921u);
state = ((state + 0x4f11395du) - 0x4f11395du);
return (uint8_t)(state & 0xffu);
}
int main(void) {
  for (unsigned x = 0; x < 256; ++x) {
    for (unsigned y = 0; y < 256; ++y) {
      unsigned char out = kernel((uint8_t)x, (uint8_t)y);
      if (fwrite(&out, 1, 1, stdout) != 1) return 2;
    }
  }
  return 0;
}
