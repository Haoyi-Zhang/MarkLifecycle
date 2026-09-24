
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
    107a:	e8 71 04 00 00       	call   14f0 <wm_add_v2.isra.0>
    107f:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1083:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1087:	e8 64 04 00 00       	call   14f0 <wm_add_v2.isra.0>
    108c:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1090:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1094:	e8 57 04 00 00       	call   14f0 <wm_add_v2.isra.0>
    1099:	89 44 24 18          	mov    %eax,0x18(%rsp)
    109d:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10a1:	e8 4a 04 00 00       	call   14f0 <wm_add_v2.isra.0>
    10a6:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10aa:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10ae:	e8 3d 04 00 00       	call   14f0 <wm_add_v2.isra.0>
    10b3:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10b7:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10bb:	e8 30 04 00 00       	call   14f0 <wm_add_v2.isra.0>
    10c0:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10c4:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10c8:	e8 23 04 00 00       	call   14f0 <wm_add_v2.isra.0>
    10cd:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10d1:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10d5:	e8 16 04 00 00       	call   14f0 <wm_add_v2.isra.0>
    10da:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10de:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10e2:	e8 09 04 00 00       	call   14f0 <wm_add_v2.isra.0>
    10e7:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10eb:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10ef:	e8 fc 03 00 00       	call   14f0 <wm_add_v2.isra.0>
    10f4:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10f8:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10fc:	e8 ef 03 00 00       	call   14f0 <wm_add_v2.isra.0>
    1101:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1105:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1109:	e8 e2 03 00 00       	call   14f0 <wm_add_v2.isra.0>
    110e:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1112:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1116:	e8 d5 03 00 00       	call   14f0 <wm_add_v2.isra.0>
    111b:	89 44 24 18          	mov    %eax,0x18(%rsp)
    111f:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1123:	e8 c8 03 00 00       	call   14f0 <wm_add_v2.isra.0>
    1128:	89 44 24 18          	mov    %eax,0x18(%rsp)
    112c:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1130:	e8 bb 03 00 00       	call   14f0 <wm_add_v2.isra.0>
    1135:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1139:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    113d:	e8 ae 03 00 00       	call   14f0 <wm_add_v2.isra.0>
    1142:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1146:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    114a:	e8 a1 03 00 00       	call   14f0 <wm_add_v2.isra.0>
    114f:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1153:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1157:	e8 94 03 00 00       	call   14f0 <wm_add_v2.isra.0>
    115c:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1160:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1164:	e8 87 03 00 00       	call   14f0 <wm_add_v2.isra.0>
    1169:	89 44 24 18          	mov    %eax,0x18(%rsp)
    116d:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1171:	e8 7a 03 00 00       	call   14f0 <wm_add_v2.isra.0>
    1176:	89 44 24 18          	mov    %eax,0x18(%rsp)
    117a:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    117e:	e8 6d 03 00 00       	call   14f0 <wm_add_v2.isra.0>
    1183:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1187:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    118b:	e8 60 03 00 00       	call   14f0 <wm_add_v2.isra.0>
    1190:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1194:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1198:	e8 53 03 00 00       	call   14f0 <wm_add_v2.isra.0>
    119d:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11a1:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11a5:	e8 46 03 00 00       	call   14f0 <wm_add_v2.isra.0>
    11aa:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11ae:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11b2:	e8 39 03 00 00       	call   14f0 <wm_add_v2.isra.0>
    11b7:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11bb:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11bf:	e8 2c 03 00 00       	call   14f0 <wm_add_v2.isra.0>
    11c4:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11c8:	8b 54 24 18          	mov    0x18(%rsp),%edx
    11cc:	b8 61 00 00 00       	mov    $0x61,%eax
    11d1:	83 fa ff             	cmp    $0xffffffff,%edx
    11d4:	0f 84 14 02 00 00    	je     13ee <main+0x38e>
    11da:	48 8d 44 24 1c       	lea    0x1c(%rsp),%rax
    11df:	b9 7b 00 00 00       	mov    $0x7b,%ecx
    11e4:	bd 01 00 00 00       	mov    $0x1,%ebp
    11e9:	48 bb 00 26 00 00 01 10 00 04 	movabs $0x400100100002600,%rbx
    11f3:	4c 8d 25 66 2b 00 00 	lea    0x2b66(%rip),%r12        # 3d60 <cases>
    11fa:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    11ff:	4d 8b 3c 24          	mov    (%r12),%r15
    1203:	84 c9                	test   %cl,%cl
    1205:	0f 84 2e 01 00 00    	je     1339 <main+0x2d9>
    120b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1210:	4c 89 fe             	mov    %r15,%rsi
    1213:	41 be 01 00 00 00    	mov    $0x1,%r14d
    1219:	45 31 d2             	xor    %r10d,%r10d
    121c:	45 31 ed             	xor    %r13d,%r13d
    121f:	45 31 c9             	xor    %r9d,%r9d
    1222:	45 31 db             	xor    %r11d,%r11d
    1225:	45 31 c0             	xor    %r8d,%r8d
    1228:	31 ff                	xor    %edi,%edi
    122a:	eb 53                	jmp    127f <main+0x21f>
    122c:	0f 1f 40 00          	nopl   0x0(%rax)
    1230:	80 f9 5b             	cmp    $0x5b,%cl
    1233:	0f 84 5f 01 00 00    	je     1398 <main+0x338>
    1239:	0f 87 09 01 00 00    	ja     1348 <main+0x2e8>
    123f:	8d 41 f7             	lea    -0x9(%rcx),%eax
    1242:	3c 31                	cmp    $0x31,%al
    1244:	0f 87 0b 01 00 00    	ja     1355 <main+0x2f5>
    124a:	48 89 e8             	mov    %rbp,%rax
    124d:	48 d3 e0             	shl    %cl,%rax
    1250:	48 85 d8             	test   %rbx,%rax
    1253:	0f 85 57 01 00 00    	jne    13b0 <main+0x350>
    1259:	83 fa 22             	cmp    $0x22,%edx
    125c:	0f 85 f3 00 00 00    	jne    1355 <main+0x2f5>
    1262:	41 83 c1 01          	add    $0x1,%r9d
    1266:	45 31 d2             	xor    %r10d,%r10d
    1269:	41 b8 01 00 00 00    	mov    $0x1,%r8d
    126f:	90                   	nop
    1270:	0f b6 4e 01          	movzbl 0x1(%rsi),%ecx
    1274:	48 8d 46 01          	lea    0x1(%rsi),%rax
    1278:	84 c9                	test   %cl,%cl
    127a:	74 44                	je     12c0 <main+0x260>
    127c:	48 89 c6             	mov    %rax,%rsi
    127f:	89 f8                	mov    %edi,%eax
    1281:	0f b6 d1             	movzbl %cl,%edx
    1284:	c1 e0 05             	shl    $0x5,%eax
    1287:	01 f8                	add    %edi,%eax
    1289:	01 d0                	add    %edx,%eax
    128b:	0f b7 f8             	movzwl %ax,%edi
    128e:	45 85 c0             	test   %r8d,%r8d
    1291:	74 9d                	je     1230 <main+0x1d0>
    1293:	45 85 db             	test   %r11d,%r11d
    1296:	0f 85 d4 00 00 00    	jne    1370 <main+0x310>
    129c:	80 f9 5c             	cmp    $0x5c,%cl
    129f:	0f 84 2b 01 00 00    	je     13d0 <main+0x370>
    12a5:	45 31 c0             	xor    %r8d,%r8d
    12a8:	80 f9 22             	cmp    $0x22,%cl
    12ab:	0f b6 4e 01          	movzbl 0x1(%rsi),%ecx
    12af:	48 8d 46 01          	lea    0x1(%rsi),%rax
    12b3:	41 0f 95 c0          	setne  %r8b
    12b7:	84 c9                	test   %cl,%cl
    12b9:	75 c1                	jne    127c <main+0x21c>
    12bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    12c0:	44 29 fe             	sub    %r15d,%esi
    12c3:	41 c1 e1 18          	shl    $0x18,%r9d
    12c7:	89 f8                	mov    %edi,%eax
    12c9:	8d 56 01             	lea    0x1(%rsi),%edx
    12cc:	41 81 e1 00 00 00 7f 	and    $0x7f000000,%r9d
    12d3:	c1 e2 10             	shl    $0x10,%edx
    12d6:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
    12dc:	09 d0                	or     %edx,%eax
    12de:	41 09 c1             	or     %eax,%r9d
    12e1:	31 c0                	xor    %eax,%eax
    12e3:	45 09 e8             	or     %r13d,%r8d
    12e6:	0f 94 c0             	sete   %al
    12e9:	44 21 f0             	and    %r14d,%eax
    12ec:	c1 e0 1f             	shl    $0x1f,%eax
    12ef:	41 09 c1             	or     %eax,%r9d
    12f2:	48 8b 0d 27 2d 00 00 	mov    0x2d27(%rip),%rcx        # 4020 <stdout@GLIBC_2.2.5>
    12f9:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    12fe:	ba 04 00 00 00       	mov    $0x4,%edx
    1303:	be 01 00 00 00       	mov    $0x1,%esi
    1308:	44 89 4c 24 1c       	mov    %r9d,0x1c(%rsp)
    130d:	49 83 c4 08          	add    $0x8,%r12
    1311:	e8 2a fd ff ff       	call   1040 <fwrite@plt>
    1316:	48 8d 05 c3 2a 00 00 	lea    0x2ac3(%rip),%rax        # 3de0 <_DYNAMIC>
    131d:	4c 39 e0             	cmp    %r12,%rax
    1320:	0f 84 b2 00 00 00    	je     13d8 <main+0x378>
    1326:	49 8b 04 24          	mov    (%r12),%rax
    132a:	4d 8b 3c 24          	mov    (%r12),%r15
    132e:	0f b6 08             	movzbl (%rax),%ecx
    1331:	84 c9                	test   %cl,%cl
    1333:	0f 85 d7 fe ff ff    	jne    1210 <main+0x1b0>
    1339:	44 8b 0d c4 0c 00 00 	mov    0xcc4(%rip),%r9d        # 2004 <_IO_stdin_used+0x4>
    1340:	eb b0                	jmp    12f2 <main+0x292>
    1342:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1348:	80 f9 7b             	cmp    $0x7b,%cl
    134b:	74 4b                	je     1398 <main+0x338>
    134d:	83 e1 df             	and    $0xffffffdf,%ecx
    1350:	80 f9 5d             	cmp    $0x5d,%cl
    1353:	74 2b                	je     1380 <main+0x320>
    1355:	45 85 d2             	test   %r10d,%r10d
    1358:	0f 85 12 ff ff ff    	jne    1270 <main+0x210>
    135e:	41 83 c1 01          	add    $0x1,%r9d
    1362:	45 31 c0             	xor    %r8d,%r8d
    1365:	41 ba 01 00 00 00    	mov    $0x1,%r10d
    136b:	e9 00 ff ff ff       	jmp    1270 <main+0x210>
    1370:	45 89 d8             	mov    %r11d,%r8d
    1373:	45 31 db             	xor    %r11d,%r11d
    1376:	e9 f5 fe ff ff       	jmp    1270 <main+0x210>
    137b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1380:	45 85 ed             	test   %r13d,%r13d
    1383:	74 3b                	je     13c0 <main+0x360>
    1385:	41 83 ed 01          	sub    $0x1,%r13d
    1389:	45 31 d2             	xor    %r10d,%r10d
    138c:	e9 df fe ff ff       	jmp    1270 <main+0x210>
    1391:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1398:	41 83 c5 01          	add    $0x1,%r13d
    139c:	41 83 c1 01          	add    $0x1,%r9d
    13a0:	45 31 d2             	xor    %r10d,%r10d
    13a3:	e9 c8 fe ff ff       	jmp    1270 <main+0x210>
    13a8:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    13b0:	45 31 d2             	xor    %r10d,%r10d
    13b3:	e9 b8 fe ff ff       	jmp    1270 <main+0x210>
    13b8:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    13c0:	45 31 d2             	xor    %r10d,%r10d
    13c3:	45 31 f6             	xor    %r14d,%r14d
    13c6:	e9 a5 fe ff ff       	jmp    1270 <main+0x210>
    13cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    13d0:	45 89 c3             	mov    %r8d,%r11d
    13d3:	e9 98 fe ff ff       	jmp    1270 <main+0x210>
    13d8:	48 8b 3d 41 2c 00 00 	mov    0x2c41(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    13df:	e8 4c fc ff ff       	call   1030 <ferror@plt>
    13e4:	85 c0                	test   %eax,%eax
    13e6:	0f 95 c0             	setne  %al
    13e9:	0f b6 c0             	movzbl %al,%eax
    13ec:	01 c0                	add    %eax,%eax
    13ee:	48 83 c4 28          	add    $0x28,%rsp
    13f2:	5b                   	pop    %rbx
    13f3:	5d                   	pop    %rbp
    13f4:	41 5c                	pop    %r12
    13f6:	41 5d                	pop    %r13
    13f8:	41 5e                	pop    %r14
    13fa:	41 5f                	pop    %r15
    13fc:	c3                   	ret
    13fd:	0f 1f 00             	nopl   (%rax)

0000000000001400 <_start>:
    1400:	31 ed                	xor    %ebp,%ebp
    1402:	49 89 d1             	mov    %rdx,%r9
    1405:	5e                   	pop    %rsi
    1406:	48 89 e2             	mov    %rsp,%rdx
    1409:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    140d:	50                   	push   %rax
    140e:	54                   	push   %rsp
    140f:	45 31 c0             	xor    %r8d,%r8d
    1412:	31 c9                	xor    %ecx,%ecx
    1414:	48 8d 3d 45 fc ff ff 	lea    -0x3bb(%rip),%rdi        # 1060 <main>
    141b:	ff 15 9f 2b 00 00    	call   *0x2b9f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1421:	f4                   	hlt
    1422:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    142c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001430 <deregister_tm_clones>:
    1430:	48 8d 3d e9 2b 00 00 	lea    0x2be9(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1437:	48 8d 05 e2 2b 00 00 	lea    0x2be2(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    143e:	48 39 f8             	cmp    %rdi,%rax
    1441:	74 15                	je     1458 <deregister_tm_clones+0x28>
    1443:	48 8b 05 7e 2b 00 00 	mov    0x2b7e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    144a:	48 85 c0             	test   %rax,%rax
    144d:	74 09                	je     1458 <deregister_tm_clones+0x28>
    144f:	ff e0                	jmp    *%rax
    1451:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1458:	c3                   	ret
    1459:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001460 <register_tm_clones>:
    1460:	48 8d 3d b9 2b 00 00 	lea    0x2bb9(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1467:	48 8d 35 b2 2b 00 00 	lea    0x2bb2(%rip),%rsi        # 4020 <stdout@GLIBC_2.2.5>
    146e:	48 29 fe             	sub    %rdi,%rsi
    1471:	48 89 f0             	mov    %rsi,%rax
    1474:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1478:	48 c1 f8 03          	sar    $0x3,%rax
    147c:	48 01 c6             	add    %rax,%rsi
    147f:	48 d1 fe             	sar    $1,%rsi
    1482:	74 14                	je     1498 <register_tm_clones+0x38>
    1484:	48 8b 05 4d 2b 00 00 	mov    0x2b4d(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    148b:	48 85 c0             	test   %rax,%rax
    148e:	74 08                	je     1498 <register_tm_clones+0x38>
    1490:	ff e0                	jmp    *%rax
    1492:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1498:	c3                   	ret
    1499:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000014a0 <__do_global_dtors_aux>:
    14a0:	f3 0f 1e fa          	endbr64
    14a4:	80 3d 7d 2b 00 00 00 	cmpb   $0x0,0x2b7d(%rip)        # 4028 <completed.0>
    14ab:	75 2b                	jne    14d8 <__do_global_dtors_aux+0x38>
    14ad:	55                   	push   %rbp
    14ae:	48 83 3d 2a 2b 00 00 00 	cmpq   $0x0,0x2b2a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    14b6:	48 89 e5             	mov    %rsp,%rbp
    14b9:	74 0c                	je     14c7 <__do_global_dtors_aux+0x27>
    14bb:	48 8b 3d 56 2b 00 00 	mov    0x2b56(%rip),%rdi        # 4018 <__dso_handle>
    14c2:	e8 89 fb ff ff       	call   1050 <__cxa_finalize@plt>
    14c7:	e8 64 ff ff ff       	call   1430 <deregister_tm_clones>
    14cc:	c6 05 55 2b 00 00 01 	movb   $0x1,0x2b55(%rip)        # 4028 <completed.0>
    14d3:	5d                   	pop    %rbp
    14d4:	c3                   	ret
    14d5:	0f 1f 00             	nopl   (%rax)
    14d8:	c3                   	ret
    14d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000014e0 <frame_dummy>:
    14e0:	f3 0f 1e fa          	endbr64
    14e4:	e9 77 ff ff ff       	jmp    1460 <register_tm_clones>
    14e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000014f0 <wm_add_v2.isra.0>:
    14f0:	89 f8                	mov    %edi,%eax
    14f2:	c3                   	ret

Disassembly of section .fini:

00000000000014f4 <_fini>:
    14f4:	48 83 ec 08          	sub    $0x8,%rsp
    14f8:	48 83 c4 08          	add    $0x8,%rsp
    14fc:	c3                   	ret
