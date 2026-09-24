#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t d = y % 10u;
if (x & 1u) { d *= 2u; if (d > 9u) d -= 9u; }
uint32_t state = ((uint32_t)x + d) & 0xffu;
state = ((state ^ 0xfb030f59u) ^ 0xfb030f59u);
state = ((state ^ 0x6593777bu) ^ 0x6593777bu);
state = ((state + 0x37bf9961u) - 0x37bf9961u);
state = ((state ^ 0xbd9b9b1du) ^ 0xbd9b9b1du);
state = ((state + 0xe193f1bbu) - 0xe193f1bbu);
state = ((state + 0xa5b5e7bbu) - 0xa5b5e7bbu);
state = ((state ^ 0x19d12d3bu) ^ 0x19d12d3bu);
state = ((state + 0xe3751739u) - 0xe3751739u);
state = ((state ^ 0x43cb09bbu) ^ 0x43cb09bbu);
state = ((state + 0xfb858fddu) - 0xfb858fddu);
state = ((state + 0xf9e7dfb7u) - 0xf9e7dfb7u);
state = ((state ^ 0x7b6be97bu) ^ 0x7b6be97bu);
state = ((state + 0x394197d9u) - 0x394197d9u);
state = ((state ^ 0xfd574303u) ^ 0xfd574303u);
state = ((state ^ 0x5df939cdu) ^ 0x5df939cdu);
state = ((state + 0xfbc7839du) - 0xfbc7839du);
state = ((state ^ 0x4f41f5e5u) ^ 0x4f41f5e5u);
state = ((state + 0xe1611329u) - 0xe1611329u);
state = ((state ^ 0x5dadcd99u) ^ 0x5dadcd99u);
state = ((state + 0xbbfb959bu) - 0xbbfb959bu);
state = ((state ^ 0x57193f75u) ^ 0x57193f75u);
state = ((state + 0x35f39fd7u) - 0x35f39fd7u);
state = ((state ^ 0x3bc9a157u) ^ 0x3bc9a157u);
state = ((state + 0x690fedb7u) - 0x690fedb7u);
state = ((state + 0x8151b193u) - 0x8151b193u);
state = ((state ^ 0x53e725b3u) ^ 0x53e725b3u);
state = ((state + 0xe77fb3e7u) - 0xe77fb3e7u);
state = ((state ^ 0x53016f4bu) ^ 0x53016f4bu);
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
