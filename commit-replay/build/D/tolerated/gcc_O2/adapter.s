
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
    1077:	e8 e4 04 00 00       	call   1560 <wm_add_v2.isra.0>
    107c:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1080:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1084:	e8 d7 04 00 00       	call   1560 <wm_add_v2.isra.0>
    1089:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    108d:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1091:	e8 ca 04 00 00       	call   1560 <wm_add_v2.isra.0>
    1096:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    109a:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    109e:	e8 bd 04 00 00       	call   1560 <wm_add_v2.isra.0>
    10a3:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10a7:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10ab:	e8 b0 04 00 00       	call   1560 <wm_add_v2.isra.0>
    10b0:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10b4:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10b8:	e8 a3 04 00 00       	call   1560 <wm_add_v2.isra.0>
    10bd:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10c1:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10c5:	e8 96 04 00 00       	call   1560 <wm_add_v2.isra.0>
    10ca:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10ce:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10d2:	e8 89 04 00 00       	call   1560 <wm_add_v2.isra.0>
    10d7:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10db:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10df:	e8 7c 04 00 00       	call   1560 <wm_add_v2.isra.0>
    10e4:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10e8:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10ec:	e8 6f 04 00 00       	call   1560 <wm_add_v2.isra.0>
    10f1:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10f5:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10f9:	e8 62 04 00 00       	call   1560 <wm_add_v2.isra.0>
    10fe:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1102:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1106:	e8 55 04 00 00       	call   1560 <wm_add_v2.isra.0>
    110b:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    110f:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1113:	e8 48 04 00 00       	call   1560 <wm_add_v2.isra.0>
    1118:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    111c:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1120:	e8 3b 04 00 00       	call   1560 <wm_add_v2.isra.0>
    1125:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1129:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    112d:	e8 2e 04 00 00       	call   1560 <wm_add_v2.isra.0>
    1132:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1136:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    113a:	e8 21 04 00 00       	call   1560 <wm_add_v2.isra.0>
    113f:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1143:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1147:	e8 14 04 00 00       	call   1560 <wm_add_v2.isra.0>
    114c:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1150:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1154:	e8 07 04 00 00       	call   1560 <wm_add_v2.isra.0>
    1159:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    115d:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1161:	e8 fa 03 00 00       	call   1560 <wm_add_v2.isra.0>
    1166:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    116a:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    116e:	e8 ed 03 00 00       	call   1560 <wm_add_v2.isra.0>
    1173:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1177:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    117b:	e8 e0 03 00 00       	call   1560 <wm_add_v2.isra.0>
    1180:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1184:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1188:	e8 d3 03 00 00       	call   1560 <wm_add_v2.isra.0>
    118d:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1191:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1195:	e8 c6 03 00 00       	call   1560 <wm_add_v2.isra.0>
    119a:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    119e:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    11a2:	e8 b9 03 00 00       	call   1560 <wm_add_v2.isra.0>
    11a7:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    11ab:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    11af:	e8 ac 03 00 00       	call   1560 <wm_add_v2.isra.0>
    11b4:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    11b8:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    11bc:	e8 9f 03 00 00       	call   1560 <wm_add_v2.isra.0>
    11c1:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    11c5:	8b 54 24 3c          	mov    0x3c(%rsp),%edx
    11c9:	b8 61 00 00 00       	mov    $0x61,%eax
    11ce:	83 fa ff             	cmp    $0xffffffff,%edx
    11d1:	0f 84 7f 02 00 00    	je     1456 <main+0x3f6>
    11d7:	be 02 00 00 00       	mov    $0x2,%esi
    11dc:	ba 0e 00 00 00       	mov    $0xe,%edx
    11e1:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
    11e6:	66 0f 6f 15 22 0e 00 00 	movdqa 0xe22(%rip),%xmm2        # 2010 <_IO_stdin_used+0x10>
    11ee:	66 4c 0f 6e fe       	movq   %rsi,%xmm15
    11f3:	be 04 00 00 00       	mov    $0x4,%esi
    11f8:	66 48 0f 6e ea       	movq   %rdx,%xmm5
    11fd:	ba 10 00 00 00       	mov    $0x10,%edx
    1202:	66 4c 0f 6e f6       	movq   %rsi,%xmm14
    1207:	be 06 00 00 00       	mov    $0x6,%esi
    120c:	66 0f 6c ed          	punpcklqdq %xmm5,%xmm5
    1210:	48 89 e8             	mov    %rbp,%rax
    1213:	66 4c 0f 6e ee       	movq   %rsi,%xmm13
    1218:	be 08 00 00 00       	mov    $0x8,%esi
    121d:	0f 29 2c 24          	movaps %xmm5,(%rsp)
    1221:	66 48 0f 6e ea       	movq   %rdx,%xmm5
    1226:	66 4c 0f 6e e6       	movq   %rsi,%xmm12
    122b:	be 0a 00 00 00       	mov    $0xa,%esi
    1230:	ba 0b 0b 0b 0b       	mov    $0xb0b0b0b,%edx
    1235:	66 4c 0f 6e de       	movq   %rsi,%xmm11
    123a:	66 0f 6c ed          	punpcklqdq %xmm5,%xmm5
    123e:	be 0c 00 00 00       	mov    $0xc,%esi
    1243:	66 4c 0f 6e d6       	movq   %rsi,%xmm10
    1248:	66 0f 6e fa          	movd   %edx,%xmm7
    124c:	be ff 00 ff 00       	mov    $0xff00ff,%esi
    1251:	0f 29 6c 24 10       	movaps %xmm5,0x10(%rsp)
    1256:	66 0f 70 f7 00       	pshufd $0x0,%xmm7,%xmm6
    125b:	66 0f 6e ee          	movd   %esi,%xmm5
    125f:	66 45 0f 6c ff       	punpcklqdq %xmm15,%xmm15
    1264:	48 8d 9c 24 80 00 00 00 	lea    0x80(%rsp),%rbx
    126c:	66 45 0f 6c f6       	punpcklqdq %xmm14,%xmm14
    1271:	66 45 0f 6c ed       	punpcklqdq %xmm13,%xmm13
    1276:	66 45 0f 6c e4       	punpcklqdq %xmm12,%xmm12
    127b:	0f 29 74 24 20       	movaps %xmm6,0x20(%rsp)
    1280:	66 45 0f 6c db       	punpcklqdq %xmm11,%xmm11
    1285:	66 45 0f 6c d2       	punpcklqdq %xmm10,%xmm10
    128a:	66 0f 70 ed 00       	pshufd $0x0,%xmm5,%xmm5
    128f:	66 0f 6f e2          	movdqa %xmm2,%xmm4
    1293:	66 0f 6f c2          	movdqa %xmm2,%xmm0
    1297:	66 0f 6f ca          	movdqa %xmm2,%xmm1
    129b:	48 83 c0 10          	add    $0x10,%rax
    129f:	66 44 0f 6f ca       	movdqa %xmm2,%xmm9
    12a4:	66 44 0f 6f c2       	movdqa %xmm2,%xmm8
    12a9:	66 41 0f d4 e6       	paddq  %xmm14,%xmm4
    12ae:	66 0f 6f 34 24       	movdqa (%rsp),%xmm6
    12b3:	66 45 0f d4 c5       	paddq  %xmm13,%xmm8
    12b8:	66 45 0f d4 cf       	paddq  %xmm15,%xmm9
    12bd:	66 0f 6f fa          	movdqa %xmm2,%xmm7
    12c1:	41 0f c6 e0 88       	shufps $0x88,%xmm8,%xmm4
    12c6:	41 0f c6 c1 88       	shufps $0x88,%xmm9,%xmm0
    12cb:	66 44 0f 6f c0       	movdqa %xmm0,%xmm8
    12d0:	66 0f 61 c4          	punpcklwd %xmm4,%xmm0
    12d4:	66 44 0f 69 c4       	punpckhwd %xmm4,%xmm8
    12d9:	66 0f 6f da          	movdqa %xmm2,%xmm3
    12dd:	66 0f 6f e0          	movdqa %xmm0,%xmm4
    12e1:	66 0f d4 f2          	paddq  %xmm2,%xmm6
    12e5:	66 41 0f 69 e0       	punpckhwd %xmm8,%xmm4
    12ea:	66 41 0f d4 cc       	paddq  %xmm12,%xmm1
    12ef:	66 41 0f d4 fb       	paddq  %xmm11,%xmm7
    12f4:	66 41 0f d4 da       	paddq  %xmm10,%xmm3
    12f9:	66 41 0f 61 c0       	punpcklwd %xmm8,%xmm0
    12fe:	0f c6 de 88          	shufps $0x88,%xmm6,%xmm3
    1302:	66 0f 61 c4          	punpcklwd %xmm4,%xmm0
    1306:	0f c6 cf 88          	shufps $0x88,%xmm7,%xmm1
    130a:	66 0f 6f e1          	movdqa %xmm1,%xmm4
    130e:	66 0f 61 cb          	punpcklwd %xmm3,%xmm1
    1312:	66 0f 69 e3          	punpckhwd %xmm3,%xmm4
    1316:	66 0f db c5          	pand   %xmm5,%xmm0
    131a:	66 0f 6f d9          	movdqa %xmm1,%xmm3
    131e:	66 0f 61 cc          	punpcklwd %xmm4,%xmm1
    1322:	66 0f d4 54 24 10    	paddq  0x10(%rsp),%xmm2
    1328:	66 0f 69 dc          	punpckhwd %xmm4,%xmm3
    132c:	66 0f 61 cb          	punpcklwd %xmm3,%xmm1
    1330:	66 0f 6f d9          	movdqa %xmm1,%xmm3
    1334:	66 0f 6f c8          	movdqa %xmm0,%xmm1
    1338:	66 0f db dd          	pand   %xmm5,%xmm3
    133c:	66 0f 67 cb          	packuswb %xmm3,%xmm1
    1340:	66 0f 6f c1          	movdqa %xmm1,%xmm0
    1344:	66 0f fc c1          	paddb  %xmm1,%xmm0
    1348:	66 0f fc c0          	paddb  %xmm0,%xmm0
    134c:	66 0f fc c0          	paddb  %xmm0,%xmm0
    1350:	66 0f fc c1          	paddb  %xmm1,%xmm0
    1354:	66 0f fc c0          	paddb  %xmm0,%xmm0
    1358:	66 0f fc c0          	paddb  %xmm0,%xmm0
    135c:	66 0f fc c1          	paddb  %xmm1,%xmm0
    1360:	66 0f fc 44 24 20    	paddb  0x20(%rsp),%xmm0
    1366:	0f 29 40 f0          	movaps %xmm0,-0x10(%rax)
    136a:	48 39 c3             	cmp    %rax,%rbx
    136d:	0f 85 1c ff ff ff    	jne    128f <main+0x22f>
    1373:	be a5 a5 a5 a5       	mov    $0xa5a5a5a5,%esi
    1378:	31 c0                	xor    %eax,%eax
    137a:	66 0f 6e c6          	movd   %esi,%xmm0
    137e:	66 0f 70 c0 00       	pshufd $0x0,%xmm0,%xmm0
    1383:	eb 6a                	jmp    13ef <main+0x38f>
    1385:	0f 1f 00             	nopl   (%rax)
    1388:	31 c9                	xor    %ecx,%ecx
    138a:	40 f6 c6 04          	test   $0x4,%sil
    138e:	74 09                	je     1399 <main+0x339>
    1390:	8b 0a                	mov    (%rdx),%ecx
    1392:	89 0f                	mov    %ecx,(%rdi)
    1394:	b9 04 00 00 00       	mov    $0x4,%ecx
    1399:	40 f6 c6 02          	test   $0x2,%sil
    139d:	74 0e                	je     13ad <main+0x34d>
    139f:	44 0f b7 04 0a       	movzwl (%rdx,%rcx,1),%r8d
    13a4:	66 44 89 04 0f       	mov    %r8w,(%rdi,%rcx,1)
    13a9:	48 83 c1 02          	add    $0x2,%rcx
    13ad:	83 e6 01             	and    $0x1,%esi
    13b0:	74 07                	je     13b9 <main+0x359>
    13b2:	0f b6 14 0a          	movzbl (%rdx,%rcx,1),%edx
    13b6:	88 14 0f             	mov    %dl,(%rdi,%rcx,1)
    13b9:	4c 8d 60 01          	lea    0x1(%rax),%r12
    13bd:	48 8b 0d 5c 2c 00 00 	mov    0x2c5c(%rip),%rcx        # 4020 <stdout@GLIBC_2.2.5>
    13c4:	be 01 00 00 00       	mov    $0x1,%esi
    13c9:	48 89 df             	mov    %rbx,%rdi
    13cc:	4c 89 e2             	mov    %r12,%rdx
    13cf:	c6 84 04 80 00 00 00 00 	movb   $0x0,0x80(%rsp,%rax,1)
    13d7:	e8 64 fc ff ff       	call   1040 <fwrite@plt>
    13dc:	66 0f 6f 05 3c 0c 00 00 	movdqa 0xc3c(%rip),%xmm0        # 2020 <_IO_stdin_used+0x20>
    13e4:	49 39 c4             	cmp    %rax,%r12
    13e7:	75 57                	jne    1440 <main+0x3e0>
    13e9:	48 83 f8 41          	cmp    $0x41,%rax
    13ed:	74 51                	je     1440 <main+0x3e0>
    13ef:	c6 43 40 a5          	movb   $0xa5,0x40(%rbx)
    13f3:	89 c6                	mov    %eax,%esi
    13f5:	48 89 df             	mov    %rbx,%rdi
    13f8:	48 89 ea             	mov    %rbp,%rdx
    13fb:	0f 29 03             	movaps %xmm0,(%rbx)
    13fe:	0f 29 43 10          	movaps %xmm0,0x10(%rbx)
    1402:	0f 29 43 20          	movaps %xmm0,0x20(%rbx)
    1406:	0f 29 43 30          	movaps %xmm0,0x30(%rbx)
    140a:	83 f8 08             	cmp    $0x8,%eax
    140d:	0f 82 75 ff ff ff    	jb     1388 <main+0x328>
    1413:	89 c7                	mov    %eax,%edi
    1415:	31 d2                	xor    %edx,%edx
    1417:	83 e7 f8             	and    $0xfffffff8,%edi
    141a:	89 d1                	mov    %edx,%ecx
    141c:	83 c2 08             	add    $0x8,%edx
    141f:	4c 8b 44 0d 00       	mov    0x0(%rbp,%rcx,1),%r8
    1424:	4c 89 04 0b          	mov    %r8,(%rbx,%rcx,1)
    1428:	39 fa                	cmp    %edi,%edx
    142a:	72 ee                	jb     141a <main+0x3ba>
    142c:	48 8d 3c 13          	lea    (%rbx,%rdx,1),%rdi
    1430:	48 01 ea             	add    %rbp,%rdx
    1433:	e9 50 ff ff ff       	jmp    1388 <main+0x328>
    1438:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    1440:	48 8b 3d d9 2b 00 00 	mov    0x2bd9(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1447:	e8 e4 fb ff ff       	call   1030 <ferror@plt>
    144c:	85 c0                	test   %eax,%eax
    144e:	0f 95 c0             	setne  %al
    1451:	0f b6 c0             	movzbl %al,%eax
    1454:	01 c0                	add    %eax,%eax
    1456:	48 81 c4 d0 00 00 00 	add    $0xd0,%rsp
    145d:	5b                   	pop    %rbx
    145e:	5d                   	pop    %rbp
    145f:	41 5c                	pop    %r12
    1461:	c3                   	ret
    1462:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    146c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001470 <_start>:
    1470:	31 ed                	xor    %ebp,%ebp
    1472:	49 89 d1             	mov    %rdx,%r9
    1475:	5e                   	pop    %rsi
    1476:	48 89 e2             	mov    %rsp,%rdx
    1479:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    147d:	50                   	push   %rax
    147e:	54                   	push   %rsp
    147f:	45 31 c0             	xor    %r8d,%r8d
    1482:	31 c9                	xor    %ecx,%ecx
    1484:	48 8d 3d d5 fb ff ff 	lea    -0x42b(%rip),%rdi        # 1060 <main>
    148b:	ff 15 2f 2b 00 00    	call   *0x2b2f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1491:	f4                   	hlt
    1492:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    149c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000014a0 <deregister_tm_clones>:
    14a0:	48 8d 3d 79 2b 00 00 	lea    0x2b79(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    14a7:	48 8d 05 72 2b 00 00 	lea    0x2b72(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    14ae:	48 39 f8             	cmp    %rdi,%rax
    14b1:	74 15                	je     14c8 <deregister_tm_clones+0x28>
    14b3:	48 8b 05 0e 2b 00 00 	mov    0x2b0e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    14ba:	48 85 c0             	test   %rax,%rax
    14bd:	74 09                	je     14c8 <deregister_tm_clones+0x28>
    14bf:	ff e0                	jmp    *%rax
    14c1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    14c8:	c3                   	ret
    14c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000014d0 <register_tm_clones>:
    14d0:	48 8d 3d 49 2b 00 00 	lea    0x2b49(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    14d7:	48 8d 35 42 2b 00 00 	lea    0x2b42(%rip),%rsi        # 4020 <stdout@GLIBC_2.2.5>
    14de:	48 29 fe             	sub    %rdi,%rsi
    14e1:	48 89 f0             	mov    %rsi,%rax
    14e4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    14e8:	48 c1 f8 03          	sar    $0x3,%rax
    14ec:	48 01 c6             	add    %rax,%rsi
    14ef:	48 d1 fe             	sar    $1,%rsi
    14f2:	74 14                	je     1508 <register_tm_clones+0x38>
    14f4:	48 8b 05 dd 2a 00 00 	mov    0x2add(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    14fb:	48 85 c0             	test   %rax,%rax
    14fe:	74 08                	je     1508 <register_tm_clones+0x38>
    1500:	ff e0                	jmp    *%rax
    1502:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1508:	c3                   	ret
    1509:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001510 <__do_global_dtors_aux>:
    1510:	f3 0f 1e fa          	endbr64
    1514:	80 3d 0d 2b 00 00 00 	cmpb   $0x0,0x2b0d(%rip)        # 4028 <completed.0>
    151b:	75 2b                	jne    1548 <__do_global_dtors_aux+0x38>
    151d:	55                   	push   %rbp
    151e:	48 83 3d ba 2a 00 00 00 	cmpq   $0x0,0x2aba(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1526:	48 89 e5             	mov    %rsp,%rbp
    1529:	74 0c                	je     1537 <__do_global_dtors_aux+0x27>
    152b:	48 8b 3d e6 2a 00 00 	mov    0x2ae6(%rip),%rdi        # 4018 <__dso_handle>
    1532:	e8 19 fb ff ff       	call   1050 <__cxa_finalize@plt>
    1537:	e8 64 ff ff ff       	call   14a0 <deregister_tm_clones>
    153c:	c6 05 e5 2a 00 00 01 	movb   $0x1,0x2ae5(%rip)        # 4028 <completed.0>
    1543:	5d                   	pop    %rbp
    1544:	c3                   	ret
    1545:	0f 1f 00             	nopl   (%rax)
    1548:	c3                   	ret
    1549:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001550 <frame_dummy>:
    1550:	f3 0f 1e fa          	endbr64
    1554:	e9 77 ff ff ff       	jmp    14d0 <register_tm_clones>
    1559:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001560 <wm_add_v2.isra.0>:
    1560:	89 f8                	mov    %edi,%eax
    1562:	c3                   	ret

Disassembly of section .fini:

0000000000001564 <_fini>:
    1564:	48 83 ec 08          	sub    $0x8,%rsp
    1568:	48 83 c4 08          	add    $0x8,%rsp
    156c:	c3                   	ret
