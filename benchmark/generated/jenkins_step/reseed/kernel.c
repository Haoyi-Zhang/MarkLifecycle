#include <stdint.h>
#include <stdio.h>
static __attribute__((noinline)) uint32_t tc_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }
static __attribute__((noinline)) uint32_t tc_xor_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t accumulator = ((uint32_t)x + y) & 0xffu;
accumulator = (accumulator + ((accumulator << 3) & 0xffu)) & 0xffu;
accumulator ^= accumulator >> 4;
accumulator = (accumulator * 0x1bu) & 0xffu;
accumulator ^= accumulator >> 3;
accumulator = tc_add_v2(accumulator, 0x69c30137u);
accumulator = tc_add_v2(accumulator, 0x851b7523u);
accumulator = tc_xor_v2(accumulator, 0x538529d7u);
accumulator = tc_xor_v2(accumulator, 0xabbfb9d1u);
accumulator = tc_xor_v2(accumulator, 0xedaba34bu);
accumulator = tc_add_v2(accumulator, 0x77733d6bu);
accumulator = tc_xor_v2(accumulator, 0xab935dfbu);
accumulator = tc_xor_v2(accumulator, 0x9b17e3e9u);
accumulator = tc_add_v2(accumulator, 0xbb35b3f1u);
accumulator = tc_xor_v2(accumulator, 0x73cb5753u);
accumulator = tc_add_v2(accumulator, 0x719f612fu);
accumulator = tc_xor_v2(accumulator, 0x334d0d99u);
accumulator = tc_xor_v2(accumulator, 0x018d6debu);
accumulator = tc_add_v2(accumulator, 0x3543490fu);
accumulator = tc_xor_v2(accumulator, 0xa547d139u);
accumulator = tc_add_v2(accumulator, 0xabfdf529u);
accumulator = tc_add_v2(accumulator, 0x1b29f1f5u);
accumulator = tc_xor_v2(accumulator, 0xc383b75bu);
accumulator = tc_add_v2(accumulator, 0xffd1b9d3u);
accumulator = tc_xor_v2(accumulator, 0x31d7cda9u);
accumulator = tc_add_v2(accumulator, 0xc3179b73u);
accumulator = tc_add_v2(accumulator, 0x9557d5a5u);
accumulator = tc_xor_v2(accumulator, 0xdf573fbbu);
accumulator = tc_add_v2(accumulator, 0xa55d3163u);
accumulator = tc_xor_v2(accumulator, 0xd1af9dabu);
accumulator = tc_add_v2(accumulator, 0x314d952fu);
accumulator = tc_add_v2(accumulator, 0x2fbba705u);
accumulator = tc_xor_v2(accumulator, 0xb78fe309u);
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
