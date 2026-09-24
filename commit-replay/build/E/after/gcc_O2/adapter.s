
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

0000000000001080 <main>:
    1080:	48 83 ec 18          	sub    $0x18,%rsp
    1084:	c7 44 24 0c f5 79 2b 6d 	movl   $0x6d2b79f5,0xc(%rsp)
    108c:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1090:	e8 fb 05 00 00       	call   1690 <wm_add_v2.isra.0>
    1095:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1099:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    109d:	e8 ee 05 00 00       	call   1690 <wm_add_v2.isra.0>
    10a2:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10a6:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10aa:	e8 e1 05 00 00       	call   1690 <wm_add_v2.isra.0>
    10af:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10b3:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10b7:	e8 d4 05 00 00       	call   1690 <wm_add_v2.isra.0>
    10bc:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10c0:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10c4:	e8 c7 05 00 00       	call   1690 <wm_add_v2.isra.0>
    10c9:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10cd:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10d1:	e8 ba 05 00 00       	call   1690 <wm_add_v2.isra.0>
    10d6:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10da:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10de:	e8 ad 05 00 00       	call   1690 <wm_add_v2.isra.0>
    10e3:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10e7:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10eb:	e8 a0 05 00 00       	call   1690 <wm_add_v2.isra.0>
    10f0:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10f4:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10f8:	e8 93 05 00 00       	call   1690 <wm_add_v2.isra.0>
    10fd:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1101:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1105:	e8 86 05 00 00       	call   1690 <wm_add_v2.isra.0>
    110a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    110e:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1112:	e8 79 05 00 00       	call   1690 <wm_add_v2.isra.0>
    1117:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    111b:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    111f:	e8 6c 05 00 00       	call   1690 <wm_add_v2.isra.0>
    1124:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1128:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    112c:	e8 5f 05 00 00       	call   1690 <wm_add_v2.isra.0>
    1131:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1135:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1139:	e8 52 05 00 00       	call   1690 <wm_add_v2.isra.0>
    113e:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1142:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1146:	e8 45 05 00 00       	call   1690 <wm_add_v2.isra.0>
    114b:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    114f:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1153:	e8 38 05 00 00       	call   1690 <wm_add_v2.isra.0>
    1158:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    115c:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1160:	e8 2b 05 00 00       	call   1690 <wm_add_v2.isra.0>
    1165:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1169:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    116d:	e8 1e 05 00 00       	call   1690 <wm_add_v2.isra.0>
    1172:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1176:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    117a:	e8 11 05 00 00       	call   1690 <wm_add_v2.isra.0>
    117f:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1183:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1187:	e8 04 05 00 00       	call   1690 <wm_add_v2.isra.0>
    118c:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1190:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1194:	e8 f7 04 00 00       	call   1690 <wm_add_v2.isra.0>
    1199:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    119d:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11a1:	e8 ea 04 00 00       	call   1690 <wm_add_v2.isra.0>
    11a6:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11aa:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11ae:	e8 dd 04 00 00       	call   1690 <wm_add_v2.isra.0>
    11b3:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11b7:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11bb:	e8 d0 04 00 00       	call   1690 <wm_add_v2.isra.0>
    11c0:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11c4:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11c8:	e8 c3 04 00 00       	call   1690 <wm_add_v2.isra.0>
    11cd:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11d1:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11d5:	e8 b6 04 00 00       	call   1690 <wm_add_v2.isra.0>
    11da:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11de:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11e2:	e8 a9 04 00 00       	call   1690 <wm_add_v2.isra.0>
    11e7:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11eb:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11ef:	e8 9c 04 00 00       	call   1690 <wm_add_v2.isra.0>
    11f4:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11f8:	8b 54 24 0c          	mov    0xc(%rsp),%edx
    11fc:	b8 61 00 00 00       	mov    $0x61,%eax
    1201:	83 fa ff             	cmp    $0xffffffff,%edx
    1204:	74 1b                	je     1221 <main+0x1a1>
    1206:	e8 35 01 00 00       	call   1340 <run_contract>
    120b:	48 8b 3d 0e 2e 00 00 	mov    0x2e0e(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1212:	e8 19 fe ff ff       	call   1030 <ferror@plt>
    1217:	85 c0                	test   %eax,%eax
    1219:	0f 95 c0             	setne  %al
    121c:	0f b6 c0             	movzbl %al,%eax
    121f:	01 c0                	add    %eax,%eax
    1221:	48 83 c4 18          	add    $0x18,%rsp
    1225:	c3                   	ret
    1226:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

0000000000001230 <_start>:
    1230:	31 ed                	xor    %ebp,%ebp
    1232:	49 89 d1             	mov    %rdx,%r9
    1235:	5e                   	pop    %rsi
    1236:	48 89 e2             	mov    %rsp,%rdx
    1239:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    123d:	50                   	push   %rax
    123e:	54                   	push   %rsp
    123f:	45 31 c0             	xor    %r8d,%r8d
    1242:	31 c9                	xor    %ecx,%ecx
    1244:	48 8d 3d 35 fe ff ff 	lea    -0x1cb(%rip),%rdi        # 1080 <main>
    124b:	ff 15 6f 2d 00 00    	call   *0x2d6f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1251:	f4                   	hlt
    1252:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    125c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001260 <deregister_tm_clones>:
    1260:	48 8d 3d b9 2d 00 00 	lea    0x2db9(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1267:	48 8d 05 b2 2d 00 00 	lea    0x2db2(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    126e:	48 39 f8             	cmp    %rdi,%rax
    1271:	74 15                	je     1288 <deregister_tm_clones+0x28>
    1273:	48 8b 05 4e 2d 00 00 	mov    0x2d4e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    127a:	48 85 c0             	test   %rax,%rax
    127d:	74 09                	je     1288 <deregister_tm_clones+0x28>
    127f:	ff e0                	jmp    *%rax
    1281:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1288:	c3                   	ret
    1289:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001290 <register_tm_clones>:
    1290:	48 8d 3d 89 2d 00 00 	lea    0x2d89(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1297:	48 8d 35 82 2d 00 00 	lea    0x2d82(%rip),%rsi        # 4020 <stdout@GLIBC_2.2.5>
    129e:	48 29 fe             	sub    %rdi,%rsi
    12a1:	48 89 f0             	mov    %rsi,%rax
    12a4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    12a8:	48 c1 f8 03          	sar    $0x3,%rax
    12ac:	48 01 c6             	add    %rax,%rsi
    12af:	48 d1 fe             	sar    $1,%rsi
    12b2:	74 14                	je     12c8 <register_tm_clones+0x38>
    12b4:	48 8b 05 1d 2d 00 00 	mov    0x2d1d(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    12bb:	48 85 c0             	test   %rax,%rax
    12be:	74 08                	je     12c8 <register_tm_clones+0x38>
    12c0:	ff e0                	jmp    *%rax
    12c2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    12c8:	c3                   	ret
    12c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000012d0 <__do_global_dtors_aux>:
    12d0:	f3 0f 1e fa          	endbr64
    12d4:	80 3d 4d 2d 00 00 00 	cmpb   $0x0,0x2d4d(%rip)        # 4028 <completed.0>
    12db:	75 2b                	jne    1308 <__do_global_dtors_aux+0x38>
    12dd:	55                   	push   %rbp
    12de:	48 83 3d fa 2c 00 00 00 	cmpq   $0x0,0x2cfa(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    12e6:	48 89 e5             	mov    %rsp,%rbp
    12e9:	74 0c                	je     12f7 <__do_global_dtors_aux+0x27>
    12eb:	48 8b 3d 26 2d 00 00 	mov    0x2d26(%rip),%rdi        # 4018 <__dso_handle>
    12f2:	e8 59 fd ff ff       	call   1050 <__cxa_finalize@plt>
    12f7:	e8 64 ff ff ff       	call   1260 <deregister_tm_clones>
    12fc:	c6 05 25 2d 00 00 01 	movb   $0x1,0x2d25(%rip)        # 4028 <completed.0>
    1303:	5d                   	pop    %rbp
    1304:	c3                   	ret
    1305:	0f 1f 00             	nopl   (%rax)
    1308:	c3                   	ret
    1309:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001310 <frame_dummy>:
    1310:	f3 0f 1e fa          	endbr64
    1314:	e9 77 ff ff ff       	jmp    1290 <register_tm_clones>
    1319:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    1323:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    132d:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    1337:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

0000000000001340 <run_contract>:
    1340:	48 b8 78 56 34 12 ff ff ff ff 	movabs $0xffffffff12345678,%rax
    134a:	41 57                	push   %r15
    134c:	41 56                	push   %r14
    134e:	41 55                	push   %r13
    1350:	45 31 ed             	xor    %r13d,%r13d
    1353:	41 54                	push   %r12
    1355:	55                   	push   %rbp
    1356:	53                   	push   %rbx
    1357:	48 81 ec 88 01 00 00 	sub    $0x188,%rsp
    135e:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
    1363:	b8 04 00 00 00       	mov    $0x4,%eax
    1368:	48 8d 5c 24 70       	lea    0x70(%rsp),%rbx
    136d:	4c 8d b4 24 80 00 00 00 	lea    0x80(%rsp),%r14
    1375:	66 0f 6e f8          	movd   %eax,%xmm7
    1379:	b8 08 00 00 00       	mov    $0x8,%eax
    137e:	48 8d 6c 24 6c       	lea    0x6c(%rsp),%rbp
    1383:	c7 44 24 74 01 00 01 00 	movl   $0x10001,0x74(%rsp)
    138b:	66 0f 6e e0          	movd   %eax,%xmm4
    138f:	b8 0c 00 00 00       	mov    $0xc,%eax
    1394:	66 0f 70 ff 00       	pshufd $0x0,%xmm7,%xmm7
    1399:	0f 29 3c 24          	movaps %xmm7,(%rsp)
    139d:	66 0f 6e f0          	movd   %eax,%xmm6
    13a1:	b8 10 00 00 00       	mov    $0x10,%eax
    13a6:	66 0f 70 dc 00       	pshufd $0x0,%xmm4,%xmm3
    13ab:	0f 29 5c 24 10       	movaps %xmm3,0x10(%rsp)
    13b0:	66 0f 6e d8          	movd   %eax,%xmm3
    13b4:	66 0f 70 ee 00       	pshufd $0x0,%xmm6,%xmm5
    13b9:	0f 29 6c 24 20       	movaps %xmm5,0x20(%rsp)
    13be:	66 0f 70 fb 00       	pshufd $0x0,%xmm3,%xmm7
    13c3:	0f 29 7c 24 30       	movaps %xmm7,0x30(%rsp)
    13c8:	41 83 fd 01          	cmp    $0x1,%r13d
    13cc:	bf ff 00 ff 00       	mov    $0xff00ff,%edi
    13d1:	66 0f 6f 15 37 0c 00 00 	movdqa 0xc37(%rip),%xmm2        # 2010 <_IO_stdin_used+0x10>
    13d9:	48 8d 94 24 80 01 00 00 	lea    0x180(%rsp),%rdx
    13e1:	0f 94 c0             	sete   %al
    13e4:	66 0f 6e f7          	movd   %edi,%xmm6
    13e8:	bf 01 01 01 01       	mov    $0x1010101,%edi
    13ed:	f7 d8                	neg    %eax
    13ef:	41 83 fd 02          	cmp    $0x2,%r13d
    13f3:	66 44 0f 6e d7       	movd   %edi,%xmm10
    13f8:	bf 55 55 55 55       	mov    $0x55555555,%edi
    13fd:	66 0f 6e c0          	movd   %eax,%xmm0
    1401:	0f 94 c0             	sete   %al
    1404:	66 44 0f 6e cf       	movd   %edi,%xmm9
    1409:	bf f0 f0 f0 f0       	mov    $0xf0f0f0f0,%edi
    140e:	66 0f 60 c0          	punpcklbw %xmm0,%xmm0
    1412:	f7 d8                	neg    %eax
    1414:	41 83 fd 01          	cmp    $0x1,%r13d
    1418:	66 0f 70 f6 00       	pshufd $0x0,%xmm6,%xmm6
    141d:	66 0f 61 c0          	punpcklwd %xmm0,%xmm0
    1421:	66 44 0f 6e c7       	movd   %edi,%xmm8
    1426:	bf 1f 1f 1f 1f       	mov    $0x1f1f1f1f,%edi
    142b:	66 45 0f 70 d2 00    	pshufd $0x0,%xmm10,%xmm10
    1431:	66 0f 70 e8 00       	pshufd $0x0,%xmm0,%xmm5
    1436:	66 0f 6e c0          	movd   %eax,%xmm0
    143a:	18 c0                	sbb    %al,%al
    143c:	66 45 0f 70 c9 00    	pshufd $0x0,%xmm9,%xmm9
    1442:	66 0f 60 c0          	punpcklbw %xmm0,%xmm0
    1446:	66 0f 6e ff          	movd   %edi,%xmm7
    144a:	66 45 0f 70 c0 00    	pshufd $0x0,%xmm8,%xmm8
    1450:	66 0f 61 c0          	punpcklwd %xmm0,%xmm0
    1454:	66 0f 70 ff 00       	pshufd $0x0,%xmm7,%xmm7
    1459:	66 0f 70 e0 00       	pshufd $0x0,%xmm0,%xmm4
    145e:	66 0f 6e c0          	movd   %eax,%xmm0
    1462:	4c 89 f0             	mov    %r14,%rax
    1465:	66 0f 60 c0          	punpcklbw %xmm0,%xmm0
    1469:	66 0f 61 c0          	punpcklwd %xmm0,%xmm0
    146d:	66 0f 70 d8 00       	pshufd $0x0,%xmm0,%xmm3
    1472:	66 44 0f 6f 2c 24    	movdqa (%rsp),%xmm13
    1478:	66 0f 6f c2          	movdqa %xmm2,%xmm0
    147c:	48 83 c0 10          	add    $0x10,%rax
    1480:	66 0f 6f 4c 24 10    	movdqa 0x10(%rsp),%xmm1
    1486:	66 44 0f 6f 64 24 20 	movdqa 0x20(%rsp),%xmm12
    148d:	66 44 0f 6f d8       	movdqa %xmm0,%xmm11
    1492:	66 44 0f fe ea       	paddd  %xmm2,%xmm13
    1497:	66 0f fe ca          	paddd  %xmm2,%xmm1
    149b:	66 41 0f 61 c5       	punpcklwd %xmm13,%xmm0
    14a0:	66 44 0f fe e2       	paddd  %xmm2,%xmm12
    14a5:	66 45 0f 69 dd       	punpckhwd %xmm13,%xmm11
    14aa:	66 44 0f 6f e8       	movdqa %xmm0,%xmm13
    14af:	66 41 0f 61 c3       	punpcklwd %xmm11,%xmm0
    14b4:	66 0f fe 54 24 30    	paddd  0x30(%rsp),%xmm2
    14ba:	66 45 0f 69 eb       	punpckhwd %xmm11,%xmm13
    14bf:	66 44 0f 6f d9       	movdqa %xmm1,%xmm11
    14c4:	66 41 0f 61 cc       	punpcklwd %xmm12,%xmm1
    14c9:	66 45 0f 69 dc       	punpckhwd %xmm12,%xmm11
    14ce:	66 44 0f 6f e1       	movdqa %xmm1,%xmm12
    14d3:	66 41 0f 61 c5       	punpcklwd %xmm13,%xmm0
    14d8:	66 45 0f 69 e3       	punpckhwd %xmm11,%xmm12
    14dd:	66 41 0f 61 cb       	punpcklwd %xmm11,%xmm1
    14e2:	66 0f db c6          	pand   %xmm6,%xmm0
    14e6:	66 41 0f 61 cc       	punpcklwd %xmm12,%xmm1
    14eb:	66 44 0f 6f e5       	movdqa %xmm5,%xmm12
    14f0:	66 0f db ce          	pand   %xmm6,%xmm1
    14f4:	66 0f 67 c1          	packuswb %xmm1,%xmm0
    14f8:	66 0f ef c9          	pxor   %xmm1,%xmm1
    14fc:	66 44 0f 6f d8       	movdqa %xmm0,%xmm11
    1501:	66 45 0f db da       	pand   %xmm10,%xmm11
    1506:	66 41 0f f8 cb       	psubb  %xmm11,%xmm1
    150b:	66 44 0f 6f d8       	movdqa %xmm0,%xmm11
    1510:	66 41 0f ef c9       	pxor   %xmm9,%xmm1
    1515:	66 44 0f df dd       	pandn  %xmm5,%xmm11
    151a:	66 44 0f df e1       	pandn  %xmm1,%xmm12
    151f:	66 0f 6f c8          	movdqa %xmm0,%xmm1
    1523:	66 0f 71 f1 04       	psllw  $0x4,%xmm1
    1528:	66 45 0f eb e3       	por    %xmm11,%xmm12
    152d:	66 44 0f 6f dc       	movdqa %xmm4,%xmm11
    1532:	66 41 0f db c8       	pand   %xmm8,%xmm1
    1537:	66 45 0f df dc       	pandn  %xmm12,%xmm11
    153c:	66 0f fc c8          	paddb  %xmm0,%xmm1
    1540:	66 0f db c3          	pand   %xmm3,%xmm0
    1544:	66 0f fc cf          	paddb  %xmm7,%xmm1
    1548:	66 0f db cc          	pand   %xmm4,%xmm1
    154c:	66 44 0f eb d9       	por    %xmm1,%xmm11
    1551:	66 0f 6f cb          	movdqa %xmm3,%xmm1
    1555:	66 41 0f df cb       	pandn  %xmm11,%xmm1
    155a:	66 0f eb c1          	por    %xmm1,%xmm0
    155e:	0f 29 40 f0          	movaps %xmm0,-0x10(%rax)
    1562:	48 39 c2             	cmp    %rax,%rdx
    1565:	0f 85 07 ff ff ff    	jne    1472 <run_contract+0x132>
    156b:	48 89 5c 24 48       	mov    %rbx,0x48(%rsp)
    1570:	b8 01 00 00 00       	mov    $0x1,%eax
    1575:	4d 8d a6 01 01 00 00 	lea    0x101(%r14),%r12
    157c:	41 bf 71 80 07 80    	mov    $0x80078071,%r15d
    1582:	44 89 6c 24 54       	mov    %r13d,0x54(%rsp)
    1587:	48 89 5c 24 58       	mov    %rbx,0x58(%rsp)
    158c:	44 0f b7 e8          	movzwl %ax,%r13d
    1590:	c1 e8 10             	shr    $0x10,%eax
    1593:	4c 89 f3             	mov    %r14,%rbx
    1596:	89 44 24 44          	mov    %eax,0x44(%rsp)
    159a:	44 89 ea             	mov    %r13d,%edx
    159d:	0f 1f 00             	nopl   (%rax)
    15a0:	c1 e0 10             	shl    $0x10,%eax
    15a3:	be 01 00 00 00       	mov    $0x1,%esi
    15a8:	48 89 ef             	mov    %rbp,%rdi
    15ab:	48 83 c3 01          	add    $0x1,%rbx
    15af:	48 8b 0d 6a 2a 00 00 	mov    0x2a6a(%rip),%rcx        # 4020 <stdout@GLIBC_2.2.5>
    15b6:	09 d0                	or     %edx,%eax
    15b8:	ba 04 00 00 00       	mov    $0x4,%edx
    15bd:	89 44 24 6c          	mov    %eax,0x6c(%rsp)
    15c1:	e8 7a fa ff ff       	call   1040 <fwrite@plt>
    15c6:	4c 39 e3             	cmp    %r12,%rbx
    15c9:	74 79                	je     1644 <run_contract+0x304>
    15cb:	8b 44 24 44          	mov    0x44(%rsp),%eax
    15cf:	44 89 ea             	mov    %r13d,%edx
    15d2:	4c 89 f1             	mov    %r14,%rcx
    15d5:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    15e0:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    15eb:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    15f6:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    1600:	44 0f b6 09          	movzbl (%rcx),%r9d
    1604:	48 83 c1 01          	add    $0x1,%rcx
    1608:	44 01 ca             	add    %r9d,%edx
    160b:	8d 34 02             	lea    (%rdx,%rax,1),%esi
    160e:	49 89 d1             	mov    %rdx,%r9
    1611:	49 0f af d7          	imul   %r15,%rdx
    1615:	48 c1 ea 2f          	shr    $0x2f,%rdx
    1619:	69 c2 f1 ff 00 00    	imul   $0xfff1,%edx,%eax
    161f:	44 89 ca             	mov    %r9d,%edx
    1622:	29 c2                	sub    %eax,%edx
    1624:	89 f0                	mov    %esi,%eax
    1626:	49 0f af c7          	imul   %r15,%rax
    162a:	48 c1 e8 2f          	shr    $0x2f,%rax
    162e:	44 69 c8 f1 ff 00 00 	imul   $0xfff1,%eax,%r9d
    1635:	89 f0                	mov    %esi,%eax
    1637:	44 29 c8             	sub    %r9d,%eax
    163a:	48 39 d9             	cmp    %rbx,%rcx
    163d:	75 c1                	jne    1600 <run_contract+0x2c0>
    163f:	e9 5c ff ff ff       	jmp    15a0 <run_contract+0x260>
    1644:	48 83 44 24 48 04    	addq   $0x4,0x48(%rsp)
    164a:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
    164f:	4c 39 f0             	cmp    %r14,%rax
    1652:	74 07                	je     165b <run_contract+0x31b>
    1654:	8b 00                	mov    (%rax),%eax
    1656:	e9 31 ff ff ff       	jmp    158c <run_contract+0x24c>
    165b:	44 8b 6c 24 54       	mov    0x54(%rsp),%r13d
    1660:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
    1665:	41 83 c5 01          	add    $0x1,%r13d
    1669:	41 83 fd 04          	cmp    $0x4,%r13d
    166d:	0f 85 55 fd ff ff    	jne    13c8 <run_contract+0x88>
    1673:	48 81 c4 88 01 00 00 	add    $0x188,%rsp
    167a:	5b                   	pop    %rbx
    167b:	5d                   	pop    %rbp
    167c:	41 5c                	pop    %r12
    167e:	41 5d                	pop    %r13
    1680:	41 5e                	pop    %r14
    1682:	41 5f                	pop    %r15
    1684:	c3                   	ret
    1685:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)

0000000000001690 <wm_add_v2.isra.0>:
    1690:	89 f8                	mov    %edi,%eax
    1692:	c3                   	ret

Disassembly of section .fini:

0000000000001694 <_fini>:
    1694:	48 83 ec 08          	sub    $0x8,%rsp
    1698:	48 83 c4 08          	add    $0x8,%rsp
    169c:	c3                   	ret
