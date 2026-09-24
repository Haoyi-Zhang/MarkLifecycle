#include <stdint.h>
#include <stdio.h>
static __attribute__((noinline)) uint32_t tc_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }
static __attribute__((noinline)) uint32_t tc_xor_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t accumulator;
if (y == 9u || y == 10u || y == 13u || y == 32u) accumulator = x;
else if (y == 123u || y == 91u) accumulator = ((uint32_t)x + 1u) & 0xffu;
else if (y == 125u || y == 93u) accumulator = ((uint32_t)x - 1u) & 0xffu;
else if (y == 34u) accumulator = ((uint32_t)x ^ 0x80u) & 0xffu;
else accumulator = ((uint32_t)x + (y & 3u)) & 0xffu;
accumulator = tc_xor_v2(accumulator, 0x4b4fd7a7u);
accumulator = tc_xor_v2(accumulator, 0xdb1175f9u);
accumulator = tc_add_v2(accumulator, 0xa11fcf81u);
accumulator = tc_add_v2(accumulator, 0xd193b72bu);
accumulator = tc_xor_v2(accumulator, 0x9dcd471bu);
accumulator = tc_add_v2(accumulator, 0x1fef6b9fu);
accumulator = tc_add_v2(accumulator, 0xb58f2f23u);
accumulator = tc_xor_v2(accumulator, 0xbf33094du);
accumulator = tc_xor_v2(accumulator, 0x8d718505u);
accumulator = tc_xor_v2(accumulator, 0x6585b161u);
accumulator = tc_xor_v2(accumulator, 0x8bb3c5b9u);
accumulator = tc_add_v2(accumulator, 0x5d3f893du);
accumulator = tc_xor_v2(accumulator, 0xd75be71du);
accumulator = tc_add_v2(accumulator, 0x57f90bd3u);
accumulator = tc_xor_v2(accumulator, 0x9debb301u);
accumulator = tc_add_v2(accumulator, 0xa5b5ab25u);
accumulator = tc_add_v2(accumulator, 0x5da52ffbu);
accumulator = tc_xor_v2(accumulator, 0xbd93e757u);
accumulator = tc_xor_v2(accumulator, 0x6b7dbfebu);
accumulator = tc_add_v2(accumulator, 0x33932f33u);
accumulator = tc_add_v2(accumulator, 0x87991dc9u);
accumulator = tc_add_v2(accumulator, 0x75474b47u);
accumulator = tc_add_v2(accumulator, 0x77d591dfu);
accumulator = tc_add_v2(accumulator, 0xbdd597c5u);
accumulator = tc_xor_v2(accumulator, 0xa7e3e50du);
accumulator = tc_add_v2(accumulator, 0x1f27114du);
accumulator = tc_xor_v2(accumulator, 0x2935595du);
accumulator = tc_add_v2(accumulator, 0xe1a501d9u);
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
