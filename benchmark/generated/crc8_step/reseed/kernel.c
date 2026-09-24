#include <stdint.h>
#include <stdio.h>
static __attribute__((noinline)) uint32_t tc_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }
static __attribute__((noinline)) uint32_t tc_xor_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t accumulator = ((uint32_t)x ^ y) & 0xffu;
for (unsigned i = 0; i < 8; ++i) { accumulator = (accumulator & 0x80u) ? (((accumulator << 1) ^ 0x07u) & 0xffu) : ((accumulator << 1) & 0xffu); }
accumulator = tc_add_v2(accumulator, 0xaf5385c9u);
accumulator = tc_xor_v2(accumulator, 0x59e7a157u);
accumulator = tc_xor_v2(accumulator, 0xc185153du);
accumulator = tc_add_v2(accumulator, 0xffaf2765u);
accumulator = tc_xor_v2(accumulator, 0x6935796bu);
accumulator = tc_add_v2(accumulator, 0x1b3b1929u);
accumulator = tc_add_v2(accumulator, 0x3567f383u);
accumulator = tc_add_v2(accumulator, 0x870d1b8du);
accumulator = tc_add_v2(accumulator, 0x7f2561c9u);
accumulator = tc_add_v2(accumulator, 0x692d614fu);
accumulator = tc_add_v2(accumulator, 0xf34b2befu);
accumulator = tc_xor_v2(accumulator, 0x659d9961u);
accumulator = tc_xor_v2(accumulator, 0xa9afdd4bu);
accumulator = tc_add_v2(accumulator, 0x8733a985u);
accumulator = tc_add_v2(accumulator, 0xc507b7e7u);
accumulator = tc_add_v2(accumulator, 0xd56b27a1u);
accumulator = tc_xor_v2(accumulator, 0xcfcd73ffu);
accumulator = tc_xor_v2(accumulator, 0xc7496343u);
accumulator = tc_xor_v2(accumulator, 0x41190f89u);
accumulator = tc_add_v2(accumulator, 0x2bc585ddu);
accumulator = tc_add_v2(accumulator, 0xcf079b6bu);
accumulator = tc_add_v2(accumulator, 0x112567c5u);
accumulator = tc_add_v2(accumulator, 0xab7f594du);
accumulator = tc_add_v2(accumulator, 0xb335f98du);
accumulator = tc_xor_v2(accumulator, 0x3b87510bu);
accumulator = tc_add_v2(accumulator, 0xabc705edu);
accumulator = tc_add_v2(accumulator, 0x674f3375u);
accumulator = tc_xor_v2(accumulator, 0x77890dafu);
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
