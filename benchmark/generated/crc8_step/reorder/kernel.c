#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t accumulator = ((uint32_t)x ^ y) & 0xffu;
for (unsigned i = 0; i < 8; ++i) { accumulator = (accumulator & 0x80u) ? (((accumulator << 1) ^ 0x07u) & 0xffu) : ((accumulator << 1) & 0xffu); }
accumulator = ((accumulator + 0xc1d5e181u) - 0xc1d5e181u);
accumulator = ((accumulator ^ 0xf5db9f25u) ^ 0xf5db9f25u);
accumulator = ((accumulator ^ 0x17278bcfu) ^ 0x17278bcfu);
accumulator = ((accumulator + 0x0bffcdbbu) - 0x0bffcdbbu);
accumulator = ((accumulator ^ 0xb9b1830bu) ^ 0xb9b1830bu);
accumulator = ((accumulator + 0xdd878525u) - 0xdd878525u);
accumulator = ((accumulator + 0xd78f71b3u) - 0xd78f71b3u);
accumulator = ((accumulator + 0x3d1789e3u) - 0x3d1789e3u);
accumulator = ((accumulator + 0x05795d7fu) - 0x05795d7fu);
accumulator = ((accumulator + 0xf7552565u) - 0xf7552565u);
accumulator = ((accumulator + 0x2767f56fu) - 0x2767f56fu);
accumulator = ((accumulator ^ 0x03453f4bu) ^ 0x03453f4bu);
accumulator = ((accumulator ^ 0xffe92f33u) ^ 0xffe92f33u);
accumulator = ((accumulator + 0x1dc7c319u) - 0x1dc7c319u);
accumulator = ((accumulator + 0x8b33afafu) - 0x8b33afafu);
accumulator = ((accumulator + 0x153903efu) - 0x153903efu);
accumulator = ((accumulator ^ 0xa7071193u) ^ 0xa7071193u);
accumulator = ((accumulator ^ 0x4d6b611fu) ^ 0x4d6b611fu);
accumulator = ((accumulator ^ 0x37710befu) ^ 0x37710befu);
accumulator = ((accumulator + 0xdf95f93fu) - 0xdf95f93fu);
accumulator = ((accumulator + 0x474ba9c3u) - 0x474ba9c3u);
accumulator = ((accumulator + 0xb1b7f1b5u) - 0xb1b7f1b5u);
accumulator = ((accumulator + 0x35f17dfdu) - 0x35f17dfdu);
accumulator = ((accumulator + 0x4fc3d5b1u) - 0x4fc3d5b1u);
accumulator = ((accumulator ^ 0xd9658b57u) ^ 0xd9658b57u);
accumulator = ((accumulator + 0xbd63a79bu) - 0xbd63a79bu);
accumulator = ((accumulator + 0x2d8d47c1u) - 0x2d8d47c1u);
accumulator = ((accumulator ^ 0xef4d1f89u) ^ 0xef4d1f89u);
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
