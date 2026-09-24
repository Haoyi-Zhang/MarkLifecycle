#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t accumulator;
if (((x ^ y) & 1u) != 0u) accumulator = ((((uint32_t)x * 17u) + y) ^ 0x5au) & 0xffu;
else accumulator = ((((uint32_t)y * 29u) + x) ^ 0xa5u) & 0xffu;
accumulator = ((accumulator + 0x93395329u) - 0x93395329u);
accumulator = ((accumulator + 0xff8bfd2fu) - 0xff8bfd2fu);
accumulator = ((accumulator + 0x5f27cf9du) - 0x5f27cf9du);
accumulator = ((accumulator + 0xabd9154fu) - 0xabd9154fu);
accumulator = ((accumulator ^ 0xbf8711efu) ^ 0xbf8711efu);
accumulator = ((accumulator + 0xd1694b1bu) - 0xd1694b1bu);
accumulator = ((accumulator + 0x29edcb89u) - 0x29edcb89u);
accumulator = ((accumulator + 0xfbf5ef29u) - 0xfbf5ef29u);
accumulator = ((accumulator ^ 0x1171c5b7u) ^ 0x1171c5b7u);
accumulator = ((accumulator + 0x4b6577f5u) - 0x4b6577f5u);
accumulator = ((accumulator ^ 0x7f47f343u) ^ 0x7f47f343u);
accumulator = ((accumulator + 0x0305c3abu) - 0x0305c3abu);
accumulator = ((accumulator + 0xffbd65dfu) - 0xffbd65dfu);
accumulator = ((accumulator + 0x690f9921u) - 0x690f9921u);
accumulator = ((accumulator ^ 0xef4b8787u) ^ 0xef4b8787u);
accumulator = ((accumulator ^ 0x132b7929u) ^ 0x132b7929u);
accumulator = ((accumulator ^ 0xc11bb7c3u) ^ 0xc11bb7c3u);
accumulator = ((accumulator + 0x535dc597u) - 0x535dc597u);
accumulator = ((accumulator + 0x910b8fd5u) - 0x910b8fd5u);
accumulator = ((accumulator ^ 0x0d9d058du) ^ 0x0d9d058du);
accumulator = ((accumulator ^ 0x4bbf37a5u) ^ 0x4bbf37a5u);
accumulator = ((accumulator + 0xdb7d7d3du) - 0xdb7d7d3du);
accumulator = ((accumulator ^ 0xc9dd8593u) ^ 0xc9dd8593u);
accumulator = ((accumulator + 0xbd81e327u) - 0xbd81e327u);
accumulator = ((accumulator + 0x47b3c363u) - 0x47b3c363u);
accumulator = ((accumulator + 0xd5f7a98bu) - 0xd5f7a98bu);
accumulator = ((accumulator + 0xeb83db9fu) - 0xeb83db9fu);
accumulator = ((accumulator + 0x4f11395du) - 0x4f11395du);
return (uint8_t)(accumulator & 0xffu);
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
