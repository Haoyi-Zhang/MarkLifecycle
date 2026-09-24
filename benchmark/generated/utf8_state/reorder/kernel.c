#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t accumulator;
if (x != 0u) accumulator = ((y & 0xc0u) == 0x80u) ? (((uint32_t)x - 1u) & 0xffu) : 0xffu;
else if (y < 0x80u) accumulator = 0u;
else if (y >= 0xc2u && y <= 0xdfu) accumulator = 1u;
else if (y >= 0xe0u && y <= 0xefu) accumulator = 2u;
else if (y >= 0xf0u && y <= 0xf4u) accumulator = 3u;
else accumulator = 0xffu;
accumulator = ((accumulator + 0xe325ff79u) - 0xe325ff79u);
accumulator = ((accumulator + 0x55bde333u) - 0x55bde333u);
accumulator = ((accumulator + 0xfd75c923u) - 0xfd75c923u);
accumulator = ((accumulator + 0x8fdfbd19u) - 0x8fdfbd19u);
accumulator = ((accumulator ^ 0xabc70b9du) ^ 0xabc70b9du);
accumulator = ((accumulator + 0x89a37959u) - 0x89a37959u);
accumulator = ((accumulator ^ 0xd9756b93u) ^ 0xd9756b93u);
accumulator = ((accumulator ^ 0x2da99b87u) ^ 0x2da99b87u);
accumulator = ((accumulator ^ 0x2991d35bu) ^ 0x2991d35bu);
accumulator = ((accumulator ^ 0xb79f4f7bu) ^ 0xb79f4f7bu);
accumulator = ((accumulator ^ 0xc90b9bf3u) ^ 0xc90b9bf3u);
accumulator = ((accumulator ^ 0xc52bd3f5u) ^ 0xc52bd3f5u);
accumulator = ((accumulator + 0x9b71310du) - 0x9b71310du);
accumulator = ((accumulator + 0x296523cbu) - 0x296523cbu);
accumulator = ((accumulator + 0xc56b4919u) - 0xc56b4919u);
accumulator = ((accumulator + 0x2129879du) - 0x2129879du);
accumulator = ((accumulator + 0xabcf8945u) - 0xabcf8945u);
accumulator = ((accumulator ^ 0x7f3f9d57u) ^ 0x7f3f9d57u);
accumulator = ((accumulator + 0x69f1dbc7u) - 0x69f1dbc7u);
accumulator = ((accumulator ^ 0x1b6f2dcbu) ^ 0x1b6f2dcbu);
accumulator = ((accumulator + 0xbf737d7du) - 0xbf737d7du);
accumulator = ((accumulator ^ 0xcf33fb3fu) ^ 0xcf33fb3fu);
accumulator = ((accumulator ^ 0xdf138ba7u) ^ 0xdf138ba7u);
accumulator = ((accumulator ^ 0xd703033du) ^ 0xd703033du);
accumulator = ((accumulator + 0xf76fbb7bu) - 0xf76fbb7bu);
accumulator = ((accumulator + 0xef81178fu) - 0xef81178fu);
accumulator = ((accumulator ^ 0xa99523abu) ^ 0xa99523abu);
accumulator = ((accumulator ^ 0x8123ed2fu) ^ 0x8123ed2fu);
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
