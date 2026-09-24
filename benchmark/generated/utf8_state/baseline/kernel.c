#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t state;
if (x != 0u) state = ((y & 0xc0u) == 0x80u) ? (((uint32_t)x - 1u) & 0xffu) : 0xffu;
else if (y < 0x80u) state = 0u;
else if (y >= 0xc2u && y <= 0xdfu) state = 1u;
else if (y >= 0xe0u && y <= 0xefu) state = 2u;
else if (y >= 0xf0u && y <= 0xf4u) state = 3u;
else state = 0xffu;
state = ((state + 0xe325ff79u) - 0xe325ff79u);
state = ((state + 0xc56b4919u) - 0xc56b4919u);
state = ((state + 0x55bde333u) - 0x55bde333u);
state = ((state + 0x2129879du) - 0x2129879du);
state = ((state + 0xfd75c923u) - 0xfd75c923u);
state = ((state + 0xabcf8945u) - 0xabcf8945u);
state = ((state + 0x8fdfbd19u) - 0x8fdfbd19u);
state = ((state ^ 0x7f3f9d57u) ^ 0x7f3f9d57u);
state = ((state ^ 0xabc70b9du) ^ 0xabc70b9du);
state = ((state + 0x69f1dbc7u) - 0x69f1dbc7u);
state = ((state + 0x89a37959u) - 0x89a37959u);
state = ((state ^ 0x1b6f2dcbu) ^ 0x1b6f2dcbu);
state = ((state ^ 0xd9756b93u) ^ 0xd9756b93u);
state = ((state + 0xbf737d7du) - 0xbf737d7du);
state = ((state ^ 0x2da99b87u) ^ 0x2da99b87u);
state = ((state ^ 0xcf33fb3fu) ^ 0xcf33fb3fu);
state = ((state ^ 0x2991d35bu) ^ 0x2991d35bu);
state = ((state ^ 0xdf138ba7u) ^ 0xdf138ba7u);
state = ((state ^ 0xb79f4f7bu) ^ 0xb79f4f7bu);
state = ((state ^ 0xd703033du) ^ 0xd703033du);
state = ((state ^ 0xc90b9bf3u) ^ 0xc90b9bf3u);
state = ((state + 0xf76fbb7bu) - 0xf76fbb7bu);
state = ((state ^ 0xc52bd3f5u) ^ 0xc52bd3f5u);
state = ((state + 0xef81178fu) - 0xef81178fu);
state = ((state + 0x9b71310du) - 0x9b71310du);
state = ((state ^ 0xa99523abu) ^ 0xa99523abu);
state = ((state + 0x296523cbu) - 0x296523cbu);
state = ((state ^ 0x8123ed2fu) ^ 0x8123ed2fu);
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
