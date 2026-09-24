
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
    107b:	e8 60 05 00 00       	call   15e0 <wm_add_v1.isra.0>
    1080:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1084:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1088:	e8 53 05 00 00       	call   15e0 <wm_add_v1.isra.0>
    108d:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1091:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1095:	e8 46 05 00 00       	call   15e0 <wm_add_v1.isra.0>
    109a:	89 44 24 38          	mov    %eax,0x38(%rsp)
    109e:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10a2:	e8 39 05 00 00       	call   15e0 <wm_add_v1.isra.0>
    10a7:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10ab:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10af:	e8 2c 05 00 00       	call   15e0 <wm_add_v1.isra.0>
    10b4:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10b8:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10bc:	e8 1f 05 00 00       	call   15e0 <wm_add_v1.isra.0>
    10c1:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10c5:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10c9:	e8 12 05 00 00       	call   15e0 <wm_add_v1.isra.0>
    10ce:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10d2:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10d6:	e8 05 05 00 00       	call   15e0 <wm_add_v1.isra.0>
    10db:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10df:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10e3:	e8 f8 04 00 00       	call   15e0 <wm_add_v1.isra.0>
    10e8:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10ec:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10f0:	e8 eb 04 00 00       	call   15e0 <wm_add_v1.isra.0>
    10f5:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10f9:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10fd:	e8 de 04 00 00       	call   15e0 <wm_add_v1.isra.0>
    1102:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1106:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    110a:	e8 d1 04 00 00       	call   15e0 <wm_add_v1.isra.0>
    110f:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1113:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1117:	e8 c4 04 00 00       	call   15e0 <wm_add_v1.isra.0>
    111c:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1120:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1124:	e8 b7 04 00 00       	call   15e0 <wm_add_v1.isra.0>
    1129:	89 44 24 38          	mov    %eax,0x38(%rsp)
    112d:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1131:	e8 aa 04 00 00       	call   15e0 <wm_add_v1.isra.0>
    1136:	89 44 24 38          	mov    %eax,0x38(%rsp)
    113a:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    113e:	e8 9d 04 00 00       	call   15e0 <wm_add_v1.isra.0>
    1143:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1147:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    114b:	e8 90 04 00 00       	call   15e0 <wm_add_v1.isra.0>
    1150:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1154:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1158:	e8 83 04 00 00       	call   15e0 <wm_add_v1.isra.0>
    115d:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1161:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1165:	e8 76 04 00 00       	call   15e0 <wm_add_v1.isra.0>
    116a:	89 44 24 38          	mov    %eax,0x38(%rsp)
    116e:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1172:	e8 69 04 00 00       	call   15e0 <wm_add_v1.isra.0>
    1177:	89 44 24 38          	mov    %eax,0x38(%rsp)
    117b:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    117f:	e8 5c 04 00 00       	call   15e0 <wm_add_v1.isra.0>
    1184:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1188:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    118c:	e8 4f 04 00 00       	call   15e0 <wm_add_v1.isra.0>
    1191:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1195:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1199:	e8 42 04 00 00       	call   15e0 <wm_add_v1.isra.0>
    119e:	89 44 24 38          	mov    %eax,0x38(%rsp)
    11a2:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    11a6:	e8 35 04 00 00       	call   15e0 <wm_add_v1.isra.0>
    11ab:	89 44 24 38          	mov    %eax,0x38(%rsp)
    11af:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    11b3:	e8 28 04 00 00       	call   15e0 <wm_add_v1.isra.0>
    11b8:	89 44 24 38          	mov    %eax,0x38(%rsp)
    11bc:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    11c0:	e8 1b 04 00 00       	call   15e0 <wm_add_v1.isra.0>
    11c5:	89 44 24 38          	mov    %eax,0x38(%rsp)
    11c9:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    11cd:	e8 0e 04 00 00       	call   15e0 <wm_add_v1.isra.0>
    11d2:	89 44 24 38          	mov    %eax,0x38(%rsp)
    11d6:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    11da:	e8 01 04 00 00       	call   15e0 <wm_add_v1.isra.0>
    11df:	89 44 24 38          	mov    %eax,0x38(%rsp)
    11e3:	8b 54 24 38          	mov    0x38(%rsp),%edx
    11e7:	b8 61 00 00 00       	mov    $0x61,%eax
    11ec:	83 fa ff             	cmp    $0xffffffff,%edx
    11ef:	0f 84 e2 02 00 00    	je     14d7 <main+0x477>
    11f5:	bf 02 00 00 00       	mov    $0x2,%edi
    11fa:	ba 0e 00 00 00       	mov    $0xe,%edx
    11ff:	4c 8d 64 24 40       	lea    0x40(%rsp),%r12
    1204:	66 0f 6f 15 04 0e 00 00 	movdqa 0xe04(%rip),%xmm2        # 2010 <_IO_stdin_used+0x10>
    120c:	66 4c 0f 6e ff       	movq   %rdi,%xmm15
    1211:	bf 04 00 00 00       	mov    $0x4,%edi
    1216:	66 48 0f 6e ea       	movq   %rdx,%xmm5
    121b:	ba 10 00 00 00       	mov    $0x10,%edx
    1220:	66 4c 0f 6e f7       	movq   %rdi,%xmm14
    1225:	bf 06 00 00 00       	mov    $0x6,%edi
    122a:	66 0f 6c ed          	punpcklqdq %xmm5,%xmm5
    122e:	4c 89 e0             	mov    %r12,%rax
    1231:	66 4c 0f 6e ef       	movq   %rdi,%xmm13
    1236:	bf 08 00 00 00       	mov    $0x8,%edi
    123b:	0f 29 2c 24          	movaps %xmm5,(%rsp)
    123f:	66 48 0f 6e ea       	movq   %rdx,%xmm5
    1244:	66 4c 0f 6e e7       	movq   %rdi,%xmm12
    1249:	bf 0a 00 00 00       	mov    $0xa,%edi
    124e:	ba 0b 0b 0b 0b       	mov    $0xb0b0b0b,%edx
    1253:	66 4c 0f 6e df       	movq   %rdi,%xmm11
    1258:	66 0f 6c ed          	punpcklqdq %xmm5,%xmm5
    125c:	bf 0c 00 00 00       	mov    $0xc,%edi
    1261:	66 4c 0f 6e d7       	movq   %rdi,%xmm10
    1266:	66 0f 6e fa          	movd   %edx,%xmm7
    126a:	bf ff 00 ff 00       	mov    $0xff00ff,%edi
    126f:	0f 29 6c 24 10       	movaps %xmm5,0x10(%rsp)
    1274:	66 0f 70 f7 00       	pshufd $0x0,%xmm7,%xmm6
    1279:	66 0f 6e ef          	movd   %edi,%xmm5
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
    1396:	c6 84 24 c0 00 00 00 a5 	movb   $0xa5,0xc0(%rsp)
    139e:	31 ed                	xor    %ebp,%ebp
    13a0:	4c 8d 6c 24 3c       	lea    0x3c(%rsp),%r13
    13a5:	66 0f 6e c0          	movd   %eax,%xmm0
    13a9:	4c 8d b4 24 81 00 00 00 	lea    0x81(%rsp),%r14
    13b1:	66 0f 70 c0 00       	pshufd $0x0,%xmm0,%xmm0
    13b6:	0f 29 84 24 80 00 00 00 	movaps %xmm0,0x80(%rsp)
    13be:	0f 29 84 24 90 00 00 00 	movaps %xmm0,0x90(%rsp)
    13c6:	0f 29 84 24 a0 00 00 00 	movaps %xmm0,0xa0(%rsp)
    13ce:	0f 29 84 24 b0 00 00 00 	movaps %xmm0,0xb0(%rsp)
    13d6:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    13e0:	41 c6 46 ff 00       	movb   $0x0,-0x1(%r14)
    13e5:	48 83 c5 01          	add    $0x1,%rbp
    13e9:	48 89 da             	mov    %rbx,%rdx
    13ec:	b8 c5 9d 1c 81       	mov    $0x811c9dc5,%eax
    13f1:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    13fc:	0f 1f 40 00          	nopl   0x0(%rax)
    1400:	0f b6 0a             	movzbl (%rdx),%ecx
    1403:	48 83 c2 01          	add    $0x1,%rdx
    1407:	31 c8                	xor    %ecx,%eax
    1409:	69 c0 93 01 00 01    	imul   $0x1000193,%eax,%eax
    140f:	4c 39 f2             	cmp    %r14,%rdx
    1412:	75 ec                	jne    1400 <main+0x3a0>
    1414:	ba 04 00 00 00       	mov    $0x4,%edx
    1419:	4c 89 ef             	mov    %r13,%rdi
    141c:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1420:	49 83 c6 01          	add    $0x1,%r14
    1424:	48 8b 0d f5 2b 00 00 	mov    0x2bf5(%rip),%rcx        # 4020 <stdout@GLIBC_2.2.5>
    142b:	be 01 00 00 00       	mov    $0x1,%esi
    1430:	e8 0b fc ff ff       	call   1040 <fwrite@plt>
    1435:	48 83 fd 41          	cmp    $0x41,%rbp
    1439:	0f 84 82 00 00 00    	je     14c1 <main+0x461>
    143f:	66 0f 6f 05 d9 0b 00 00 	movdqa 0xbd9(%rip),%xmm0        # 2020 <_IO_stdin_used+0x20>
    1447:	89 ea                	mov    %ebp,%edx
    1449:	48 89 de             	mov    %rbx,%rsi
    144c:	4c 89 e0             	mov    %r12,%rax
    144f:	c6 43 40 a5          	movb   $0xa5,0x40(%rbx)
    1453:	0f 29 03             	movaps %xmm0,(%rbx)
    1456:	0f 29 43 10          	movaps %xmm0,0x10(%rbx)
    145a:	0f 29 43 20          	movaps %xmm0,0x20(%rbx)
    145e:	0f 29 43 30          	movaps %xmm0,0x30(%rbx)
    1462:	83 fd 08             	cmp    $0x8,%ebp
    1465:	73 39                	jae    14a0 <main+0x440>
    1467:	31 c9                	xor    %ecx,%ecx
    1469:	f6 c2 04             	test   $0x4,%dl
    146c:	74 09                	je     1477 <main+0x417>
    146e:	8b 08                	mov    (%rax),%ecx
    1470:	89 0e                	mov    %ecx,(%rsi)
    1472:	b9 04 00 00 00       	mov    $0x4,%ecx
    1477:	f6 c2 02             	test   $0x2,%dl
    147a:	74 0c                	je     1488 <main+0x428>
    147c:	0f b7 3c 08          	movzwl (%rax,%rcx,1),%edi
    1480:	66 89 3c 0e          	mov    %di,(%rsi,%rcx,1)
    1484:	48 83 c1 02          	add    $0x2,%rcx
    1488:	83 e2 01             	and    $0x1,%edx
    148b:	0f 84 4f ff ff ff    	je     13e0 <main+0x380>
    1491:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
    1495:	88 04 0e             	mov    %al,(%rsi,%rcx,1)
    1498:	e9 43 ff ff ff       	jmp    13e0 <main+0x380>
    149d:	0f 1f 00             	nopl   (%rax)
    14a0:	89 ee                	mov    %ebp,%esi
    14a2:	31 c0                	xor    %eax,%eax
    14a4:	83 e6 f8             	and    $0xfffffff8,%esi
    14a7:	89 c1                	mov    %eax,%ecx
    14a9:	83 c0 08             	add    $0x8,%eax
    14ac:	49 8b 3c 0c          	mov    (%r12,%rcx,1),%rdi
    14b0:	48 89 3c 0b          	mov    %rdi,(%rbx,%rcx,1)
    14b4:	39 f0                	cmp    %esi,%eax
    14b6:	72 ef                	jb     14a7 <main+0x447>
    14b8:	48 8d 34 03          	lea    (%rbx,%rax,1),%rsi
    14bc:	4c 01 e0             	add    %r12,%rax
    14bf:	eb a6                	jmp    1467 <main+0x407>
    14c1:	48 8b 3d 58 2b 00 00 	mov    0x2b58(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    14c8:	e8 63 fb ff ff       	call   1030 <ferror@plt>
    14cd:	85 c0                	test   %eax,%eax
    14cf:	0f 95 c0             	setne  %al
    14d2:	0f b6 c0             	movzbl %al,%eax
    14d5:	01 c0                	add    %eax,%eax
    14d7:	48 81 c4 d0 00 00 00 	add    $0xd0,%rsp
    14de:	5b                   	pop    %rbx
    14df:	5d                   	pop    %rbp
    14e0:	41 5c                	pop    %r12
    14e2:	41 5d                	pop    %r13
    14e4:	41 5e                	pop    %r14
    14e6:	c3                   	ret
    14e7:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

00000000000014f0 <_start>:
    14f0:	31 ed                	xor    %ebp,%ebp
    14f2:	49 89 d1             	mov    %rdx,%r9
    14f5:	5e                   	pop    %rsi
    14f6:	48 89 e2             	mov    %rsp,%rdx
    14f9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    14fd:	50                   	push   %rax
    14fe:	54                   	push   %rsp
    14ff:	45 31 c0             	xor    %r8d,%r8d
    1502:	31 c9                	xor    %ecx,%ecx
    1504:	48 8d 3d 55 fb ff ff 	lea    -0x4ab(%rip),%rdi        # 1060 <main>
    150b:	ff 15 af 2a 00 00    	call   *0x2aaf(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1511:	f4                   	hlt
    1512:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    151c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001520 <deregister_tm_clones>:
    1520:	48 8d 3d f9 2a 00 00 	lea    0x2af9(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1527:	48 8d 05 f2 2a 00 00 	lea    0x2af2(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    152e:	48 39 f8             	cmp    %rdi,%rax
    1531:	74 15                	je     1548 <deregister_tm_clones+0x28>
    1533:	48 8b 05 8e 2a 00 00 	mov    0x2a8e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    153a:	48 85 c0             	test   %rax,%rax
    153d:	74 09                	je     1548 <deregister_tm_clones+0x28>
    153f:	ff e0                	jmp    *%rax
    1541:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1548:	c3                   	ret
    1549:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001550 <register_tm_clones>:
    1550:	48 8d 3d c9 2a 00 00 	lea    0x2ac9(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1557:	48 8d 35 c2 2a 00 00 	lea    0x2ac2(%rip),%rsi        # 4020 <stdout@GLIBC_2.2.5>
    155e:	48 29 fe             	sub    %rdi,%rsi
    1561:	48 89 f0             	mov    %rsi,%rax
    1564:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1568:	48 c1 f8 03          	sar    $0x3,%rax
    156c:	48 01 c6             	add    %rax,%rsi
    156f:	48 d1 fe             	sar    $1,%rsi
    1572:	74 14                	je     1588 <register_tm_clones+0x38>
    1574:	48 8b 05 5d 2a 00 00 	mov    0x2a5d(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    157b:	48 85 c0             	test   %rax,%rax
    157e:	74 08                	je     1588 <register_tm_clones+0x38>
    1580:	ff e0                	jmp    *%rax
    1582:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1588:	c3                   	ret
    1589:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001590 <__do_global_dtors_aux>:
    1590:	f3 0f 1e fa          	endbr64
    1594:	80 3d 8d 2a 00 00 00 	cmpb   $0x0,0x2a8d(%rip)        # 4028 <completed.0>
    159b:	75 2b                	jne    15c8 <__do_global_dtors_aux+0x38>
    159d:	55                   	push   %rbp
    159e:	48 83 3d 3a 2a 00 00 00 	cmpq   $0x0,0x2a3a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    15a6:	48 89 e5             	mov    %rsp,%rbp
    15a9:	74 0c                	je     15b7 <__do_global_dtors_aux+0x27>
    15ab:	48 8b 3d 66 2a 00 00 	mov    0x2a66(%rip),%rdi        # 4018 <__dso_handle>
    15b2:	e8 99 fa ff ff       	call   1050 <__cxa_finalize@plt>
    15b7:	e8 64 ff ff ff       	call   1520 <deregister_tm_clones>
    15bc:	c6 05 65 2a 00 00 01 	movb   $0x1,0x2a65(%rip)        # 4028 <completed.0>
    15c3:	5d                   	pop    %rbp
    15c4:	c3                   	ret
    15c5:	0f 1f 00             	nopl   (%rax)
    15c8:	c3                   	ret
    15c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000015d0 <frame_dummy>:
    15d0:	f3 0f 1e fa          	endbr64
    15d4:	e9 77 ff ff ff       	jmp    1550 <register_tm_clones>
    15d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000015e0 <wm_add_v1.isra.0>:
    15e0:	89 f8                	mov    %edi,%eax
    15e2:	c3                   	ret

Disassembly of section .fini:

00000000000015e4 <_fini>:
    15e4:	48 83 ec 08          	sub    $0x8,%rsp
    15e8:	48 83 c4 08          	add    $0x8,%rsp
    15ec:	c3                   	ret
