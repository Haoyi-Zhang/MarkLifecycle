#include <stdint.h>
#include <stdio.h>
static __attribute__((noinline)) uint32_t tc_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }
static __attribute__((noinline)) uint32_t tc_xor_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t r = ((((uint32_t)x << 3) | ((uint32_t)x >> 5)) & 0xffu);
uint32_t accumulator = (r ^ y ^ ((uint32_t)y >> 2)) & 0xffu;
accumulator = tc_add_v2(accumulator, 0x0525437fu);
accumulator = tc_add_v2(accumulator, 0x7d352fddu);
accumulator = tc_add_v2(accumulator, 0x3b0f7323u);
accumulator = tc_xor_v2(accumulator, 0x7b09af43u);
accumulator = tc_add_v2(accumulator, 0x4d5d717du);
accumulator = tc_add_v2(accumulator, 0x5be3312du);
accumulator = tc_xor_v2(accumulator, 0x23fbf5a1u);
accumulator = tc_add_v2(accumulator, 0xdf650d05u);
accumulator = tc_add_v2(accumulator, 0x95b70fd7u);
accumulator = tc_xor_v2(accumulator, 0x7d113d99u);
accumulator = tc_xor_v2(accumulator, 0x7741d955u);
accumulator = tc_xor_v2(accumulator, 0xeda719bdu);
accumulator = tc_xor_v2(accumulator, 0x85a32b3du);
accumulator = tc_xor_v2(accumulator, 0x276b7775u);
accumulator = tc_xor_v2(accumulator, 0xe5cf878bu);
accumulator = tc_add_v2(accumulator, 0x5fa5f1adu);
accumulator = tc_add_v2(accumulator, 0x7f4f2b6bu);
accumulator = tc_xor_v2(accumulator, 0x0d83033bu);
accumulator = tc_xor_v2(accumulator, 0x71fde3c1u);
accumulator = tc_add_v2(accumulator, 0x6db1e797u);
accumulator = tc_add_v2(accumulator, 0x59734fffu);
accumulator = tc_xor_v2(accumulator, 0x01d3291fu);
accumulator = tc_xor_v2(accumulator, 0xa30b2f65u);
accumulator = tc_add_v2(accumulator, 0xd975cd4du);
accumulator = tc_xor_v2(accumulator, 0xb7bd9dcdu);
accumulator = tc_xor_v2(accumulator, 0x4bcfb9e3u);
accumulator = tc_xor_v2(accumulator, 0x63c58159u);
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
