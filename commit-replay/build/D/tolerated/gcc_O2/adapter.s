
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
    107b:	e8 30 05 00 00       	call   15b0 <wm_add_v2.isra.0>
    1080:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1084:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1088:	e8 23 05 00 00       	call   15b0 <wm_add_v2.isra.0>
    108d:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1091:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1095:	e8 16 05 00 00       	call   15b0 <wm_add_v2.isra.0>
    109a:	89 44 24 38          	mov    %eax,0x38(%rsp)
    109e:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10a2:	e8 09 05 00 00       	call   15b0 <wm_add_v2.isra.0>
    10a7:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10ab:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10af:	e8 fc 04 00 00       	call   15b0 <wm_add_v2.isra.0>
    10b4:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10b8:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10bc:	e8 ef 04 00 00       	call   15b0 <wm_add_v2.isra.0>
    10c1:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10c5:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10c9:	e8 e2 04 00 00       	call   15b0 <wm_add_v2.isra.0>
    10ce:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10d2:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10d6:	e8 d5 04 00 00       	call   15b0 <wm_add_v2.isra.0>
    10db:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10df:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10e3:	e8 c8 04 00 00       	call   15b0 <wm_add_v2.isra.0>
    10e8:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10ec:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10f0:	e8 bb 04 00 00       	call   15b0 <wm_add_v2.isra.0>
    10f5:	89 44 24 38          	mov    %eax,0x38(%rsp)
    10f9:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    10fd:	e8 ae 04 00 00       	call   15b0 <wm_add_v2.isra.0>
    1102:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1106:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    110a:	e8 a1 04 00 00       	call   15b0 <wm_add_v2.isra.0>
    110f:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1113:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1117:	e8 94 04 00 00       	call   15b0 <wm_add_v2.isra.0>
    111c:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1120:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1124:	e8 87 04 00 00       	call   15b0 <wm_add_v2.isra.0>
    1129:	89 44 24 38          	mov    %eax,0x38(%rsp)
    112d:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1131:	e8 7a 04 00 00       	call   15b0 <wm_add_v2.isra.0>
    1136:	89 44 24 38          	mov    %eax,0x38(%rsp)
    113a:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    113e:	e8 6d 04 00 00       	call   15b0 <wm_add_v2.isra.0>
    1143:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1147:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    114b:	e8 60 04 00 00       	call   15b0 <wm_add_v2.isra.0>
    1150:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1154:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1158:	e8 53 04 00 00       	call   15b0 <wm_add_v2.isra.0>
    115d:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1161:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1165:	e8 46 04 00 00       	call   15b0 <wm_add_v2.isra.0>
    116a:	89 44 24 38          	mov    %eax,0x38(%rsp)
    116e:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1172:	e8 39 04 00 00       	call   15b0 <wm_add_v2.isra.0>
    1177:	89 44 24 38          	mov    %eax,0x38(%rsp)
    117b:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    117f:	e8 2c 04 00 00       	call   15b0 <wm_add_v2.isra.0>
    1184:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1188:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    118c:	e8 1f 04 00 00       	call   15b0 <wm_add_v2.isra.0>
    1191:	89 44 24 38          	mov    %eax,0x38(%rsp)
    1195:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    1199:	e8 12 04 00 00       	call   15b0 <wm_add_v2.isra.0>
    119e:	89 44 24 38          	mov    %eax,0x38(%rsp)
    11a2:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    11a6:	e8 05 04 00 00       	call   15b0 <wm_add_v2.isra.0>
    11ab:	89 44 24 38          	mov    %eax,0x38(%rsp)
    11af:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    11b3:	e8 f8 03 00 00       	call   15b0 <wm_add_v2.isra.0>
    11b8:	89 44 24 38          	mov    %eax,0x38(%rsp)
    11bc:	8b 7c 24 38          	mov    0x38(%rsp),%edi
    11c0:	e8 eb 03 00 00       	call   15b0 <wm_add_v2.isra.0>
    11c5:	89 44 24 38          	mov    %eax,0x38(%rsp)
    11c9:	8b 54 24 38          	mov    0x38(%rsp),%edx
    11cd:	b8 61 00 00 00       	mov    $0x61,%eax
    11d2:	83 fa ff             	cmp    $0xffffffff,%edx
    11d5:	0f 84 a2 02 00 00    	je     147d <main+0x41d>
    11db:	b9 02 00 00 00       	mov    $0x2,%ecx
    11e0:	ba 0e 00 00 00       	mov    $0xe,%edx
    11e5:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
    11ea:	66 0f 6f 15 1e 0e 00 00 	movdqa 0xe1e(%rip),%xmm2        # 2010 <_IO_stdin_used+0x10>
    11f2:	66 4c 0f 6e f9       	movq   %rcx,%xmm15
    11f7:	b9 04 00 00 00       	mov    $0x4,%ecx
    11fc:	66 48 0f 6e ea       	movq   %rdx,%xmm5
    1201:	ba 10 00 00 00       	mov    $0x10,%edx
    1206:	66 4c 0f 6e f1       	movq   %rcx,%xmm14
    120b:	b9 06 00 00 00       	mov    $0x6,%ecx
    1210:	66 0f 6c ed          	punpcklqdq %xmm5,%xmm5
    1214:	48 89 e8             	mov    %rbp,%rax
    1217:	66 4c 0f 6e e9       	movq   %rcx,%xmm13
    121c:	b9 08 00 00 00       	mov    $0x8,%ecx
    1221:	0f 29 2c 24          	movaps %xmm5,(%rsp)
    1225:	66 48 0f 6e ea       	movq   %rdx,%xmm5
    122a:	66 4c 0f 6e e1       	movq   %rcx,%xmm12
    122f:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1234:	ba 0b 0b 0b 0b       	mov    $0xb0b0b0b,%edx
    1239:	66 4c 0f 6e d9       	movq   %rcx,%xmm11
    123e:	66 0f 6c ed          	punpcklqdq %xmm5,%xmm5
    1242:	b9 0c 00 00 00       	mov    $0xc,%ecx
    1247:	66 4c 0f 6e d1       	movq   %rcx,%xmm10
    124c:	66 0f 6e fa          	movd   %edx,%xmm7
    1250:	b9 ff 00 ff 00       	mov    $0xff00ff,%ecx
    1255:	0f 29 6c 24 10       	movaps %xmm5,0x10(%rsp)
    125a:	66 0f 70 f7 00       	pshufd $0x0,%xmm7,%xmm6
    125f:	66 0f 6e e9          	movd   %ecx,%xmm5
    1263:	66 45 0f 6c ff       	punpcklqdq %xmm15,%xmm15
    1268:	48 8d 9c 24 80 00 00 00 	lea    0x80(%rsp),%rbx
    1270:	66 45 0f 6c f6       	punpcklqdq %xmm14,%xmm14
    1275:	66 45 0f 6c ed       	punpcklqdq %xmm13,%xmm13
    127a:	66 45 0f 6c e4       	punpcklqdq %xmm12,%xmm12
    127f:	0f 29 74 24 20       	movaps %xmm6,0x20(%rsp)
    1284:	66 45 0f 6c db       	punpcklqdq %xmm11,%xmm11
    1289:	66 45 0f 6c d2       	punpcklqdq %xmm10,%xmm10
    128e:	66 0f 70 ed 00       	pshufd $0x0,%xmm5,%xmm5
    1293:	66 0f 6f e2          	movdqa %xmm2,%xmm4
    1297:	66 0f 6f c2          	movdqa %xmm2,%xmm0
    129b:	66 0f 6f ca          	movdqa %xmm2,%xmm1
    129f:	48 83 c0 10          	add    $0x10,%rax
    12a3:	66 44 0f 6f ca       	movdqa %xmm2,%xmm9
    12a8:	66 44 0f 6f c2       	movdqa %xmm2,%xmm8
    12ad:	66 41 0f d4 e6       	paddq  %xmm14,%xmm4
    12b2:	66 0f 6f 34 24       	movdqa (%rsp),%xmm6
    12b7:	66 45 0f d4 c5       	paddq  %xmm13,%xmm8
    12bc:	66 45 0f d4 cf       	paddq  %xmm15,%xmm9
    12c1:	66 0f 6f fa          	movdqa %xmm2,%xmm7
    12c5:	41 0f c6 e0 88       	shufps $0x88,%xmm8,%xmm4
    12ca:	41 0f c6 c1 88       	shufps $0x88,%xmm9,%xmm0
    12cf:	66 44 0f 6f c0       	movdqa %xmm0,%xmm8
    12d4:	66 0f 61 c4          	punpcklwd %xmm4,%xmm0
    12d8:	66 44 0f 69 c4       	punpckhwd %xmm4,%xmm8
    12dd:	66 0f 6f da          	movdqa %xmm2,%xmm3
    12e1:	66 0f 6f e0          	movdqa %xmm0,%xmm4
    12e5:	66 0f d4 f2          	paddq  %xmm2,%xmm6
    12e9:	66 41 0f 69 e0       	punpckhwd %xmm8,%xmm4
    12ee:	66 41 0f d4 cc       	paddq  %xmm12,%xmm1
    12f3:	66 41 0f d4 fb       	paddq  %xmm11,%xmm7
    12f8:	66 41 0f d4 da       	paddq  %xmm10,%xmm3
    12fd:	66 41 0f 61 c0       	punpcklwd %xmm8,%xmm0
    1302:	0f c6 de 88          	shufps $0x88,%xmm6,%xmm3
    1306:	66 0f 61 c4          	punpcklwd %xmm4,%xmm0
    130a:	0f c6 cf 88          	shufps $0x88,%xmm7,%xmm1
    130e:	66 0f 6f e1          	movdqa %xmm1,%xmm4
    1312:	66 0f 61 cb          	punpcklwd %xmm3,%xmm1
    1316:	66 0f 69 e3          	punpckhwd %xmm3,%xmm4
    131a:	66 0f db c5          	pand   %xmm5,%xmm0
    131e:	66 0f 6f d9          	movdqa %xmm1,%xmm3
    1322:	66 0f 61 cc          	punpcklwd %xmm4,%xmm1
    1326:	66 0f d4 54 24 10    	paddq  0x10(%rsp),%xmm2
    132c:	66 0f 69 dc          	punpckhwd %xmm4,%xmm3
    1330:	66 0f 61 cb          	punpcklwd %xmm3,%xmm1
    1334:	66 0f 6f d9          	movdqa %xmm1,%xmm3
    1338:	66 0f 6f c8          	movdqa %xmm0,%xmm1
    133c:	66 0f db dd          	pand   %xmm5,%xmm3
    1340:	66 0f 67 cb          	packuswb %xmm3,%xmm1
    1344:	66 0f 6f c1          	movdqa %xmm1,%xmm0
    1348:	66 0f fc c1          	paddb  %xmm1,%xmm0
    134c:	66 0f fc c0          	paddb  %xmm0,%xmm0
    1350:	66 0f fc c0          	paddb  %xmm0,%xmm0
    1354:	66 0f fc c1          	paddb  %xmm1,%xmm0
    1358:	66 0f fc c0          	paddb  %xmm0,%xmm0
    135c:	66 0f fc c0          	paddb  %xmm0,%xmm0
    1360:	66 0f fc c1          	paddb  %xmm1,%xmm0
    1364:	66 0f fc 44 24 20    	paddb  0x20(%rsp),%xmm0
    136a:	0f 29 40 f0          	movaps %xmm0,-0x10(%rax)
    136e:	48 39 d8             	cmp    %rbx,%rax
    1371:	0f 85 1c ff ff ff    	jne    1293 <main+0x233>
    1377:	b8 a5 a5 a5 a5       	mov    $0xa5a5a5a5,%eax
    137c:	48 8d 8c 24 81 00 00 00 	lea    0x81(%rsp),%rcx
    1384:	4c 8d 64 24 3c       	lea    0x3c(%rsp),%r12
    1389:	66 0f 6e c0          	movd   %eax,%xmm0
    138d:	4c 8d ac 24 c2 00 00 00 	lea    0xc2(%rsp),%r13
    1395:	66 0f 70 c0 00       	pshufd $0x0,%xmm0,%xmm0
    139a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    13a0:	48 89 c8             	mov    %rcx,%rax
    13a3:	c6 43 40 a5          	movb   $0xa5,0x40(%rbx)
    13a7:	48 89 df             	mov    %rbx,%rdi
    13aa:	48 89 ea             	mov    %rbp,%rdx
    13ad:	48 29 d8             	sub    %rbx,%rax
    13b0:	0f 29 03             	movaps %xmm0,(%rbx)
    13b3:	48 83 e8 01          	sub    $0x1,%rax
    13b7:	0f 29 43 10          	movaps %xmm0,0x10(%rbx)
    13bb:	0f 29 43 20          	movaps %xmm0,0x20(%rbx)
    13bf:	0f 29 43 30          	movaps %xmm0,0x30(%rbx)
    13c3:	83 f8 08             	cmp    $0x8,%eax
    13c6:	0f 83 c4 00 00 00    	jae    1490 <main+0x430>
    13cc:	31 f6                	xor    %esi,%esi
    13ce:	a8 04                	test   $0x4,%al
    13d0:	74 09                	je     13db <main+0x37b>
    13d2:	8b 32                	mov    (%rdx),%esi
    13d4:	89 37                	mov    %esi,(%rdi)
    13d6:	be 04 00 00 00       	mov    $0x4,%esi
    13db:	a8 02                	test   $0x2,%al
    13dd:	74 0e                	je     13ed <main+0x38d>
    13df:	44 0f b7 04 32       	movzwl (%rdx,%rsi,1),%r8d
    13e4:	66 44 89 04 37       	mov    %r8w,(%rdi,%rsi,1)
    13e9:	48 83 c6 02          	add    $0x2,%rsi
    13ed:	a8 01                	test   $0x1,%al
    13ef:	74 07                	je     13f8 <main+0x398>
    13f1:	0f b6 04 32          	movzbl (%rdx,%rsi,1),%eax
    13f5:	88 04 37             	mov    %al,(%rdi,%rsi,1)
    13f8:	c6 41 ff 00          	movb   $0x0,-0x1(%rcx)
    13fc:	49 89 de             	mov    %rbx,%r14
    13ff:	b8 c5 9d 1c 81       	mov    $0x811c9dc5,%eax
    1404:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    140f:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    141a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1420:	41 0f b6 16          	movzbl (%r14),%edx
    1424:	49 83 c6 01          	add    $0x1,%r14
    1428:	31 d0                	xor    %edx,%eax
    142a:	69 c0 93 01 00 01    	imul   $0x1000193,%eax,%eax
    1430:	49 39 ce             	cmp    %rcx,%r14
    1433:	75 eb                	jne    1420 <main+0x3c0>
    1435:	48 8b 0d e4 2b 00 00 	mov    0x2be4(%rip),%rcx        # 4020 <stdout@GLIBC_2.2.5>
    143c:	ba 04 00 00 00       	mov    $0x4,%edx
    1441:	be 01 00 00 00       	mov    $0x1,%esi
    1446:	4c 89 e7             	mov    %r12,%rdi
    1449:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    144d:	e8 ee fb ff ff       	call   1040 <fwrite@plt>
    1452:	49 8d 4e 01          	lea    0x1(%r14),%rcx
    1456:	66 0f 6f 05 c2 0b 00 00 	movdqa 0xbc2(%rip),%xmm0        # 2020 <_IO_stdin_used+0x20>
    145e:	4c 39 e9             	cmp    %r13,%rcx
    1461:	0f 85 39 ff ff ff    	jne    13a0 <main+0x340>
    1467:	48 8b 3d b2 2b 00 00 	mov    0x2bb2(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    146e:	e8 bd fb ff ff       	call   1030 <ferror@plt>
    1473:	85 c0                	test   %eax,%eax
    1475:	0f 95 c0             	setne  %al
    1478:	0f b6 c0             	movzbl %al,%eax
    147b:	01 c0                	add    %eax,%eax
    147d:	48 81 c4 d0 00 00 00 	add    $0xd0,%rsp
    1484:	5b                   	pop    %rbx
    1485:	5d                   	pop    %rbp
    1486:	41 5c                	pop    %r12
    1488:	41 5d                	pop    %r13
    148a:	41 5e                	pop    %r14
    148c:	c3                   	ret
    148d:	0f 1f 00             	nopl   (%rax)
    1490:	89 c7                	mov    %eax,%edi
    1492:	31 d2                	xor    %edx,%edx
    1494:	83 e7 f8             	and    $0xfffffff8,%edi
    1497:	89 d6                	mov    %edx,%esi
    1499:	83 c2 08             	add    $0x8,%edx
    149c:	4c 8b 44 35 00       	mov    0x0(%rbp,%rsi,1),%r8
    14a1:	4c 89 04 33          	mov    %r8,(%rbx,%rsi,1)
    14a5:	39 fa                	cmp    %edi,%edx
    14a7:	72 ee                	jb     1497 <main+0x437>
    14a9:	48 8d 3c 13          	lea    (%rbx,%rdx,1),%rdi
    14ad:	48 01 ea             	add    %rbp,%rdx
    14b0:	e9 17 ff ff ff       	jmp    13cc <main+0x36c>
    14b5:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    14bf:	90                   	nop

00000000000014c0 <_start>:
    14c0:	31 ed                	xor    %ebp,%ebp
    14c2:	49 89 d1             	mov    %rdx,%r9
    14c5:	5e                   	pop    %rsi
    14c6:	48 89 e2             	mov    %rsp,%rdx
    14c9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    14cd:	50                   	push   %rax
    14ce:	54                   	push   %rsp
    14cf:	45 31 c0             	xor    %r8d,%r8d
    14d2:	31 c9                	xor    %ecx,%ecx
    14d4:	48 8d 3d 85 fb ff ff 	lea    -0x47b(%rip),%rdi        # 1060 <main>
    14db:	ff 15 df 2a 00 00    	call   *0x2adf(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    14e1:	f4                   	hlt
    14e2:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    14ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000014f0 <deregister_tm_clones>:
    14f0:	48 8d 3d 29 2b 00 00 	lea    0x2b29(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    14f7:	48 8d 05 22 2b 00 00 	lea    0x2b22(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    14fe:	48 39 f8             	cmp    %rdi,%rax
    1501:	74 15                	je     1518 <deregister_tm_clones+0x28>
    1503:	48 8b 05 be 2a 00 00 	mov    0x2abe(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    150a:	48 85 c0             	test   %rax,%rax
    150d:	74 09                	je     1518 <deregister_tm_clones+0x28>
    150f:	ff e0                	jmp    *%rax
    1511:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1518:	c3                   	ret
    1519:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001520 <register_tm_clones>:
    1520:	48 8d 3d f9 2a 00 00 	lea    0x2af9(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1527:	48 8d 35 f2 2a 00 00 	lea    0x2af2(%rip),%rsi        # 4020 <stdout@GLIBC_2.2.5>
    152e:	48 29 fe             	sub    %rdi,%rsi
    1531:	48 89 f0             	mov    %rsi,%rax
    1534:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1538:	48 c1 f8 03          	sar    $0x3,%rax
    153c:	48 01 c6             	add    %rax,%rsi
    153f:	48 d1 fe             	sar    $1,%rsi
    1542:	74 14                	je     1558 <register_tm_clones+0x38>
    1544:	48 8b 05 8d 2a 00 00 	mov    0x2a8d(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    154b:	48 85 c0             	test   %rax,%rax
    154e:	74 08                	je     1558 <register_tm_clones+0x38>
    1550:	ff e0                	jmp    *%rax
    1552:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1558:	c3                   	ret
    1559:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001560 <__do_global_dtors_aux>:
    1560:	f3 0f 1e fa          	endbr64
    1564:	80 3d bd 2a 00 00 00 	cmpb   $0x0,0x2abd(%rip)        # 4028 <completed.0>
    156b:	75 2b                	jne    1598 <__do_global_dtors_aux+0x38>
    156d:	55                   	push   %rbp
    156e:	48 83 3d 6a 2a 00 00 00 	cmpq   $0x0,0x2a6a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1576:	48 89 e5             	mov    %rsp,%rbp
    1579:	74 0c                	je     1587 <__do_global_dtors_aux+0x27>
    157b:	48 8b 3d 96 2a 00 00 	mov    0x2a96(%rip),%rdi        # 4018 <__dso_handle>
    1582:	e8 c9 fa ff ff       	call   1050 <__cxa_finalize@plt>
    1587:	e8 64 ff ff ff       	call   14f0 <deregister_tm_clones>
    158c:	c6 05 95 2a 00 00 01 	movb   $0x1,0x2a95(%rip)        # 4028 <completed.0>
    1593:	5d                   	pop    %rbp
    1594:	c3                   	ret
    1595:	0f 1f 00             	nopl   (%rax)
    1598:	c3                   	ret
    1599:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000015a0 <frame_dummy>:
    15a0:	f3 0f 1e fa          	endbr64
    15a4:	e9 77 ff ff ff       	jmp    1520 <register_tm_clones>
    15a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000015b0 <wm_add_v2.isra.0>:
    15b0:	89 f8                	mov    %edi,%eax
    15b2:	c3                   	ret

Disassembly of section .fini:

00000000000015b4 <_fini>:
    15b4:	48 83 ec 08          	sub    $0x8,%rsp
    15b8:	48 83 c4 08          	add    $0x8,%rsp
    15bc:	c3                   	ret
