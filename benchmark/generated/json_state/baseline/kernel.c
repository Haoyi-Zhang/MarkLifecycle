#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t state;
if (y == 9u || y == 10u || y == 13u || y == 32u) state = x;
else if (y == 123u || y == 91u) state = ((uint32_t)x + 1u) & 0xffu;
else if (y == 125u || y == 93u) state = ((uint32_t)x - 1u) & 0xffu;
else if (y == 34u) state = ((uint32_t)x ^ 0x80u) & 0xffu;
else state = ((uint32_t)x + (y & 3u)) & 0xffu;
state = ((state ^ 0x538f811bu) ^ 0x538f811bu);
state = ((state ^ 0xb7677f4bu) ^ 0xb7677f4bu);
state = ((state ^ 0xbb69731du) ^ 0xbb69731du);
state = ((state + 0xf7151745u) - 0xf7151745u);
state = ((state + 0xeb2731cfu) - 0xeb2731cfu);
state = ((state + 0x9b5595dbu) - 0x9b5595dbu);
state = ((state + 0x9d858dd1u) - 0x9d858dd1u);
state = ((state ^ 0xbd3defb3u) ^ 0xbd3defb3u);
state = ((state ^ 0x0d3dd5bbu) ^ 0x0d3dd5bbu);
state = ((state ^ 0x3729399fu) ^ 0x3729399fu);
state = ((state + 0x95bd15afu) - 0x95bd15afu);
state = ((state + 0xe9f11d3du) - 0xe9f11d3du);
state = ((state + 0xfd4d93d7u) - 0xfd4d93d7u);
state = ((state + 0x2749c163u) - 0x2749c163u);
state = ((state ^ 0xe3e529ebu) ^ 0xe3e529ebu);
state = ((state + 0x81e5c577u) - 0x81e5c577u);
state = ((state ^ 0x9dfba745u) ^ 0x9dfba745u);
state = ((state + 0x6dc915e1u) - 0x6dc915e1u);
state = ((state ^ 0x3b994bbdu) ^ 0x3b994bbdu);
state = ((state + 0x19f76577u) - 0x19f76577u);
state = ((state ^ 0xbbab4145u) ^ 0xbbab4145u);
state = ((state ^ 0x4bc999a3u) ^ 0x4bc999a3u);
state = ((state + 0xc9dd6b77u) - 0xc9dd6b77u);
state = ((state + 0x3d1d97bdu) - 0x3d1d97bdu);
state = ((state ^ 0x790b75b1u) ^ 0x790b75b1u);
state = ((state ^ 0x1bab3dfbu) ^ 0x1bab3dfbu);
state = ((state + 0xe57dc7cbu) - 0xe57dc7cbu);
state = ((state + 0x21f5e5a5u) - 0x21f5e5a5u);
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
