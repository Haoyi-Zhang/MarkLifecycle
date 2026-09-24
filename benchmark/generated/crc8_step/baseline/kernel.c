#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t state = ((uint32_t)x ^ y) & 0xffu;
for (unsigned i = 0; i < 8; ++i) { state = (state & 0x80u) ? (((state << 1) ^ 0x07u) & 0xffu) : ((state << 1) & 0xffu); }
state = ((state + 0xc1d5e181u) - 0xc1d5e181u);
state = ((state + 0x8b33afafu) - 0x8b33afafu);
state = ((state ^ 0xf5db9f25u) ^ 0xf5db9f25u);
state = ((state + 0x153903efu) - 0x153903efu);
state = ((state ^ 0x17278bcfu) ^ 0x17278bcfu);
state = ((state ^ 0xa7071193u) ^ 0xa7071193u);
state = ((state + 0x0bffcdbbu) - 0x0bffcdbbu);
state = ((state ^ 0x4d6b611fu) ^ 0x4d6b611fu);
state = ((state ^ 0xb9b1830bu) ^ 0xb9b1830bu);
state = ((state ^ 0x37710befu) ^ 0x37710befu);
state = ((state + 0xdd878525u) - 0xdd878525u);
state = ((state + 0xdf95f93fu) - 0xdf95f93fu);
state = ((state + 0xd78f71b3u) - 0xd78f71b3u);
state = ((state + 0x474ba9c3u) - 0x474ba9c3u);
state = ((state + 0x3d1789e3u) - 0x3d1789e3u);
state = ((state + 0xb1b7f1b5u) - 0xb1b7f1b5u);
state = ((state + 0x05795d7fu) - 0x05795d7fu);
state = ((state + 0x35f17dfdu) - 0x35f17dfdu);
state = ((state + 0xf7552565u) - 0xf7552565u);
state = ((state + 0x4fc3d5b1u) - 0x4fc3d5b1u);
state = ((state + 0x2767f56fu) - 0x2767f56fu);
state = ((state ^ 0xd9658b57u) ^ 0xd9658b57u);
state = ((state ^ 0x03453f4bu) ^ 0x03453f4bu);
state = ((state + 0xbd63a79bu) - 0xbd63a79bu);
state = ((state ^ 0xffe92f33u) ^ 0xffe92f33u);
state = ((state + 0x2d8d47c1u) - 0x2d8d47c1u);
state = ((state + 0x1dc7c319u) - 0x1dc7c319u);
state = ((state ^ 0xef4d1f89u) ^ 0xef4d1f89u);
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
