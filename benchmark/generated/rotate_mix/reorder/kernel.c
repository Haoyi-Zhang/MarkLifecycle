#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t r = ((((uint32_t)x << 3) | ((uint32_t)x >> 5)) & 0xffu);
uint32_t accumulator = (r ^ y ^ ((uint32_t)y >> 2)) & 0xffu;
accumulator = ((accumulator ^ 0x8541ed0bu) ^ 0x8541ed0bu);
accumulator = ((accumulator ^ 0xe5cf878bu) ^ 0xe5cf878bu);
accumulator = ((accumulator + 0x5fa5f1adu) - 0x5fa5f1adu);
accumulator = ((accumulator + 0x7f4f2b6bu) - 0x7f4f2b6bu);
accumulator = ((accumulator ^ 0x0d83033bu) ^ 0x0d83033bu);
accumulator = ((accumulator ^ 0x71fde3c1u) ^ 0x71fde3c1u);
accumulator = ((accumulator + 0x6db1e797u) - 0x6db1e797u);
accumulator = ((accumulator + 0x59734fffu) - 0x59734fffu);
accumulator = ((accumulator ^ 0x01d3291fu) ^ 0x01d3291fu);
accumulator = ((accumulator ^ 0xa30b2f65u) ^ 0xa30b2f65u);
accumulator = ((accumulator + 0xd975cd4du) - 0xd975cd4du);
accumulator = ((accumulator ^ 0xb7bd9dcdu) ^ 0xb7bd9dcdu);
accumulator = ((accumulator ^ 0x4bcfb9e3u) ^ 0x4bcfb9e3u);
accumulator = ((accumulator ^ 0x63c58159u) ^ 0x63c58159u);
accumulator = ((accumulator ^ 0x0525437fu) ^ 0x0525437fu);
accumulator = ((accumulator + 0x7d352fddu) - 0x7d352fddu);
accumulator = ((accumulator + 0x3b0f7323u) - 0x3b0f7323u);
accumulator = ((accumulator ^ 0x7b09af43u) ^ 0x7b09af43u);
accumulator = ((accumulator + 0x4d5d717du) - 0x4d5d717du);
accumulator = ((accumulator + 0x5be3312du) - 0x5be3312du);
accumulator = ((accumulator ^ 0x23fbf5a1u) ^ 0x23fbf5a1u);
accumulator = ((accumulator + 0xdf650d05u) - 0xdf650d05u);
accumulator = ((accumulator + 0x95b70fd7u) - 0x95b70fd7u);
accumulator = ((accumulator ^ 0x7d113d99u) ^ 0x7d113d99u);
accumulator = ((accumulator ^ 0x7741d955u) ^ 0x7741d955u);
accumulator = ((accumulator ^ 0xeda719bdu) ^ 0xeda719bdu);
accumulator = ((accumulator ^ 0x85a32b3du) ^ 0x85a32b3du);
accumulator = ((accumulator ^ 0x276b7775u) ^ 0x276b7775u);
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
