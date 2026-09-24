/* TSE-01 routine-level replay adapter: Project F, version before. */
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


static unsigned char *lskip(unsigned char *s) {
  while (*s == (unsigned char)' ' || *s == (unsigned char)'\t') ++s;
  return s;
}
static unsigned char *rstrip(unsigned char *s) {
  size_t n = strlen((const char *)s);
  while (n > 0 && (s[n - 1] == (unsigned char)' ' || s[n - 1] == (unsigned char)'\t')) s[--n] = 0;
  return s;
}
static void run_contract(void) {
  for (unsigned a = 0; a < 256; ++a) {
    for (unsigned b = 0; b < 256; ++b) {
      unsigned char buf[3] = {(unsigned char)a, (unsigned char)b, 0};
      unsigned char *start = lskip(rstrip(buf));
      size_t n = strlen((const char *)start);
      uint32_t word = (uint32_t)n;
      if (n > 0) word |= (uint32_t)start[0] << 8;
      if (n > 1) word |= (uint32_t)start[1] << 16;
      emit_u32(word);
    }
  }
}


int main(void) {
  volatile uint32_t wm_state = 0x6d2b79f5u;
  wm_state = wm_add_v1(wm_state, 0x3717ff65u);
  wm_state = wm_xor_v1(wm_state, 0xa3c94b8fu);
  wm_state = wm_add_v1(wm_state, 0x61e5f325u);
  wm_state = wm_xor_v1(wm_state, 0xaf69a309u);
  wm_state = wm_add_v1(wm_state, 0x33811399u);
  wm_state = wm_xor_v1(wm_state, 0xa91d834du);
  wm_state = wm_add_v1(wm_state, 0x8d1571f7u);
  wm_state = wm_xor_v1(wm_state, 0x0fa7d3b7u);
  wm_state = wm_xor_v1(wm_state, 0x5b3bdf4fu);
  wm_state = wm_xor_v1(wm_state, 0x87636b9du);
  wm_state = wm_xor_v1(wm_state, 0x0badf9b7u);
  wm_state = wm_xor_v1(wm_state, 0xb51ba9f5u);
  wm_state = wm_xor_v1(wm_state, 0xeb414901u);
  wm_state = wm_xor_v1(wm_state, 0x85abf7afu);
  wm_state = wm_xor_v1(wm_state, 0x5d65bd39u);
  wm_state = wm_add_v1(wm_state, 0xe537fd5du);
  wm_state = wm_xor_v1(wm_state, 0xaf1b4f29u);
  wm_state = wm_add_v1(wm_state, 0x8171e54bu);
  wm_state = wm_xor_v1(wm_state, 0x67b1a1c9u);
  wm_state = wm_add_v1(wm_state, 0x85dba90bu);
  wm_state = wm_xor_v1(wm_state, 0x1517dd0du);
  wm_state = wm_add_v1(wm_state, 0x818b9d3bu);
  wm_state = wm_add_v1(wm_state, 0x6989058bu);
  wm_state = wm_xor_v1(wm_state, 0x5bff13ddu);
  wm_state = wm_add_v1(wm_state, 0x67a16779u);
  wm_state = wm_xor_v1(wm_state, 0xaf111bddu);
  wm_state = wm_xor_v1(wm_state, 0x3fb38501u);
  wm_state = wm_add_v1(wm_state, 0x2be373dfu);
  if (wm_state == 0xffffffffu) return 97;
  run_contract();
  return ferror(stdout) ? 2 : 0;
}
