
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
    1060:	41 57                	push   %r15
    1062:	41 56                	push   %r14
    1064:	41 55                	push   %r13
    1066:	41 54                	push   %r12
    1068:	55                   	push   %rbp
    1069:	53                   	push   %rbx
    106a:	48 83 ec 18          	sub    $0x18,%rsp
    106e:	c7 44 24 08 f5 79 2b 6d 	movl   $0x6d2b79f5,0x8(%rsp)
    1076:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    107a:	e8 d1 04 00 00       	call   1550 <wm_add_v1.isra.0>
    107f:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1083:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    1087:	e8 c4 04 00 00       	call   1550 <wm_add_v1.isra.0>
    108c:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1090:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    1094:	e8 b7 04 00 00       	call   1550 <wm_add_v1.isra.0>
    1099:	89 44 24 08          	mov    %eax,0x8(%rsp)
    109d:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    10a1:	e8 aa 04 00 00       	call   1550 <wm_add_v1.isra.0>
    10a6:	89 44 24 08          	mov    %eax,0x8(%rsp)
    10aa:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    10ae:	e8 9d 04 00 00       	call   1550 <wm_add_v1.isra.0>
    10b3:	89 44 24 08          	mov    %eax,0x8(%rsp)
    10b7:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    10bb:	e8 90 04 00 00       	call   1550 <wm_add_v1.isra.0>
    10c0:	89 44 24 08          	mov    %eax,0x8(%rsp)
    10c4:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    10c8:	e8 83 04 00 00       	call   1550 <wm_add_v1.isra.0>
    10cd:	89 44 24 08          	mov    %eax,0x8(%rsp)
    10d1:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    10d5:	e8 76 04 00 00       	call   1550 <wm_add_v1.isra.0>
    10da:	89 44 24 08          	mov    %eax,0x8(%rsp)
    10de:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    10e2:	e8 69 04 00 00       	call   1550 <wm_add_v1.isra.0>
    10e7:	89 44 24 08          	mov    %eax,0x8(%rsp)
    10eb:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    10ef:	e8 5c 04 00 00       	call   1550 <wm_add_v1.isra.0>
    10f4:	89 44 24 08          	mov    %eax,0x8(%rsp)
    10f8:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    10fc:	e8 4f 04 00 00       	call   1550 <wm_add_v1.isra.0>
    1101:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1105:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    1109:	e8 42 04 00 00       	call   1550 <wm_add_v1.isra.0>
    110e:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1112:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    1116:	e8 35 04 00 00       	call   1550 <wm_add_v1.isra.0>
    111b:	89 44 24 08          	mov    %eax,0x8(%rsp)
    111f:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    1123:	e8 28 04 00 00       	call   1550 <wm_add_v1.isra.0>
    1128:	89 44 24 08          	mov    %eax,0x8(%rsp)
    112c:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    1130:	e8 1b 04 00 00       	call   1550 <wm_add_v1.isra.0>
    1135:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1139:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    113d:	e8 0e 04 00 00       	call   1550 <wm_add_v1.isra.0>
    1142:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1146:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    114a:	e8 01 04 00 00       	call   1550 <wm_add_v1.isra.0>
    114f:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1153:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    1157:	e8 f4 03 00 00       	call   1550 <wm_add_v1.isra.0>
    115c:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1160:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    1164:	e8 e7 03 00 00       	call   1550 <wm_add_v1.isra.0>
    1169:	89 44 24 08          	mov    %eax,0x8(%rsp)
    116d:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    1171:	e8 da 03 00 00       	call   1550 <wm_add_v1.isra.0>
    1176:	89 44 24 08          	mov    %eax,0x8(%rsp)
    117a:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    117e:	e8 cd 03 00 00       	call   1550 <wm_add_v1.isra.0>
    1183:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1187:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    118b:	e8 c0 03 00 00       	call   1550 <wm_add_v1.isra.0>
    1190:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1194:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    1198:	e8 b3 03 00 00       	call   1550 <wm_add_v1.isra.0>
    119d:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11a1:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    11a5:	e8 a6 03 00 00       	call   1550 <wm_add_v1.isra.0>
    11aa:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11ae:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    11b2:	e8 99 03 00 00       	call   1550 <wm_add_v1.isra.0>
    11b7:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11bb:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    11bf:	e8 8c 03 00 00       	call   1550 <wm_add_v1.isra.0>
    11c4:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11c8:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    11cc:	e8 7f 03 00 00       	call   1550 <wm_add_v1.isra.0>
    11d1:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11d5:	8b 7c 24 08          	mov    0x8(%rsp),%edi
    11d9:	e8 72 03 00 00       	call   1550 <wm_add_v1.isra.0>
    11de:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11e2:	8b 54 24 08          	mov    0x8(%rsp),%edx
    11e6:	b8 61 00 00 00       	mov    $0x61,%eax
    11eb:	83 fa ff             	cmp    $0xffffffff,%edx
    11ee:	0f 84 51 02 00 00    	je     1445 <main+0x3e5>
    11f4:	4c 8d 2d 65 2b 00 00 	lea    0x2b65(%rip),%r13        # 3d60 <cases>
    11fb:	ba 7b 00 00 00       	mov    $0x7b,%edx
    1200:	48 8d 5c 24 0c       	lea    0xc(%rsp),%rbx
    1205:	49 bc 05 00 00 00 05 00 00 00 	movabs $0x500000005,%r12
    120f:	49 8b 75 00          	mov    0x0(%r13),%rsi
    1213:	49 8d ad 80 00 00 00 	lea    0x80(%r13),%rbp
    121a:	84 d2                	test   %dl,%dl
    121c:	0f 84 27 01 00 00    	je     1349 <main+0x2e9>
    1222:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    122d:	0f 1f 00             	nopl   (%rax)
    1230:	31 c0                	xor    %eax,%eax
    1232:	41 be 01 00 00 00    	mov    $0x1,%r14d
    1238:	45 31 db             	xor    %r11d,%r11d
    123b:	45 31 c9             	xor    %r9d,%r9d
    123e:	45 31 c0             	xor    %r8d,%r8d
    1241:	45 31 d2             	xor    %r10d,%r10d
    1244:	31 ff                	xor    %edi,%edi
    1246:	31 c9                	xor    %ecx,%ecx
    1248:	41 89 c7             	mov    %eax,%r15d
    124b:	eb 4a                	jmp    1297 <main+0x237>
    124d:	0f 1f 00             	nopl   (%rax)
    1250:	80 fa 22             	cmp    $0x22,%dl
    1253:	0f 84 37 01 00 00    	je     1390 <main+0x330>
    1259:	0f 86 f9 00 00 00    	jbe    1358 <main+0x2f8>
    125f:	80 fa 7b             	cmp    $0x7b,%dl
    1262:	0f 84 18 01 00 00    	je     1380 <main+0x320>
    1268:	0f 87 3a 01 00 00    	ja     13a8 <main+0x348>
    126e:	80 fa 5b             	cmp    $0x5b,%dl
    1271:	0f 84 09 01 00 00    	je     1380 <main+0x320>
    1277:	80 fa 5d             	cmp    $0x5d,%dl
    127a:	0f 85 70 01 00 00    	jne    13f0 <main+0x390>
    1280:	45 85 c9             	test   %r9d,%r9d
    1283:	0f 84 57 01 00 00    	je     13e0 <main+0x380>
    1289:	41 83 e9 01          	sub    $0x1,%r9d
    128d:	45 31 db             	xor    %r11d,%r11d
    1290:	0f b6 16             	movzbl (%rsi),%edx
    1293:	84 d2                	test   %dl,%dl
    1295:	74 49                	je     12e0 <main+0x280>
    1297:	44 89 f8             	mov    %r15d,%eax
    129a:	48 83 c6 01          	add    $0x1,%rsi
    129e:	83 c1 01             	add    $0x1,%ecx
    12a1:	c1 e0 05             	shl    $0x5,%eax
    12a4:	44 01 f8             	add    %r15d,%eax
    12a7:	44 0f b6 fa          	movzbl %dl,%r15d
    12ab:	44 01 f8             	add    %r15d,%eax
    12ae:	44 0f b7 f8          	movzwl %ax,%r15d
    12b2:	85 ff                	test   %edi,%edi
    12b4:	74 9a                	je     1250 <main+0x1f0>
    12b6:	45 85 d2             	test   %r10d,%r10d
    12b9:	0f 85 b1 00 00 00    	jne    1370 <main+0x310>
    12bf:	80 fa 5c             	cmp    $0x5c,%dl
    12c2:	0f 84 48 01 00 00    	je     1410 <main+0x3b0>
    12c8:	31 ff                	xor    %edi,%edi
    12ca:	80 fa 22             	cmp    $0x22,%dl
    12cd:	0f b6 16             	movzbl (%rsi),%edx
    12d0:	40 0f 95 c7          	setne  %dil
    12d4:	84 d2                	test   %dl,%dl
    12d6:	75 bf                	jne    1297 <main+0x237>
    12d8:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    12e0:	c1 e1 10             	shl    $0x10,%ecx
    12e3:	41 c1 e0 18          	shl    $0x18,%r8d
    12e7:	44 89 f8             	mov    %r15d,%eax
    12ea:	31 d2                	xor    %edx,%edx
    12ec:	81 e1 00 00 ff 00    	and    $0xff0000,%ecx
    12f2:	41 81 e0 00 00 00 7f 	and    $0x7f000000,%r8d
    12f9:	09 c8                	or     %ecx,%eax
    12fb:	44 09 c0             	or     %r8d,%eax
    12fe:	41 09 f9             	or     %edi,%r9d
    1301:	0f 94 c2             	sete   %dl
    1304:	44 21 f2             	and    %r14d,%edx
    1307:	c1 e2 1f             	shl    $0x1f,%edx
    130a:	09 d0                	or     %edx,%eax
    130c:	ba 04 00 00 00       	mov    $0x4,%edx
    1311:	48 89 df             	mov    %rbx,%rdi
    1314:	49 83 c5 08          	add    $0x8,%r13
    1318:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    131c:	48 8b 0d fd 2c 00 00 	mov    0x2cfd(%rip),%rcx        # 4020 <stdout@GLIBC_2.2.5>
    1323:	be 01 00 00 00       	mov    $0x1,%esi
    1328:	e8 13 fd ff ff       	call   1040 <fwrite@plt>
    132d:	49 39 ed             	cmp    %rbp,%r13
    1330:	0f 84 f9 00 00 00    	je     142f <main+0x3cf>
    1336:	49 8b 45 00          	mov    0x0(%r13),%rax
    133a:	49 8b 75 00          	mov    0x0(%r13),%rsi
    133e:	0f b6 10             	movzbl (%rax),%edx
    1341:	84 d2                	test   %dl,%dl
    1343:	0f 85 e7 fe ff ff    	jne    1230 <main+0x1d0>
    1349:	8b 05 b5 0c 00 00    	mov    0xcb5(%rip),%eax        # 2004 <_IO_stdin_used+0x4>
    134f:	eb bb                	jmp    130c <main+0x2ac>
    1351:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1358:	80 fa 0d             	cmp    $0xd,%dl
    135b:	74 07                	je     1364 <main+0x304>
    135d:	76 71                	jbe    13d0 <main+0x370>
    135f:	80 fa 20             	cmp    $0x20,%dl
    1362:	75 4d                	jne    13b1 <main+0x351>
    1364:	45 31 db             	xor    %r11d,%r11d
    1367:	e9 24 ff ff ff       	jmp    1290 <main+0x230>
    136c:	0f 1f 40 00          	nopl   0x0(%rax)
    1370:	44 89 d7             	mov    %r10d,%edi
    1373:	45 31 d2             	xor    %r10d,%r10d
    1376:	e9 15 ff ff ff       	jmp    1290 <main+0x230>
    137b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1380:	41 83 c1 01          	add    $0x1,%r9d
    1384:	41 83 c0 01          	add    $0x1,%r8d
    1388:	45 31 db             	xor    %r11d,%r11d
    138b:	e9 00 ff ff ff       	jmp    1290 <main+0x230>
    1390:	41 83 c0 01          	add    $0x1,%r8d
    1394:	45 31 db             	xor    %r11d,%r11d
    1397:	bf 01 00 00 00       	mov    $0x1,%edi
    139c:	e9 ef fe ff ff       	jmp    1290 <main+0x230>
    13a1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    13a8:	80 fa 7d             	cmp    $0x7d,%dl
    13ab:	0f 84 cf fe ff ff    	je     1280 <main+0x220>
    13b1:	45 85 db             	test   %r11d,%r11d
    13b4:	0f 85 d6 fe ff ff    	jne    1290 <main+0x230>
    13ba:	41 83 c0 01          	add    $0x1,%r8d
    13be:	31 ff                	xor    %edi,%edi
    13c0:	41 bb 01 00 00 00    	mov    $0x1,%r11d
    13c6:	e9 c5 fe ff ff       	jmp    1290 <main+0x230>
    13cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    13d0:	83 ea 09             	sub    $0x9,%edx
    13d3:	80 fa 01             	cmp    $0x1,%dl
    13d6:	76 8c                	jbe    1364 <main+0x304>
    13d8:	eb d7                	jmp    13b1 <main+0x351>
    13da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    13e0:	45 31 db             	xor    %r11d,%r11d
    13e3:	45 31 f6             	xor    %r14d,%r14d
    13e6:	e9 a5 fe ff ff       	jmp    1290 <main+0x230>
    13eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    13f0:	80 fa 5a             	cmp    $0x5a,%dl
    13f3:	77 2b                	ja     1420 <main+0x3c0>
    13f5:	80 fa 2c             	cmp    $0x2c,%dl
    13f8:	0f 84 66 ff ff ff    	je     1364 <main+0x304>
    13fe:	80 fa 3a             	cmp    $0x3a,%dl
    1401:	0f 84 5d ff ff ff    	je     1364 <main+0x304>
    1407:	eb a8                	jmp    13b1 <main+0x351>
    1409:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1410:	41 89 fa             	mov    %edi,%r10d
    1413:	e9 78 fe ff ff       	jmp    1290 <main+0x230>
    1418:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    1420:	83 ea 5b             	sub    $0x5b,%edx
    1423:	49 0f a3 d4          	bt     %rdx,%r12
    1427:	0f 82 37 ff ff ff    	jb     1364 <main+0x304>
    142d:	eb 82                	jmp    13b1 <main+0x351>
    142f:	48 8b 3d ea 2b 00 00 	mov    0x2bea(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1436:	e8 f5 fb ff ff       	call   1030 <ferror@plt>
    143b:	85 c0                	test   %eax,%eax
    143d:	0f 95 c0             	setne  %al
    1440:	0f b6 c0             	movzbl %al,%eax
    1443:	01 c0                	add    %eax,%eax
    1445:	48 83 c4 18          	add    $0x18,%rsp
    1449:	5b                   	pop    %rbx
    144a:	5d                   	pop    %rbp
    144b:	41 5c                	pop    %r12
    144d:	41 5d                	pop    %r13
    144f:	41 5e                	pop    %r14
    1451:	41 5f                	pop    %r15
    1453:	c3                   	ret
    1454:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    145e:	66 90                	xchg   %ax,%ax

0000000000001460 <_start>:
    1460:	31 ed                	xor    %ebp,%ebp
    1462:	49 89 d1             	mov    %rdx,%r9
    1465:	5e                   	pop    %rsi
    1466:	48 89 e2             	mov    %rsp,%rdx
    1469:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    146d:	50                   	push   %rax
    146e:	54                   	push   %rsp
    146f:	45 31 c0             	xor    %r8d,%r8d
    1472:	31 c9                	xor    %ecx,%ecx
    1474:	48 8d 3d e5 fb ff ff 	lea    -0x41b(%rip),%rdi        # 1060 <main>
    147b:	ff 15 3f 2b 00 00    	call   *0x2b3f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1481:	f4                   	hlt
    1482:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    148c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001490 <deregister_tm_clones>:
    1490:	48 8d 3d 89 2b 00 00 	lea    0x2b89(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1497:	48 8d 05 82 2b 00 00 	lea    0x2b82(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    149e:	48 39 f8             	cmp    %rdi,%rax
    14a1:	74 15                	je     14b8 <deregister_tm_clones+0x28>
    14a3:	48 8b 05 1e 2b 00 00 	mov    0x2b1e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    14aa:	48 85 c0             	test   %rax,%rax
    14ad:	74 09                	je     14b8 <deregister_tm_clones+0x28>
    14af:	ff e0                	jmp    *%rax
    14b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    14b8:	c3                   	ret
    14b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000014c0 <register_tm_clones>:
    14c0:	48 8d 3d 59 2b 00 00 	lea    0x2b59(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    14c7:	48 8d 35 52 2b 00 00 	lea    0x2b52(%rip),%rsi        # 4020 <stdout@GLIBC_2.2.5>
    14ce:	48 29 fe             	sub    %rdi,%rsi
    14d1:	48 89 f0             	mov    %rsi,%rax
    14d4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    14d8:	48 c1 f8 03          	sar    $0x3,%rax
    14dc:	48 01 c6             	add    %rax,%rsi
    14df:	48 d1 fe             	sar    $1,%rsi
    14e2:	74 14                	je     14f8 <register_tm_clones+0x38>
    14e4:	48 8b 05 ed 2a 00 00 	mov    0x2aed(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    14eb:	48 85 c0             	test   %rax,%rax
    14ee:	74 08                	je     14f8 <register_tm_clones+0x38>
    14f0:	ff e0                	jmp    *%rax
    14f2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    14f8:	c3                   	ret
    14f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001500 <__do_global_dtors_aux>:
    1500:	f3 0f 1e fa          	endbr64
    1504:	80 3d 1d 2b 00 00 00 	cmpb   $0x0,0x2b1d(%rip)        # 4028 <completed.0>
    150b:	75 2b                	jne    1538 <__do_global_dtors_aux+0x38>
    150d:	55                   	push   %rbp
    150e:	48 83 3d ca 2a 00 00 00 	cmpq   $0x0,0x2aca(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1516:	48 89 e5             	mov    %rsp,%rbp
    1519:	74 0c                	je     1527 <__do_global_dtors_aux+0x27>
    151b:	48 8b 3d f6 2a 00 00 	mov    0x2af6(%rip),%rdi        # 4018 <__dso_handle>
    1522:	e8 29 fb ff ff       	call   1050 <__cxa_finalize@plt>
    1527:	e8 64 ff ff ff       	call   1490 <deregister_tm_clones>
    152c:	c6 05 f5 2a 00 00 01 	movb   $0x1,0x2af5(%rip)        # 4028 <completed.0>
    1533:	5d                   	pop    %rbp
    1534:	c3                   	ret
    1535:	0f 1f 00             	nopl   (%rax)
    1538:	c3                   	ret
    1539:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001540 <frame_dummy>:
    1540:	f3 0f 1e fa          	endbr64
    1544:	e9 77 ff ff ff       	jmp    14c0 <register_tm_clones>
    1549:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001550 <wm_add_v1.isra.0>:
    1550:	89 f8                	mov    %edi,%eax
    1552:	c3                   	ret

Disassembly of section .fini:

0000000000001554 <_fini>:
    1554:	48 83 ec 08          	sub    $0x8,%rsp
    1558:	48 83 c4 08          	add    $0x8,%rsp
    155c:	c3                   	ret
