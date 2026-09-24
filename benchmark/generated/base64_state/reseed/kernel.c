#include <stdint.h>
#include <stdio.h>
static __attribute__((noinline)) uint32_t tc_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }
static __attribute__((noinline)) uint32_t tc_xor_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t v;
if (y >= 65u && y <= 90u) v = y - 65u;
else if (y >= 97u && y <= 122u) v = y - 71u;
else if (y >= 48u && y <= 57u) v = y + 4u;
else if (y == 43u) v = 62u;
else if (y == 47u) v = 63u;
else v = 0xffu;
uint32_t accumulator = (v ^ x) & 0xffu;
accumulator = tc_add_v2(accumulator, 0x1dcdbd81u);
accumulator = tc_xor_v2(accumulator, 0xab1bf183u);
accumulator = tc_xor_v2(accumulator, 0xa5950773u);
accumulator = tc_add_v2(accumulator, 0x316fbdc7u);
accumulator = tc_xor_v2(accumulator, 0x8bff0129u);
accumulator = tc_xor_v2(accumulator, 0xe1ef43b3u);
accumulator = tc_xor_v2(accumulator, 0x813b6defu);
accumulator = tc_add_v2(accumulator, 0x938f496bu);
accumulator = tc_add_v2(accumulator, 0xa7655b7fu);
accumulator = tc_add_v2(accumulator, 0xd3891f91u);
accumulator = tc_add_v2(accumulator, 0x45efb107u);
accumulator = tc_add_v2(accumulator, 0x0365b9fdu);
accumulator = tc_xor_v2(accumulator, 0x357ff3f3u);
accumulator = tc_add_v2(accumulator, 0x7d29dd37u);
accumulator = tc_add_v2(accumulator, 0x655f4501u);
accumulator = tc_add_v2(accumulator, 0xeb57b7a9u);
accumulator = tc_xor_v2(accumulator, 0xeb239fc9u);
accumulator = tc_add_v2(accumulator, 0xcd95afedu);
accumulator = tc_add_v2(accumulator, 0x77494351u);
accumulator = tc_add_v2(accumulator, 0x1997b3f1u);
accumulator = tc_add_v2(accumulator, 0x6327d569u);
accumulator = tc_add_v2(accumulator, 0x3ddd0157u);
accumulator = tc_add_v2(accumulator, 0x33733b21u);
accumulator = tc_add_v2(accumulator, 0x85fd8f97u);
accumulator = tc_add_v2(accumulator, 0x19f3335du);
accumulator = tc_xor_v2(accumulator, 0xcd53eb53u);
accumulator = tc_add_v2(accumulator, 0x7d4329bfu);
accumulator = tc_xor_v2(accumulator, 0xf359df37u);
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
