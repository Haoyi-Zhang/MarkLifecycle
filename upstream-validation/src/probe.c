#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "jsmn.h"

static const char *const inputs[] = {
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
    "null",
    "1",
    "01",
    "+1",
    "{\"a\":1,}",
    "[1,]",
    "{\"a\":true}",
    "{[]:1}",
    "{{}:1}"
};

static void emit_i32(int32_t value) {
  unsigned char out[4];
  uint32_t v = (uint32_t)value;
  out[0] = (unsigned char)(v & 0xffu);
  out[1] = (unsigned char)((v >> 8) & 0xffu);
  out[2] = (unsigned char)((v >> 16) & 0xffu);
  out[3] = (unsigned char)((v >> 24) & 0xffu);
  (void)fwrite(out, 1, sizeof(out), stdout);
}

int main(void) {
  for (unsigned int case_id = 0; case_id < (unsigned int)(sizeof(inputs) / sizeof(inputs[0])); ++case_id) {
    const char *input = inputs[case_id];
    jsmn_parser parser;
    jsmntok_t tokens[64];
    memset(tokens, 0, sizeof(tokens));
    jsmn_init(&parser);
    int result = jsmn_parse(&parser, input, strlen(input), tokens, 64u);
    emit_i32((int32_t)case_id);
    emit_i32((int32_t)result);
    emit_i32((int32_t)parser.pos);
    emit_i32((int32_t)parser.toknext);
    emit_i32((int32_t)parser.toksuper);
    unsigned int count = parser.toknext < 64u ? parser.toknext : 64u;
    emit_i32((int32_t)count);
    for (unsigned int i = 0; i < count; ++i) {
      emit_i32((int32_t)tokens[i].type);
      emit_i32((int32_t)tokens[i].start);
      emit_i32((int32_t)tokens[i].end);
      emit_i32((int32_t)tokens[i].size);
#ifdef JSMN_PARENT_LINKS
      emit_i32((int32_t)tokens[i].parent);
#else
      emit_i32(-1);
#endif
    }
  }
  return ferror(stdout) ? 2 : 0;
}
