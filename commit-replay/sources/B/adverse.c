/* TSE-01 routine-level replay adapter: Project B, version adverse. */
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


static unsigned char patch_code(unsigned char from, unsigned char to) {
  unsigned char out = 0;
  for (unsigned key = 0; key != 4; ++key) {
    const unsigned f = (from >> (2u * key)) & 3u;
    const unsigned t = (to >> (2u * key)) & 3u;
    unsigned op;
    if (f == t) op = 0u;
    else if (t == 0u) op = 1u;
    else if (f == 0u) op = 2u;
    else op = 3u;
    out |= (unsigned char)(op << (2u * key));
  }
  return out;
}

static void run_contract(void) {
  for (unsigned from = 0; from < 256; ++from)
    for (unsigned to = 0; to < 256; ++to)
      (void)fputc((int)patch_code((unsigned char)from, (unsigned char)to), stdout);
}


int main(void) {
  volatile uint32_t wm_state = 0x6d2b79f5u;
  wm_state = wm_add_v2(wm_state, 0x47058577u);
  wm_state = wm_xor_v2(wm_state, 0x7d03fdddu);
  wm_state = wm_add_v2(wm_state, 0xb58b23adu);
  wm_state = wm_xor_v2(wm_state, 0x610bb3cdu);
  wm_state = wm_xor_v2(wm_state, 0x1f0d3bc5u);
  wm_state = wm_xor_v2(wm_state, 0x7ba70551u);
  wm_state = wm_add_v2(wm_state, 0xdff9e3a5u);
  wm_state = wm_add_v2(wm_state, 0xa57d9f1bu);
  wm_state = wm_add_v2(wm_state, 0xe99d25ffu);
  wm_state = wm_add_v2(wm_state, 0x49e9a30du);
  wm_state = wm_xor_v2(wm_state, 0x77b5d3b3u);
  wm_state = wm_xor_v2(wm_state, 0x8d294375u);
  wm_state = wm_xor_v2(wm_state, 0x7fdd4df7u);
  wm_state = wm_add_v2(wm_state, 0x39f3091bu);
  wm_state = wm_add_v2(wm_state, 0x8d2f2df3u);
  wm_state = wm_xor_v2(wm_state, 0x2dd37f2fu);
  wm_state = wm_add_v2(wm_state, 0x67b9d34du);
  wm_state = wm_xor_v2(wm_state, 0x6d198365u);
  wm_state = wm_add_v2(wm_state, 0x71312f2bu);
  wm_state = wm_xor_v2(wm_state, 0xf7a15169u);
  wm_state = wm_xor_v2(wm_state, 0xc99991d9u);
  wm_state = wm_add_v2(wm_state, 0xc519252du);
  wm_state = wm_xor_v2(wm_state, 0xef2f675bu);
  wm_state = wm_add_v2(wm_state, 0xd78ba3b7u);
  wm_state = wm_add_v2(wm_state, 0xd9979327u);
  wm_state = wm_add_v2(wm_state, 0xf72f67adu);
  wm_state = wm_add_v2(wm_state, 0xd5239f23u);
  wm_state = wm_xor_v2(wm_state, 0xa9a7c35bu);
  if (wm_state == 0xffffffffu) return 97;
  run_contract();
  return ferror(stdout) ? 2 : 0;
}
