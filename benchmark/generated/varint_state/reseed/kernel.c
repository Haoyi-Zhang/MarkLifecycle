#include <stdint.h>
#include <stdio.h>
static __attribute__((noinline)) uint32_t tc_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }
static __attribute__((noinline)) uint32_t tc_xor_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t accumulator = (y & 0x80u) ? ((((uint32_t)x << 1) ^ (y & 0x7fu)) & 0xffu) : (((uint32_t)x + y) & 0xffu);
accumulator = tc_add_v2(accumulator, 0xb115070bu);
accumulator = tc_add_v2(accumulator, 0x43d5675fu);
accumulator = tc_xor_v2(accumulator, 0xe1b7736bu);
accumulator = tc_xor_v2(accumulator, 0x2fed7f8bu);
accumulator = tc_xor_v2(accumulator, 0xd7b7f9b5u);
accumulator = tc_add_v2(accumulator, 0xcf09fd71u);
accumulator = tc_add_v2(accumulator, 0xa521ad89u);
accumulator = tc_add_v2(accumulator, 0xd359ed79u);
accumulator = tc_add_v2(accumulator, 0x1f630b9fu);
accumulator = tc_xor_v2(accumulator, 0xefb35d25u);
accumulator = tc_xor_v2(accumulator, 0x6be14987u);
accumulator = tc_xor_v2(accumulator, 0x1fd72b3fu);
accumulator = tc_add_v2(accumulator, 0x39915b11u);
accumulator = tc_xor_v2(accumulator, 0xafefab59u);
accumulator = tc_add_v2(accumulator, 0x9d816195u);
accumulator = tc_xor_v2(accumulator, 0x77bb3175u);
accumulator = tc_xor_v2(accumulator, 0x659501cfu);
accumulator = tc_add_v2(accumulator, 0x6dd36119u);
accumulator = tc_add_v2(accumulator, 0xc39191edu);
accumulator = tc_xor_v2(accumulator, 0xb947879bu);
accumulator = tc_xor_v2(accumulator, 0x255f2149u);
accumulator = tc_xor_v2(accumulator, 0x058d97a9u);
accumulator = tc_add_v2(accumulator, 0x7343eba7u);
accumulator = tc_add_v2(accumulator, 0x97d9ebebu);
accumulator = tc_xor_v2(accumulator, 0x33ebfbf5u);
accumulator = tc_add_v2(accumulator, 0x89dbe7abu);
accumulator = tc_xor_v2(accumulator, 0xcf67bbcdu);
accumulator = tc_add_v2(accumulator, 0x99ebab01u);
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
