#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t r = ((((uint32_t)x << 3) | ((uint32_t)x >> 5)) & 0xffu);
uint32_t state = (r ^ y ^ ((uint32_t)y >> 2)) & 0xffu;
state = ((state ^ 0x8541ed0bu) ^ 0x8541ed0bu);
state = ((state ^ 0x0525437fu) ^ 0x0525437fu);
state = ((state ^ 0xe5cf878bu) ^ 0xe5cf878bu);
state = ((state + 0x7d352fddu) - 0x7d352fddu);
state = ((state + 0x5fa5f1adu) - 0x5fa5f1adu);
state = ((state + 0x3b0f7323u) - 0x3b0f7323u);
state = ((state + 0x7f4f2b6bu) - 0x7f4f2b6bu);
state = ((state ^ 0x7b09af43u) ^ 0x7b09af43u);
state = ((state ^ 0x0d83033bu) ^ 0x0d83033bu);
state = ((state + 0x4d5d717du) - 0x4d5d717du);
state = ((state ^ 0x71fde3c1u) ^ 0x71fde3c1u);
state = ((state + 0x5be3312du) - 0x5be3312du);
state = ((state + 0x6db1e797u) - 0x6db1e797u);
state = ((state ^ 0x23fbf5a1u) ^ 0x23fbf5a1u);
state = ((state + 0x59734fffu) - 0x59734fffu);
state = ((state + 0xdf650d05u) - 0xdf650d05u);
state = ((state ^ 0x01d3291fu) ^ 0x01d3291fu);
state = ((state + 0x95b70fd7u) - 0x95b70fd7u);
state = ((state ^ 0xa30b2f65u) ^ 0xa30b2f65u);
state = ((state ^ 0x7d113d99u) ^ 0x7d113d99u);
state = ((state + 0xd975cd4du) - 0xd975cd4du);
state = ((state ^ 0x7741d955u) ^ 0x7741d955u);
state = ((state ^ 0xb7bd9dcdu) ^ 0xb7bd9dcdu);
state = ((state ^ 0xeda719bdu) ^ 0xeda719bdu);
state = ((state ^ 0x4bcfb9e3u) ^ 0x4bcfb9e3u);
state = ((state ^ 0x85a32b3du) ^ 0x85a32b3du);
state = ((state ^ 0x63c58159u) ^ 0x63c58159u);
state = ((state ^ 0x276b7775u) ^ 0x276b7775u);
return (uint8_t)(state & 0xffu);
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
