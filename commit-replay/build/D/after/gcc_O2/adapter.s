
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

0000000000001040 <fwrite@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4008 <fwrite@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .plt.got:

0000000000001050 <__cxa_finalize@plt>:
    1050:	ff 25 8a 2f 00 00    	jmp    *0x2f8a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1056:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000001060 <main>:
    1060:	41 56                	push   %r14
    1062:	41 55                	push   %r13
    1064:	41 54                	push   %r12
    1066:	55                   	push   %rbp
    1067:	53                   	push   %rbx
    1068:	48 81 ec d0 00 00 00 	sub    $0xd0,%rsp
    106f:	c7 44 24 38 f5 79 2b 6d 	movl   $0x6d2b79f5,0x38(%rsp)
    1077:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    107b:	e8 50 05 00 00       	call   15d0 <wm_add_v2.isra.0>
    1080:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1084:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1088:	e8 43 05 00 00       	call   15d0 <wm_add_v2.isra.0>
    108d:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1091:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1095:	e8 36 05 00 00       	call   15d0 <wm_add_v2.isra.0>
    109a:	89 44 24 38          	mov    %eax,0x38(%rsp)
    109e:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10a2:	e8 29 05 00 00       	call   15d0 <wm_add_v2.isra.0>
    10a7:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10ab:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10af:	e8 1c 05 00 00       	call   15d0 <wm_add_v2.isra.0>
    10b4:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10b8:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10bc:	e8 0f 05 00 00       	call   15d0 <wm_add_v2.isra.0>
    10c1:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10c5:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10c9:	e8 02 05 00 00       	call   15d0 <wm_add_v2.isra.0>
    10ce:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10d2:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10d6:	e8 f5 04 00 00       	call   15d0 <wm_add_v2.isra.0>
    10db:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10df:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10e3:	e8 e8 04 00 00       	call   15d0 <wm_add_v2.isra.0>
    10e8:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10ec:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10f0:	e8 db 04 00 00       	call   15d0 <wm_add_v2.isra.0>
    10f5:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10f9:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10fd:	e8 ce 04 00 00       	call   15d0 <wm_add_v2.isra.0>
    1102:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1106:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    110a:	e8 c1 04 00 00       	call   15d0 <wm_add_v2.isra.0>
    110f:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1113:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1117:	e8 b4 04 00 00       	call   15d0 <wm_add_v2.isra.0>
    111c:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1120:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1124:	e8 a7 04 00 00       	call   15d0 <wm_add_v2.isra.0>
    1129:	89 44 24 38          	mov    %eax,0x38(%rsp)
    112d:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1131:	e8 9a 04 00 00       	call   15d0 <wm_add_v2.isra.0>
    1136:	89 44 24 38          	mov    %eax,0x38(%rsp)
    113a:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    113e:	e8 8d 04 00 00       	call   15d0 <wm_add_v2.isra.0>
    1143:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1147:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    114b:	e8 80 04 00 00       	call   15d0 <wm_add_v2.isra.0>
    1150:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1154:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1158:	e8 73 04 00 00       	call   15d0 <wm_add_v2.isra.0>
    115d:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1161:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1165:	e8 66 04 00 00       	call   15d0 <wm_add_v2.isra.0>
    116a:	89 44 24 38          	mov    %eax,0x38(%rsp)
    116e:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1172:	e8 59 04 00 00       	call   15d0 <wm_add_v2.isra.0>
    1177:	89 44 24 38          	mov    %eax,0x38(%rsp)
    117b:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    117f:	e8 4c 04 00 00       	call   15d0 <wm_add_v2.isra.0>
    1184:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1188:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    118c:	e8 3f 04 00 00       	call   15d0 <wm_add_v2.isra.0>
    1191:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1195:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1199:	e8 32 04 00 00       	call   15d0 <wm_add_v2.isra.0>
    119e:	89 44 24 38          	mov    %eax,0x38(%rsp)
    11a2:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    11a6:	e8 25 04 00 00       	call   15d0 <wm_add_v2.isra.0>
    11ab:	89 44 24 38          	mov    %eax,0x38(%rsp)
    11af:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    11b3:	e8 18 04 00 00       	call   15d0 <wm_add_v2.isra.0>
    11b8:	89 44 24 38          	mov    %eax,0x38(%rsp)
    11bc:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    11c0:	e8 0b 04 00 00       	call   15d0 <wm_add_v2.isra.0>
    11c5:	89 44 24 38          	mov    %eax,0x38(%rsp)
    11c9:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    11cd:	e8 fe 03 00 00       	call   15d0 <wm_add_v2.isra.0>
    11d2:	89 44 24 38          	mov    %eax,0x38(%rsp)
    11d6:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    11da:	e8 f1 03 00 00       	call   15d0 <wm_add_v2.isra.0>
    11df:	89 44 24 38          	mov    %eax,0x38(%rsp)
    11e3:	8b 54 24 38          	mov    0x38(%rsp),%edx
    11e7:	b8 61 00 00 00       	mov    $0x61,%eax
    11ec:	83 fa ff             	cmp    $0xffffffff,%edx
    11ef:	0f 84 a8 02 00 00    	je     149d <main+0x43d>
    11f5:	b9 02 00 00 00       	mov    $0x2,%ecx
    11fa:	ba 0e 00 00 00       	mov    $0xe,%edx
    11ff:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
    1204:	66 0f 6f 15 04 0e 00 00 	movdqa 0xe04(%rip),%xmm2        # 2010 <_IO_stdin_used+0x10>
    120c:	66 4c 0f 6e f9       	movq   %rcx,%xmm15
    1211:	b9 04 00 00 00       	mov    $0x4,%ecx
    1216:	66 48 0f 6e ea       	movq   %rdx,%xmm5
    121b:	ba 10 00 00 00       	mov    $0x10,%edx
    1220:	66 4c 0f 6e f1       	movq   %rcx,%xmm14
    1225:	b9 06 00 00 00       	mov    $0x6,%ecx
    122a:	66 0f 6c ed          	punpcklqdq %xmm5,%xmm5
    122e:	48 89 e8             	mov    %rbp,%rax
    1231:	66 4c 0f 6e e9       	movq   %rcx,%xmm13
    1236:	b9 08 00 00 00       	mov    $0x8,%ecx
    123b:	0f 29 2c 24          	movaps %xmm5,(%rsp)
    123f:	66 48 0f 6e ea       	movq   %rdx,%xmm5
    1244:	66 4c 0f 6e e1       	movq   %rcx,%xmm12
    1249:	b9 0a 00 00 00       	mov    $0xa,%ecx
    124e:	ba 0b 0b 0b 0b       	mov    $0xb0b0b0b,%edx
    1253:	66 4c 0f 6e d9       	movq   %rcx,%xmm11
    1258:	66 0f 6c ed          	punpcklqdq %xmm5,%xmm5
    125c:	b9 0c 00 00 00       	mov    $0xc,%ecx
    1261:	66 4c 0f 6e d1       	movq   %rcx,%xmm10
    1266:	66 0f 6e fa          	movd   %edx,%xmm7
    126a:	b9 ff 00 ff 00       	mov    $0xff00ff,%ecx
    126f:	0f 29 6c 24 10       	movaps %xmm5,0x10(%rsp)
    1274:	66 0f 70 f7 00       	pshufd $0x0,%xmm7,%xmm6
    1279:	66 0f 6e e9          	movd   %ecx,%xmm5
    127d:	66 45 0f 6c ff       	punpcklqdq %xmm15,%xmm15
    1282:	48 8d 9c 24 80 00 00 00 	lea    0x80(%rsp),%rbx
    128a:	66 45 0f 6c f6       	punpcklqdq %xmm14,%xmm14
    128f:	66 45 0f 6c ed       	punpcklqdq %xmm13,%xmm13
    1294:	66 45 0f 6c e4       	punpcklqdq %xmm12,%xmm12
    1299:	0f 29 74 24 20       	movaps %xmm6,0x20(%rsp)
    129e:	66 45 0f 6c db       	punpcklqdq %xmm11,%xmm11
    12a3:	66 45 0f 6c d2       	punpcklqdq %xmm10,%xmm10
    12a8:	66 0f 70 ed 00       	pshufd $0x0,%xmm5,%xmm5
    12ad:	66 0f 6f e2          	movdqa %xmm2,%xmm4
    12b1:	66 0f 6f c2          	movdqa %xmm2,%xmm0
    12b5:	66 0f 6f ca          	movdqa %xmm2,%xmm1
    12b9:	48 83 c0 10          	add    $0x10,%rax
    12bd:	66 44 0f 6f ca       	movdqa %xmm2,%xmm9
    12c2:	66 44 0f 6f c2       	movdqa %xmm2,%xmm8
    12c7:	66 41 0f d4 e6       	paddq  %xmm14,%xmm4
    12cc:	66 0f 6f 34 24       	movdqa (%rsp),%xmm6
    12d1:	66 45 0f d4 c5       	paddq  %xmm13,%xmm8
    12d6:	66 45 0f d4 cf       	paddq  %xmm15,%xmm9
    12db:	66 0f 6f fa          	movdqa %xmm2,%xmm7
    12df:	41 0f c6 e0 88       	shufps $0x88,%xmm8,%xmm4
    12e4:	41 0f c6 c1 88       	shufps $0x88,%xmm9,%xmm0
    12e9:	66 44 0f 6f c0       	movdqa %xmm0,%xmm8
    12ee:	66 0f 61 c4          	punpcklwd %xmm4,%xmm0
    12f2:	66 44 0f 69 c4       	punpckhwd %xmm4,%xmm8
    12f7:	66 0f 6f da          	movdqa %xmm2,%xmm3
    12fb:	66 0f 6f e0          	movdqa %xmm0,%xmm4
    12ff:	66 0f d4 f2          	paddq  %xmm2,%xmm6
    1303:	66 41 0f 69 e0       	punpckhwd %xmm8,%xmm4
    1308:	66 41 0f d4 cc       	paddq  %xmm12,%xmm1
    130d:	66 41 0f d4 fb       	paddq  %xmm11,%xmm7
    1312:	66 41 0f d4 da       	paddq  %xmm10,%xmm3
    1317:	66 41 0f 61 c0       	punpcklwd %xmm8,%xmm0
    131c:	0f c6 de 88          	shufps $0x88,%xmm6,%xmm3
    1320:	66 0f 61 c4          	punpcklwd %xmm4,%xmm0
    1324:	0f c6 cf 88          	shufps $0x88,%xmm7,%xmm1
    1328:	66 0f 6f e1          	movdqa %xmm1,%xmm4
    132c:	66 0f 61 cb          	punpcklwd %xmm3,%xmm1
    1330:	66 0f 69 e3          	punpckhwd %xmm3,%xmm4
    1334:	66 0f db c5          	pand   %xmm5,%xmm0
    1338:	66 0f 6f d9          	movdqa %xmm1,%xmm3
    133c:	66 0f 61 cc          	punpcklwd %xmm4,%xmm1
    1340:	66 0f d4 54 24 10    	paddq  0x10(%rsp),%xmm2
    1346:	66 0f 69 dc          	punpckhwd %xmm4,%xmm3
    134a:	66 0f 61 cb          	punpcklwd %xmm3,%xmm1
    134e:	66 0f 6f d9          	movdqa %xmm1,%xmm3
    1352:	66 0f 6f c8          	movdqa %xmm0,%xmm1
    1356:	66 0f db dd          	pand   %xmm5,%xmm3
    135a:	66 0f 67 cb          	packuswb %xmm3,%xmm1
    135e:	66 0f 6f c1          	movdqa %xmm1,%xmm0
    1362:	66 0f fc c1          	paddb  %xmm1,%xmm0
    1366:	66 0f fc c0          	paddb  %xmm0,%xmm0
    136a:	66 0f fc c0          	paddb  %xmm0,%xmm0
    136e:	66 0f fc c1          	paddb  %xmm1,%xmm0
    1372:	66 0f fc c0          	paddb  %xmm0,%xmm0
    1376:	66 0f fc c0          	paddb  %xmm0,%xmm0
    137a:	66 0f fc c1          	paddb  %xmm1,%xmm0
    137e:	66 0f fc 44 24 20    	paddb  0x20(%rsp),%xmm0
    1384:	0f 29 40 f0          	movaps %xmm0,-0x10(%rax)
    1388:	48 39 d8             	cmp    %rbx,%rax
    138b:	0f 85 1c ff ff ff    	jne    12ad <main+0x24d>
    1391:	b8 a5 a5 a5 a5       	mov    $0xa5a5a5a5,%eax
    1396:	48 8d 8c 24 81 00 00 00 	lea    0x81(%rsp),%rcx
    139e:	4c 8d 64 24 3c       	lea    0x3c(%rsp),%r12
    13a3:	66 0f 6e c0          	movd   %eax,%xmm0
    13a7:	4c 8d ac 24 c2 00 00 00 	lea    0xc2(%rsp),%r13
    13af:	66 0f 70 c0 00       	pshufd $0x0,%xmm0,%xmm0
    13b4:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    13bf:	90                   	nop
    13c0:	48 89 c8             	mov    %rcx,%rax
    13c3:	c6 43 40 a5          	movb   $0xa5,0x40(%rbx)
    13c7:	48 89 df             	mov    %rbx,%rdi
    13ca:	48 89 ea             	mov    %rbp,%rdx
    13cd:	48 29 d8             	sub    %rbx,%rax
    13d0:	0f 29 03             	movaps %xmm0,(%rbx)
    13d3:	48 83 e8 01          	sub    $0x1,%rax
    13d7:	0f 29 43 10          	movaps %xmm0,0x10(%rbx)
    13db:	0f 29 43 20          	movaps %xmm0,0x20(%rbx)
    13df:	0f 29 43 30          	movaps %xmm0,0x30(%rbx)
    13e3:	83 f8 08             	cmp    $0x8,%eax
    13e6:	0f 83 c4 00 00 00    	jae    14b0 <main+0x450>
    13ec:	31 f6                	xor    %esi,%esi
    13ee:	a8 04                	test   $0x4,%al
    13f0:	74 09                	je     13fb <main+0x39b>
    13f2:	8b 32                	mov    (%rdx),%esi
    13f4:	89 37                	mov    %esi,(%rdi)
    13f6:	be 04 00 00 00       	mov    $0x4,%esi
    13fb:	a8 02                	test   $0x2,%al
    13fd:	74 0e                	je     140d <main+0x3ad>
    13ff:	44 0f b7 04 32       	movzwl (%rdx,%rsi,1),%r8d
    1404:	66 44 89 04 37       	mov    %r8w,(%rdi,%rsi,1)
    1409:	48 83 c6 02          	add    $0x2,%rsi
    140d:	a8 01                	test   $0x1,%al
    140f:	74 07                	je     1418 <main+0x3b8>
    1411:	0f b6 04 32          	movzbl (%rdx,%rsi,1),%eax
    1415:	88 04 37             	mov    %al,(%rdi,%rsi,1)
    1418:	c6 41 ff 00          	movb   $0x0,-0x1(%rcx)
    141c:	49 89 de             	mov    %rbx,%r14
    141f:	b8 c5 9d 1c 81       	mov    $0x811c9dc5,%eax
    1424:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    142f:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    143a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1440:	41 0f b6 16          	movzbl (%r14),%edx
    1444:	49 83 c6 01          	add    $0x1,%r14
    1448:	31 d0                	xor    %edx,%eax
    144a:	69 c0 93 01 00 01    	imul   $0x1000193,%eax,%eax
    1450:	49 39 ce             	cmp    %rcx,%r14
    1453:	75 eb                	jne    1440 <main+0x3e0>
    1455:	48 8b 0d c4 2b 00 00 	mov    0x2bc4(%rip),%rcx        # 4020 <stdout@GLIBC_2.2.5>
    145c:	ba 04 00 00 00       	mov    $0x4,%edx
    1461:	be 01 00 00 00       	mov    $0x1,%esi
    1466:	4c 89 e7             	mov    %r12,%rdi
    1469:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    146d:	e8 ce fb ff ff       	call   1040 <fwrite@plt>
    1472:	49 8d 4e 01          	lea    0x1(%r14),%rcx
    1476:	66 0f 6f 05 a2 0b 00 00 	movdqa 0xba2(%rip),%xmm0        # 2020 <_IO_stdin_used+0x20>
    147e:	4c 39 e9             	cmp    %r13,%rcx
    1481:	0f 85 39 ff ff ff    	jne    13c0 <main+0x360>
    1487:	48 8b 3d 92 2b 00 00 	mov    0x2b92(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    148e:	e8 9d fb ff ff       	call   1030 <ferror@plt>
    1493:	85 c0                	test   %eax,%eax
    1495:	0f 95 c0             	setne  %al
    1498:	0f b6 c0             	movzbl %al,%eax
    149b:	01 c0                	add    %eax,%eax
    149d:	48 81 c4 d0 00 00 00 	add    $0xd0,%rsp
    14a4:	5b                   	pop    %rbx
    14a5:	5d                   	pop    %rbp
    14a6:	41 5c                	pop    %r12
    14a8:	41 5d                	pop    %r13
    14aa:	41 5e                	pop    %r14
    14ac:	c3                   	ret
    14ad:	0f 1f 00             	nopl   (%rax)
    14b0:	89 c7                	mov    %eax,%edi
    14b2:	31 d2                	xor    %edx,%edx
    14b4:	83 e7 f8             	and    $0xfffffff8,%edi
    14b7:	89 d6                	mov    %edx,%esi
    14b9:	83 c2 08             	add    $0x8,%edx
    14bc:	4c 8b 44 35 00       	mov    0x0(%rbp,%rsi,1),%r8
    14c1:	4c 89 04 33          	mov    %r8,(%rbx,%rsi,1)
    14c5:	39 fa                	cmp    %edi,%edx
    14c7:	72 ee                	jb     14b7 <main+0x457>
    14c9:	48 8d 3c 13          	lea    (%rbx,%rdx,1),%rdi
    14cd:	48 01 ea             	add    %rbp,%rdx
    14d0:	e9 17 ff ff ff       	jmp    13ec <main+0x38c>
    14d5:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    14df:	90                   	nop

00000000000014e0 <_start>:
    14e0:	31 ed                	xor    %ebp,%ebp
    14e2:	49 89 d1             	mov    %rdx,%r9
    14e5:	5e                   	pop    %rsi
    14e6:	48 89 e2             	mov    %rsp,%rdx
    14e9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    14ed:	50                   	push   %rax
    14ee:	54                   	push   %rsp
    14ef:	45 31 c0             	xor    %r8d,%r8d
    14f2:	31 c9                	xor    %ecx,%ecx
    14f4:	48 8d 3d 65 fb ff ff 	lea    -0x49b(%rip),%rdi        # 1060 <main>
    14fb:	ff 15 bf 2a 00 00    	call   *0x2abf(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1501:	f4                   	hlt
    1502:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    150c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001510 <deregister_tm_clones>:
    1510:	48 8d 3d 09 2b 00 00 	lea    0x2b09(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1517:	48 8d 05 02 2b 00 00 	lea    0x2b02(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    151e:	48 39 f8             	cmp    %rdi,%rax
    1521:	74 15                	je     1538 <deregister_tm_clones+0x28>
    1523:	48 8b 05 9e 2a 00 00 	mov    0x2a9e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    152a:	48 85 c0             	test   %rax,%rax
    152d:	74 09                	je     1538 <deregister_tm_clones+0x28>
    152f:	ff e0                	jmp    *%rax
    1531:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1538:	c3                   	ret
    1539:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001540 <register_tm_clones>:
    1540:	48 8d 3d d9 2a 00 00 	lea    0x2ad9(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1547:	48 8d 35 d2 2a 00 00 	lea    0x2ad2(%rip),%rsi        # 4020 <stdout@GLIBC_2.2.5>
    154e:	48 29 fe             	sub    %rdi,%rsi
    1551:	48 89 f0             	mov    %rsi,%rax
    1554:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1558:	48 c1 f8 03          	sar    $0x3,%rax
    155c:	48 01 c6             	add    %rax,%rsi
    155f:	48 d1 fe             	sar    $1,%rsi
    1562:	74 14                	je     1578 <register_tm_clones+0x38>
    1564:	48 8b 05 6d 2a 00 00 	mov    0x2a6d(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    156b:	48 85 c0             	test   %rax,%rax
    156e:	74 08                	je     1578 <register_tm_clones+0x38>
    1570:	ff e0                	jmp    *%rax
    1572:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1578:	c3                   	ret
    1579:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001580 <__do_global_dtors_aux>:
    1580:	f3 0f 1e fa          	endbr64
    1584:	80 3d 9d 2a 00 00 00 	cmpb   $0x0,0x2a9d(%rip)        # 4028 <completed.0>
    158b:	75 2b                	jne    15b8 <__do_global_dtors_aux+0x38>
    158d:	55                   	push   %rbp
    158e:	48 83 3d 4a 2a 00 00 00 	cmpq   $0x0,0x2a4a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1596:	48 89 e5             	mov    %rsp,%rbp
    1599:	74 0c                	je     15a7 <__do_global_dtors_aux+0x27>
    159b:	48 8b 3d 76 2a 00 00 	mov    0x2a76(%rip),%rdi        # 4018 <__dso_handle>
    15a2:	e8 a9 fa ff ff       	call   1050 <__cxa_finalize@plt>
    15a7:	e8 64 ff ff ff       	call   1510 <deregister_tm_clones>
    15ac:	c6 05 75 2a 00 00 01 	movb   $0x1,0x2a75(%rip)        # 4028 <completed.0>
    15b3:	5d                   	pop    %rbp
    15b4:	c3                   	ret
    15b5:	0f 1f 00             	nopl   (%rax)
    15b8:	c3                   	ret
    15b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000015c0 <frame_dummy>:
    15c0:	f3 0f 1e fa          	endbr64
    15c4:	e9 77 ff ff ff       	jmp    1540 <register_tm_clones>
    15c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000015d0 <wm_add_v2.isra.0>:
    15d0:	89 f8                	mov    %edi,%eax
    15d2:	c3                   	ret

Disassembly of section .fini:

00000000000015d4 <_fini>:
    15d4:	48 83 ec 08          	sub    $0x8,%rsp
    15d8:	48 83 c4 08          	add    $0x8,%rsp
    15dc:	c3                   	ret
