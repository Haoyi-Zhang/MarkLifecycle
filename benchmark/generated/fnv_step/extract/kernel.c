#include <stdint.h>
#include <stdio.h>
static __attribute__((noinline)) uint32_t tc_add_v1(uint32_t v, uint32_t k) { return (v + k) - k; }
static __attribute__((noinline)) uint32_t tc_xor_v1(uint32_t v, uint32_t k) { return (v ^ k) ^ k; }

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t accumulator = ((uint32_t)(x ^ y) * 0x93u) & 0xffu;
accumulator = tc_xor_v1(accumulator, 0x01af4b55u);
accumulator = tc_xor_v1(accumulator, 0x5b39f55du);
accumulator = tc_xor_v1(accumulator, 0x799d91ebu);
accumulator = tc_xor_v1(accumulator, 0xdd8395f1u);
accumulator = tc_xor_v1(accumulator, 0x792b0b43u);
accumulator = tc_xor_v1(accumulator, 0x993389d7u);
accumulator = tc_xor_v1(accumulator, 0xa7132bb1u);
accumulator = tc_add_v1(accumulator, 0xfd69f331u);
accumulator = tc_add_v1(accumulator, 0xc3cbcf1du);
accumulator = tc_add_v1(accumulator, 0xc9ff3b89u);
accumulator = tc_add_v1(accumulator, 0x7b5fdf51u);
accumulator = tc_xor_v1(accumulator, 0x47116151u);
accumulator = tc_xor_v1(accumulator, 0x4f7b7795u);
accumulator = tc_xor_v1(accumulator, 0x79856737u);
accumulator = tc_add_v1(accumulator, 0xc5c119b3u);
accumulator = tc_add_v1(accumulator, 0xe74be52du);
accumulator = tc_add_v1(accumulator, 0x53871353u);
accumulator = tc_add_v1(accumulator, 0x658ddb43u);
accumulator = tc_add_v1(accumulator, 0x752bc729u);
accumulator = tc_add_v1(accumulator, 0x81e9b57fu);
accumulator = tc_add_v1(accumulator, 0xbb3bd7afu);
accumulator = tc_add_v1(accumulator, 0x77dbc743u);
accumulator = tc_add_v1(accumulator, 0xd9af3dc1u);
accumulator = tc_add_v1(accumulator, 0xd959770fu);
accumulator = tc_xor_v1(accumulator, 0xb777f35fu);
accumulator = tc_xor_v1(accumulator, 0x6f47e987u);
accumulator = tc_xor_v1(accumulator, 0x051121edu);
accumulator = tc_xor_v1(accumulator, 0x85a94d8bu);
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
