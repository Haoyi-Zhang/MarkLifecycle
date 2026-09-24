#include <stdint.h>
#include <stdio.h>
static __attribute__((noinline)) uint32_t tc_add_v1(uint32_t v, uint32_t k) { return (v + k) - k; }
static __attribute__((noinline)) uint32_t tc_xor_v1(uint32_t v, uint32_t k) { return (v ^ k) ^ k; }

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t d = y % 10u;
if (x & 1u) { d *= 2u; if (d > 9u) d -= 9u; }
uint32_t accumulator = ((uint32_t)x + d) & 0xffu;
accumulator = tc_xor_v1(accumulator, 0xfb030f59u);
accumulator = tc_add_v1(accumulator, 0x37bf9961u);
accumulator = tc_add_v1(accumulator, 0xe193f1bbu);
accumulator = tc_xor_v1(accumulator, 0x19d12d3bu);
accumulator = tc_xor_v1(accumulator, 0x43cb09bbu);
accumulator = tc_add_v1(accumulator, 0xf9e7dfb7u);
accumulator = tc_add_v1(accumulator, 0x394197d9u);
accumulator = tc_xor_v1(accumulator, 0x5df939cdu);
accumulator = tc_xor_v1(accumulator, 0x4f41f5e5u);
accumulator = tc_xor_v1(accumulator, 0x5dadcd99u);
accumulator = tc_xor_v1(accumulator, 0x57193f75u);
accumulator = tc_xor_v1(accumulator, 0x3bc9a157u);
accumulator = tc_add_v1(accumulator, 0x8151b193u);
accumulator = tc_add_v1(accumulator, 0xe77fb3e7u);
accumulator = tc_xor_v1(accumulator, 0x6593777bu);
accumulator = tc_xor_v1(accumulator, 0xbd9b9b1du);
accumulator = tc_add_v1(accumulator, 0xa5b5e7bbu);
accumulator = tc_add_v1(accumulator, 0xe3751739u);
accumulator = tc_add_v1(accumulator, 0xfb858fddu);
accumulator = tc_xor_v1(accumulator, 0x7b6be97bu);
accumulator = tc_xor_v1(accumulator, 0xfd574303u);
accumulator = tc_add_v1(accumulator, 0xfbc7839du);
accumulator = tc_add_v1(accumulator, 0xe1611329u);
accumulator = tc_add_v1(accumulator, 0xbbfb959bu);
accumulator = tc_add_v1(accumulator, 0x35f39fd7u);
accumulator = tc_add_v1(accumulator, 0x690fedb7u);
accumulator = tc_xor_v1(accumulator, 0x53e725b3u);
accumulator = tc_xor_v1(accumulator, 0x53016f4bu);
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
