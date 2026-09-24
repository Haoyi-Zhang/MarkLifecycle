
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
    109a:	e8 01 04 00 00       	call   14a0 <wm_add_v2.isra.0>
    109f:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10a3:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10a7:	e8 f4 03 00 00       	call   14a0 <wm_add_v2.isra.0>
    10ac:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10b0:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10b4:	e8 e7 03 00 00       	call   14a0 <wm_add_v2.isra.0>
    10b9:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10bd:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10c1:	e8 da 03 00 00       	call   14a0 <wm_add_v2.isra.0>
    10c6:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10ca:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10ce:	e8 cd 03 00 00       	call   14a0 <wm_add_v2.isra.0>
    10d3:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10d7:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10db:	e8 c0 03 00 00       	call   14a0 <wm_add_v2.isra.0>
    10e0:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10e4:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10e8:	e8 b3 03 00 00       	call   14a0 <wm_add_v2.isra.0>
    10ed:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10f1:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10f5:	e8 a6 03 00 00       	call   14a0 <wm_add_v2.isra.0>
    10fa:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10fe:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1102:	e8 99 03 00 00       	call   14a0 <wm_add_v2.isra.0>
    1107:	89 44 24 18          	mov    %eax,0x18(%rsp)
    110b:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    110f:	e8 8c 03 00 00       	call   14a0 <wm_add_v2.isra.0>
    1114:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1118:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    111c:	e8 7f 03 00 00       	call   14a0 <wm_add_v2.isra.0>
    1121:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1125:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1129:	e8 72 03 00 00       	call   14a0 <wm_add_v2.isra.0>
    112e:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1132:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1136:	e8 65 03 00 00       	call   14a0 <wm_add_v2.isra.0>
    113b:	89 44 24 18          	mov    %eax,0x18(%rsp)
    113f:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1143:	e8 58 03 00 00       	call   14a0 <wm_add_v2.isra.0>
    1148:	89 44 24 18          	mov    %eax,0x18(%rsp)
    114c:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1150:	e8 4b 03 00 00       	call   14a0 <wm_add_v2.isra.0>
    1155:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1159:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    115d:	e8 3e 03 00 00       	call   14a0 <wm_add_v2.isra.0>
    1162:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1166:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    116a:	e8 31 03 00 00       	call   14a0 <wm_add_v2.isra.0>
    116f:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1173:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1177:	e8 24 03 00 00       	call   14a0 <wm_add_v2.isra.0>
    117c:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1180:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1184:	e8 17 03 00 00       	call   14a0 <wm_add_v2.isra.0>
    1189:	89 44 24 18          	mov    %eax,0x18(%rsp)
    118d:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1191:	e8 0a 03 00 00       	call   14a0 <wm_add_v2.isra.0>
    1196:	89 44 24 18          	mov    %eax,0x18(%rsp)
    119a:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    119e:	e8 fd 02 00 00       	call   14a0 <wm_add_v2.isra.0>
    11a3:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11a7:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11ab:	e8 f0 02 00 00       	call   14a0 <wm_add_v2.isra.0>
    11b0:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11b4:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11b8:	e8 e3 02 00 00       	call   14a0 <wm_add_v2.isra.0>
    11bd:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11c1:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11c5:	e8 d6 02 00 00       	call   14a0 <wm_add_v2.isra.0>
    11ca:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11ce:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11d2:	e8 c9 02 00 00       	call   14a0 <wm_add_v2.isra.0>
    11d7:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11db:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11df:	e8 bc 02 00 00       	call   14a0 <wm_add_v2.isra.0>
    11e4:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11e8:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11ec:	e8 af 02 00 00       	call   14a0 <wm_add_v2.isra.0>
    11f1:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11f5:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11f9:	e8 a2 02 00 00       	call   14a0 <wm_add_v2.isra.0>
    11fe:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1202:	8b 54 24 18          	mov    0x18(%rsp),%edx
    1206:	b8 61 00 00 00       	mov    $0x61,%eax
    120b:	83 fa ff             	cmp    $0xffffffff,%edx
    120e:	0f 84 53 01 00 00    	je     1367 <main+0x2e7>
    1214:	48 8d 44 24 1c       	lea    0x1c(%rsp),%rax
    1219:	45 31 f6             	xor    %r14d,%r14d
    121c:	4c 8d 64 24 14       	lea    0x14(%rsp),%r12
    1221:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    1226:	41 83 fe 20          	cmp    $0x20,%r14d
    122a:	45 89 f5             	mov    %r14d,%r13d
    122d:	40 0f 94 c5          	sete   %bpl
    1231:	41 83 fe 09          	cmp    $0x9,%r14d
    1235:	0f 94 c0             	sete   %al
    1238:	31 db                	xor    %ebx,%ebx
    123a:	09 c5                	or     %eax,%ebp
    123c:	0f 1f 40 00          	nopl   0x0(%rax)
    1240:	44 88 6c 24 14       	mov    %r13b,0x14(%rsp)
    1245:	4d 89 e7             	mov    %r12,%r15
    1248:	88 5c 24 15          	mov    %bl,0x15(%rsp)
    124c:	c6 44 24 16 00       	movb   $0x0,0x16(%rsp)
    1251:	40 84 ed             	test   %bpl,%bpl
    1254:	74 1b                	je     1271 <main+0x1f1>
    1256:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    1260:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
    1265:	49 83 c7 01          	add    $0x1,%r15
    1269:	3c 20                	cmp    $0x20,%al
    126b:	74 f3                	je     1260 <main+0x1e0>
    126d:	3c 09                	cmp    $0x9,%al
    126f:	74 ef                	je     1260 <main+0x1e0>
    1271:	4c 89 ff             	mov    %r15,%rdi
    1274:	e8 c7 fd ff ff       	call   1040 <strlen@plt>
    1279:	48 85 c0             	test   %rax,%rax
    127c:	75 2c                	jne    12aa <main+0x22a>
    127e:	e9 fd 00 00 00       	jmp    1380 <main+0x300>
    1283:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    128e:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1299:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    12a0:	41 c6 04 07 00       	movb   $0x0,(%r15,%rax,1)
    12a5:	48 85 c0             	test   %rax,%rax
    12a8:	74 13                	je     12bd <main+0x23d>
    12aa:	48 83 e8 01          	sub    $0x1,%rax
    12ae:	41 0f b6 14 07       	movzbl (%r15,%rax,1),%edx
    12b3:	80 fa 20             	cmp    $0x20,%dl
    12b6:	74 e8                	je     12a0 <main+0x220>
    12b8:	80 fa 09             	cmp    $0x9,%dl
    12bb:	74 e3                	je     12a0 <main+0x220>
    12bd:	4c 89 ff             	mov    %r15,%rdi
    12c0:	e8 7b fd ff ff       	call   1040 <strlen@plt>
    12c5:	48 85 c0             	test   %rax,%rax
    12c8:	0f 84 b2 00 00 00    	je     1380 <main+0x300>
    12ce:	41 0f b6 3f          	movzbl (%r15),%edi
    12d2:	c1 e7 08             	shl    $0x8,%edi
    12d5:	09 c7                	or     %eax,%edi
    12d7:	48 83 f8 01          	cmp    $0x1,%rax
    12db:	0f 84 af 00 00 00    	je     1390 <main+0x310>
    12e1:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
    12e6:	c1 e0 10             	shl    $0x10,%eax
    12e9:	09 f8                	or     %edi,%eax
    12eb:	89 c2                	mov    %eax,%edx
    12ed:	0f b6 c8             	movzbl %al,%ecx
    12f0:	0f b6 f4             	movzbl %ah,%esi
    12f3:	c1 e8 18             	shr    $0x18,%eax
    12f6:	c1 ea 10             	shr    $0x10,%edx
    12f9:	0f b6 c0             	movzbl %al,%eax
    12fc:	0f b6 d2             	movzbl %dl,%edx
    12ff:	40 0f b6 f6          	movzbl %sil,%esi
    1303:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    1308:	c1 e0 08             	shl    $0x8,%eax
    130b:	83 c3 01             	add    $0x1,%ebx
    130e:	09 d0                	or     %edx,%eax
    1310:	ba 04 00 00 00       	mov    $0x4,%edx
    1315:	c1 e0 08             	shl    $0x8,%eax
    1318:	09 f0                	or     %esi,%eax
    131a:	be 01 00 00 00       	mov    $0x1,%esi
    131f:	c1 e0 08             	shl    $0x8,%eax
    1322:	09 c8                	or     %ecx,%eax
    1324:	48 8b 0d fd 2c 00 00 	mov    0x2cfd(%rip),%rcx        # 4028 <stdout@GLIBC_2.2.5>
    132b:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
    132f:	e8 1c fd ff ff       	call   1050 <fwrite@plt>
    1334:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
    133a:	0f 85 00 ff ff ff    	jne    1240 <main+0x1c0>
    1340:	41 83 c6 01          	add    $0x1,%r14d
    1344:	41 81 fe 00 01 00 00 	cmp    $0x100,%r14d
    134b:	0f 85 d5 fe ff ff    	jne    1226 <main+0x1a6>
    1351:	48 8b 3d d0 2c 00 00 	mov    0x2cd0(%rip),%rdi        # 4028 <stdout@GLIBC_2.2.5>
    1358:	e8 d3 fc ff ff       	call   1030 <ferror@plt>
    135d:	85 c0                	test   %eax,%eax
    135f:	0f 95 c0             	setne  %al
    1362:	0f b6 c0             	movzbl %al,%eax
    1365:	01 c0                	add    %eax,%eax
    1367:	48 83 c4 28          	add    $0x28,%rsp
    136b:	5b                   	pop    %rbx
    136c:	5d                   	pop    %rbp
    136d:	41 5c                	pop    %r12
    136f:	41 5d                	pop    %r13
    1371:	41 5e                	pop    %r14
    1373:	41 5f                	pop    %r15
    1375:	c3                   	ret
    1376:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    1380:	31 c0                	xor    %eax,%eax
    1382:	31 d2                	xor    %edx,%edx
    1384:	31 f6                	xor    %esi,%esi
    1386:	31 c9                	xor    %ecx,%ecx
    1388:	e9 6c ff ff ff       	jmp    12f9 <main+0x279>
    138d:	0f 1f 00             	nopl   (%rax)
    1390:	89 f8                	mov    %edi,%eax
    1392:	89 fa                	mov    %edi,%edx
    1394:	40 0f b6 cf          	movzbl %dil,%ecx
    1398:	c1 ef 18             	shr    $0x18,%edi
    139b:	0f b6 f4             	movzbl %ah,%esi
    139e:	c1 ea 10             	shr    $0x10,%edx
    13a1:	89 f8                	mov    %edi,%eax
    13a3:	e9 51 ff ff ff       	jmp    12f9 <main+0x279>
    13a8:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)

00000000000013b0 <_start>:
    13b0:	31 ed                	xor    %ebp,%ebp
    13b2:	49 89 d1             	mov    %rdx,%r9
    13b5:	5e                   	pop    %rsi
    13b6:	48 89 e2             	mov    %rsp,%rdx
    13b9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    13bd:	50                   	push   %rax
    13be:	54                   	push   %rsp
    13bf:	45 31 c0             	xor    %r8d,%r8d
    13c2:	31 c9                	xor    %ecx,%ecx
    13c4:	48 8d 3d b5 fc ff ff 	lea    -0x34b(%rip),%rdi        # 1080 <main>
    13cb:	ff 15 ef 2b 00 00    	call   *0x2bef(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    13d1:	f4                   	hlt
    13d2:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    13dc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000013e0 <deregister_tm_clones>:
    13e0:	48 8d 3d 41 2c 00 00 	lea    0x2c41(%rip),%rdi        # 4028 <stdout@GLIBC_2.2.5>
    13e7:	48 8d 05 3a 2c 00 00 	lea    0x2c3a(%rip),%rax        # 4028 <stdout@GLIBC_2.2.5>
    13ee:	48 39 f8             	cmp    %rdi,%rax
    13f1:	74 15                	je     1408 <deregister_tm_clones+0x28>
    13f3:	48 8b 05 ce 2b 00 00 	mov    0x2bce(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    13fa:	48 85 c0             	test   %rax,%rax
    13fd:	74 09                	je     1408 <deregister_tm_clones+0x28>
    13ff:	ff e0                	jmp    *%rax
    1401:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1408:	c3                   	ret
    1409:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001410 <register_tm_clones>:
    1410:	48 8d 3d 11 2c 00 00 	lea    0x2c11(%rip),%rdi        # 4028 <stdout@GLIBC_2.2.5>
    1417:	48 8d 35 0a 2c 00 00 	lea    0x2c0a(%rip),%rsi        # 4028 <stdout@GLIBC_2.2.5>
    141e:	48 29 fe             	sub    %rdi,%rsi
    1421:	48 89 f0             	mov    %rsi,%rax
    1424:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1428:	48 c1 f8 03          	sar    $0x3,%rax
    142c:	48 01 c6             	add    %rax,%rsi
    142f:	48 d1 fe             	sar    $1,%rsi
    1432:	74 14                	je     1448 <register_tm_clones+0x38>
    1434:	48 8b 05 9d 2b 00 00 	mov    0x2b9d(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    143b:	48 85 c0             	test   %rax,%rax
    143e:	74 08                	je     1448 <register_tm_clones+0x38>
    1440:	ff e0                	jmp    *%rax
    1442:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1448:	c3                   	ret
    1449:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001450 <__do_global_dtors_aux>:
    1450:	f3 0f 1e fa          	endbr64
    1454:	80 3d d5 2b 00 00 00 	cmpb   $0x0,0x2bd5(%rip)        # 4030 <completed.0>
    145b:	75 2b                	jne    1488 <__do_global_dtors_aux+0x38>
    145d:	55                   	push   %rbp
    145e:	48 83 3d 7a 2b 00 00 00 	cmpq   $0x0,0x2b7a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1466:	48 89 e5             	mov    %rsp,%rbp
    1469:	74 0c                	je     1477 <__do_global_dtors_aux+0x27>
    146b:	48 8b 3d ae 2b 00 00 	mov    0x2bae(%rip),%rdi        # 4020 <__dso_handle>
    1472:	e8 e9 fb ff ff       	call   1060 <__cxa_finalize@plt>
    1477:	e8 64 ff ff ff       	call   13e0 <deregister_tm_clones>
    147c:	c6 05 ad 2b 00 00 01 	movb   $0x1,0x2bad(%rip)        # 4030 <completed.0>
    1483:	5d                   	pop    %rbp
    1484:	c3                   	ret
    1485:	0f 1f 00             	nopl   (%rax)
    1488:	c3                   	ret
    1489:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001490 <frame_dummy>:
    1490:	f3 0f 1e fa          	endbr64
    1494:	e9 77 ff ff ff       	jmp    1410 <register_tm_clones>
    1499:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000014a0 <wm_add_v2.isra.0>:
    14a0:	89 f8                	mov    %edi,%eax
    14a2:	c3                   	ret

Disassembly of section .fini:

00000000000014a4 <_fini>:
    14a4:	48 83 ec 08          	sub    $0x8,%rsp
    14a8:	48 83 c4 08          	add    $0x8,%rsp
    14ac:	c3                   	ret
