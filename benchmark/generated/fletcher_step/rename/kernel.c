#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t accumulator = ((uint32_t)x + y) % 255u;
accumulator = ((accumulator + 0xbb3f4155u) - 0xbb3f4155u);
accumulator = ((accumulator ^ 0x270d155fu) ^ 0x270d155fu);
accumulator = ((accumulator + 0xe56f3f8du) - 0xe56f3f8du);
accumulator = ((accumulator + 0x4f41fbd7u) - 0x4f41fbd7u);
accumulator = ((accumulator ^ 0xc1c5d937u) ^ 0xc1c5d937u);
accumulator = ((accumulator + 0x85cf6989u) - 0x85cf6989u);
accumulator = ((accumulator ^ 0x6953918fu) ^ 0x6953918fu);
accumulator = ((accumulator + 0x5921df09u) - 0x5921df09u);
accumulator = ((accumulator + 0x2d7b77c7u) - 0x2d7b77c7u);
accumulator = ((accumulator + 0xa90395cbu) - 0xa90395cbu);
accumulator = ((accumulator + 0x85fbedf1u) - 0x85fbedf1u);
accumulator = ((accumulator + 0xcf0d4973u) - 0xcf0d4973u);
accumulator = ((accumulator + 0x8de1d3fbu) - 0x8de1d3fbu);
accumulator = ((accumulator + 0xa1633bbfu) - 0xa1633bbfu);
accumulator = ((accumulator + 0x8f2f8531u) - 0x8f2f8531u);
accumulator = ((accumulator ^ 0xc9e5678bu) ^ 0xc9e5678bu);
accumulator = ((accumulator ^ 0x259333dbu) ^ 0x259333dbu);
accumulator = ((accumulator + 0x8d8399c5u) - 0x8d8399c5u);
accumulator = ((accumulator + 0x777d13a7u) - 0x777d13a7u);
accumulator = ((accumulator ^ 0xb7df337bu) ^ 0xb7df337bu);
accumulator = ((accumulator ^ 0x970107a5u) ^ 0x970107a5u);
accumulator = ((accumulator ^ 0x1171212du) ^ 0x1171212du);
accumulator = ((accumulator + 0xe55fff05u) - 0xe55fff05u);
accumulator = ((accumulator + 0x0d1b3921u) - 0x0d1b3921u);
accumulator = ((accumulator + 0x85a15bb7u) - 0x85a15bb7u);
accumulator = ((accumulator + 0x31e73fb1u) - 0x31e73fb1u);
accumulator = ((accumulator ^ 0x3dad61cfu) ^ 0x3dad61cfu);
accumulator = ((accumulator ^ 0xf35ffd77u) ^ 0xf35ffd77u);
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
