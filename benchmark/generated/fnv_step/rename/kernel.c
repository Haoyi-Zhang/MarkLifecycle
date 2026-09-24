#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t accumulator = ((uint32_t)(x ^ y) * 0x93u) & 0xffu;
accumulator = ((accumulator ^ 0x01af4b55u) ^ 0x01af4b55u);
accumulator = ((accumulator + 0xc5c119b3u) - 0xc5c119b3u);
accumulator = ((accumulator ^ 0x5b39f55du) ^ 0x5b39f55du);
accumulator = ((accumulator + 0xe74be52du) - 0xe74be52du);
accumulator = ((accumulator ^ 0x799d91ebu) ^ 0x799d91ebu);
accumulator = ((accumulator + 0x53871353u) - 0x53871353u);
accumulator = ((accumulator ^ 0xdd8395f1u) ^ 0xdd8395f1u);
accumulator = ((accumulator + 0x658ddb43u) - 0x658ddb43u);
accumulator = ((accumulator ^ 0x792b0b43u) ^ 0x792b0b43u);
accumulator = ((accumulator + 0x752bc729u) - 0x752bc729u);
accumulator = ((accumulator ^ 0x993389d7u) ^ 0x993389d7u);
accumulator = ((accumulator + 0x81e9b57fu) - 0x81e9b57fu);
accumulator = ((accumulator ^ 0xa7132bb1u) ^ 0xa7132bb1u);
accumulator = ((accumulator + 0xbb3bd7afu) - 0xbb3bd7afu);
accumulator = ((accumulator + 0xfd69f331u) - 0xfd69f331u);
accumulator = ((accumulator + 0x77dbc743u) - 0x77dbc743u);
accumulator = ((accumulator + 0xc3cbcf1du) - 0xc3cbcf1du);
accumulator = ((accumulator + 0xd9af3dc1u) - 0xd9af3dc1u);
accumulator = ((accumulator + 0xc9ff3b89u) - 0xc9ff3b89u);
accumulator = ((accumulator + 0xd959770fu) - 0xd959770fu);
accumulator = ((accumulator + 0x7b5fdf51u) - 0x7b5fdf51u);
accumulator = ((accumulator ^ 0xb777f35fu) ^ 0xb777f35fu);
accumulator = ((accumulator ^ 0x47116151u) ^ 0x47116151u);
accumulator = ((accumulator ^ 0x6f47e987u) ^ 0x6f47e987u);
accumulator = ((accumulator ^ 0x4f7b7795u) ^ 0x4f7b7795u);
accumulator = ((accumulator ^ 0x051121edu) ^ 0x051121edu);
accumulator = ((accumulator ^ 0x79856737u) ^ 0x79856737u);
accumulator = ((accumulator ^ 0x85a94d8bu) ^ 0x85a94d8bu);
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
