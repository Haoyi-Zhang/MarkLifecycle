#include <stdint.h>
#include <stdio.h>
static __attribute__((noinline)) uint32_t tc_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }
static __attribute__((noinline)) uint32_t tc_xor_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t sum = (uint32_t)x + y;
uint32_t accumulator = (sum > 255u) ? 255u : sum;
accumulator = tc_xor_v2(accumulator, 0x47b9c389u);
accumulator = tc_add_v2(accumulator, 0x57e7d353u);
accumulator = tc_add_v2(accumulator, 0xadad1b69u);
accumulator = tc_xor_v2(accumulator, 0x7b1dc391u);
accumulator = tc_xor_v2(accumulator, 0x011b4f1fu);
accumulator = tc_xor_v2(accumulator, 0xf5b52137u);
accumulator = tc_add_v2(accumulator, 0xc3bf87c9u);
accumulator = tc_add_v2(accumulator, 0x1feb3f7bu);
accumulator = tc_add_v2(accumulator, 0x6f75711du);
accumulator = tc_add_v2(accumulator, 0xc5071fcbu);
accumulator = tc_add_v2(accumulator, 0x9723ad9fu);
accumulator = tc_add_v2(accumulator, 0xeb836de1u);
accumulator = tc_xor_v2(accumulator, 0x9bcb0dcfu);
accumulator = tc_add_v2(accumulator, 0xb5e7d9ddu);
accumulator = tc_xor_v2(accumulator, 0x9bf561dbu);
accumulator = tc_xor_v2(accumulator, 0x37819dedu);
accumulator = tc_xor_v2(accumulator, 0x9b2dbd41u);
accumulator = tc_xor_v2(accumulator, 0x7d3f47b9u);
accumulator = tc_xor_v2(accumulator, 0x0f459755u);
accumulator = tc_add_v2(accumulator, 0xb7e1adf3u);
accumulator = tc_add_v2(accumulator, 0x912baf1bu);
accumulator = tc_add_v2(accumulator, 0xfbc35711u);
accumulator = tc_xor_v2(accumulator, 0x7985f5d7u);
accumulator = tc_add_v2(accumulator, 0x572f4f67u);
accumulator = tc_add_v2(accumulator, 0xbd557f33u);
accumulator = tc_xor_v2(accumulator, 0x53f53745u);
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
