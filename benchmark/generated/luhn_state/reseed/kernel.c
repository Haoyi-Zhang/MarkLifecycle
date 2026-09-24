#include <stdint.h>
#include <stdio.h>
static __attribute__((noinline)) uint32_t tc_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }
static __attribute__((noinline)) uint32_t tc_xor_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t d = y % 10u;
if (x & 1u) { d *= 2u; if (d > 9u) d -= 9u; }
uint32_t accumulator = ((uint32_t)x + d) & 0xffu;
accumulator = tc_xor_v2(accumulator, 0xc709b797u);
accumulator = tc_add_v2(accumulator, 0x9dad9779u);
accumulator = tc_add_v2(accumulator, 0x99ef8bdfu);
accumulator = tc_xor_v2(accumulator, 0xc1f749d3u);
accumulator = tc_xor_v2(accumulator, 0xffed858du);
accumulator = tc_add_v2(accumulator, 0xe36309d1u);
accumulator = tc_add_v2(accumulator, 0x9f7f0bf3u);
accumulator = tc_xor_v2(accumulator, 0xe70d5397u);
accumulator = tc_xor_v2(accumulator, 0xa7d765edu);
accumulator = tc_xor_v2(accumulator, 0x2b391f9fu);
accumulator = tc_xor_v2(accumulator, 0xed6b91f3u);
accumulator = tc_xor_v2(accumulator, 0x83ed3dd1u);
accumulator = tc_add_v2(accumulator, 0x6fa55353u);
accumulator = tc_add_v2(accumulator, 0x0dcbdf6fu);
accumulator = tc_xor_v2(accumulator, 0x1fd581d7u);
accumulator = tc_xor_v2(accumulator, 0xdfb73f63u);
accumulator = tc_add_v2(accumulator, 0xfdadf9a9u);
accumulator = tc_add_v2(accumulator, 0x7fc91d91u);
accumulator = tc_add_v2(accumulator, 0xcfe3a3f3u);
accumulator = tc_xor_v2(accumulator, 0x7359b7bdu);
accumulator = tc_xor_v2(accumulator, 0xf7ad9b35u);
accumulator = tc_add_v2(accumulator, 0x2bd3f1a9u);
accumulator = tc_add_v2(accumulator, 0x173b13adu);
accumulator = tc_add_v2(accumulator, 0xe955a52du);
accumulator = tc_add_v2(accumulator, 0x4bdd53d7u);
accumulator = tc_add_v2(accumulator, 0x35519905u);
accumulator = tc_xor_v2(accumulator, 0x55d1c56fu);
accumulator = tc_xor_v2(accumulator, 0x3185a9a7u);
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
