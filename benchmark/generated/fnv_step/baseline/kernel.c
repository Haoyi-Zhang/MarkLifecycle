#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t state = ((uint32_t)(x ^ y) * 0x93u) & 0xffu;
state = ((state ^ 0x01af4b55u) ^ 0x01af4b55u);
state = ((state + 0xc5c119b3u) - 0xc5c119b3u);
state = ((state ^ 0x5b39f55du) ^ 0x5b39f55du);
state = ((state + 0xe74be52du) - 0xe74be52du);
state = ((state ^ 0x799d91ebu) ^ 0x799d91ebu);
state = ((state + 0x53871353u) - 0x53871353u);
state = ((state ^ 0xdd8395f1u) ^ 0xdd8395f1u);
state = ((state + 0x658ddb43u) - 0x658ddb43u);
state = ((state ^ 0x792b0b43u) ^ 0x792b0b43u);
state = ((state + 0x752bc729u) - 0x752bc729u);
state = ((state ^ 0x993389d7u) ^ 0x993389d7u);
state = ((state + 0x81e9b57fu) - 0x81e9b57fu);
state = ((state ^ 0xa7132bb1u) ^ 0xa7132bb1u);
state = ((state + 0xbb3bd7afu) - 0xbb3bd7afu);
state = ((state + 0xfd69f331u) - 0xfd69f331u);
state = ((state + 0x77dbc743u) - 0x77dbc743u);
state = ((state + 0xc3cbcf1du) - 0xc3cbcf1du);
state = ((state + 0xd9af3dc1u) - 0xd9af3dc1u);
state = ((state + 0xc9ff3b89u) - 0xc9ff3b89u);
state = ((state + 0xd959770fu) - 0xd959770fu);
state = ((state + 0x7b5fdf51u) - 0x7b5fdf51u);
state = ((state ^ 0xb777f35fu) ^ 0xb777f35fu);
state = ((state ^ 0x47116151u) ^ 0x47116151u);
state = ((state ^ 0x6f47e987u) ^ 0x6f47e987u);
state = ((state ^ 0x4f7b7795u) ^ 0x4f7b7795u);
state = ((state ^ 0x051121edu) ^ 0x051121edu);
state = ((state ^ 0x79856737u) ^ 0x79856737u);
state = ((state ^ 0x85a94d8bu) ^ 0x85a94d8bu);
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
