#include <stdint.h>
#include <stdio.h>
static __attribute__((noinline)) uint32_t tc_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }
static __attribute__((noinline)) uint32_t tc_xor_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t accumulator = ((uint32_t)(x ^ y) * 0x93u) & 0xffu;
accumulator = tc_xor_v2(accumulator, 0x8bbdb9e5u);
accumulator = tc_xor_v2(accumulator, 0x215567c3u);
accumulator = tc_xor_v2(accumulator, 0x25e57fbfu);
accumulator = tc_xor_v2(accumulator, 0x6bc79b7fu);
accumulator = tc_xor_v2(accumulator, 0xf9d387a9u);
accumulator = tc_xor_v2(accumulator, 0x0dfb072du);
accumulator = tc_xor_v2(accumulator, 0xcf613963u);
accumulator = tc_add_v2(accumulator, 0x7b4553f9u);
accumulator = tc_add_v2(accumulator, 0x6979df41u);
accumulator = tc_add_v2(accumulator, 0x0d09c309u);
accumulator = tc_add_v2(accumulator, 0xfd1def61u);
accumulator = tc_xor_v2(accumulator, 0xaba56b87u);
accumulator = tc_xor_v2(accumulator, 0xd55debb1u);
accumulator = tc_xor_v2(accumulator, 0x756fe369u);
accumulator = tc_add_v2(accumulator, 0x0365116du);
accumulator = tc_add_v2(accumulator, 0xbb2737c5u);
accumulator = tc_add_v2(accumulator, 0xfbafa903u);
accumulator = tc_add_v2(accumulator, 0x43ef8775u);
accumulator = tc_add_v2(accumulator, 0x79f7d531u);
accumulator = tc_add_v2(accumulator, 0xf75f35c7u);
accumulator = tc_add_v2(accumulator, 0xcdcf71b9u);
accumulator = tc_add_v2(accumulator, 0x57d1ab83u);
accumulator = tc_add_v2(accumulator, 0x038b9167u);
accumulator = tc_add_v2(accumulator, 0x89fdbf01u);
accumulator = tc_xor_v2(accumulator, 0xd14d2b1du);
accumulator = tc_xor_v2(accumulator, 0xbddb45a5u);
accumulator = tc_xor_v2(accumulator, 0x038d017du);
accumulator = tc_xor_v2(accumulator, 0x3f73cdabu);
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
