#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t d = y % 10u;
if (x & 1u) { d *= 2u; if (d > 9u) d -= 9u; }
uint32_t accumulator = ((uint32_t)x + d) & 0xffu;
accumulator = ((accumulator ^ 0xfb030f59u) ^ 0xfb030f59u);
accumulator = ((accumulator ^ 0x6593777bu) ^ 0x6593777bu);
accumulator = ((accumulator + 0x37bf9961u) - 0x37bf9961u);
accumulator = ((accumulator ^ 0xbd9b9b1du) ^ 0xbd9b9b1du);
accumulator = ((accumulator + 0xe193f1bbu) - 0xe193f1bbu);
accumulator = ((accumulator + 0xa5b5e7bbu) - 0xa5b5e7bbu);
accumulator = ((accumulator ^ 0x19d12d3bu) ^ 0x19d12d3bu);
accumulator = ((accumulator + 0xe3751739u) - 0xe3751739u);
accumulator = ((accumulator ^ 0x43cb09bbu) ^ 0x43cb09bbu);
accumulator = ((accumulator + 0xfb858fddu) - 0xfb858fddu);
accumulator = ((accumulator + 0xf9e7dfb7u) - 0xf9e7dfb7u);
accumulator = ((accumulator ^ 0x7b6be97bu) ^ 0x7b6be97bu);
accumulator = ((accumulator + 0x394197d9u) - 0x394197d9u);
accumulator = ((accumulator ^ 0xfd574303u) ^ 0xfd574303u);
accumulator = ((accumulator ^ 0x5df939cdu) ^ 0x5df939cdu);
accumulator = ((accumulator + 0xfbc7839du) - 0xfbc7839du);
accumulator = ((accumulator ^ 0x4f41f5e5u) ^ 0x4f41f5e5u);
accumulator = ((accumulator + 0xe1611329u) - 0xe1611329u);
accumulator = ((accumulator ^ 0x5dadcd99u) ^ 0x5dadcd99u);
accumulator = ((accumulator + 0xbbfb959bu) - 0xbbfb959bu);
accumulator = ((accumulator ^ 0x57193f75u) ^ 0x57193f75u);
accumulator = ((accumulator + 0x35f39fd7u) - 0x35f39fd7u);
accumulator = ((accumulator ^ 0x3bc9a157u) ^ 0x3bc9a157u);
accumulator = ((accumulator + 0x690fedb7u) - 0x690fedb7u);
accumulator = ((accumulator + 0x8151b193u) - 0x8151b193u);
accumulator = ((accumulator ^ 0x53e725b3u) ^ 0x53e725b3u);
accumulator = ((accumulator + 0xe77fb3e7u) - 0xe77fb3e7u);
accumulator = ((accumulator ^ 0x53016f4bu) ^ 0x53016f4bu);
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
