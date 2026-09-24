#include <stdint.h>
#include <stdio.h>
static __attribute__((noinline)) uint32_t tc_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }
static __attribute__((noinline)) uint32_t tc_xor_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t accumulator = ((uint32_t)x + y) % 255u;
accumulator = tc_add_v2(accumulator, 0xc3eb9719u);
accumulator = tc_add_v2(accumulator, 0x9b75abb9u);
accumulator = tc_xor_v2(accumulator, 0x55b7b5afu);
accumulator = tc_xor_v2(accumulator, 0x23e355f1u);
accumulator = tc_add_v2(accumulator, 0x6b57cb9du);
accumulator = tc_add_v2(accumulator, 0xed056be9u);
accumulator = tc_add_v2(accumulator, 0xb593c103u);
accumulator = tc_add_v2(accumulator, 0xa5973337u);
accumulator = tc_xor_v2(accumulator, 0x49a57ddfu);
accumulator = tc_add_v2(accumulator, 0xe1671b4bu);
accumulator = tc_xor_v2(accumulator, 0xfb0563e3u);
accumulator = tc_add_v2(accumulator, 0xdb55810bu);
accumulator = tc_add_v2(accumulator, 0xb939155fu);
accumulator = tc_xor_v2(accumulator, 0x97eb8777u);
accumulator = tc_xor_v2(accumulator, 0x6d9b5d6fu);
accumulator = tc_add_v2(accumulator, 0x9999abadu);
accumulator = tc_add_v2(accumulator, 0xb355b371u);
accumulator = tc_add_v2(accumulator, 0x8789a76du);
accumulator = tc_add_v2(accumulator, 0x330fbd57u);
accumulator = tc_add_v2(accumulator, 0x4361d197u);
accumulator = tc_add_v2(accumulator, 0x51ffb7dfu);
accumulator = tc_xor_v2(accumulator, 0x135521f9u);
accumulator = tc_add_v2(accumulator, 0x8f1bf3e7u);
accumulator = tc_xor_v2(accumulator, 0x838f177bu);
accumulator = tc_xor_v2(accumulator, 0x2db7d367u);
accumulator = tc_add_v2(accumulator, 0x8f2ff345u);
accumulator = tc_add_v2(accumulator, 0xe9318b59u);
accumulator = tc_xor_v2(accumulator, 0x037b5503u);
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
