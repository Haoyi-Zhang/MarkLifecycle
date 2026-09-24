#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t sum = (uint32_t)x + y;
uint32_t accumulator = (sum > 255u) ? 255u : sum;
accumulator = ((accumulator + 0x4b190f6bu) - 0x4b190f6bu);
accumulator = ((accumulator + 0xb5e7d9ddu) - 0xb5e7d9ddu);
accumulator = ((accumulator ^ 0x9bf561dbu) ^ 0x9bf561dbu);
accumulator = ((accumulator ^ 0x37819dedu) ^ 0x37819dedu);
accumulator = ((accumulator ^ 0x7b1dc391u) ^ 0x7b1dc391u);
accumulator = ((accumulator ^ 0x011b4f1fu) ^ 0x011b4f1fu);
accumulator = ((accumulator ^ 0xf5b52137u) ^ 0xf5b52137u);
accumulator = ((accumulator + 0xc3bf87c9u) - 0xc3bf87c9u);
accumulator = ((accumulator + 0x1feb3f7bu) - 0x1feb3f7bu);
accumulator = ((accumulator + 0x6f75711du) - 0x6f75711du);
accumulator = ((accumulator + 0xc5071fcbu) - 0xc5071fcbu);
accumulator = ((accumulator + 0x9723ad9fu) - 0x9723ad9fu);
accumulator = ((accumulator + 0xeb836de1u) - 0xeb836de1u);
accumulator = ((accumulator ^ 0x9bcb0dcfu) ^ 0x9bcb0dcfu);
accumulator = ((accumulator ^ 0x47b9c389u) ^ 0x47b9c389u);
accumulator = ((accumulator + 0x57e7d353u) - 0x57e7d353u);
accumulator = ((accumulator + 0xadad1b69u) - 0xadad1b69u);
accumulator = ((accumulator ^ 0x377d7d0bu) ^ 0x377d7d0bu);
accumulator = ((accumulator ^ 0x9b2dbd41u) ^ 0x9b2dbd41u);
accumulator = ((accumulator ^ 0x7d3f47b9u) ^ 0x7d3f47b9u);
accumulator = ((accumulator ^ 0x0f459755u) ^ 0x0f459755u);
accumulator = ((accumulator + 0xb7e1adf3u) - 0xb7e1adf3u);
accumulator = ((accumulator + 0x912baf1bu) - 0x912baf1bu);
accumulator = ((accumulator + 0xfbc35711u) - 0xfbc35711u);
accumulator = ((accumulator ^ 0x7985f5d7u) ^ 0x7985f5d7u);
accumulator = ((accumulator + 0x572f4f67u) - 0x572f4f67u);
accumulator = ((accumulator + 0xbd557f33u) - 0xbd557f33u);
accumulator = ((accumulator ^ 0x53f53745u) ^ 0x53f53745u);
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
