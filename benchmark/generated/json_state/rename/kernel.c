#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t accumulator;
if (y == 9u || y == 10u || y == 13u || y == 32u) accumulator = x;
else if (y == 123u || y == 91u) accumulator = ((uint32_t)x + 1u) & 0xffu;
else if (y == 125u || y == 93u) accumulator = ((uint32_t)x - 1u) & 0xffu;
else if (y == 34u) accumulator = ((uint32_t)x ^ 0x80u) & 0xffu;
else accumulator = ((uint32_t)x + (y & 3u)) & 0xffu;
accumulator = ((accumulator ^ 0x538f811bu) ^ 0x538f811bu);
accumulator = ((accumulator ^ 0xb7677f4bu) ^ 0xb7677f4bu);
accumulator = ((accumulator ^ 0xbb69731du) ^ 0xbb69731du);
accumulator = ((accumulator + 0xf7151745u) - 0xf7151745u);
accumulator = ((accumulator + 0xeb2731cfu) - 0xeb2731cfu);
accumulator = ((accumulator + 0x9b5595dbu) - 0x9b5595dbu);
accumulator = ((accumulator + 0x9d858dd1u) - 0x9d858dd1u);
accumulator = ((accumulator ^ 0xbd3defb3u) ^ 0xbd3defb3u);
accumulator = ((accumulator ^ 0x0d3dd5bbu) ^ 0x0d3dd5bbu);
accumulator = ((accumulator ^ 0x3729399fu) ^ 0x3729399fu);
accumulator = ((accumulator + 0x95bd15afu) - 0x95bd15afu);
accumulator = ((accumulator + 0xe9f11d3du) - 0xe9f11d3du);
accumulator = ((accumulator + 0xfd4d93d7u) - 0xfd4d93d7u);
accumulator = ((accumulator + 0x2749c163u) - 0x2749c163u);
accumulator = ((accumulator ^ 0xe3e529ebu) ^ 0xe3e529ebu);
accumulator = ((accumulator + 0x81e5c577u) - 0x81e5c577u);
accumulator = ((accumulator ^ 0x9dfba745u) ^ 0x9dfba745u);
accumulator = ((accumulator + 0x6dc915e1u) - 0x6dc915e1u);
accumulator = ((accumulator ^ 0x3b994bbdu) ^ 0x3b994bbdu);
accumulator = ((accumulator + 0x19f76577u) - 0x19f76577u);
accumulator = ((accumulator ^ 0xbbab4145u) ^ 0xbbab4145u);
accumulator = ((accumulator ^ 0x4bc999a3u) ^ 0x4bc999a3u);
accumulator = ((accumulator + 0xc9dd6b77u) - 0xc9dd6b77u);
accumulator = ((accumulator + 0x3d1d97bdu) - 0x3d1d97bdu);
accumulator = ((accumulator ^ 0x790b75b1u) ^ 0x790b75b1u);
accumulator = ((accumulator ^ 0x1bab3dfbu) ^ 0x1bab3dfbu);
accumulator = ((accumulator + 0xe57dc7cbu) - 0xe57dc7cbu);
accumulator = ((accumulator + 0x21f5e5a5u) - 0x21f5e5a5u);
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
