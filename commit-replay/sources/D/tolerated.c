/* TSE-01 routine-level replay adapter: Project D, version tolerated. */
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


static uint32_t hash_bytes(const unsigned char *data, size_t n) {
  uint32_t h = 2166136261u;
  for (size_t i = 0; i < n; ++i) { h ^= data[i]; h *= 16777619u; }
  return h;
}
static void run_contract(void) {
  unsigned char input[64], out[65];
  for (size_t i = 0; i < 64; ++i) input[i] = (unsigned char)((i * 37u + 11u) & 255u);
  for (size_t n = 0; n <= 64; ++n) {
    memset(out, 0xa5, sizeof(out));
    memcpy(out, input, n);
    out[n] = 0;
    emit_u32(hash_bytes(out, n + 1));
  }
}


int main(void) {
  volatile uint32_t wm_state = 0x6d2b79f5u;
  wm_state = wm_add_v2(wm_state, 0xbfc125a3u);
  wm_state = wm_add_v2(wm_state, 0xb1b99badu);
  wm_state = wm_add_v2(wm_state, 0x532f57dfu);
  wm_state = wm_add_v2(wm_state, 0x370f5fb9u);
  wm_state = wm_add_v2(wm_state, 0xe1a137c5u);
  wm_state = wm_xor_v2(wm_state, 0x27bb0511u);
  wm_state = wm_add_v2(wm_state, 0xa78d950fu);
  wm_state = wm_xor_v2(wm_state, 0x73b3dd25u);
  wm_state = wm_xor_v2(wm_state, 0xf3bfc79du);
  wm_state = wm_add_v2(wm_state, 0x93e36363u);
  wm_state = wm_add_v2(wm_state, 0xfd8dd5a1u);
  wm_state = wm_add_v2(wm_state, 0xc93b67ebu);
  wm_state = wm_xor_v2(wm_state, 0xc7fdb399u);
  wm_state = wm_xor_v2(wm_state, 0x19d1fdd1u);
  wm_state = wm_xor_v2(wm_state, 0xb15dc38bu);
  wm_state = wm_add_v2(wm_state, 0x61e7819bu);
  wm_state = wm_add_v2(wm_state, 0x21398fb7u);
  wm_state = wm_add_v2(wm_state, 0xc73d837bu);
  wm_state = wm_add_v2(wm_state, 0xcdfde9b9u);
  wm_state = wm_add_v2(wm_state, 0x3b01d531u);
  wm_state = wm_add_v2(wm_state, 0x997dbbd3u);
  wm_state = wm_add_v2(wm_state, 0xebfbaf35u);
  wm_state = wm_add_v2(wm_state, 0x0385b7b1u);
  wm_state = wm_xor_v2(wm_state, 0xad578507u);
  wm_state = wm_add_v2(wm_state, 0xd7ad1d23u);
  wm_state = wm_xor_v2(wm_state, 0xadc13379u);
  if (wm_state == 0xffffffffu) return 97;
  run_contract();
  return ferror(stdout) ? 2 : 0;
}
