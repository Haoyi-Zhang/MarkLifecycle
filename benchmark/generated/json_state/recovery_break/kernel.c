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
accumulator = tc_add_v2(accumulator, 0xb7677f4bu);
accumulator = tc_add_v2(accumulator, 0xf7151745u);
accumulator = tc_add_v2(accumulator, 0x9b5595dbu);
accumulator = tc_xor_v2(accumulator, 0xbd3defb3u);
accumulator = tc_xor_v2(accumulator, 0x3729399fu);
accumulator = tc_add_v2(accumulator, 0xe9f11d3du);
accumulator = tc_add_v2(accumulator, 0x2749c163u);
accumulator = tc_add_v2(accumulator, 0x81e5c577u);
accumulator = tc_add_v2(accumulator, 0x6dc915e1u);
accumulator = tc_add_v2(accumulator, 0x19f76577u);
accumulator = tc_xor_v2(accumulator, 0x4bc999a3u);
accumulator = tc_add_v2(accumulator, 0x3d1d97bdu);
accumulator = tc_xor_v2(accumulator, 0x1bab3dfbu);
accumulator = tc_add_v2(accumulator, 0x21f5e5a5u);
accumulator = tc_xor_v2(accumulator, 0xbb69731du);
accumulator = tc_add_v2(accumulator, 0xeb2731cfu);
accumulator = tc_add_v2(accumulator, 0x9d858dd1u);
accumulator = tc_xor_v2(accumulator, 0x0d3dd5bbu);
accumulator = tc_add_v2(accumulator, 0x95bd15afu);
accumulator = tc_add_v2(accumulator, 0xfd4d93d7u);
accumulator = tc_xor_v2(accumulator, 0xe3e529ebu);
accumulator = tc_xor_v2(accumulator, 0x9dfba745u);
accumulator = tc_xor_v2(accumulator, 0x3b994bbdu);
accumulator = tc_xor_v2(accumulator, 0xbbab4145u);
accumulator = tc_add_v2(accumulator, 0xc9dd6b77u);
accumulator = tc_xor_v2(accumulator, 0x790b75b1u);
accumulator = tc_add_v2(accumulator, 0xe57dc7cbu);
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
