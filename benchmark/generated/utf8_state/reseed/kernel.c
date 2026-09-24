#include <stdint.h>
#include <stdio.h>
static __attribute__((noinline)) uint32_t tc_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }
static __attribute__((noinline)) uint32_t tc_xor_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t accumulator;
if (x != 0u) accumulator = ((y & 0xc0u) == 0x80u) ? (((uint32_t)x - 1u) & 0xffu) : 0xffu;
else if (y < 0x80u) accumulator = 0u;
else if (y >= 0xc2u && y <= 0xdfu) accumulator = 1u;
else if (y >= 0xe0u && y <= 0xefu) accumulator = 2u;
else if (y >= 0xf0u && y <= 0xf4u) accumulator = 3u;
else accumulator = 0xffu;
accumulator = tc_add_v2(accumulator, 0x77c7b377u);
accumulator = tc_add_v2(accumulator, 0x6dfdfb99u);
accumulator = tc_add_v2(accumulator, 0x214fd9a1u);
accumulator = tc_add_v2(accumulator, 0x65fdf3b3u);
accumulator = tc_xor_v2(accumulator, 0xab7da5cbu);
accumulator = tc_add_v2(accumulator, 0xf7f31ff7u);
accumulator = tc_xor_v2(accumulator, 0x43212b9du);
accumulator = tc_xor_v2(accumulator, 0xef9b5b39u);
accumulator = tc_xor_v2(accumulator, 0x6973d19du);
accumulator = tc_xor_v2(accumulator, 0xadef8f1fu);
accumulator = tc_xor_v2(accumulator, 0xf9a527f1u);
accumulator = tc_xor_v2(accumulator, 0x475fd75du);
accumulator = tc_add_v2(accumulator, 0xc71f85f3u);
accumulator = tc_add_v2(accumulator, 0x5dddd9d5u);
accumulator = tc_add_v2(accumulator, 0xd9cb6155u);
accumulator = tc_add_v2(accumulator, 0x1b75f537u);
accumulator = tc_add_v2(accumulator, 0x53af6b53u);
accumulator = tc_xor_v2(accumulator, 0x8b638d05u);
accumulator = tc_add_v2(accumulator, 0x79f5cd19u);
accumulator = tc_xor_v2(accumulator, 0xf153016du);
accumulator = tc_add_v2(accumulator, 0x735331d7u);
accumulator = tc_xor_v2(accumulator, 0x45bb9145u);
accumulator = tc_xor_v2(accumulator, 0x5d13f57fu);
accumulator = tc_xor_v2(accumulator, 0x83956d35u);
accumulator = tc_add_v2(accumulator, 0xe3ed1df1u);
accumulator = tc_add_v2(accumulator, 0x8b5d31f9u);
accumulator = tc_xor_v2(accumulator, 0xc3bdebf7u);
accumulator = tc_xor_v2(accumulator, 0x97b3dbe9u);
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
