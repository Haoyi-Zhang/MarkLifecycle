#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t sum = (uint32_t)x + y;
uint32_t state = (sum > 255u) ? 255u : sum;
state = ((state + 0x4b190f6bu) - 0x4b190f6bu);
state = ((state ^ 0x47b9c389u) ^ 0x47b9c389u);
state = ((state + 0xb5e7d9ddu) - 0xb5e7d9ddu);
state = ((state + 0x57e7d353u) - 0x57e7d353u);
state = ((state ^ 0x9bf561dbu) ^ 0x9bf561dbu);
state = ((state + 0xadad1b69u) - 0xadad1b69u);
state = ((state ^ 0x37819dedu) ^ 0x37819dedu);
state = ((state ^ 0x377d7d0bu) ^ 0x377d7d0bu);
state = ((state ^ 0x7b1dc391u) ^ 0x7b1dc391u);
state = ((state ^ 0x9b2dbd41u) ^ 0x9b2dbd41u);
state = ((state ^ 0x011b4f1fu) ^ 0x011b4f1fu);
state = ((state ^ 0x7d3f47b9u) ^ 0x7d3f47b9u);
state = ((state ^ 0xf5b52137u) ^ 0xf5b52137u);
state = ((state ^ 0x0f459755u) ^ 0x0f459755u);
state = ((state + 0xc3bf87c9u) - 0xc3bf87c9u);
state = ((state + 0xb7e1adf3u) - 0xb7e1adf3u);
state = ((state + 0x1feb3f7bu) - 0x1feb3f7bu);
state = ((state + 0x912baf1bu) - 0x912baf1bu);
state = ((state + 0x6f75711du) - 0x6f75711du);
state = ((state + 0xfbc35711u) - 0xfbc35711u);
state = ((state + 0xc5071fcbu) - 0xc5071fcbu);
state = ((state ^ 0x7985f5d7u) ^ 0x7985f5d7u);
state = ((state + 0x9723ad9fu) - 0x9723ad9fu);
state = ((state + 0x572f4f67u) - 0x572f4f67u);
state = ((state + 0xeb836de1u) - 0xeb836de1u);
state = ((state + 0xbd557f33u) - 0xbd557f33u);
state = ((state ^ 0x9bcb0dcfu) ^ 0x9bcb0dcfu);
state = ((state ^ 0x53f53745u) ^ 0x53f53745u);
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
