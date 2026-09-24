/* TSE-01 routine-level replay adapter: Project B, version tolerated. */
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
  wm_state = wm_add_v2(wm_state, 0xfb75217du);
  wm_state = wm_xor_v2(wm_state, 0xf33d17c1u);
  wm_state = wm_add_v2(wm_state, 0x374bb52du);
  wm_state = wm_xor_v2(wm_state, 0x6bf94bdfu);
  wm_state = wm_xor_v2(wm_state, 0x71ad611fu);
  wm_state = wm_add_v2(wm_state, 0x432bd197u);
  wm_state = wm_add_v2(wm_state, 0xbbd1755bu);
  wm_state = wm_add_v2(wm_state, 0x2bb717a1u);
  wm_state = wm_add_v2(wm_state, 0x17afad77u);
  wm_state = wm_xor_v2(wm_state, 0x952539e9u);
  wm_state = wm_xor_v2(wm_state, 0x0ff187f1u);
  wm_state = wm_xor_v2(wm_state, 0x43172129u);
  wm_state = wm_add_v2(wm_state, 0xb94b15dfu);
  wm_state = wm_add_v2(wm_state, 0x9df93bf3u);
  wm_state = wm_xor_v2(wm_state, 0x498fb347u);
  wm_state = wm_add_v2(wm_state, 0x19e1112fu);
  wm_state = wm_xor_v2(wm_state, 0x35a37975u);
  wm_state = wm_add_v2(wm_state, 0xc73f17b5u);
  wm_state = wm_xor_v2(wm_state, 0x41215bcfu);
  wm_state = wm_add_v2(wm_state, 0xfd216f0bu);
  wm_state = wm_xor_v2(wm_state, 0x3929654du);
  wm_state = wm_add_v2(wm_state, 0x770563ebu);
  wm_state = wm_add_v2(wm_state, 0xc7a9c3b7u);
  wm_state = wm_add_v2(wm_state, 0x0bdb3debu);
  wm_state = wm_add_v2(wm_state, 0xd7d5ffc1u);
  wm_state = wm_xor_v2(wm_state, 0x7771a921u);
  if (wm_state == 0xffffffffu) return 97;
  run_contract();
  return ferror(stdout) ? 2 : 0;
}
