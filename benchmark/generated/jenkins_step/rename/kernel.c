#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t accumulator = ((uint32_t)x + y) & 0xffu;
accumulator = (accumulator + ((accumulator << 3) & 0xffu)) & 0xffu;
accumulator ^= accumulator >> 4;
accumulator = (accumulator * 0x1bu) & 0xffu;
accumulator ^= accumulator >> 3;
accumulator = ((accumulator + 0xbb672da5u) - 0xbb672da5u);
accumulator = ((accumulator ^ 0x71af493bu) ^ 0x71af493bu);
accumulator = ((accumulator + 0x758f1dfbu) - 0x758f1dfbu);
accumulator = ((accumulator + 0xe52b7145u) - 0xe52b7145u);
accumulator = ((accumulator ^ 0xf53f731fu) ^ 0xf53f731fu);
accumulator = ((accumulator + 0x0b41d799u) - 0x0b41d799u);
accumulator = ((accumulator ^ 0x671f57cdu) ^ 0x671f57cdu);
accumulator = ((accumulator ^ 0xbbf1ff93u) ^ 0xbbf1ff93u);
accumulator = ((accumulator ^ 0xd71fafd3u) ^ 0xd71fafd3u);
accumulator = ((accumulator + 0x8521fb0du) - 0x8521fb0du);
accumulator = ((accumulator + 0x4f8b4901u) - 0x4f8b4901u);
accumulator = ((accumulator ^ 0x6f614fabu) ^ 0x6f614fabu);
accumulator = ((accumulator ^ 0xbf339db9u) ^ 0xbf339db9u);
accumulator = ((accumulator + 0xe1fdfb5du) - 0xe1fdfb5du);
accumulator = ((accumulator ^ 0x4f2b63cbu) ^ 0x4f2b63cbu);
accumulator = ((accumulator + 0x97b1930bu) - 0x97b1930bu);
accumulator = ((accumulator + 0x5159d3bbu) - 0x5159d3bbu);
accumulator = ((accumulator ^ 0x2d831335u) ^ 0x2d831335u);
accumulator = ((accumulator ^ 0x3325e549u) ^ 0x3325e549u);
accumulator = ((accumulator + 0x55eb57b5u) - 0x55eb57b5u);
accumulator = ((accumulator + 0xc91385ffu) - 0xc91385ffu);
accumulator = ((accumulator ^ 0xedf13bf1u) ^ 0xedf13bf1u);
accumulator = ((accumulator ^ 0x2f115d5bu) ^ 0x2f115d5bu);
accumulator = ((accumulator + 0x4973d757u) - 0x4973d757u);
accumulator = ((accumulator ^ 0x6545db39u) ^ 0x6545db39u);
accumulator = ((accumulator + 0x0f3975cbu) - 0x0f3975cbu);
accumulator = ((accumulator + 0x97cd115du) - 0x97cd115du);
accumulator = ((accumulator ^ 0xf1bb253du) ^ 0xf1bb253du);
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
