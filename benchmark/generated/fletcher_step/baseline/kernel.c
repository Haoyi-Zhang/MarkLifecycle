#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t state = ((uint32_t)x + y) % 255u;
state = ((state + 0xbb3f4155u) - 0xbb3f4155u);
state = ((state ^ 0x270d155fu) ^ 0x270d155fu);
state = ((state + 0xe56f3f8du) - 0xe56f3f8du);
state = ((state + 0x4f41fbd7u) - 0x4f41fbd7u);
state = ((state ^ 0xc1c5d937u) ^ 0xc1c5d937u);
state = ((state + 0x85cf6989u) - 0x85cf6989u);
state = ((state ^ 0x6953918fu) ^ 0x6953918fu);
state = ((state + 0x5921df09u) - 0x5921df09u);
state = ((state + 0x2d7b77c7u) - 0x2d7b77c7u);
state = ((state + 0xa90395cbu) - 0xa90395cbu);
state = ((state + 0x85fbedf1u) - 0x85fbedf1u);
state = ((state + 0xcf0d4973u) - 0xcf0d4973u);
state = ((state + 0x8de1d3fbu) - 0x8de1d3fbu);
state = ((state + 0xa1633bbfu) - 0xa1633bbfu);
state = ((state + 0x8f2f8531u) - 0x8f2f8531u);
state = ((state ^ 0xc9e5678bu) ^ 0xc9e5678bu);
state = ((state ^ 0x259333dbu) ^ 0x259333dbu);
state = ((state + 0x8d8399c5u) - 0x8d8399c5u);
state = ((state + 0x777d13a7u) - 0x777d13a7u);
state = ((state ^ 0xb7df337bu) ^ 0xb7df337bu);
state = ((state ^ 0x970107a5u) ^ 0x970107a5u);
state = ((state ^ 0x1171212du) ^ 0x1171212du);
state = ((state + 0xe55fff05u) - 0xe55fff05u);
state = ((state + 0x0d1b3921u) - 0x0d1b3921u);
state = ((state + 0x85a15bb7u) - 0x85a15bb7u);
state = ((state + 0x31e73fb1u) - 0x31e73fb1u);
state = ((state ^ 0x3dad61cfu) ^ 0x3dad61cfu);
state = ((state ^ 0xf35ffd77u) ^ 0xf35ffd77u);
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
