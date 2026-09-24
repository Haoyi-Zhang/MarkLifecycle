#include <stdint.h>
#include <stdio.h>
static __attribute__((noinline)) uint32_t tc_add_v1(uint32_t v, uint32_t k) { return (v + k) - k; }
static __attribute__((noinline)) uint32_t tc_xor_v1(uint32_t v, uint32_t k) { return (v ^ k) ^ k; }

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t accumulator;
if (((x ^ y) & 1u) != 0u) accumulator = ((((uint32_t)x * 17u) + y) ^ 0x5au) & 0xffu;
else accumulator = ((((uint32_t)y * 29u) + x) ^ 0xa5u) & 0xffu;
accumulator = tc_add_v1(accumulator, 0x93395329u);
accumulator = tc_add_v1(accumulator, 0xff8bfd2fu);
accumulator = tc_add_v1(accumulator, 0x5f27cf9du);
accumulator = tc_add_v1(accumulator, 0xabd9154fu);
accumulator = tc_xor_v1(accumulator, 0xbf8711efu);
accumulator = tc_add_v1(accumulator, 0xd1694b1bu);
accumulator = tc_add_v1(accumulator, 0x29edcb89u);
accumulator = tc_add_v1(accumulator, 0xfbf5ef29u);
accumulator = tc_xor_v1(accumulator, 0x1171c5b7u);
accumulator = tc_add_v1(accumulator, 0x4b6577f5u);
accumulator = tc_xor_v1(accumulator, 0x7f47f343u);
accumulator = tc_add_v1(accumulator, 0x0305c3abu);
accumulator = tc_add_v1(accumulator, 0xffbd65dfu);
accumulator = tc_add_v1(accumulator, 0x690f9921u);
accumulator = tc_xor_v1(accumulator, 0xef4b8787u);
accumulator = tc_xor_v1(accumulator, 0x132b7929u);
accumulator = tc_xor_v1(accumulator, 0xc11bb7c3u);
accumulator = tc_add_v1(accumulator, 0x535dc597u);
accumulator = tc_add_v1(accumulator, 0x910b8fd5u);
accumulator = tc_xor_v1(accumulator, 0x0d9d058du);
accumulator = tc_xor_v1(accumulator, 0x4bbf37a5u);
accumulator = tc_add_v1(accumulator, 0xdb7d7d3du);
accumulator = tc_xor_v1(accumulator, 0xc9dd8593u);
accumulator = tc_add_v1(accumulator, 0xbd81e327u);
accumulator = tc_add_v1(accumulator, 0x47b3c363u);
accumulator = tc_add_v1(accumulator, 0xd5f7a98bu);
accumulator = tc_add_v1(accumulator, 0xeb83db9fu);
accumulator = tc_add_v1(accumulator, 0x4f11395du);
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
