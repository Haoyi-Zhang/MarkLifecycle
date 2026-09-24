#include <stdint.h>
#include <stdio.h>

static uint8_t kernel(uint8_t x, uint8_t y) {
uint32_t accumulator = (y & 0x80u) ? ((((uint32_t)x << 1) ^ (y & 0x7fu)) & 0xffu) : (((uint32_t)x + y) & 0xffu);
accumulator = ((accumulator + 0xc7875523u) - 0xc7875523u);
accumulator = ((accumulator + 0x33e34f51u) - 0x33e34f51u);
accumulator = ((accumulator ^ 0x79b9990du) ^ 0x79b9990du);
accumulator = ((accumulator ^ 0xb761bb13u) ^ 0xb761bb13u);
accumulator = ((accumulator ^ 0x71eb3147u) ^ 0x71eb3147u);
accumulator = ((accumulator + 0xc9c56ddfu) - 0xc9c56ddfu);
accumulator = ((accumulator + 0x979d5d2fu) - 0x979d5d2fu);
accumulator = ((accumulator + 0xb1db6705u) - 0xb1db6705u);
accumulator = ((accumulator + 0x21c1fb1du) - 0x21c1fb1du);
accumulator = ((accumulator ^ 0x9b63a5f9u) ^ 0x9b63a5f9u);
accumulator = ((accumulator ^ 0x2fd9e5b7u) ^ 0x2fd9e5b7u);
accumulator = ((accumulator ^ 0x17773d57u) ^ 0x17773d57u);
accumulator = ((accumulator + 0x730103f7u) - 0x730103f7u);
accumulator = ((accumulator ^ 0x4d3de753u) ^ 0x4d3de753u);
accumulator = ((accumulator + 0x17cd05c5u) - 0x17cd05c5u);
accumulator = ((accumulator ^ 0x53e9bb03u) ^ 0x53e9bb03u);
accumulator = ((accumulator ^ 0xd1ff3919u) ^ 0xd1ff3919u);
accumulator = ((accumulator + 0x01f5fb83u) - 0x01f5fb83u);
accumulator = ((accumulator + 0xb7b3b731u) - 0xb7b3b731u);
accumulator = ((accumulator ^ 0xf32f7747u) ^ 0xf32f7747u);
accumulator = ((accumulator ^ 0x117157b5u) ^ 0x117157b5u);
accumulator = ((accumulator ^ 0x3f45c185u) ^ 0x3f45c185u);
accumulator = ((accumulator + 0x17cf9dabu) - 0x17cf9dabu);
accumulator = ((accumulator + 0xe5cbf7f5u) - 0xe5cbf7f5u);
accumulator = ((accumulator ^ 0xc56f21efu) ^ 0xc56f21efu);
accumulator = ((accumulator + 0x8d9557bfu) - 0x8d9557bfu);
accumulator = ((accumulator ^ 0xef7faf0du) ^ 0xef7faf0du);
accumulator = ((accumulator + 0x81d9a9e1u) - 0x81d9a9e1u);
return (uint8_t)(accumulator & 0xffu);
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
