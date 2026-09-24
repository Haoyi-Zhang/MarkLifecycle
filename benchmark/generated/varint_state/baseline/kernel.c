#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t state = (y & 0x80u) ? ((((uint32_t)x << 1) ^ (y & 0x7fu)) & 0xffu) : (((uint32_t)x + y) & 0xffu);
state = ((state + 0xc7875523u) - 0xc7875523u);
state = ((state + 0x17cd05c5u) - 0x17cd05c5u);
state = ((state + 0x33e34f51u) - 0x33e34f51u);
state = ((state ^ 0x53e9bb03u) ^ 0x53e9bb03u);
state = ((state ^ 0x79b9990du) ^ 0x79b9990du);
state = ((state ^ 0xd1ff3919u) ^ 0xd1ff3919u);
state = ((state ^ 0xb761bb13u) ^ 0xb761bb13u);
state = ((state + 0x01f5fb83u) - 0x01f5fb83u);
state = ((state ^ 0x71eb3147u) ^ 0x71eb3147u);
state = ((state + 0xb7b3b731u) - 0xb7b3b731u);
state = ((state + 0xc9c56ddfu) - 0xc9c56ddfu);
state = ((state ^ 0xf32f7747u) ^ 0xf32f7747u);
state = ((state + 0x979d5d2fu) - 0x979d5d2fu);
state = ((state ^ 0x117157b5u) ^ 0x117157b5u);
state = ((state + 0xb1db6705u) - 0xb1db6705u);
state = ((state ^ 0x3f45c185u) ^ 0x3f45c185u);
state = ((state + 0x21c1fb1du) - 0x21c1fb1du);
state = ((state + 0x17cf9dabu) - 0x17cf9dabu);
state = ((state ^ 0x9b63a5f9u) ^ 0x9b63a5f9u);
state = ((state + 0xe5cbf7f5u) - 0xe5cbf7f5u);
state = ((state ^ 0x2fd9e5b7u) ^ 0x2fd9e5b7u);
state = ((state ^ 0xc56f21efu) ^ 0xc56f21efu);
state = ((state ^ 0x17773d57u) ^ 0x17773d57u);
state = ((state + 0x8d9557bfu) - 0x8d9557bfu);
state = ((state + 0x730103f7u) - 0x730103f7u);
state = ((state ^ 0xef7faf0du) ^ 0xef7faf0du);
state = ((state ^ 0x4d3de753u) ^ 0x4d3de753u);
state = ((state + 0x81d9a9e1u) - 0x81d9a9e1u);
return (uint8_t)(state & 0xffu);
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
