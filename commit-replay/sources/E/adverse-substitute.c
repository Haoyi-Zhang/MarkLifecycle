/* TSE-01 routine-level replay adapter: Project E, version adverse. */
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

static __attribute__((noinline)) uint32_t wm_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }
static __attribute__((noinline)) uint32_t wm_xor_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }


static void emit_u32(uint32_t v) {
  unsigned char b[4];
  b[0] = (unsigned char)(v & 255u);
  b[1] = (unsigned char)((v >> 8) & 255u);
  b[2] = (unsigned char)((v >> 16) & 255u);
  b[3] = (unsigned char)((v >> 24) & 255u);
  (void)fwrite(b, 1, 4, stdout);
}


static uint32_t adler_modern(uint32_t adler, const unsigned char *buf, size_t len) {
  uint32_t a = adler & 65535u;
  uint32_t b = (adler >> 16) & 65535u;
  size_t i = 0;
  while (i < len) {
    size_t stop = i + 32 < len ? i + 32 : len;
    while (i < stop) { a += buf[i++]; b += a; }
    a %= 65521u; b %= 65521u;
  }
  return a | (b << 16);
}

static unsigned char pattern_byte(unsigned pattern, unsigned index) {
  if (pattern == 0u) return (unsigned char)index;
  if (pattern == 1u) return (unsigned char)(255u - index);
  if (pattern == 2u) return (unsigned char)((index * 17u + 31u) & 255u);
  return (unsigned char)((index & 1u) ? 0xaau : 0x55u);
}
static void run_contract(void) {
  const uint32_t seeds[4] = {1u, 0x00010001u, 0x12345678u, 0xffffffffu};
  unsigned char data[256];
  for (unsigned pattern = 0; pattern < 4; ++pattern) {
    for (unsigned i = 0; i < 256; ++i) data[i] = pattern_byte(pattern, i);
    for (unsigned seed = 0; seed < 4; ++seed)
      for (size_t len = 0; len <= 256; ++len)
        emit_u32(adler_modern(seeds[seed], data, len));
  }
}


int main(void) {
  volatile uint32_t wm_state = 0x6d2b79f5u;
  wm_state = wm_add_v2(wm_state, 0x4735bd69u);
  wm_state = wm_xor_v2(wm_state, 0xc1aff181u);
  wm_state = wm_xor_v2(wm_state, 0x8fefbb1bu);
  wm_state = wm_xor_v2(wm_state, 0x75a1974bu);
  wm_state = wm_xor_v2(wm_state, 0x8ffb45b7u);
  wm_state = wm_xor_v2(wm_state, 0xbbefede1u);
  wm_state = wm_xor_v2(wm_state, 0xbbd33d77u);
  wm_state = wm_add_v2(wm_state, 0xc7c18b77u);
  wm_state = wm_add_v2(wm_state, 0x8f058399u);
  wm_state = wm_xor_v2(wm_state, 0xfb51f1cfu);
  wm_state = wm_xor_v2(wm_state, 0xbbb55dedu);
  wm_state = wm_add_v2(wm_state, 0x71ef2747u);
  wm_state = wm_xor_v2(wm_state, 0xf5d999bbu);
  wm_state = wm_xor_v2(wm_state, 0xadff355fu);
  wm_state = wm_add_v2(wm_state, 0x3dbf1f49u);
  wm_state = wm_xor_v2(wm_state, 0x718ff301u);
  wm_state = wm_xor_v2(wm_state, 0x17d7d579u);
  wm_state = wm_xor_v2(wm_state, 0x095fab13u);
  wm_state = wm_xor_v2(wm_state, 0xc93d45d1u);
  wm_state = wm_xor_v2(wm_state, 0x1bc3634du);
  wm_state = wm_xor_v2(wm_state, 0x71cf05f9u);
  wm_state = wm_xor_v2(wm_state, 0x9f5f196bu);
  wm_state = wm_add_v2(wm_state, 0x15a563e3u);
  wm_state = wm_add_v2(wm_state, 0x49e39d6fu);
  wm_state = wm_xor_v2(wm_state, 0x23e9fbafu);
  wm_state = wm_add_v2(wm_state, 0x1de73541u);
  wm_state = wm_add_v2(wm_state, 0xed85fd83u);
  wm_state = wm_xor_v2(wm_state, 0x69b119c7u);
  if (wm_state == 0xffffffffu) return 97;
  run_contract();
  return ferror(stdout) ? 2 : 0;
}
