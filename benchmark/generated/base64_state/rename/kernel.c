#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t v;
if (y >= 65u && y <= 90u) v = y - 65u;
else if (y >= 97u && y <= 122u) v = y - 71u;
else if (y >= 48u && y <= 57u) v = y + 4u;
else if (y == 43u) v = 62u;
else if (y == 47u) v = 63u;
else v = 0xffu;
uint32_t accumulator = (v ^ x) & 0xffu;
accumulator = ((accumulator + 0x976f2193u) - 0x976f2193u);
accumulator = ((accumulator + 0x31e1fbafu) - 0x31e1fbafu);
accumulator = ((accumulator ^ 0xfd61ef63u) ^ 0xfd61ef63u);
accumulator = ((accumulator + 0xfd1711a1u) - 0xfd1711a1u);
accumulator = ((accumulator ^ 0x914fa5d9u) ^ 0x914fa5d9u);
accumulator = ((accumulator ^ 0x51a56999u) ^ 0x51a56999u);
accumulator = ((accumulator + 0xab59132bu) - 0xab59132bu);
accumulator = ((accumulator + 0xb5afe31bu) - 0xb5afe31bu);
accumulator = ((accumulator ^ 0xdf134729u) ^ 0xdf134729u);
accumulator = ((accumulator + 0xa195b119u) - 0xa195b119u);
accumulator = ((accumulator ^ 0x9da9675du) ^ 0x9da9675du);
accumulator = ((accumulator + 0xad7327c7u) - 0xad7327c7u);
accumulator = ((accumulator ^ 0xe5939f35u) ^ 0xe5939f35u);
accumulator = ((accumulator + 0xfd51efc3u) - 0xfd51efc3u);
accumulator = ((accumulator + 0x9b7f9dd5u) - 0x9b7f9dd5u);
accumulator = ((accumulator + 0x7f738b6du) - 0x7f738b6du);
accumulator = ((accumulator + 0x91b7e999u) - 0x91b7e999u);
accumulator = ((accumulator + 0xad2de779u) - 0xad2de779u);
accumulator = ((accumulator + 0xc53fcbabu) - 0xc53fcbabu);
accumulator = ((accumulator + 0xe3c3412bu) - 0xe3c3412bu);
accumulator = ((accumulator + 0x5df5110du) - 0x5df5110du);
accumulator = ((accumulator + 0x99996983u) - 0x99996983u);
accumulator = ((accumulator + 0xb9ed6b1fu) - 0xb9ed6b1fu);
accumulator = ((accumulator ^ 0x89617d07u) ^ 0x89617d07u);
accumulator = ((accumulator ^ 0x4f4bfb59u) ^ 0x4f4bfb59u);
accumulator = ((accumulator + 0x67fb5963u) - 0x67fb5963u);
accumulator = ((accumulator + 0xab47adcdu) - 0xab47adcdu);
accumulator = ((accumulator ^ 0x896bd3adu) ^ 0x896bd3adu);
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
