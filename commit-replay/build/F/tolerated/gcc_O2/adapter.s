
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

0000000000001040 <strlen@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4008 <strlen@GLIBC_2.2.5>
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

0000000000001080 <main>:
    1080:	41 57                	push   %r15
    1082:	41 56                	push   %r14
    1084:	41 55                	push   %r13
    1086:	41 54                	push   %r12
    1088:	55                   	push   %rbp
    1089:	53                   	push   %rbx
    108a:	48 83 ec 28          	sub    $0x28,%rsp
    108e:	c7 44 24 18 f5 79 2b 6d 	movl   $0x6d2b79f5,0x18(%rsp)
    1096:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    109a:	e8 e1 03 00 00       	call   1480 <wm_add_v2.isra.0>
    109f:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10a3:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10a7:	e8 d4 03 00 00       	call   1480 <wm_add_v2.isra.0>
    10ac:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10b0:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10b4:	e8 c7 03 00 00       	call   1480 <wm_add_v2.isra.0>
    10b9:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10bd:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10c1:	e8 ba 03 00 00       	call   1480 <wm_add_v2.isra.0>
    10c6:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10ca:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10ce:	e8 ad 03 00 00       	call   1480 <wm_add_v2.isra.0>
    10d3:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10d7:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10db:	e8 a0 03 00 00       	call   1480 <wm_add_v2.isra.0>
    10e0:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10e4:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10e8:	e8 93 03 00 00       	call   1480 <wm_add_v2.isra.0>
    10ed:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10f1:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10f5:	e8 86 03 00 00       	call   1480 <wm_add_v2.isra.0>
    10fa:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10fe:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1102:	e8 79 03 00 00       	call   1480 <wm_add_v2.isra.0>
    1107:	89 44 24 18          	mov    %eax,0x18(%rsp)
    110b:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    110f:	e8 6c 03 00 00       	call   1480 <wm_add_v2.isra.0>
    1114:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1118:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    111c:	e8 5f 03 00 00       	call   1480 <wm_add_v2.isra.0>
    1121:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1125:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1129:	e8 52 03 00 00       	call   1480 <wm_add_v2.isra.0>
    112e:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1132:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1136:	e8 45 03 00 00       	call   1480 <wm_add_v2.isra.0>
    113b:	89 44 24 18          	mov    %eax,0x18(%rsp)
    113f:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1143:	e8 38 03 00 00       	call   1480 <wm_add_v2.isra.0>
    1148:	89 44 24 18          	mov    %eax,0x18(%rsp)
    114c:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1150:	e8 2b 03 00 00       	call   1480 <wm_add_v2.isra.0>
    1155:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1159:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    115d:	e8 1e 03 00 00       	call   1480 <wm_add_v2.isra.0>
    1162:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1166:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    116a:	e8 11 03 00 00       	call   1480 <wm_add_v2.isra.0>
    116f:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1173:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1177:	e8 04 03 00 00       	call   1480 <wm_add_v2.isra.0>
    117c:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1180:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1184:	e8 f7 02 00 00       	call   1480 <wm_add_v2.isra.0>
    1189:	89 44 24 18          	mov    %eax,0x18(%rsp)
    118d:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1191:	e8 ea 02 00 00       	call   1480 <wm_add_v2.isra.0>
    1196:	89 44 24 18          	mov    %eax,0x18(%rsp)
    119a:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    119e:	e8 dd 02 00 00       	call   1480 <wm_add_v2.isra.0>
    11a3:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11a7:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11ab:	e8 d0 02 00 00       	call   1480 <wm_add_v2.isra.0>
    11b0:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11b4:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11b8:	e8 c3 02 00 00       	call   1480 <wm_add_v2.isra.0>
    11bd:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11c1:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11c5:	e8 b6 02 00 00       	call   1480 <wm_add_v2.isra.0>
    11ca:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11ce:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11d2:	e8 a9 02 00 00       	call   1480 <wm_add_v2.isra.0>
    11d7:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11db:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11df:	e8 9c 02 00 00       	call   1480 <wm_add_v2.isra.0>
    11e4:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11e8:	8b 54 24 18          	mov    0x18(%rsp),%edx
    11ec:	b8 61 00 00 00       	mov    $0x61,%eax
    11f1:	83 fa ff             	cmp    $0xffffffff,%edx
    11f4:	0f 84 4d 01 00 00    	je     1347 <main+0x2c7>
    11fa:	48 8d 44 24 1c       	lea    0x1c(%rsp),%rax
    11ff:	45 31 f6             	xor    %r14d,%r14d
    1202:	4c 8d 64 24 14       	lea    0x14(%rsp),%r12
    1207:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    120c:	41 83 fe 20          	cmp    $0x20,%r14d
    1210:	45 89 f5             	mov    %r14d,%r13d
    1213:	40 0f 94 c5          	sete   %bpl
    1217:	41 83 fe 09          	cmp    $0x9,%r14d
    121b:	0f 94 c0             	sete   %al
    121e:	31 db                	xor    %ebx,%ebx
    1220:	09 c5                	or     %eax,%ebp
    1222:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    122d:	0f 1f 00             	nopl   (%rax)
    1230:	44 88 6c 24 14       	mov    %r13b,0x14(%rsp)
    1235:	4d 89 e7             	mov    %r12,%r15
    1238:	88 5c 24 15          	mov    %bl,0x15(%rsp)
    123c:	c6 44 24 16 00       	movb   $0x0,0x16(%rsp)
    1241:	40 84 ed             	test   %bpl,%bpl
    1244:	74 1b                	je     1261 <main+0x1e1>
    1246:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    1250:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
    1255:	49 83 c7 01          	add    $0x1,%r15
    1259:	3c 20                	cmp    $0x20,%al
    125b:	74 f3                	je     1250 <main+0x1d0>
    125d:	3c 09                	cmp    $0x9,%al
    125f:	74 ef                	je     1250 <main+0x1d0>
    1261:	4c 89 ff             	mov    %r15,%rdi
    1264:	e8 d7 fd ff ff       	call   1040 <strlen@plt>
    1269:	48 85 c0             	test   %rax,%rax
    126c:	75 1c                	jne    128a <main+0x20a>
    126e:	e9 ed 00 00 00       	jmp    1360 <main+0x2e0>
    1273:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    127e:	66 90                	xchg   %ax,%ax
    1280:	41 c6 04 07 00       	movb   $0x0,(%r15,%rax,1)
    1285:	48 85 c0             	test   %rax,%rax
    1288:	74 13                	je     129d <main+0x21d>
    128a:	48 83 e8 01          	sub    $0x1,%rax
    128e:	41 0f b6 14 07       	movzbl (%r15,%rax,1),%edx
    1293:	80 fa 20             	cmp    $0x20,%dl
    1296:	74 e8                	je     1280 <main+0x200>
    1298:	80 fa 09             	cmp    $0x9,%dl
    129b:	74 e3                	je     1280 <main+0x200>
    129d:	4c 89 ff             	mov    %r15,%rdi
    12a0:	e8 9b fd ff ff       	call   1040 <strlen@plt>
    12a5:	48 85 c0             	test   %rax,%rax
    12a8:	0f 84 b2 00 00 00    	je     1360 <main+0x2e0>
    12ae:	41 0f b6 3f          	movzbl (%r15),%edi
    12b2:	c1 e7 08             	shl    $0x8,%edi
    12b5:	09 c7                	or     %eax,%edi
    12b7:	48 83 f8 01          	cmp    $0x1,%rax
    12bb:	0f 84 af 00 00 00    	je     1370 <main+0x2f0>
    12c1:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
    12c6:	c1 e0 10             	shl    $0x10,%eax
    12c9:	09 f8                	or     %edi,%eax
    12cb:	89 c2                	mov    %eax,%edx
    12cd:	0f b6 c8             	movzbl %al,%ecx
    12d0:	0f b6 f4             	movzbl %ah,%esi
    12d3:	c1 e8 18             	shr    $0x18,%eax
    12d6:	c1 ea 10             	shr    $0x10,%edx
    12d9:	0f b6 c0             	movzbl %al,%eax
    12dc:	0f b6 d2             	movzbl %dl,%edx
    12df:	40 0f b6 f6          	movzbl %sil,%esi
    12e3:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    12e8:	c1 e0 08             	shl    $0x8,%eax
    12eb:	83 c3 01             	add    $0x1,%ebx
    12ee:	09 d0                	or     %edx,%eax
    12f0:	ba 04 00 00 00       	mov    $0x4,%edx
    12f5:	c1 e0 08             	shl    $0x8,%eax
    12f8:	09 f0                	or     %esi,%eax
    12fa:	be 01 00 00 00       	mov    $0x1,%esi
    12ff:	c1 e0 08             	shl    $0x8,%eax
    1302:	09 c8                	or     %ecx,%eax
    1304:	48 8b 0d 1d 2d 00 00 	mov    0x2d1d(%rip),%rcx        # 4028 <stdout@GLIBC_2.2.5>
    130b:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
    130f:	e8 3c fd ff ff       	call   1050 <fwrite@plt>
    1314:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
    131a:	0f 85 10 ff ff ff    	jne    1230 <main+0x1b0>
    1320:	41 83 c6 01          	add    $0x1,%r14d
    1324:	41 81 fe 00 01 00 00 	cmp    $0x100,%r14d
    132b:	0f 85 db fe ff ff    	jne    120c <main+0x18c>
    1331:	48 8b 3d f0 2c 00 00 	mov    0x2cf0(%rip),%rdi        # 4028 <stdout@GLIBC_2.2.5>
    1338:	e8 f3 fc ff ff       	call   1030 <ferror@plt>
    133d:	85 c0                	test   %eax,%eax
    133f:	0f 95 c0             	setne  %al
    1342:	0f b6 c0             	movzbl %al,%eax
    1345:	01 c0                	add    %eax,%eax
    1347:	48 83 c4 28          	add    $0x28,%rsp
    134b:	5b                   	pop    %rbx
    134c:	5d                   	pop    %rbp
    134d:	41 5c                	pop    %r12
    134f:	41 5d                	pop    %r13
    1351:	41 5e                	pop    %r14
    1353:	41 5f                	pop    %r15
    1355:	c3                   	ret
    1356:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    1360:	31 c0                	xor    %eax,%eax
    1362:	31 d2                	xor    %edx,%edx
    1364:	31 f6                	xor    %esi,%esi
    1366:	31 c9                	xor    %ecx,%ecx
    1368:	e9 6c ff ff ff       	jmp    12d9 <main+0x259>
    136d:	0f 1f 00             	nopl   (%rax)
    1370:	89 f8                	mov    %edi,%eax
    1372:	89 fa                	mov    %edi,%edx
    1374:	40 0f b6 cf          	movzbl %dil,%ecx
    1378:	c1 ef 18             	shr    $0x18,%edi
    137b:	0f b6 f4             	movzbl %ah,%esi
    137e:	c1 ea 10             	shr    $0x10,%edx
    1381:	89 f8                	mov    %edi,%eax
    1383:	e9 51 ff ff ff       	jmp    12d9 <main+0x259>
    1388:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)

0000000000001390 <_start>:
    1390:	31 ed                	xor    %ebp,%ebp
    1392:	49 89 d1             	mov    %rdx,%r9
    1395:	5e                   	pop    %rsi
    1396:	48 89 e2             	mov    %rsp,%rdx
    1399:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    139d:	50                   	push   %rax
    139e:	54                   	push   %rsp
    139f:	45 31 c0             	xor    %r8d,%r8d
    13a2:	31 c9                	xor    %ecx,%ecx
    13a4:	48 8d 3d d5 fc ff ff 	lea    -0x32b(%rip),%rdi        # 1080 <main>
    13ab:	ff 15 0f 2c 00 00    	call   *0x2c0f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    13b1:	f4                   	hlt
    13b2:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    13bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000013c0 <deregister_tm_clones>:
    13c0:	48 8d 3d 61 2c 00 00 	lea    0x2c61(%rip),%rdi        # 4028 <stdout@GLIBC_2.2.5>
    13c7:	48 8d 05 5a 2c 00 00 	lea    0x2c5a(%rip),%rax        # 4028 <stdout@GLIBC_2.2.5>
    13ce:	48 39 f8             	cmp    %rdi,%rax
    13d1:	74 15                	je     13e8 <deregister_tm_clones+0x28>
    13d3:	48 8b 05 ee 2b 00 00 	mov    0x2bee(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    13da:	48 85 c0             	test   %rax,%rax
    13dd:	74 09                	je     13e8 <deregister_tm_clones+0x28>
    13df:	ff e0                	jmp    *%rax
    13e1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    13e8:	c3                   	ret
    13e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000013f0 <register_tm_clones>:
    13f0:	48 8d 3d 31 2c 00 00 	lea    0x2c31(%rip),%rdi        # 4028 <stdout@GLIBC_2.2.5>
    13f7:	48 8d 35 2a 2c 00 00 	lea    0x2c2a(%rip),%rsi        # 4028 <stdout@GLIBC_2.2.5>
    13fe:	48 29 fe             	sub    %rdi,%rsi
    1401:	48 89 f0             	mov    %rsi,%rax
    1404:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1408:	48 c1 f8 03          	sar    $0x3,%rax
    140c:	48 01 c6             	add    %rax,%rsi
    140f:	48 d1 fe             	sar    $1,%rsi
    1412:	74 14                	je     1428 <register_tm_clones+0x38>
    1414:	48 8b 05 bd 2b 00 00 	mov    0x2bbd(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    141b:	48 85 c0             	test   %rax,%rax
    141e:	74 08                	je     1428 <register_tm_clones+0x38>
    1420:	ff e0                	jmp    *%rax
    1422:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1428:	c3                   	ret
    1429:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001430 <__do_global_dtors_aux>:
    1430:	f3 0f 1e fa          	endbr64
    1434:	80 3d f5 2b 00 00 00 	cmpb   $0x0,0x2bf5(%rip)        # 4030 <completed.0>
    143b:	75 2b                	jne    1468 <__do_global_dtors_aux+0x38>
    143d:	55                   	push   %rbp
    143e:	48 83 3d 9a 2b 00 00 00 	cmpq   $0x0,0x2b9a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1446:	48 89 e5             	mov    %rsp,%rbp
    1449:	74 0c                	je     1457 <__do_global_dtors_aux+0x27>
    144b:	48 8b 3d ce 2b 00 00 	mov    0x2bce(%rip),%rdi        # 4020 <__dso_handle>
    1452:	e8 09 fc ff ff       	call   1060 <__cxa_finalize@plt>
    1457:	e8 64 ff ff ff       	call   13c0 <deregister_tm_clones>
    145c:	c6 05 cd 2b 00 00 01 	movb   $0x1,0x2bcd(%rip)        # 4030 <completed.0>
    1463:	5d                   	pop    %rbp
    1464:	c3                   	ret
    1465:	0f 1f 00             	nopl   (%rax)
    1468:	c3                   	ret
    1469:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001470 <frame_dummy>:
    1470:	f3 0f 1e fa          	endbr64
    1474:	e9 77 ff ff ff       	jmp    13f0 <register_tm_clones>
    1479:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001480 <wm_add_v2.isra.0>:
    1480:	89 f8                	mov    %edi,%eax
    1482:	c3                   	ret

Disassembly of section .fini:

0000000000001484 <_fini>:
    1484:	48 83 ec 08          	sub    $0x8,%rsp
    1488:	48 83 c4 08          	add    $0x8,%rsp
    148c:	c3                   	ret
