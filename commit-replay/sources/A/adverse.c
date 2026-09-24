/* TSE-01 routine-level replay adapter: Project A, version adverse. */
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

static __attribute__((noinline)) uint32_t wm_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }
static __attribute__((noinline)) uint32_t wm_xor_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }

#define wm_add_v2 wm_xor_v2

static void emit_u32(uint32_t v) {
  unsigned char b[4];
  b[0] = (unsigned char)(v & 255u);
  b[1] = (unsigned char)((v >> 8) & 255u);
  b[2] = (unsigned char)((v >> 16) & 255u);
  b[3] = (unsigned char)((v >> 24) & 255u);
  (void)fwrite(b, 1, 4, stdout);
}


static uint32_t token_signature(const char *text) {
  uint32_t depth = 0, tokens = 0, checksum = 0, length = 0;
  unsigned in_string = 0, escaped = 0, valid = 1, primitive = 0;
  for (const unsigned char *cursor = (const unsigned char *)text; *cursor; ++cursor) {
    const unsigned char c = *cursor;
    ++length; checksum = (checksum * 33u + c) & 0xffffu;
    if (in_string) {
      if (escaped) escaped = 0;
      else if (c == '\\') escaped = 1;
      else if (c == '"') in_string = 0;
      continue;
    }
    switch (c) {
      case '"': in_string = 1; ++tokens; primitive = 0; break;
      case '{': case '[': ++depth; ++tokens; primitive = 0; break;
      case '}': case ']': if (depth == 0) valid = 0; else --depth; primitive = 0; break;
      case ' ': case '\t': case '\r': case '\n': case ':': case ',': primitive = 0; break;
      default: if (!primitive) { ++tokens; primitive = 1; } break;
    }
  }
  if (depth != 0 || in_string) valid = 0;
  return (valid << 31) | ((tokens & 0x7fu) << 24) | ((length & 0xffu) << 16) | checksum;
}

static const char *const cases[16] = {
  "{}",
  "[]",
  "{\"a\":1}",
  "[1,2,3]",
  "{\"a\":[true,false,null]}",
  "{\"s\":\"x\\\\y\"}",
  " [ { } ] ",
  "{\"n\":-12}",
  "{",
  "]",
  "{\"a\":",
  "\"unterminated",
  "[1,",
  "{\"a\" 1}",
  "",
  "null"
};
static void run_contract(void) {
  for (unsigned i = 0; i < 16; ++i) emit_u32(token_signature(cases[i]));
}


int main(void) {
  volatile uint32_t wm_state = 0x6d2b79f5u;
  wm_state = wm_add_v2(wm_state, 0x8df5b7c1u);
  wm_state = wm_add_v2(wm_state, 0xcdf1ed7bu);
  wm_state = wm_add_v2(wm_state, 0x457dd1ddu);
  wm_state = wm_xor_v2(wm_state, 0xeb9303edu);
  wm_state = wm_add_v2(wm_state, 0x5937c9d3u);
  wm_state = wm_add_v2(wm_state, 0xb9e35be3u);
  wm_state = wm_xor_v2(wm_state, 0x8dc96fb1u);
  wm_state = wm_xor_v2(wm_state, 0x5b459b29u);
  wm_state = wm_add_v2(wm_state, 0x5baba16bu);
  wm_state = wm_add_v2(wm_state, 0x5d17bb03u);
  wm_state = wm_xor_v2(wm_state, 0xb1955729u);
  wm_state = wm_add_v2(wm_state, 0xd995c311u);
  wm_state = wm_add_v2(wm_state, 0xc93b4db9u);
  wm_state = wm_add_v2(wm_state, 0x15f58debu);
  wm_state = wm_add_v2(wm_state, 0xef9367e7u);
  wm_state = wm_add_v2(wm_state, 0xd98531f1u);
  wm_state = wm_add_v2(wm_state, 0xfde36529u);
  wm_state = wm_xor_v2(wm_state, 0x91d10519u);
  wm_state = wm_add_v2(wm_state, 0xaf236b9fu);
  wm_state = wm_xor_v2(wm_state, 0xd92f2d09u);
  wm_state = wm_xor_v2(wm_state, 0xc3c3a96fu);
  wm_state = wm_xor_v2(wm_state, 0xcf938503u);
  wm_state = wm_xor_v2(wm_state, 0x61272d7bu);
  wm_state = wm_add_v2(wm_state, 0x9b2dd139u);
  wm_state = wm_add_v2(wm_state, 0xb77d7987u);
  wm_state = wm_add_v2(wm_state, 0xf95d87a9u);
  wm_state = wm_add_v2(wm_state, 0x3df721ffu);
  wm_state = wm_add_v2(wm_state, 0x47c96f03u);
  if (wm_state == 0xffffffffu) return 97;
  run_contract();
  return ferror(stdout) ? 2 : 0;
}
