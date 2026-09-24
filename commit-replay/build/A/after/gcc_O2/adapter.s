
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
    106a:	48 83 ec 28          	sub    $0x28,%rsp
    106e:	c7 44 24 18 f5 79 2b 6d 	movl   $0x6d2b79f5,0x18(%rsp)
    1076:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    107a:	e8 91 04 00 00       	call   1510 <wm_add_v2.isra.0>
    107f:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1083:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1087:	e8 84 04 00 00       	call   1510 <wm_add_v2.isra.0>
    108c:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1090:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1094:	e8 77 04 00 00       	call   1510 <wm_add_v2.isra.0>
    1099:	89 44 24 18          	mov    %eax,0x18(%rsp)
    109d:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10a1:	e8 6a 04 00 00       	call   1510 <wm_add_v2.isra.0>
    10a6:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10aa:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10ae:	e8 5d 04 00 00       	call   1510 <wm_add_v2.isra.0>
    10b3:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10b7:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10bb:	e8 50 04 00 00       	call   1510 <wm_add_v2.isra.0>
    10c0:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10c4:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10c8:	e8 43 04 00 00       	call   1510 <wm_add_v2.isra.0>
    10cd:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10d1:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10d5:	e8 36 04 00 00       	call   1510 <wm_add_v2.isra.0>
    10da:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10de:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10e2:	e8 29 04 00 00       	call   1510 <wm_add_v2.isra.0>
    10e7:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10eb:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10ef:	e8 1c 04 00 00       	call   1510 <wm_add_v2.isra.0>
    10f4:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10f8:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10fc:	e8 0f 04 00 00       	call   1510 <wm_add_v2.isra.0>
    1101:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1105:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1109:	e8 02 04 00 00       	call   1510 <wm_add_v2.isra.0>
    110e:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1112:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1116:	e8 f5 03 00 00       	call   1510 <wm_add_v2.isra.0>
    111b:	89 44 24 18          	mov    %eax,0x18(%rsp)
    111f:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1123:	e8 e8 03 00 00       	call   1510 <wm_add_v2.isra.0>
    1128:	89 44 24 18          	mov    %eax,0x18(%rsp)
    112c:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1130:	e8 db 03 00 00       	call   1510 <wm_add_v2.isra.0>
    1135:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1139:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    113d:	e8 ce 03 00 00       	call   1510 <wm_add_v2.isra.0>
    1142:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1146:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    114a:	e8 c1 03 00 00       	call   1510 <wm_add_v2.isra.0>
    114f:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1153:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1157:	e8 b4 03 00 00       	call   1510 <wm_add_v2.isra.0>
    115c:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1160:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1164:	e8 a7 03 00 00       	call   1510 <wm_add_v2.isra.0>
    1169:	89 44 24 18          	mov    %eax,0x18(%rsp)
    116d:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1171:	e8 9a 03 00 00       	call   1510 <wm_add_v2.isra.0>
    1176:	89 44 24 18          	mov    %eax,0x18(%rsp)
    117a:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    117e:	e8 8d 03 00 00       	call   1510 <wm_add_v2.isra.0>
    1183:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1187:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    118b:	e8 80 03 00 00       	call   1510 <wm_add_v2.isra.0>
    1190:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1194:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1198:	e8 73 03 00 00       	call   1510 <wm_add_v2.isra.0>
    119d:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11a1:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11a5:	e8 66 03 00 00       	call   1510 <wm_add_v2.isra.0>
    11aa:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11ae:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11b2:	e8 59 03 00 00       	call   1510 <wm_add_v2.isra.0>
    11b7:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11bb:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11bf:	e8 4c 03 00 00       	call   1510 <wm_add_v2.isra.0>
    11c4:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11c8:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11cc:	e8 3f 03 00 00       	call   1510 <wm_add_v2.isra.0>
    11d1:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11d5:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11d9:	e8 32 03 00 00       	call   1510 <wm_add_v2.isra.0>
    11de:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11e2:	8b 54 24 18          	mov    0x18(%rsp),%edx
    11e6:	b8 61 00 00 00       	mov    $0x61,%eax
    11eb:	83 fa ff             	cmp    $0xffffffff,%edx
    11ee:	0f 84 1a 02 00 00    	je     140e <main+0x3ae>
    11f4:	48 8d 44 24 1c       	lea    0x1c(%rsp),%rax
    11f9:	b9 7b 00 00 00       	mov    $0x7b,%ecx
    11fe:	bd 01 00 00 00       	mov    $0x1,%ebp
    1203:	48 bb 00 26 00 00 01 10 00 04 	movabs $0x400100100002600,%rbx
    120d:	4c 8d 25 4c 2b 00 00 	lea    0x2b4c(%rip),%r12        # 3d60 <cases>
    1214:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    1219:	4d 8b 3c 24          	mov    (%r12),%r15
    121d:	84 c9                	test   %cl,%cl
    121f:	0f 84 34 01 00 00    	je     1359 <main+0x2f9>
    1225:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1230:	4c 89 fe             	mov    %r15,%rsi
    1233:	41 be 01 00 00 00    	mov    $0x1,%r14d
    1239:	45 31 d2             	xor    %r10d,%r10d
    123c:	45 31 ed             	xor    %r13d,%r13d
    123f:	45 31 c9             	xor    %r9d,%r9d
    1242:	45 31 db             	xor    %r11d,%r11d
    1245:	45 31 c0             	xor    %r8d,%r8d
    1248:	31 ff                	xor    %edi,%edi
    124a:	eb 53                	jmp    129f <main+0x23f>
    124c:	0f 1f 40 00          	nopl   0x0(%rax)
    1250:	80 f9 5b             	cmp    $0x5b,%cl
    1253:	0f 84 5f 01 00 00    	je     13b8 <main+0x358>
    1259:	0f 87 09 01 00 00    	ja     1368 <main+0x308>
    125f:	8d 41 f7             	lea    -0x9(%rcx),%eax
    1262:	3c 31                	cmp    $0x31,%al
    1264:	0f 87 0b 01 00 00    	ja     1375 <main+0x315>
    126a:	48 89 e8             	mov    %rbp,%rax
    126d:	48 d3 e0             	shl    %cl,%rax
    1270:	48 85 d8             	test   %rbx,%rax
    1273:	0f 85 57 01 00 00    	jne    13d0 <main+0x370>
    1279:	83 fa 22             	cmp    $0x22,%edx
    127c:	0f 85 f3 00 00 00    	jne    1375 <main+0x315>
    1282:	41 83 c1 01          	add    $0x1,%r9d
    1286:	45 31 d2             	xor    %r10d,%r10d
    1289:	41 b8 01 00 00 00    	mov    $0x1,%r8d
    128f:	90                   	nop
    1290:	0f b6 4e 01          	movzbl 0x1(%rsi),%ecx
    1294:	48 8d 46 01          	lea    0x1(%rsi),%rax
    1298:	84 c9                	test   %cl,%cl
    129a:	74 44                	je     12e0 <main+0x280>
    129c:	48 89 c6             	mov    %rax,%rsi
    129f:	89 f8                	mov    %edi,%eax
    12a1:	0f b6 d1             	movzbl %cl,%edx
    12a4:	c1 e0 05             	shl    $0x5,%eax
    12a7:	01 f8                	add    %edi,%eax
    12a9:	01 d0                	add    %edx,%eax
    12ab:	0f b7 f8             	movzwl %ax,%edi
    12ae:	45 85 c0             	test   %r8d,%r8d
    12b1:	74 9d                	je     1250 <main+0x1f0>
    12b3:	45 85 db             	test   %r11d,%r11d
    12b6:	0f 85 d4 00 00 00    	jne    1390 <main+0x330>
    12bc:	80 f9 5c             	cmp    $0x5c,%cl
    12bf:	0f 84 2b 01 00 00    	je     13f0 <main+0x390>
    12c5:	45 31 c0             	xor    %r8d,%r8d
    12c8:	80 f9 22             	cmp    $0x22,%cl
    12cb:	0f b6 4e 01          	movzbl 0x1(%rsi),%ecx
    12cf:	48 8d 46 01          	lea    0x1(%rsi),%rax
    12d3:	41 0f 95 c0          	setne  %r8b
    12d7:	84 c9                	test   %cl,%cl
    12d9:	75 c1                	jne    129c <main+0x23c>
    12db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    12e0:	44 29 fe             	sub    %r15d,%esi
    12e3:	41 c1 e1 18          	shl    $0x18,%r9d
    12e7:	89 f8                	mov    %edi,%eax
    12e9:	8d 56 01             	lea    0x1(%rsi),%edx
    12ec:	41 81 e1 00 00 00 7f 	and    $0x7f000000,%r9d
    12f3:	c1 e2 10             	shl    $0x10,%edx
    12f6:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
    12fc:	09 d0                	or     %edx,%eax
    12fe:	41 09 c1             	or     %eax,%r9d
    1301:	31 c0                	xor    %eax,%eax
    1303:	45 09 e8             	or     %r13d,%r8d
    1306:	0f 94 c0             	sete   %al
    1309:	44 21 f0             	and    %r14d,%eax
    130c:	c1 e0 1f             	shl    $0x1f,%eax
    130f:	41 09 c1             	or     %eax,%r9d
    1312:	48 8b 0d 07 2d 00 00 	mov    0x2d07(%rip),%rcx        # 4020 <stdout@GLIBC_2.2.5>
    1319:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    131e:	ba 04 00 00 00       	mov    $0x4,%edx
    1323:	be 01 00 00 00       	mov    $0x1,%esi
    1328:	44 89 4c 24 1c       	mov    %r9d,0x1c(%rsp)
    132d:	49 83 c4 08          	add    $0x8,%r12
    1331:	e8 0a fd ff ff       	call   1040 <fwrite@plt>
    1336:	48 8d 05 a3 2a 00 00 	lea    0x2aa3(%rip),%rax        # 3de0 <_DYNAMIC>
    133d:	4c 39 e0             	cmp    %r12,%rax
    1340:	0f 84 b2 00 00 00    	je     13f8 <main+0x398>
    1346:	49 8b 04 24          	mov    (%r12),%rax
    134a:	4d 8b 3c 24          	mov    (%r12),%r15
    134e:	0f b6 08             	movzbl (%rax),%ecx
    1351:	84 c9                	test   %cl,%cl
    1353:	0f 85 d7 fe ff ff    	jne    1230 <main+0x1d0>
    1359:	44 8b 0d a4 0c 00 00 	mov    0xca4(%rip),%r9d        # 2004 <_IO_stdin_used+0x4>
    1360:	eb b0                	jmp    1312 <main+0x2b2>
    1362:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1368:	80 f9 7b             	cmp    $0x7b,%cl
    136b:	74 4b                	je     13b8 <main+0x358>
    136d:	83 e1 df             	and    $0xffffffdf,%ecx
    1370:	80 f9 5d             	cmp    $0x5d,%cl
    1373:	74 2b                	je     13a0 <main+0x340>
    1375:	45 85 d2             	test   %r10d,%r10d
    1378:	0f 85 12 ff ff ff    	jne    1290 <main+0x230>
    137e:	41 83 c1 01          	add    $0x1,%r9d
    1382:	45 31 c0             	xor    %r8d,%r8d
    1385:	41 ba 01 00 00 00    	mov    $0x1,%r10d
    138b:	e9 00 ff ff ff       	jmp    1290 <main+0x230>
    1390:	45 89 d8             	mov    %r11d,%r8d
    1393:	45 31 db             	xor    %r11d,%r11d
    1396:	e9 f5 fe ff ff       	jmp    1290 <main+0x230>
    139b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    13a0:	45 85 ed             	test   %r13d,%r13d
    13a3:	74 3b                	je     13e0 <main+0x380>
    13a5:	41 83 ed 01          	sub    $0x1,%r13d
    13a9:	45 31 d2             	xor    %r10d,%r10d
    13ac:	e9 df fe ff ff       	jmp    1290 <main+0x230>
    13b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    13b8:	41 83 c5 01          	add    $0x1,%r13d
    13bc:	41 83 c1 01          	add    $0x1,%r9d
    13c0:	45 31 d2             	xor    %r10d,%r10d
    13c3:	e9 c8 fe ff ff       	jmp    1290 <main+0x230>
    13c8:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    13d0:	45 31 d2             	xor    %r10d,%r10d
    13d3:	e9 b8 fe ff ff       	jmp    1290 <main+0x230>
    13d8:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    13e0:	45 31 d2             	xor    %r10d,%r10d
    13e3:	45 31 f6             	xor    %r14d,%r14d
    13e6:	e9 a5 fe ff ff       	jmp    1290 <main+0x230>
    13eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    13f0:	45 89 c3             	mov    %r8d,%r11d
    13f3:	e9 98 fe ff ff       	jmp    1290 <main+0x230>
    13f8:	48 8b 3d 21 2c 00 00 	mov    0x2c21(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    13ff:	e8 2c fc ff ff       	call   1030 <ferror@plt>
    1404:	85 c0                	test   %eax,%eax
    1406:	0f 95 c0             	setne  %al
    1409:	0f b6 c0             	movzbl %al,%eax
    140c:	01 c0                	add    %eax,%eax
    140e:	48 83 c4 28          	add    $0x28,%rsp
    1412:	5b                   	pop    %rbx
    1413:	5d                   	pop    %rbp
    1414:	41 5c                	pop    %r12
    1416:	41 5d                	pop    %r13
    1418:	41 5e                	pop    %r14
    141a:	41 5f                	pop    %r15
    141c:	c3                   	ret
    141d:	0f 1f 00             	nopl   (%rax)

0000000000001420 <_start>:
    1420:	31 ed                	xor    %ebp,%ebp
    1422:	49 89 d1             	mov    %rdx,%r9
    1425:	5e                   	pop    %rsi
    1426:	48 89 e2             	mov    %rsp,%rdx
    1429:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    142d:	50                   	push   %rax
    142e:	54                   	push   %rsp
    142f:	45 31 c0             	xor    %r8d,%r8d
    1432:	31 c9                	xor    %ecx,%ecx
    1434:	48 8d 3d 25 fc ff ff 	lea    -0x3db(%rip),%rdi        # 1060 <main>
    143b:	ff 15 7f 2b 00 00    	call   *0x2b7f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1441:	f4                   	hlt
    1442:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    144c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001450 <deregister_tm_clones>:
    1450:	48 8d 3d c9 2b 00 00 	lea    0x2bc9(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1457:	48 8d 05 c2 2b 00 00 	lea    0x2bc2(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    145e:	48 39 f8             	cmp    %rdi,%rax
    1461:	74 15                	je     1478 <deregister_tm_clones+0x28>
    1463:	48 8b 05 5e 2b 00 00 	mov    0x2b5e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    146a:	48 85 c0             	test   %rax,%rax
    146d:	74 09                	je     1478 <deregister_tm_clones+0x28>
    146f:	ff e0                	jmp    *%rax
    1471:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1478:	c3                   	ret
    1479:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001480 <register_tm_clones>:
    1480:	48 8d 3d 99 2b 00 00 	lea    0x2b99(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1487:	48 8d 35 92 2b 00 00 	lea    0x2b92(%rip),%rsi        # 4020 <stdout@GLIBC_2.2.5>
    148e:	48 29 fe             	sub    %rdi,%rsi
    1491:	48 89 f0             	mov    %rsi,%rax
    1494:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1498:	48 c1 f8 03          	sar    $0x3,%rax
    149c:	48 01 c6             	add    %rax,%rsi
    149f:	48 d1 fe             	sar    $1,%rsi
    14a2:	74 14                	je     14b8 <register_tm_clones+0x38>
    14a4:	48 8b 05 2d 2b 00 00 	mov    0x2b2d(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    14ab:	48 85 c0             	test   %rax,%rax
    14ae:	74 08                	je     14b8 <register_tm_clones+0x38>
    14b0:	ff e0                	jmp    *%rax
    14b2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    14b8:	c3                   	ret
    14b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000014c0 <__do_global_dtors_aux>:
    14c0:	f3 0f 1e fa          	endbr64
    14c4:	80 3d 5d 2b 00 00 00 	cmpb   $0x0,0x2b5d(%rip)        # 4028 <completed.0>
    14cb:	75 2b                	jne    14f8 <__do_global_dtors_aux+0x38>
    14cd:	55                   	push   %rbp
    14ce:	48 83 3d 0a 2b 00 00 00 	cmpq   $0x0,0x2b0a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    14d6:	48 89 e5             	mov    %rsp,%rbp
    14d9:	74 0c                	je     14e7 <__do_global_dtors_aux+0x27>
    14db:	48 8b 3d 36 2b 00 00 	mov    0x2b36(%rip),%rdi        # 4018 <__dso_handle>
    14e2:	e8 69 fb ff ff       	call   1050 <__cxa_finalize@plt>
    14e7:	e8 64 ff ff ff       	call   1450 <deregister_tm_clones>
    14ec:	c6 05 35 2b 00 00 01 	movb   $0x1,0x2b35(%rip)        # 4028 <completed.0>
    14f3:	5d                   	pop    %rbp
    14f4:	c3                   	ret
    14f5:	0f 1f 00             	nopl   (%rax)
    14f8:	c3                   	ret
    14f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001500 <frame_dummy>:
    1500:	f3 0f 1e fa          	endbr64
    1504:	e9 77 ff ff ff       	jmp    1480 <register_tm_clones>
    1509:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001510 <wm_add_v2.isra.0>:
    1510:	89 f8                	mov    %edi,%eax
    1512:	c3                   	ret

Disassembly of section .fini:

0000000000001514 <_fini>:
    1514:	48 83 ec 08          	sub    $0x8,%rsp
    1518:	48 83 c4 08          	add    $0x8,%rsp
    151c:	c3                   	ret
