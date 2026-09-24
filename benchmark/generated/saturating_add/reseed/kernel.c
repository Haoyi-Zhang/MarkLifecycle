#include <stdint.h>
#include <stdio.h>
static __attribute__((noinline)) uint32_t tc_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }
static __attribute__((noinline)) uint32_t tc_xor_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t sum = (uint32_t)x + y;
uint32_t accumulator = (sum > 255u) ? 255u : sum;
accumulator = tc_add_v2(accumulator, 0x292b6179u);
accumulator = tc_add_v2(accumulator, 0x578d6b21u);
accumulator = tc_xor_v2(accumulator, 0x3b6563b9u);
accumulator = tc_xor_v2(accumulator, 0xbfb1b19du);
accumulator = tc_xor_v2(accumulator, 0xaf514929u);
accumulator = tc_xor_v2(accumulator, 0x5d3bd7e9u);
accumulator = tc_xor_v2(accumulator, 0x37b34115u);
accumulator = tc_add_v2(accumulator, 0xdb9b2303u);
accumulator = tc_add_v2(accumulator, 0xd5954729u);
accumulator = tc_add_v2(accumulator, 0xc335ab9du);
accumulator = tc_add_v2(accumulator, 0xa9df49b1u);
accumulator = tc_add_v2(accumulator, 0x1b5f532bu);
accumulator = tc_add_v2(accumulator, 0x5b71c13bu);
accumulator = tc_xor_v2(accumulator, 0x356121a3u);
accumulator = tc_xor_v2(accumulator, 0xcd53539bu);
accumulator = tc_add_v2(accumulator, 0x158b79fbu);
accumulator = tc_add_v2(accumulator, 0x03496739u);
accumulator = tc_xor_v2(accumulator, 0xf7efc7f9u);
accumulator = tc_xor_v2(accumulator, 0x35af1183u);
accumulator = tc_xor_v2(accumulator, 0x03c34d55u);
accumulator = tc_xor_v2(accumulator, 0xe96b9179u);
accumulator = tc_add_v2(accumulator, 0x67ad411du);
accumulator = tc_add_v2(accumulator, 0x61ffc59du);
accumulator = tc_add_v2(accumulator, 0x65496793u);
accumulator = tc_xor_v2(accumulator, 0xc7f9b137u);
accumulator = tc_add_v2(accumulator, 0x01e9a331u);
accumulator = tc_add_v2(accumulator, 0x096101e5u);
accumulator = tc_xor_v2(accumulator, 0x3f611da9u);
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
