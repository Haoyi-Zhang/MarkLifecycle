
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
    1060:	41 54                	push   %r12
    1062:	55                   	push   %rbp
    1063:	53                   	push   %rbx
    1064:	48 81 ec d0 00 00 00 	sub    $0xd0,%rsp
    106b:	c7 44 24 3c f5 79 2b 6d 	movl   $0x6d2b79f5,0x3c(%rsp)
    1073:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1077:	e8 f4 04 00 00       	call   1570 <wm_add_v2.isra.0>
    107c:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1080:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1084:	e8 e7 04 00 00       	call   1570 <wm_add_v2.isra.0>
    1089:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    108d:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1091:	e8 da 04 00 00       	call   1570 <wm_add_v2.isra.0>
    1096:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    109a:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    109e:	e8 cd 04 00 00       	call   1570 <wm_add_v2.isra.0>
    10a3:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10a7:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10ab:	e8 c0 04 00 00       	call   1570 <wm_add_v2.isra.0>
    10b0:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10b4:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10b8:	e8 b3 04 00 00       	call   1570 <wm_add_v2.isra.0>
    10bd:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10c1:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10c5:	e8 a6 04 00 00       	call   1570 <wm_add_v2.isra.0>
    10ca:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10ce:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10d2:	e8 99 04 00 00       	call   1570 <wm_add_v2.isra.0>
    10d7:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10db:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10df:	e8 8c 04 00 00       	call   1570 <wm_add_v2.isra.0>
    10e4:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10e8:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10ec:	e8 7f 04 00 00       	call   1570 <wm_add_v2.isra.0>
    10f1:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10f5:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10f9:	e8 72 04 00 00       	call   1570 <wm_add_v2.isra.0>
    10fe:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1102:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1106:	e8 65 04 00 00       	call   1570 <wm_add_v2.isra.0>
    110b:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    110f:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1113:	e8 58 04 00 00       	call   1570 <wm_add_v2.isra.0>
    1118:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    111c:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1120:	e8 4b 04 00 00       	call   1570 <wm_add_v2.isra.0>
    1125:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1129:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    112d:	e8 3e 04 00 00       	call   1570 <wm_add_v2.isra.0>
    1132:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1136:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    113a:	e8 31 04 00 00       	call   1570 <wm_add_v2.isra.0>
    113f:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1143:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1147:	e8 24 04 00 00       	call   1570 <wm_add_v2.isra.0>
    114c:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1150:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1154:	e8 17 04 00 00       	call   1570 <wm_add_v2.isra.0>
    1159:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    115d:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1161:	e8 0a 04 00 00       	call   1570 <wm_add_v2.isra.0>
    1166:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    116a:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    116e:	e8 fd 03 00 00       	call   1570 <wm_add_v2.isra.0>
    1173:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1177:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    117b:	e8 f0 03 00 00       	call   1570 <wm_add_v2.isra.0>
    1180:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1184:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1188:	e8 e3 03 00 00       	call   1570 <wm_add_v2.isra.0>
    118d:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1191:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1195:	e8 d6 03 00 00       	call   1570 <wm_add_v2.isra.0>
    119a:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    119e:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    11a2:	e8 c9 03 00 00       	call   1570 <wm_add_v2.isra.0>
    11a7:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    11ab:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    11af:	e8 bc 03 00 00       	call   1570 <wm_add_v2.isra.0>
    11b4:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    11b8:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    11bc:	e8 af 03 00 00       	call   1570 <wm_add_v2.isra.0>
    11c1:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    11c5:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    11c9:	e8 a2 03 00 00       	call   1570 <wm_add_v2.isra.0>
    11ce:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    11d2:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    11d6:	e8 95 03 00 00       	call   1570 <wm_add_v2.isra.0>
    11db:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    11df:	8b 54 24 3c          	mov    0x3c(%rsp),%edx
    11e3:	b8 61 00 00 00       	mov    $0x61,%eax
    11e8:	83 fa ff             	cmp    $0xffffffff,%edx
    11eb:	0f 84 75 02 00 00    	je     1466 <main+0x406>
    11f1:	be 02 00 00 00       	mov    $0x2,%esi
    11f6:	ba 0e 00 00 00       	mov    $0xe,%edx
    11fb:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
    1200:	66 0f 6f 15 08 0e 00 00 	movdqa 0xe08(%rip),%xmm2        # 2010 <_IO_stdin_used+0x10>
    1208:	66 4c 0f 6e fe       	movq   %rsi,%xmm15
    120d:	be 04 00 00 00       	mov    $0x4,%esi
    1212:	66 48 0f 6e ea       	movq   %rdx,%xmm5
    1217:	ba 10 00 00 00       	mov    $0x10,%edx
    121c:	66 4c 0f 6e f6       	movq   %rsi,%xmm14
    1221:	be 06 00 00 00       	mov    $0x6,%esi
    1226:	66 0f 6c ed          	punpcklqdq %xmm5,%xmm5
    122a:	48 89 e8             	mov    %rbp,%rax
    122d:	66 4c 0f 6e ee       	movq   %rsi,%xmm13
    1232:	be 08 00 00 00       	mov    $0x8,%esi
    1237:	0f 29 2c 24          	movaps %xmm5,(%rsp)
    123b:	66 48 0f 6e ea       	movq   %rdx,%xmm5
    1240:	66 4c 0f 6e e6       	movq   %rsi,%xmm12
    1245:	be 0a 00 00 00       	mov    $0xa,%esi
    124a:	ba 0b 0b 0b 0b       	mov    $0xb0b0b0b,%edx
    124f:	66 4c 0f 6e de       	movq   %rsi,%xmm11
    1254:	66 0f 6c ed          	punpcklqdq %xmm5,%xmm5
    1258:	be 0c 00 00 00       	mov    $0xc,%esi
    125d:	66 4c 0f 6e d6       	movq   %rsi,%xmm10
    1262:	66 0f 6e fa          	movd   %edx,%xmm7
    1266:	be ff 00 ff 00       	mov    $0xff00ff,%esi
    126b:	0f 29 6c 24 10       	movaps %xmm5,0x10(%rsp)
    1270:	66 0f 70 f7 00       	pshufd $0x0,%xmm7,%xmm6
    1275:	66 0f 6e ee          	movd   %esi,%xmm5
    1279:	66 45 0f 6c ff       	punpcklqdq %xmm15,%xmm15
    127e:	48 8d 9c 24 80 00 00 00 	lea    0x80(%rsp),%rbx
    1286:	66 45 0f 6c f6       	punpcklqdq %xmm14,%xmm14
    128b:	66 45 0f 6c ed       	punpcklqdq %xmm13,%xmm13
    1290:	66 45 0f 6c e4       	punpcklqdq %xmm12,%xmm12
    1295:	0f 29 74 24 20       	movaps %xmm6,0x20(%rsp)
    129a:	66 45 0f 6c db       	punpcklqdq %xmm11,%xmm11
    129f:	66 45 0f 6c d2       	punpcklqdq %xmm10,%xmm10
    12a4:	66 0f 70 ed 00       	pshufd $0x0,%xmm5,%xmm5
    12a9:	66 0f 6f e2          	movdqa %xmm2,%xmm4
    12ad:	66 0f 6f c2          	movdqa %xmm2,%xmm0
    12b1:	66 0f 6f ca          	movdqa %xmm2,%xmm1
    12b5:	48 83 c0 10          	add    $0x10,%rax
    12b9:	66 44 0f 6f ca       	movdqa %xmm2,%xmm9
    12be:	66 44 0f 6f c2       	movdqa %xmm2,%xmm8
    12c3:	66 41 0f d4 e6       	paddq  %xmm14,%xmm4
    12c8:	66 0f 6f 34 24       	movdqa (%rsp),%xmm6
    12cd:	66 45 0f d4 c5       	paddq  %xmm13,%xmm8
    12d2:	66 45 0f d4 cf       	paddq  %xmm15,%xmm9
    12d7:	66 0f 6f fa          	movdqa %xmm2,%xmm7
    12db:	41 0f c6 e0 88       	shufps $0x88,%xmm8,%xmm4
    12e0:	41 0f c6 c1 88       	shufps $0x88,%xmm9,%xmm0
    12e5:	66 44 0f 6f c0       	movdqa %xmm0,%xmm8
    12ea:	66 0f 61 c4          	punpcklwd %xmm4,%xmm0
    12ee:	66 44 0f 69 c4       	punpckhwd %xmm4,%xmm8
    12f3:	66 0f 6f da          	movdqa %xmm2,%xmm3
    12f7:	66 0f 6f e0          	movdqa %xmm0,%xmm4
    12fb:	66 0f d4 f2          	paddq  %xmm2,%xmm6
    12ff:	66 41 0f 69 e0       	punpckhwd %xmm8,%xmm4
    1304:	66 41 0f d4 cc       	paddq  %xmm12,%xmm1
    1309:	66 41 0f d4 fb       	paddq  %xmm11,%xmm7
    130e:	66 41 0f d4 da       	paddq  %xmm10,%xmm3
    1313:	66 41 0f 61 c0       	punpcklwd %xmm8,%xmm0
    1318:	0f c6 de 88          	shufps $0x88,%xmm6,%xmm3
    131c:	66 0f 61 c4          	punpcklwd %xmm4,%xmm0
    1320:	0f c6 cf 88          	shufps $0x88,%xmm7,%xmm1
    1324:	66 0f 6f e1          	movdqa %xmm1,%xmm4
    1328:	66 0f 61 cb          	punpcklwd %xmm3,%xmm1
    132c:	66 0f 69 e3          	punpckhwd %xmm3,%xmm4
    1330:	66 0f db c5          	pand   %xmm5,%xmm0
    1334:	66 0f 6f d9          	movdqa %xmm1,%xmm3
    1338:	66 0f 61 cc          	punpcklwd %xmm4,%xmm1
    133c:	66 0f d4 54 24 10    	paddq  0x10(%rsp),%xmm2
    1342:	66 0f 69 dc          	punpckhwd %xmm4,%xmm3
    1346:	66 0f 61 cb          	punpcklwd %xmm3,%xmm1
    134a:	66 0f 6f d9          	movdqa %xmm1,%xmm3
    134e:	66 0f 6f c8          	movdqa %xmm0,%xmm1
    1352:	66 0f db dd          	pand   %xmm5,%xmm3
    1356:	66 0f 67 cb          	packuswb %xmm3,%xmm1
    135a:	66 0f 6f c1          	movdqa %xmm1,%xmm0
    135e:	66 0f fc c1          	paddb  %xmm1,%xmm0
    1362:	66 0f fc c0          	paddb  %xmm0,%xmm0
    1366:	66 0f fc c0          	paddb  %xmm0,%xmm0
    136a:	66 0f fc c1          	paddb  %xmm1,%xmm0
    136e:	66 0f fc c0          	paddb  %xmm0,%xmm0
    1372:	66 0f fc c0          	paddb  %xmm0,%xmm0
    1376:	66 0f fc c1          	paddb  %xmm1,%xmm0
    137a:	66 0f fc 44 24 20    	paddb  0x20(%rsp),%xmm0
    1380:	0f 29 40 f0          	movaps %xmm0,-0x10(%rax)
    1384:	48 39 c3             	cmp    %rax,%rbx
    1387:	0f 85 1c ff ff ff    	jne    12a9 <main+0x249>
    138d:	be a5 a5 a5 a5       	mov    $0xa5a5a5a5,%esi
    1392:	31 c0                	xor    %eax,%eax
    1394:	66 0f 6e c6          	movd   %esi,%xmm0
    1398:	66 0f 70 c0 00       	pshufd $0x0,%xmm0,%xmm0
    139d:	eb 68                	jmp    1407 <main+0x3a7>
    139f:	90                   	nop
    13a0:	31 c9                	xor    %ecx,%ecx
    13a2:	40 f6 c6 04          	test   $0x4,%sil
    13a6:	74 09                	je     13b1 <main+0x351>
    13a8:	8b 0a                	mov    (%rdx),%ecx
    13aa:	89 0f                	mov    %ecx,(%rdi)
    13ac:	b9 04 00 00 00       	mov    $0x4,%ecx
    13b1:	40 f6 c6 02          	test   $0x2,%sil
    13b5:	74 0e                	je     13c5 <main+0x365>
    13b7:	44 0f b7 04 0a       	movzwl (%rdx,%rcx,1),%r8d
    13bc:	66 44 89 04 0f       	mov    %r8w,(%rdi,%rcx,1)
    13c1:	48 83 c1 02          	add    $0x2,%rcx
    13c5:	83 e6 01             	and    $0x1,%esi
    13c8:	74 07                	je     13d1 <main+0x371>
    13ca:	0f b6 14 0a          	movzbl (%rdx,%rcx,1),%edx
    13ce:	88 14 0f             	mov    %dl,(%rdi,%rcx,1)
    13d1:	4c 8d 60 01          	lea    0x1(%rax),%r12
    13d5:	48 8b 0d 44 2c 00 00 	mov    0x2c44(%rip),%rcx        # 4020 <stdout@GLIBC_2.2.5>
    13dc:	be 01 00 00 00       	mov    $0x1,%esi
    13e1:	48 89 df             	mov    %rbx,%rdi
    13e4:	4c 89 e2             	mov    %r12,%rdx
    13e7:	c6 84 04 80 00 00 00 00 	movb   $0x0,0x80(%rsp,%rax,1)
    13ef:	e8 4c fc ff ff       	call   1040 <fwrite@plt>
    13f4:	66 0f 6f 05 24 0c 00 00 	movdqa 0xc24(%rip),%xmm0        # 2020 <_IO_stdin_used+0x20>
    13fc:	49 39 c4             	cmp    %rax,%r12
    13ff:	75 4f                	jne    1450 <main+0x3f0>
    1401:	48 83 f8 41          	cmp    $0x41,%rax
    1405:	74 49                	je     1450 <main+0x3f0>
    1407:	c6 43 40 a5          	movb   $0xa5,0x40(%rbx)
    140b:	89 c6                	mov    %eax,%esi
    140d:	48 89 df             	mov    %rbx,%rdi
    1410:	48 89 ea             	mov    %rbp,%rdx
    1413:	0f 29 03             	movaps %xmm0,(%rbx)
    1416:	0f 29 43 10          	movaps %xmm0,0x10(%rbx)
    141a:	0f 29 43 20          	movaps %xmm0,0x20(%rbx)
    141e:	0f 29 43 30          	movaps %xmm0,0x30(%rbx)
    1422:	83 f8 08             	cmp    $0x8,%eax
    1425:	0f 82 75 ff ff ff    	jb     13a0 <main+0x340>
    142b:	89 c7                	mov    %eax,%edi
    142d:	31 d2                	xor    %edx,%edx
    142f:	83 e7 f8             	and    $0xfffffff8,%edi
    1432:	89 d1                	mov    %edx,%ecx
    1434:	83 c2 08             	add    $0x8,%edx
    1437:	4c 8b 44 0d 00       	mov    0x0(%rbp,%rcx,1),%r8
    143c:	4c 89 04 0b          	mov    %r8,(%rbx,%rcx,1)
    1440:	39 fa                	cmp    %edi,%edx
    1442:	72 ee                	jb     1432 <main+0x3d2>
    1444:	48 8d 3c 13          	lea    (%rbx,%rdx,1),%rdi
    1448:	48 01 ea             	add    %rbp,%rdx
    144b:	e9 50 ff ff ff       	jmp    13a0 <main+0x340>
    1450:	48 8b 3d c9 2b 00 00 	mov    0x2bc9(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1457:	e8 d4 fb ff ff       	call   1030 <ferror@plt>
    145c:	85 c0                	test   %eax,%eax
    145e:	0f 95 c0             	setne  %al
    1461:	0f b6 c0             	movzbl %al,%eax
    1464:	01 c0                	add    %eax,%eax
    1466:	48 81 c4 d0 00 00 00 	add    $0xd0,%rsp
    146d:	5b                   	pop    %rbx
    146e:	5d                   	pop    %rbp
    146f:	41 5c                	pop    %r12
    1471:	c3                   	ret
    1472:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    147c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001480 <_start>:
    1480:	31 ed                	xor    %ebp,%ebp
    1482:	49 89 d1             	mov    %rdx,%r9
    1485:	5e                   	pop    %rsi
    1486:	48 89 e2             	mov    %rsp,%rdx
    1489:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    148d:	50                   	push   %rax
    148e:	54                   	push   %rsp
    148f:	45 31 c0             	xor    %r8d,%r8d
    1492:	31 c9                	xor    %ecx,%ecx
    1494:	48 8d 3d c5 fb ff ff 	lea    -0x43b(%rip),%rdi        # 1060 <main>
    149b:	ff 15 1f 2b 00 00    	call   *0x2b1f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    14a1:	f4                   	hlt
    14a2:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    14ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000014b0 <deregister_tm_clones>:
    14b0:	48 8d 3d 69 2b 00 00 	lea    0x2b69(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    14b7:	48 8d 05 62 2b 00 00 	lea    0x2b62(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    14be:	48 39 f8             	cmp    %rdi,%rax
    14c1:	74 15                	je     14d8 <deregister_tm_clones+0x28>
    14c3:	48 8b 05 fe 2a 00 00 	mov    0x2afe(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    14ca:	48 85 c0             	test   %rax,%rax
    14cd:	74 09                	je     14d8 <deregister_tm_clones+0x28>
    14cf:	ff e0                	jmp    *%rax
    14d1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    14d8:	c3                   	ret
    14d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000014e0 <register_tm_clones>:
    14e0:	48 8d 3d 39 2b 00 00 	lea    0x2b39(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    14e7:	48 8d 35 32 2b 00 00 	lea    0x2b32(%rip),%rsi        # 4020 <stdout@GLIBC_2.2.5>
    14ee:	48 29 fe             	sub    %rdi,%rsi
    14f1:	48 89 f0             	mov    %rsi,%rax
    14f4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    14f8:	48 c1 f8 03          	sar    $0x3,%rax
    14fc:	48 01 c6             	add    %rax,%rsi
    14ff:	48 d1 fe             	sar    $1,%rsi
    1502:	74 14                	je     1518 <register_tm_clones+0x38>
    1504:	48 8b 05 cd 2a 00 00 	mov    0x2acd(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    150b:	48 85 c0             	test   %rax,%rax
    150e:	74 08                	je     1518 <register_tm_clones+0x38>
    1510:	ff e0                	jmp    *%rax
    1512:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1518:	c3                   	ret
    1519:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001520 <__do_global_dtors_aux>:
    1520:	f3 0f 1e fa          	endbr64
    1524:	80 3d fd 2a 00 00 00 	cmpb   $0x0,0x2afd(%rip)        # 4028 <completed.0>
    152b:	75 2b                	jne    1558 <__do_global_dtors_aux+0x38>
    152d:	55                   	push   %rbp
    152e:	48 83 3d aa 2a 00 00 00 	cmpq   $0x0,0x2aaa(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1536:	48 89 e5             	mov    %rsp,%rbp
    1539:	74 0c                	je     1547 <__do_global_dtors_aux+0x27>
    153b:	48 8b 3d d6 2a 00 00 	mov    0x2ad6(%rip),%rdi        # 4018 <__dso_handle>
    1542:	e8 09 fb ff ff       	call   1050 <__cxa_finalize@plt>
    1547:	e8 64 ff ff ff       	call   14b0 <deregister_tm_clones>
    154c:	c6 05 d5 2a 00 00 01 	movb   $0x1,0x2ad5(%rip)        # 4028 <completed.0>
    1553:	5d                   	pop    %rbp
    1554:	c3                   	ret
    1555:	0f 1f 00             	nopl   (%rax)
    1558:	c3                   	ret
    1559:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001560 <frame_dummy>:
    1560:	f3 0f 1e fa          	endbr64
    1564:	e9 77 ff ff ff       	jmp    14e0 <register_tm_clones>
    1569:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001570 <wm_add_v2.isra.0>:
    1570:	89 f8                	mov    %edi,%eax
    1572:	c3                   	ret

Disassembly of section .fini:

0000000000001574 <_fini>:
    1574:	48 83 ec 08          	sub    $0x8,%rsp
    1578:	48 83 c4 08          	add    $0x8,%rsp
    157c:	c3                   	ret
