
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

0000000000001040 <memcpy@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4008 <memcpy@GLIBC_2.14>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001050 <fwrite@plt>:
    1050:	ff 25 ba 2f 00 00    	jmp    *0x2fba(%rip)        # 4010 <fwrite@GLIBC_2.2.5>
    1056:	68 02 00 00 00       	push   $0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .plt.got:

0000000000001060 <__cxa_finalize@plt>:
    1060:	ff 25 7a 2f 00 00    	jmp    *0x2f7a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1066:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000001070 <main>:
    1070:	41 55                	push   %r13
    1072:	41 54                	push   %r12
    1074:	55                   	push   %rbp
    1075:	53                   	push   %rbx
    1076:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
    107d:	c7 44 24 3c f5 79 2b 6d 	movl   $0x6d2b79f5,0x3c(%rsp)
    1085:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1089:	e8 d2 04 00 00       	call   1560 <wm_add_v1.isra.0>
    108e:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1092:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1096:	e8 c5 04 00 00       	call   1560 <wm_add_v1.isra.0>
    109b:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    109f:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10a3:	e8 b8 04 00 00       	call   1560 <wm_add_v1.isra.0>
    10a8:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10ac:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10b0:	e8 ab 04 00 00       	call   1560 <wm_add_v1.isra.0>
    10b5:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10b9:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10bd:	e8 9e 04 00 00       	call   1560 <wm_add_v1.isra.0>
    10c2:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10c6:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10ca:	e8 91 04 00 00       	call   1560 <wm_add_v1.isra.0>
    10cf:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10d3:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10d7:	e8 84 04 00 00       	call   1560 <wm_add_v1.isra.0>
    10dc:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10e0:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10e4:	e8 77 04 00 00       	call   1560 <wm_add_v1.isra.0>
    10e9:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10ed:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10f1:	e8 6a 04 00 00       	call   1560 <wm_add_v1.isra.0>
    10f6:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    10fa:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    10fe:	e8 5d 04 00 00       	call   1560 <wm_add_v1.isra.0>
    1103:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1107:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    110b:	e8 50 04 00 00       	call   1560 <wm_add_v1.isra.0>
    1110:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1114:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1118:	e8 43 04 00 00       	call   1560 <wm_add_v1.isra.0>
    111d:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1121:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1125:	e8 36 04 00 00       	call   1560 <wm_add_v1.isra.0>
    112a:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    112e:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1132:	e8 29 04 00 00       	call   1560 <wm_add_v1.isra.0>
    1137:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    113b:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    113f:	e8 1c 04 00 00       	call   1560 <wm_add_v1.isra.0>
    1144:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1148:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    114c:	e8 0f 04 00 00       	call   1560 <wm_add_v1.isra.0>
    1151:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1155:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1159:	e8 02 04 00 00       	call   1560 <wm_add_v1.isra.0>
    115e:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1162:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1166:	e8 f5 03 00 00       	call   1560 <wm_add_v1.isra.0>
    116b:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    116f:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1173:	e8 e8 03 00 00       	call   1560 <wm_add_v1.isra.0>
    1178:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    117c:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    1180:	e8 db 03 00 00       	call   1560 <wm_add_v1.isra.0>
    1185:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1189:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    118d:	e8 ce 03 00 00       	call   1560 <wm_add_v1.isra.0>
    1192:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    1196:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    119a:	e8 c1 03 00 00       	call   1560 <wm_add_v1.isra.0>
    119f:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    11a3:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    11a7:	e8 b4 03 00 00       	call   1560 <wm_add_v1.isra.0>
    11ac:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    11b0:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    11b4:	e8 a7 03 00 00       	call   1560 <wm_add_v1.isra.0>
    11b9:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    11bd:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    11c1:	e8 9a 03 00 00       	call   1560 <wm_add_v1.isra.0>
    11c6:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    11ca:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    11ce:	e8 8d 03 00 00       	call   1560 <wm_add_v1.isra.0>
    11d3:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    11d7:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    11db:	e8 80 03 00 00       	call   1560 <wm_add_v1.isra.0>
    11e0:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    11e4:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
    11e8:	e8 73 03 00 00       	call   1560 <wm_add_v1.isra.0>
    11ed:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    11f1:	8b 54 24 3c          	mov    0x3c(%rsp),%edx
    11f5:	b8 61 00 00 00       	mov    $0x61,%eax
    11fa:	83 fa ff             	cmp    $0xffffffff,%edx
    11fd:	0f 84 53 02 00 00    	je     1456 <main+0x3e6>
    1203:	b9 02 00 00 00       	mov    $0x2,%ecx
    1208:	ba 0e 00 00 00       	mov    $0xe,%edx
    120d:	4c 8d 6c 24 40       	lea    0x40(%rsp),%r13
    1212:	66 0f 6f 15 f6 0d 00 00 	movdqa 0xdf6(%rip),%xmm2        # 2010 <_IO_stdin_used+0x10>
    121a:	66 4c 0f 6e f9       	movq   %rcx,%xmm15
    121f:	b9 04 00 00 00       	mov    $0x4,%ecx
    1224:	66 48 0f 6e ea       	movq   %rdx,%xmm5
    1229:	ba 10 00 00 00       	mov    $0x10,%edx
    122e:	66 4c 0f 6e f1       	movq   %rcx,%xmm14
    1233:	b9 06 00 00 00       	mov    $0x6,%ecx
    1238:	66 0f 6c ed          	punpcklqdq %xmm5,%xmm5
    123c:	4c 89 e8             	mov    %r13,%rax
    123f:	66 4c 0f 6e e9       	movq   %rcx,%xmm13
    1244:	b9 08 00 00 00       	mov    $0x8,%ecx
    1249:	0f 29 2c 24          	movaps %xmm5,(%rsp)
    124d:	66 48 0f 6e ea       	movq   %rdx,%xmm5
    1252:	66 4c 0f 6e e1       	movq   %rcx,%xmm12
    1257:	b9 0a 00 00 00       	mov    $0xa,%ecx
    125c:	ba 0b 0b 0b 0b       	mov    $0xb0b0b0b,%edx
    1261:	66 4c 0f 6e d9       	movq   %rcx,%xmm11
    1266:	66 0f 6c ed          	punpcklqdq %xmm5,%xmm5
    126a:	b9 0c 00 00 00       	mov    $0xc,%ecx
    126f:	66 4c 0f 6e d1       	movq   %rcx,%xmm10
    1274:	66 0f 6e fa          	movd   %edx,%xmm7
    1278:	b9 ff 00 ff 00       	mov    $0xff00ff,%ecx
    127d:	0f 29 6c 24 10       	movaps %xmm5,0x10(%rsp)
    1282:	66 0f 70 ff 00       	pshufd $0x0,%xmm7,%xmm7
    1287:	66 0f 6e e9          	movd   %ecx,%xmm5
    128b:	66 45 0f 6c ff       	punpcklqdq %xmm15,%xmm15
    1290:	48 8d ac 24 80 00 00 00 	lea    0x80(%rsp),%rbp
    1298:	66 45 0f 6c f6       	punpcklqdq %xmm14,%xmm14
    129d:	66 45 0f 6c ed       	punpcklqdq %xmm13,%xmm13
    12a2:	66 45 0f 6c e4       	punpcklqdq %xmm12,%xmm12
    12a7:	0f 29 7c 24 20       	movaps %xmm7,0x20(%rsp)
    12ac:	66 45 0f 6c db       	punpcklqdq %xmm11,%xmm11
    12b1:	66 45 0f 6c d2       	punpcklqdq %xmm10,%xmm10
    12b6:	66 0f 70 ed 00       	pshufd $0x0,%xmm5,%xmm5
    12bb:	66 0f 6f e2          	movdqa %xmm2,%xmm4
    12bf:	66 0f 6f c2          	movdqa %xmm2,%xmm0
    12c3:	66 0f 6f ca          	movdqa %xmm2,%xmm1
    12c7:	48 83 c0 10          	add    $0x10,%rax
    12cb:	66 44 0f 6f ca       	movdqa %xmm2,%xmm9
    12d0:	66 44 0f 6f c2       	movdqa %xmm2,%xmm8
    12d5:	66 41 0f d4 e6       	paddq  %xmm14,%xmm4
    12da:	66 0f 6f 34 24       	movdqa (%rsp),%xmm6
    12df:	66 45 0f d4 c5       	paddq  %xmm13,%xmm8
    12e4:	66 45 0f d4 cf       	paddq  %xmm15,%xmm9
    12e9:	66 0f 6f fa          	movdqa %xmm2,%xmm7
    12ed:	41 0f c6 e0 88       	shufps $0x88,%xmm8,%xmm4
    12f2:	41 0f c6 c1 88       	shufps $0x88,%xmm9,%xmm0
    12f7:	66 44 0f 6f c0       	movdqa %xmm0,%xmm8
    12fc:	66 0f 61 c4          	punpcklwd %xmm4,%xmm0
    1300:	66 44 0f 69 c4       	punpckhwd %xmm4,%xmm8
    1305:	66 0f 6f da          	movdqa %xmm2,%xmm3
    1309:	66 0f 6f e0          	movdqa %xmm0,%xmm4
    130d:	66 0f d4 f2          	paddq  %xmm2,%xmm6
    1311:	66 41 0f 69 e0       	punpckhwd %xmm8,%xmm4
    1316:	66 41 0f d4 cc       	paddq  %xmm12,%xmm1
    131b:	66 41 0f d4 fb       	paddq  %xmm11,%xmm7
    1320:	66 41 0f d4 da       	paddq  %xmm10,%xmm3
    1325:	66 41 0f 61 c0       	punpcklwd %xmm8,%xmm0
    132a:	0f c6 de 88          	shufps $0x88,%xmm6,%xmm3
    132e:	66 0f 61 c4          	punpcklwd %xmm4,%xmm0
    1332:	0f c6 cf 88          	shufps $0x88,%xmm7,%xmm1
    1336:	66 0f 6f e1          	movdqa %xmm1,%xmm4
    133a:	66 0f 61 cb          	punpcklwd %xmm3,%xmm1
    133e:	66 0f 69 e3          	punpckhwd %xmm3,%xmm4
    1342:	66 0f db c5          	pand   %xmm5,%xmm0
    1346:	66 0f 6f d9          	movdqa %xmm1,%xmm3
    134a:	66 0f 61 cc          	punpcklwd %xmm4,%xmm1
    134e:	66 0f d4 54 24 10    	paddq  0x10(%rsp),%xmm2
    1354:	66 0f 69 dc          	punpckhwd %xmm4,%xmm3
    1358:	66 0f 61 cb          	punpcklwd %xmm3,%xmm1
    135c:	66 0f 6f d9          	movdqa %xmm1,%xmm3
    1360:	66 0f 6f c8          	movdqa %xmm0,%xmm1
    1364:	66 0f db dd          	pand   %xmm5,%xmm3
    1368:	66 0f 67 cb          	packuswb %xmm3,%xmm1
    136c:	66 0f 6f c1          	movdqa %xmm1,%xmm0
    1370:	66 0f fc c1          	paddb  %xmm1,%xmm0
    1374:	66 0f fc c0          	paddb  %xmm0,%xmm0
    1378:	66 0f fc c0          	paddb  %xmm0,%xmm0
    137c:	66 0f fc c1          	paddb  %xmm1,%xmm0
    1380:	66 0f fc c0          	paddb  %xmm0,%xmm0
    1384:	66 0f fc c0          	paddb  %xmm0,%xmm0
    1388:	66 0f fc c1          	paddb  %xmm1,%xmm0
    138c:	66 0f fc 44 24 20    	paddb  0x20(%rsp),%xmm0
    1392:	0f 29 40 f0          	movaps %xmm0,-0x10(%rax)
    1396:	48 39 c5             	cmp    %rax,%rbp
    1399:	0f 85 1c ff ff ff    	jne    12bb <main+0x24b>
    139f:	b8 a5 a5 a5 a5       	mov    $0xa5a5a5a5,%eax
    13a4:	c6 84 24 c0 00 00 00 a5 	movb   $0xa5,0xc0(%rsp)
    13ac:	31 db                	xor    %ebx,%ebx
    13ae:	66 0f 6e c0          	movd   %eax,%xmm0
    13b2:	66 0f 70 c0 00       	pshufd $0x0,%xmm0,%xmm0
    13b7:	0f 29 84 24 80 00 00 00 	movaps %xmm0,0x80(%rsp)
    13bf:	0f 29 84 24 90 00 00 00 	movaps %xmm0,0x90(%rsp)
    13c7:	0f 29 84 24 a0 00 00 00 	movaps %xmm0,0xa0(%rsp)
    13cf:	0f 29 84 24 b0 00 00 00 	movaps %xmm0,0xb0(%rsp)
    13d7:	eb 3c                	jmp    1415 <main+0x3a5>
    13d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    13e0:	48 83 f8 41          	cmp    $0x41,%rax
    13e4:	74 5a                	je     1440 <main+0x3d0>
    13e6:	48 89 c2             	mov    %rax,%rdx
    13e9:	4c 89 ee             	mov    %r13,%rsi
    13ec:	48 89 ef             	mov    %rbp,%rdi
    13ef:	c6 45 40 a5          	movb   $0xa5,0x40(%rbp)
    13f3:	66 0f 6e 35 09 0c 00 00 	movd   0xc09(%rip),%xmm6        # 2004 <_IO_stdin_used+0x4>
    13fb:	66 0f 70 c6 00       	pshufd $0x0,%xmm6,%xmm0
    1400:	0f 29 45 00          	movaps %xmm0,0x0(%rbp)
    1404:	0f 29 45 10          	movaps %xmm0,0x10(%rbp)
    1408:	0f 29 45 20          	movaps %xmm0,0x20(%rbp)
    140c:	0f 29 45 30          	movaps %xmm0,0x30(%rbp)
    1410:	e8 2b fc ff ff       	call   1040 <memcpy@plt>
    1415:	4c 8d 63 01          	lea    0x1(%rbx),%r12
    1419:	48 8b 0d 08 2c 00 00 	mov    0x2c08(%rip),%rcx        # 4028 <stdout@GLIBC_2.2.5>
    1420:	be 01 00 00 00       	mov    $0x1,%esi
    1425:	48 89 ef             	mov    %rbp,%rdi
    1428:	4c 89 e2             	mov    %r12,%rdx
    142b:	c6 84 1c 80 00 00 00 00 	movb   $0x0,0x80(%rsp,%rbx,1)
    1433:	e8 18 fc ff ff       	call   1050 <fwrite@plt>
    1438:	48 89 c3             	mov    %rax,%rbx
    143b:	49 39 c4             	cmp    %rax,%r12
    143e:	74 a0                	je     13e0 <main+0x370>
    1440:	48 8b 3d e1 2b 00 00 	mov    0x2be1(%rip),%rdi        # 4028 <stdout@GLIBC_2.2.5>
    1447:	e8 e4 fb ff ff       	call   1030 <ferror@plt>
    144c:	85 c0                	test   %eax,%eax
    144e:	0f 95 c0             	setne  %al
    1451:	0f b6 c0             	movzbl %al,%eax
    1454:	01 c0                	add    %eax,%eax
    1456:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
    145d:	5b                   	pop    %rbx
    145e:	5d                   	pop    %rbp
    145f:	41 5c                	pop    %r12
    1461:	41 5d                	pop    %r13
    1463:	c3                   	ret
    1464:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    146e:	66 90                	xchg   %ax,%ax

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
    1484:	48 8d 3d e5 fb ff ff 	lea    -0x41b(%rip),%rdi        # 1070 <main>
    148b:	ff 15 2f 2b 00 00    	call   *0x2b2f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1491:	f4                   	hlt
    1492:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    149c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000014a0 <deregister_tm_clones>:
    14a0:	48 8d 3d 81 2b 00 00 	lea    0x2b81(%rip),%rdi        # 4028 <stdout@GLIBC_2.2.5>
    14a7:	48 8d 05 7a 2b 00 00 	lea    0x2b7a(%rip),%rax        # 4028 <stdout@GLIBC_2.2.5>
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
    14d0:	48 8d 3d 51 2b 00 00 	lea    0x2b51(%rip),%rdi        # 4028 <stdout@GLIBC_2.2.5>
    14d7:	48 8d 35 4a 2b 00 00 	lea    0x2b4a(%rip),%rsi        # 4028 <stdout@GLIBC_2.2.5>
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
    1514:	80 3d 15 2b 00 00 00 	cmpb   $0x0,0x2b15(%rip)        # 4030 <completed.0>
    151b:	75 2b                	jne    1548 <__do_global_dtors_aux+0x38>
    151d:	55                   	push   %rbp
    151e:	48 83 3d ba 2a 00 00 00 	cmpq   $0x0,0x2aba(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1526:	48 89 e5             	mov    %rsp,%rbp
    1529:	74 0c                	je     1537 <__do_global_dtors_aux+0x27>
    152b:	48 8b 3d ee 2a 00 00 	mov    0x2aee(%rip),%rdi        # 4020 <__dso_handle>
    1532:	e8 29 fb ff ff       	call   1060 <__cxa_finalize@plt>
    1537:	e8 64 ff ff ff       	call   14a0 <deregister_tm_clones>
    153c:	c6 05 ed 2a 00 00 01 	movb   $0x1,0x2aed(%rip)        # 4030 <completed.0>
    1543:	5d                   	pop    %rbp
    1544:	c3                   	ret
    1545:	0f 1f 00             	nopl   (%rax)
    1548:	c3                   	ret
    1549:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001550 <frame_dummy>:
    1550:	f3 0f 1e fa          	endbr64
    1554:	e9 77 ff ff ff       	jmp    14d0 <register_tm_clones>
    1559:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001560 <wm_add_v1.isra.0>:
    1560:	89 f8                	mov    %edi,%eax
    1562:	c3                   	ret

Disassembly of section .fini:

0000000000001564 <_fini>:
    1564:	48 83 ec 08          	sub    $0x8,%rsp
    1568:	48 83 c4 08          	add    $0x8,%rsp
    156c:	c3                   	ret
