#include <stdint.h>
#include <stdio.h>
static __attribute__((noinline)) uint32_t tc_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }
static __attribute__((noinline)) uint32_t tc_xor_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t r = ((((uint32_t)x << 3) | ((uint32_t)x >> 5)) & 0xffu);
uint32_t accumulator = (r ^ y ^ ((uint32_t)y >> 2)) & 0xffu;
accumulator = tc_xor_v2(accumulator, 0xcff93501u);
accumulator = tc_xor_v2(accumulator, 0xab19233bu);
accumulator = tc_add_v2(accumulator, 0xc769a14fu);
accumulator = tc_add_v2(accumulator, 0xeff13b33u);
accumulator = tc_xor_v2(accumulator, 0xa3877bbbu);
accumulator = tc_xor_v2(accumulator, 0xeb6b83cdu);
accumulator = tc_add_v2(accumulator, 0x15a30701u);
accumulator = tc_add_v2(accumulator, 0xa7b76f85u);
accumulator = tc_xor_v2(accumulator, 0x5fe57173u);
accumulator = tc_xor_v2(accumulator, 0xbb7f23f9u);
accumulator = tc_add_v2(accumulator, 0xab3dcb63u);
accumulator = tc_xor_v2(accumulator, 0x6b818b1du);
accumulator = tc_xor_v2(accumulator, 0xab71cd6fu);
accumulator = tc_xor_v2(accumulator, 0xc10d97e7u);
accumulator = tc_xor_v2(accumulator, 0x2f334903u);
accumulator = tc_add_v2(accumulator, 0x096f7f75u);
accumulator = tc_add_v2(accumulator, 0xe1af730fu);
accumulator = tc_xor_v2(accumulator, 0xe545734bu);
accumulator = tc_add_v2(accumulator, 0x8739d9edu);
accumulator = tc_add_v2(accumulator, 0x090db5d7u);
accumulator = tc_xor_v2(accumulator, 0x9ff517a3u);
accumulator = tc_add_v2(accumulator, 0xdf4d6ff7u);
accumulator = tc_add_v2(accumulator, 0x43bf859fu);
accumulator = tc_xor_v2(accumulator, 0xa5f759afu);
accumulator = tc_xor_v2(accumulator, 0xc18925c7u);
accumulator = tc_xor_v2(accumulator, 0xd55b5fa9u);
accumulator = tc_xor_v2(accumulator, 0x17858785u);
accumulator = tc_xor_v2(accumulator, 0xfddf8171u);
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
