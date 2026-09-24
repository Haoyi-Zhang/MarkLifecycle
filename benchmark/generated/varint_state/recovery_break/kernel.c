#include <stdint.h>
#include <stdio.h>
static __attribute__((noinline)) uint32_t tc_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }
static __attribute__((noinline)) uint32_t tc_xor_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t accumulator = (y & 0x80u) ? ((((uint32_t)x << 1) ^ (y & 0x7fu)) & 0xffu) : (((uint32_t)x + y) & 0xffu);
accumulator = tc_xor_v2(accumulator, 0x17cd05c5u);
accumulator = tc_xor_v2(accumulator, 0x53e9bb03u);
accumulator = tc_xor_v2(accumulator, 0xd1ff3919u);
accumulator = tc_add_v2(accumulator, 0x01f5fb83u);
accumulator = tc_add_v2(accumulator, 0xb7b3b731u);
accumulator = tc_xor_v2(accumulator, 0xf32f7747u);
accumulator = tc_xor_v2(accumulator, 0x117157b5u);
accumulator = tc_xor_v2(accumulator, 0x3f45c185u);
accumulator = tc_add_v2(accumulator, 0x17cf9dabu);
accumulator = tc_add_v2(accumulator, 0xe5cbf7f5u);
accumulator = tc_xor_v2(accumulator, 0xc56f21efu);
accumulator = tc_add_v2(accumulator, 0x8d9557bfu);
accumulator = tc_xor_v2(accumulator, 0xef7faf0du);
accumulator = tc_add_v2(accumulator, 0x81d9a9e1u);
accumulator = tc_add_v2(accumulator, 0x33e34f51u);
accumulator = tc_xor_v2(accumulator, 0x79b9990du);
accumulator = tc_xor_v2(accumulator, 0xb761bb13u);
accumulator = tc_xor_v2(accumulator, 0x71eb3147u);
accumulator = tc_add_v2(accumulator, 0xc9c56ddfu);
accumulator = tc_add_v2(accumulator, 0x979d5d2fu);
accumulator = tc_add_v2(accumulator, 0xb1db6705u);
accumulator = tc_add_v2(accumulator, 0x21c1fb1du);
accumulator = tc_xor_v2(accumulator, 0x9b63a5f9u);
accumulator = tc_xor_v2(accumulator, 0x2fd9e5b7u);
accumulator = tc_xor_v2(accumulator, 0x17773d57u);
accumulator = tc_add_v2(accumulator, 0x730103f7u);
accumulator = tc_xor_v2(accumulator, 0x4d3de753u);
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
