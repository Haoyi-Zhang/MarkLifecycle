#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t state = ((uint32_t)x + y) & 0xffu;
state = (state + ((state << 3) & 0xffu)) & 0xffu;
state ^= state >> 4;
state = (state * 0x1bu) & 0xffu;
state ^= state >> 3;
state = ((state + 0xbb672da5u) - 0xbb672da5u);
state = ((state ^ 0x71af493bu) ^ 0x71af493bu);
state = ((state + 0x758f1dfbu) - 0x758f1dfbu);
state = ((state + 0xe52b7145u) - 0xe52b7145u);
state = ((state ^ 0xf53f731fu) ^ 0xf53f731fu);
state = ((state + 0x0b41d799u) - 0x0b41d799u);
state = ((state ^ 0x671f57cdu) ^ 0x671f57cdu);
state = ((state ^ 0xbbf1ff93u) ^ 0xbbf1ff93u);
state = ((state ^ 0xd71fafd3u) ^ 0xd71fafd3u);
state = ((state + 0x8521fb0du) - 0x8521fb0du);
state = ((state + 0x4f8b4901u) - 0x4f8b4901u);
state = ((state ^ 0x6f614fabu) ^ 0x6f614fabu);
state = ((state ^ 0xbf339db9u) ^ 0xbf339db9u);
state = ((state + 0xe1fdfb5du) - 0xe1fdfb5du);
state = ((state ^ 0x4f2b63cbu) ^ 0x4f2b63cbu);
state = ((state + 0x97b1930bu) - 0x97b1930bu);
state = ((state + 0x5159d3bbu) - 0x5159d3bbu);
state = ((state ^ 0x2d831335u) ^ 0x2d831335u);
state = ((state ^ 0x3325e549u) ^ 0x3325e549u);
state = ((state + 0x55eb57b5u) - 0x55eb57b5u);
state = ((state + 0xc91385ffu) - 0xc91385ffu);
state = ((state ^ 0xedf13bf1u) ^ 0xedf13bf1u);
state = ((state ^ 0x2f115d5bu) ^ 0x2f115d5bu);
state = ((state + 0x4973d757u) - 0x4973d757u);
state = ((state ^ 0x6545db39u) ^ 0x6545db39u);
state = ((state + 0x0f3975cbu) - 0x0f3975cbu);
state = ((state + 0x97cd115du) - 0x97cd115du);
state = ((state ^ 0xf1bb253du) ^ 0xf1bb253du);
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
