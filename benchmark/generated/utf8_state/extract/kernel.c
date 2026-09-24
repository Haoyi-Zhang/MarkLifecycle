#include <stdint.h>
#include <stdio.h>
static __attribute__((noinline)) uint32_t tc_add_v1(uint32_t v, uint32_t k) { return (v + k) - k; }
static __attribute__((noinline)) uint32_t tc_xor_v1(uint32_t v, uint32_t k) { return (v ^ k) ^ k; }

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t accumulator;
if (x != 0u) accumulator = ((y & 0xc0u) == 0x80u) ? (((uint32_t)x - 1u) & 0xffu) : 0xffu;
else if (y < 0x80u) accumulator = 0u;
else if (y >= 0xc2u && y <= 0xdfu) accumulator = 1u;
else if (y >= 0xe0u && y <= 0xefu) accumulator = 2u;
else if (y >= 0xf0u && y <= 0xf4u) accumulator = 3u;
else accumulator = 0xffu;
accumulator = tc_add_v1(accumulator, 0xe325ff79u);
accumulator = tc_add_v1(accumulator, 0x55bde333u);
accumulator = tc_add_v1(accumulator, 0xfd75c923u);
accumulator = tc_add_v1(accumulator, 0x8fdfbd19u);
accumulator = tc_xor_v1(accumulator, 0xabc70b9du);
accumulator = tc_add_v1(accumulator, 0x89a37959u);
accumulator = tc_xor_v1(accumulator, 0xd9756b93u);
accumulator = tc_xor_v1(accumulator, 0x2da99b87u);
accumulator = tc_xor_v1(accumulator, 0x2991d35bu);
accumulator = tc_xor_v1(accumulator, 0xb79f4f7bu);
accumulator = tc_xor_v1(accumulator, 0xc90b9bf3u);
accumulator = tc_xor_v1(accumulator, 0xc52bd3f5u);
accumulator = tc_add_v1(accumulator, 0x9b71310du);
accumulator = tc_add_v1(accumulator, 0x296523cbu);
accumulator = tc_add_v1(accumulator, 0xc56b4919u);
accumulator = tc_add_v1(accumulator, 0x2129879du);
accumulator = tc_add_v1(accumulator, 0xabcf8945u);
accumulator = tc_xor_v1(accumulator, 0x7f3f9d57u);
accumulator = tc_add_v1(accumulator, 0x69f1dbc7u);
accumulator = tc_xor_v1(accumulator, 0x1b6f2dcbu);
accumulator = tc_add_v1(accumulator, 0xbf737d7du);
accumulator = tc_xor_v1(accumulator, 0xcf33fb3fu);
accumulator = tc_xor_v1(accumulator, 0xdf138ba7u);
accumulator = tc_xor_v1(accumulator, 0xd703033du);
accumulator = tc_add_v1(accumulator, 0xf76fbb7bu);
accumulator = tc_add_v1(accumulator, 0xef81178fu);
accumulator = tc_xor_v1(accumulator, 0xa99523abu);
accumulator = tc_xor_v1(accumulator, 0x8123ed2fu);
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
