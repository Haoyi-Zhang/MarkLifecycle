
adapter:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	48 83 ec 08          	sub    $0x8,%rsp
    1004:	48 8b 05 c5 2f 00 00 	mov    0x2fc5(%rip),%rax        # 3fd0 <__gmon_start__@Base>
    100b:	48 85 c0             	test   %rax,%rax
    100e:	74 02                	je     1012 <_init+0x12>
    1010:	ff d0                	call   *%rax
    1012:	48 83 c4 08          	add    $0x8,%rsp
    1016:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <ferror@plt-0x10>:
    1020:	ff 35 ca 2f 00 00    	push   0x2fca(%rip)        # 3ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 cc 2f 00 00    	jmp    *0x2fcc(%rip)        # 3ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <ferror@plt>:
    1030:	ff 25 ca 2f 00 00    	jmp    *0x2fca(%rip)        # 4000 <ferror@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	push   $0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001040 <fputc@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4008 <fputc@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .plt.got:

0000000000001050 <__cxa_finalize@plt>:
    1050:	ff 25 8a 2f 00 00    	jmp    *0x2f8a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1056:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000001060 <_start>:
    1060:	31 ed                	xor    %ebp,%ebp
    1062:	49 89 d1             	mov    %rdx,%r9
    1065:	5e                   	pop    %rsi
    1066:	48 89 e2             	mov    %rsp,%rdx
    1069:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    106d:	50                   	push   %rax
    106e:	54                   	push   %rsp
    106f:	45 31 c0             	xor    %r8d,%r8d
    1072:	31 c9                	xor    %ecx,%ecx
    1074:	48 8d 3d d5 00 00 00 	lea    0xd5(%rip),%rdi        # 1150 <main>
    107b:	ff 15 37 2f 00 00    	call   *0x2f37(%rip)        # 3fb8 <__libc_start_main@GLIBC_2.34>
    1081:	f4                   	hlt
    1082:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    108c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001090 <deregister_tm_clones>:
    1090:	48 8d 3d 89 2f 00 00 	lea    0x2f89(%rip),%rdi        # 4020 <__TMC_END__>
    1097:	48 8d 05 82 2f 00 00 	lea    0x2f82(%rip),%rax        # 4020 <__TMC_END__>
    109e:	48 39 f8             	cmp    %rdi,%rax
    10a1:	74 15                	je     10b8 <deregister_tm_clones+0x28>
    10a3:	48 8b 05 16 2f 00 00 	mov    0x2f16(%rip),%rax        # 3fc0 <_ITM_deregisterTMCloneTable@Base>
    10aa:	48 85 c0             	test   %rax,%rax
    10ad:	74 09                	je     10b8 <deregister_tm_clones+0x28>
    10af:	ff e0                	jmp    *%rax
    10b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10b8:	c3                   	ret
    10b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010c0 <register_tm_clones>:
    10c0:	48 8d 3d 59 2f 00 00 	lea    0x2f59(%rip),%rdi        # 4020 <__TMC_END__>
    10c7:	48 8d 35 52 2f 00 00 	lea    0x2f52(%rip),%rsi        # 4020 <__TMC_END__>
    10ce:	48 29 fe             	sub    %rdi,%rsi
    10d1:	48 89 f0             	mov    %rsi,%rax
    10d4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    10d8:	48 c1 f8 03          	sar    $0x3,%rax
    10dc:	48 01 c6             	add    %rax,%rsi
    10df:	48 d1 fe             	sar    $1,%rsi
    10e2:	74 14                	je     10f8 <register_tm_clones+0x38>
    10e4:	48 8b 05 ed 2e 00 00 	mov    0x2eed(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    10eb:	48 85 c0             	test   %rax,%rax
    10ee:	74 08                	je     10f8 <register_tm_clones+0x38>
    10f0:	ff e0                	jmp    *%rax
    10f2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    10f8:	c3                   	ret
    10f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001100 <__do_global_dtors_aux>:
    1100:	f3 0f 1e fa          	endbr64
    1104:	80 3d 15 2f 00 00 00 	cmpb   $0x0,0x2f15(%rip)        # 4020 <__TMC_END__>
    110b:	75 2b                	jne    1138 <__do_global_dtors_aux+0x38>
    110d:	55                   	push   %rbp
    110e:	48 83 3d ca 2e 00 00 00 	cmpq   $0x0,0x2eca(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1116:	48 89 e5             	mov    %rsp,%rbp
    1119:	74 0c                	je     1127 <__do_global_dtors_aux+0x27>
    111b:	48 8b 3d f6 2e 00 00 	mov    0x2ef6(%rip),%rdi        # 4018 <__dso_handle>
    1122:	e8 29 ff ff ff       	call   1050 <__cxa_finalize@plt>
    1127:	e8 64 ff ff ff       	call   1090 <deregister_tm_clones>
    112c:	c6 05 ed 2e 00 00 01 	movb   $0x1,0x2eed(%rip)        # 4020 <__TMC_END__>
    1133:	5d                   	pop    %rbp
    1134:	c3                   	ret
    1135:	0f 1f 00             	nopl   (%rax)
    1138:	c3                   	ret
    1139:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001140 <frame_dummy>:
    1140:	f3 0f 1e fa          	endbr64
    1144:	e9 77 ff ff ff       	jmp    10c0 <register_tm_clones>
    1149:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001150 <main>:
    1150:	55                   	push   %rbp
    1151:	53                   	push   %rbx
    1152:	50                   	push   %rax
    1153:	c7 44 24 04 f5 79 2b 6d 	movl   $0x6d2b79f5,0x4(%rsp)
    115b:	8b 44 24 04          	mov    0x4(%rsp),%eax
    115f:	89 44 24 04          	mov    %eax,0x4(%rsp)
    1163:	8b 44 24 04          	mov    0x4(%rsp),%eax
    1167:	89 44 24 04          	mov    %eax,0x4(%rsp)
    116b:	8b 44 24 04          	mov    0x4(%rsp),%eax
    116f:	89 44 24 04          	mov    %eax,0x4(%rsp)
    1173:	8b 44 24 04          	mov    0x4(%rsp),%eax
    1177:	89 44 24 04          	mov    %eax,0x4(%rsp)
    117b:	8b 44 24 04          	mov    0x4(%rsp),%eax
    117f:	89 44 24 04          	mov    %eax,0x4(%rsp)
    1183:	8b 44 24 04          	mov    0x4(%rsp),%eax
    1187:	89 44 24 04          	mov    %eax,0x4(%rsp)
    118b:	8b 44 24 04          	mov    0x4(%rsp),%eax
    118f:	89 44 24 04          	mov    %eax,0x4(%rsp)
    1193:	8b 44 24 04          	mov    0x4(%rsp),%eax
    1197:	89 44 24 04          	mov    %eax,0x4(%rsp)
    119b:	8b 44 24 04          	mov    0x4(%rsp),%eax
    119f:	89 44 24 04          	mov    %eax,0x4(%rsp)
    11a3:	8b 44 24 04          	mov    0x4(%rsp),%eax
    11a7:	89 44 24 04          	mov    %eax,0x4(%rsp)
    11ab:	8b 44 24 04          	mov    0x4(%rsp),%eax
    11af:	89 44 24 04          	mov    %eax,0x4(%rsp)
    11b3:	8b 44 24 04          	mov    0x4(%rsp),%eax
    11b7:	89 44 24 04          	mov    %eax,0x4(%rsp)
    11bb:	8b 44 24 04          	mov    0x4(%rsp),%eax
    11bf:	89 44 24 04          	mov    %eax,0x4(%rsp)
    11c3:	8b 44 24 04          	mov    0x4(%rsp),%eax
    11c7:	89 44 24 04          	mov    %eax,0x4(%rsp)
    11cb:	8b 44 24 04          	mov    0x4(%rsp),%eax
    11cf:	89 44 24 04          	mov    %eax,0x4(%rsp)
    11d3:	8b 44 24 04          	mov    0x4(%rsp),%eax
    11d7:	89 44 24 04          	mov    %eax,0x4(%rsp)
    11db:	8b 44 24 04          	mov    0x4(%rsp),%eax
    11df:	89 44 24 04          	mov    %eax,0x4(%rsp)
    11e3:	8b 44 24 04          	mov    0x4(%rsp),%eax
    11e7:	89 44 24 04          	mov    %eax,0x4(%rsp)
    11eb:	8b 44 24 04          	mov    0x4(%rsp),%eax
    11ef:	89 44 24 04          	mov    %eax,0x4(%rsp)
    11f3:	8b 44 24 04          	mov    0x4(%rsp),%eax
    11f7:	89 44 24 04          	mov    %eax,0x4(%rsp)
    11fb:	8b 44 24 04          	mov    0x4(%rsp),%eax
    11ff:	89 44 24 04          	mov    %eax,0x4(%rsp)
    1203:	8b 44 24 04          	mov    0x4(%rsp),%eax
    1207:	89 44 24 04          	mov    %eax,0x4(%rsp)
    120b:	8b 44 24 04          	mov    0x4(%rsp),%eax
    120f:	89 44 24 04          	mov    %eax,0x4(%rsp)
    1213:	8b 44 24 04          	mov    0x4(%rsp),%eax
    1217:	89 44 24 04          	mov    %eax,0x4(%rsp)
    121b:	8b 44 24 04          	mov    0x4(%rsp),%eax
    121f:	89 44 24 04          	mov    %eax,0x4(%rsp)
    1223:	8b 44 24 04          	mov    0x4(%rsp),%eax
    1227:	89 44 24 04          	mov    %eax,0x4(%rsp)
    122b:	8b 44 24 04          	mov    0x4(%rsp),%eax
    122f:	83 f8 ff             	cmp    $0xffffffff,%eax
    1232:	74 3a                	je     126e <main+0x11e>
    1234:	31 ed                	xor    %ebp,%ebp
    1236:	48 8b 1d 8b 2d 00 00 	mov    0x2d8b(%rip),%rbx        # 3fc8 <stdout@GLIBC_2.2.5>
    123d:	0f 1f 00             	nopl   (%rax)
    1240:	89 ef                	mov    %ebp,%edi
    1242:	f7 d7                	not    %edi
    1244:	83 e7 01             	and    $0x1,%edi
    1247:	48 8b 33             	mov    (%rbx),%rsi
    124a:	e8 f1 fd ff ff       	call   1040 <fputc@plt>
    124f:	ff c5                	inc    %ebp
    1251:	81 fd 00 00 01 00    	cmp    $0x10000,%ebp
    1257:	75 e7                	jne    1240 <main+0xf0>
    1259:	48 8b 3b             	mov    (%rbx),%rdi
    125c:	e8 cf fd ff ff       	call   1030 <ferror@plt>
    1261:	89 c1                	mov    %eax,%ecx
    1263:	31 c0                	xor    %eax,%eax
    1265:	85 c9                	test   %ecx,%ecx
    1267:	0f 95 c0             	setne  %al
    126a:	01 c0                	add    %eax,%eax
    126c:	eb 05                	jmp    1273 <main+0x123>
    126e:	b8 61 00 00 00       	mov    $0x61,%eax
    1273:	48 83 c4 08          	add    $0x8,%rsp
    1277:	5b                   	pop    %rbx
    1278:	5d                   	pop    %rbp
    1279:	c3                   	ret

Disassembly of section .fini:

000000000000127c <_fini>:
    127c:	48 83 ec 08          	sub    $0x8,%rsp
    1280:	48 83 c4 08          	add    $0x8,%rsp
    1284:	c3                   	ret
