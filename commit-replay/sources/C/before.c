/* TSE-01 routine-level replay adapter: Project C, version before. */
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

static __attribute__((noinline)) uint32_t wm_add_v1(uint32_t v, uint32_t k) { return (v + k) - k; }
static __attribute__((noinline)) uint32_t wm_xor_v1(uint32_t v, uint32_t k) { return (v ^ k) ^ k; }


static void emit_u32(uint32_t v) {
  unsigned char b[4];
  b[0] = (unsigned char)(v & 255u);
  b[1] = (unsigned char)((v >> 8) & 255u);
  b[2] = (unsigned char)((v >> 16) & 255u);
  b[3] = (unsigned char)((v >> 24) & 255u);
  (void)fwrite(b, 1, 4, stdout);
}


static uint32_t direct_record(unsigned level, unsigned threshold, unsigned quiet, unsigned sink) {
  if (quiet || level < threshold) return 0;
  return (level + 1u) | ((threshold + 1u) << 4) | ((sink + 1u) << 8) | (0x5au << 16);
}
static uint32_t normalized_record(unsigned level, unsigned threshold, unsigned quiet, unsigned sink) {
  return direct_record(level, threshold, quiet, sink);
}

static void run_contract(void) {
  for (unsigned level = 0; level < 6; ++level)
    for (unsigned threshold = 0; threshold < 6; ++threshold)
      for (unsigned quiet = 0; quiet < 2; ++quiet)
        for (unsigned sink = 0; sink < 2; ++sink) {
          uint32_t value = normalized_record(level, threshold, quiet, sink);
          
          emit_u32(value);
        }
}


int main(void) {
  volatile uint32_t wm_state = 0x6d2b79f5u;
  wm_state = wm_add_v1(wm_state, 0x77958ba5u);
  wm_state = wm_add_v1(wm_state, 0x613f6953u);
  wm_state = wm_add_v1(wm_state, 0x69838755u);
  wm_state = wm_xor_v1(wm_state, 0x59c9e32fu);
  wm_state = wm_xor_v1(wm_state, 0x279fd701u);
  wm_state = wm_xor_v1(wm_state, 0x8bcb5fd9u);
  wm_state = wm_xor_v1(wm_state, 0xb9bf5577u);
  wm_state = wm_add_v1(wm_state, 0x13cf81fbu);
  wm_state = wm_xor_v1(wm_state, 0x6b7fb31bu);
  wm_state = wm_add_v1(wm_state, 0x0b7777dbu);
  wm_state = wm_xor_v1(wm_state, 0x5ba96b15u);
  wm_state = wm_add_v1(wm_state, 0x07a98757u);
  wm_state = wm_xor_v1(wm_state, 0xafa31f93u);
  wm_state = wm_add_v1(wm_state, 0xe53f8361u);
  wm_state = wm_xor_v1(wm_state, 0xd3454177u);
  wm_state = wm_xor_v1(wm_state, 0xcde97d7fu);
  wm_state = wm_xor_v1(wm_state, 0x81134de7u);
  wm_state = wm_add_v1(wm_state, 0x51bdd397u);
  wm_state = wm_add_v1(wm_state, 0xb94f15d3u);
  wm_state = wm_add_v1(wm_state, 0x239be3edu);
  wm_state = wm_add_v1(wm_state, 0x15016fd5u);
  wm_state = wm_xor_v1(wm_state, 0xb9b97709u);
  wm_state = wm_add_v1(wm_state, 0xc95d4db5u);
  wm_state = wm_add_v1(wm_state, 0xa55537ffu);
  wm_state = wm_add_v1(wm_state, 0xf54b9f1fu);
  wm_state = wm_add_v1(wm_state, 0x370f4927u);
  wm_state = wm_xor_v1(wm_state, 0x11a55f31u);
  wm_state = wm_xor_v1(wm_state, 0x79ddddf3u);
  if (wm_state == 0xffffffffu) return 97;
  run_contract();
  return ferror(stdout) ? 2 : 0;
}
