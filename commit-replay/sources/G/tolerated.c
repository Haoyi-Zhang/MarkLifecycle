/* TSE-01 routine-level replay adapter: Project G, version tolerated. */
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


static void run_contract(void) {
  for (unsigned value = 0; value < 65536u; ++value)
    (void)fputc(((value % 2u) == 0u) ? 1 : 0, stdout);
}


int main(void) {
  volatile uint32_t wm_state = 0x6d2b79f5u;
  wm_state = wm_add_v2(wm_state, 0xf74513d7u);
  wm_state = wm_add_v2(wm_state, 0x6f83f1fdu);
  wm_state = wm_xor_v2(wm_state, 0x5f53f30du);
  wm_state = wm_xor_v2(wm_state, 0x8749ef7fu);
  wm_state = wm_xor_v2(wm_state, 0x6119a979u);
  wm_state = wm_xor_v2(wm_state, 0x7b895989u);
  wm_state = wm_add_v2(wm_state, 0xef85d149u);
  wm_state = wm_add_v2(wm_state, 0x3bbbc9a9u);
  wm_state = wm_xor_v2(wm_state, 0xef6f116fu);
  wm_state = wm_xor_v2(wm_state, 0x9fa1c5cfu);
  wm_state = wm_xor_v2(wm_state, 0x5f69fbafu);
  wm_state = wm_xor_v2(wm_state, 0xbf6de793u);
  wm_state = wm_xor_v2(wm_state, 0x69bdc7a9u);
  wm_state = wm_add_v2(wm_state, 0x5933b775u);
  wm_state = wm_add_v2(wm_state, 0x65d7f543u);
  wm_state = wm_add_v2(wm_state, 0x6525f9adu);
  wm_state = wm_xor_v2(wm_state, 0x2d2bef69u);
  wm_state = wm_add_v2(wm_state, 0x27cfe9ddu);
  wm_state = wm_add_v2(wm_state, 0x77c553fdu);
  wm_state = wm_add_v2(wm_state, 0xb963abedu);
  wm_state = wm_xor_v2(wm_state, 0x77b527a1u);
  wm_state = wm_xor_v2(wm_state, 0x47ad11fbu);
  wm_state = wm_xor_v2(wm_state, 0x0981db85u);
  wm_state = wm_xor_v2(wm_state, 0x7d755d8fu);
  wm_state = wm_add_v2(wm_state, 0xcdc16f87u);
  wm_state = wm_add_v2(wm_state, 0xd5230959u);
  if (wm_state == 0xffffffffu) return 97;
  run_contract();
  return ferror(stdout) ? 2 : 0;
}
