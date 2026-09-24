#include <stdint.h>
#include <stdio.h>
static __attribute__((noinline)) uint32_t tc_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }
static __attribute__((noinline)) uint32_t tc_xor_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t accumulator;
if (((x ^ y) & 1u) != 0u) accumulator = ((((uint32_t)x * 17u) + y) ^ 0x5au) & 0xffu;
else accumulator = ((((uint32_t)y * 29u) + x) ^ 0xa5u) & 0xffu;
accumulator = tc_add_v2(accumulator, 0xf7c587bbu);
accumulator = tc_add_v2(accumulator, 0x3113b73bu);
accumulator = tc_add_v2(accumulator, 0x4533ebadu);
accumulator = tc_add_v2(accumulator, 0x7591dbdfu);
accumulator = tc_xor_v2(accumulator, 0x45e1e367u);
accumulator = tc_add_v2(accumulator, 0xa1c58587u);
accumulator = tc_add_v2(accumulator, 0x0987af2bu);
accumulator = tc_add_v2(accumulator, 0x55d9914fu);
accumulator = tc_xor_v2(accumulator, 0x875f79ffu);
accumulator = tc_add_v2(accumulator, 0x7523fdd7u);
accumulator = tc_xor_v2(accumulator, 0xa7b551c1u);
accumulator = tc_add_v2(accumulator, 0x6f73990du);
accumulator = tc_add_v2(accumulator, 0x8355414fu);
accumulator = tc_add_v2(accumulator, 0xddc55f73u);
accumulator = tc_xor_v2(accumulator, 0x156f5767u);
accumulator = tc_xor_v2(accumulator, 0x4f1fef63u);
accumulator = tc_xor_v2(accumulator, 0x67efd99du);
accumulator = tc_add_v2(accumulator, 0x0b5f950fu);
accumulator = tc_add_v2(accumulator, 0xc70543c9u);
accumulator = tc_xor_v2(accumulator, 0xafebabc1u);
accumulator = tc_xor_v2(accumulator, 0xe3537f33u);
accumulator = tc_add_v2(accumulator, 0x251349b5u);
accumulator = tc_xor_v2(accumulator, 0xf7153f29u);
accumulator = tc_add_v2(accumulator, 0x37e75325u);
accumulator = tc_add_v2(accumulator, 0xe5f9ed01u);
accumulator = tc_add_v2(accumulator, 0xdb9b77bbu);
accumulator = tc_add_v2(accumulator, 0x190fbbffu);
accumulator = tc_add_v2(accumulator, 0x7d3f4b1fu);
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
