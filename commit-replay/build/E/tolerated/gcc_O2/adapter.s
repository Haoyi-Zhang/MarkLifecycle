
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
    1090:	e8 bb 05 00 00       	call   1650 <wm_add_v2.isra.0>
    1095:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1099:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    109d:	e8 ae 05 00 00       	call   1650 <wm_add_v2.isra.0>
    10a2:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10a6:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10aa:	e8 a1 05 00 00       	call   1650 <wm_add_v2.isra.0>
    10af:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10b3:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10b7:	e8 94 05 00 00       	call   1650 <wm_add_v2.isra.0>
    10bc:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10c0:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10c4:	e8 87 05 00 00       	call   1650 <wm_add_v2.isra.0>
    10c9:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10cd:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10d1:	e8 7a 05 00 00       	call   1650 <wm_add_v2.isra.0>
    10d6:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10da:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10de:	e8 6d 05 00 00       	call   1650 <wm_add_v2.isra.0>
    10e3:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10e7:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10eb:	e8 60 05 00 00       	call   1650 <wm_add_v2.isra.0>
    10f0:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10f4:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10f8:	e8 53 05 00 00       	call   1650 <wm_add_v2.isra.0>
    10fd:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1101:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1105:	e8 46 05 00 00       	call   1650 <wm_add_v2.isra.0>
    110a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    110e:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1112:	e8 39 05 00 00       	call   1650 <wm_add_v2.isra.0>
    1117:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    111b:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    111f:	e8 2c 05 00 00       	call   1650 <wm_add_v2.isra.0>
    1124:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1128:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    112c:	e8 1f 05 00 00       	call   1650 <wm_add_v2.isra.0>
    1131:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1135:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1139:	e8 12 05 00 00       	call   1650 <wm_add_v2.isra.0>
    113e:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1142:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1146:	e8 05 05 00 00       	call   1650 <wm_add_v2.isra.0>
    114b:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    114f:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1153:	e8 f8 04 00 00       	call   1650 <wm_add_v2.isra.0>
    1158:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    115c:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1160:	e8 eb 04 00 00       	call   1650 <wm_add_v2.isra.0>
    1165:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1169:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    116d:	e8 de 04 00 00       	call   1650 <wm_add_v2.isra.0>
    1172:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1176:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    117a:	e8 d1 04 00 00       	call   1650 <wm_add_v2.isra.0>
    117f:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1183:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1187:	e8 c4 04 00 00       	call   1650 <wm_add_v2.isra.0>
    118c:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1190:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1194:	e8 b7 04 00 00       	call   1650 <wm_add_v2.isra.0>
    1199:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    119d:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11a1:	e8 aa 04 00 00       	call   1650 <wm_add_v2.isra.0>
    11a6:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11aa:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11ae:	e8 9d 04 00 00       	call   1650 <wm_add_v2.isra.0>
    11b3:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11b7:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11bb:	e8 90 04 00 00       	call   1650 <wm_add_v2.isra.0>
    11c0:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11c4:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11c8:	e8 83 04 00 00       	call   1650 <wm_add_v2.isra.0>
    11cd:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11d1:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11d5:	e8 76 04 00 00       	call   1650 <wm_add_v2.isra.0>
    11da:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11de:	8b 54 24 0c          	mov    0xc(%rsp),%edx
    11e2:	b8 61 00 00 00       	mov    $0x61,%eax
    11e7:	83 fa ff             	cmp    $0xffffffff,%edx
    11ea:	74 1b                	je     1207 <main+0x187>
    11ec:	e8 0f 01 00 00       	call   1300 <run_contract>
    11f1:	48 8b 3d 28 2e 00 00 	mov    0x2e28(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    11f8:	e8 33 fe ff ff       	call   1030 <ferror@plt>
    11fd:	85 c0                	test   %eax,%eax
    11ff:	0f 95 c0             	setne  %al
    1202:	0f b6 c0             	movzbl %al,%eax
    1205:	01 c0                	add    %eax,%eax
    1207:	48 83 c4 18          	add    $0x18,%rsp
    120b:	c3                   	ret
    120c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001210 <_start>:
    1210:	31 ed                	xor    %ebp,%ebp
    1212:	49 89 d1             	mov    %rdx,%r9
    1215:	5e                   	pop    %rsi
    1216:	48 89 e2             	mov    %rsp,%rdx
    1219:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    121d:	50                   	push   %rax
    121e:	54                   	push   %rsp
    121f:	45 31 c0             	xor    %r8d,%r8d
    1222:	31 c9                	xor    %ecx,%ecx
    1224:	48 8d 3d 55 fe ff ff 	lea    -0x1ab(%rip),%rdi        # 1080 <main>
    122b:	ff 15 8f 2d 00 00    	call   *0x2d8f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1231:	f4                   	hlt
    1232:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    123c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001240 <deregister_tm_clones>:
    1240:	48 8d 3d d9 2d 00 00 	lea    0x2dd9(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1247:	48 8d 05 d2 2d 00 00 	lea    0x2dd2(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    124e:	48 39 f8             	cmp    %rdi,%rax
    1251:	74 15                	je     1268 <deregister_tm_clones+0x28>
    1253:	48 8b 05 6e 2d 00 00 	mov    0x2d6e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    125a:	48 85 c0             	test   %rax,%rax
    125d:	74 09                	je     1268 <deregister_tm_clones+0x28>
    125f:	ff e0                	jmp    *%rax
    1261:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1268:	c3                   	ret
    1269:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001270 <register_tm_clones>:
    1270:	48 8d 3d a9 2d 00 00 	lea    0x2da9(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1277:	48 8d 35 a2 2d 00 00 	lea    0x2da2(%rip),%rsi        # 4020 <stdout@GLIBC_2.2.5>
    127e:	48 29 fe             	sub    %rdi,%rsi
    1281:	48 89 f0             	mov    %rsi,%rax
    1284:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1288:	48 c1 f8 03          	sar    $0x3,%rax
    128c:	48 01 c6             	add    %rax,%rsi
    128f:	48 d1 fe             	sar    $1,%rsi
    1292:	74 14                	je     12a8 <register_tm_clones+0x38>
    1294:	48 8b 05 3d 2d 00 00 	mov    0x2d3d(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    129b:	48 85 c0             	test   %rax,%rax
    129e:	74 08                	je     12a8 <register_tm_clones+0x38>
    12a0:	ff e0                	jmp    *%rax
    12a2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    12a8:	c3                   	ret
    12a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000012b0 <__do_global_dtors_aux>:
    12b0:	f3 0f 1e fa          	endbr64
    12b4:	80 3d 6d 2d 00 00 00 	cmpb   $0x0,0x2d6d(%rip)        # 4028 <completed.0>
    12bb:	75 2b                	jne    12e8 <__do_global_dtors_aux+0x38>
    12bd:	55                   	push   %rbp
    12be:	48 83 3d 1a 2d 00 00 00 	cmpq   $0x0,0x2d1a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    12c6:	48 89 e5             	mov    %rsp,%rbp
    12c9:	74 0c                	je     12d7 <__do_global_dtors_aux+0x27>
    12cb:	48 8b 3d 46 2d 00 00 	mov    0x2d46(%rip),%rdi        # 4018 <__dso_handle>
    12d2:	e8 79 fd ff ff       	call   1050 <__cxa_finalize@plt>
    12d7:	e8 64 ff ff ff       	call   1240 <deregister_tm_clones>
    12dc:	c6 05 45 2d 00 00 01 	movb   $0x1,0x2d45(%rip)        # 4028 <completed.0>
    12e3:	5d                   	pop    %rbp
    12e4:	c3                   	ret
    12e5:	0f 1f 00             	nopl   (%rax)
    12e8:	c3                   	ret
    12e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000012f0 <frame_dummy>:
    12f0:	f3 0f 1e fa          	endbr64
    12f4:	e9 77 ff ff ff       	jmp    1270 <register_tm_clones>
    12f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001300 <run_contract>:
    1300:	48 b8 78 56 34 12 ff ff ff ff 	movabs $0xffffffff12345678,%rax
    130a:	41 57                	push   %r15
    130c:	41 56                	push   %r14
    130e:	41 55                	push   %r13
    1310:	45 31 ed             	xor    %r13d,%r13d
    1313:	41 54                	push   %r12
    1315:	55                   	push   %rbp
    1316:	53                   	push   %rbx
    1317:	48 81 ec 88 01 00 00 	sub    $0x188,%rsp
    131e:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
    1323:	b8 04 00 00 00       	mov    $0x4,%eax
    1328:	48 8d 5c 24 70       	lea    0x70(%rsp),%rbx
    132d:	4c 8d b4 24 80 00 00 00 	lea    0x80(%rsp),%r14
    1335:	66 0f 6e f8          	movd   %eax,%xmm7
    1339:	b8 08 00 00 00       	mov    $0x8,%eax
    133e:	48 8d 6c 24 6c       	lea    0x6c(%rsp),%rbp
    1343:	c7 44 24 74 01 00 01 00 	movl   $0x10001,0x74(%rsp)
    134b:	66 0f 6e e0          	movd   %eax,%xmm4
    134f:	b8 0c 00 00 00       	mov    $0xc,%eax
    1354:	66 0f 70 ff 00       	pshufd $0x0,%xmm7,%xmm7
    1359:	0f 29 3c 24          	movaps %xmm7,(%rsp)
    135d:	66 0f 6e f0          	movd   %eax,%xmm6
    1361:	b8 10 00 00 00       	mov    $0x10,%eax
    1366:	66 0f 70 dc 00       	pshufd $0x0,%xmm4,%xmm3
    136b:	0f 29 5c 24 10       	movaps %xmm3,0x10(%rsp)
    1370:	66 0f 6e d8          	movd   %eax,%xmm3
    1374:	66 0f 70 ee 00       	pshufd $0x0,%xmm6,%xmm5
    1379:	0f 29 6c 24 20       	movaps %xmm5,0x20(%rsp)
    137e:	66 0f 70 fb 00       	pshufd $0x0,%xmm3,%xmm7
    1383:	0f 29 7c 24 30       	movaps %xmm7,0x30(%rsp)
    1388:	41 83 fd 01          	cmp    $0x1,%r13d
    138c:	bf ff 00 ff 00       	mov    $0xff00ff,%edi
    1391:	66 0f 6f 15 77 0c 00 00 	movdqa 0xc77(%rip),%xmm2        # 2010 <_IO_stdin_used+0x10>
    1399:	48 8d 94 24 80 01 00 00 	lea    0x180(%rsp),%rdx
    13a1:	0f 94 c0             	sete   %al
    13a4:	66 0f 6e f7          	movd   %edi,%xmm6
    13a8:	bf 01 01 01 01       	mov    $0x1010101,%edi
    13ad:	f7 d8                	neg    %eax
    13af:	41 83 fd 02          	cmp    $0x2,%r13d
    13b3:	66 44 0f 6e d7       	movd   %edi,%xmm10
    13b8:	bf 55 55 55 55       	mov    $0x55555555,%edi
    13bd:	66 0f 6e c0          	movd   %eax,%xmm0
    13c1:	0f 94 c0             	sete   %al
    13c4:	66 44 0f 6e cf       	movd   %edi,%xmm9
    13c9:	bf f0 f0 f0 f0       	mov    $0xf0f0f0f0,%edi
    13ce:	66 0f 60 c0          	punpcklbw %xmm0,%xmm0
    13d2:	f7 d8                	neg    %eax
    13d4:	41 83 fd 01          	cmp    $0x1,%r13d
    13d8:	66 0f 70 f6 00       	pshufd $0x0,%xmm6,%xmm6
    13dd:	66 0f 61 c0          	punpcklwd %xmm0,%xmm0
    13e1:	66 44 0f 6e c7       	movd   %edi,%xmm8
    13e6:	bf 1f 1f 1f 1f       	mov    $0x1f1f1f1f,%edi
    13eb:	66 45 0f 70 d2 00    	pshufd $0x0,%xmm10,%xmm10
    13f1:	66 0f 70 e8 00       	pshufd $0x0,%xmm0,%xmm5
    13f6:	66 0f 6e c0          	movd   %eax,%xmm0
    13fa:	18 c0                	sbb    %al,%al
    13fc:	66 45 0f 70 c9 00    	pshufd $0x0,%xmm9,%xmm9
    1402:	66 0f 60 c0          	punpcklbw %xmm0,%xmm0
    1406:	66 0f 6e ff          	movd   %edi,%xmm7
    140a:	66 45 0f 70 c0 00    	pshufd $0x0,%xmm8,%xmm8
    1410:	66 0f 61 c0          	punpcklwd %xmm0,%xmm0
    1414:	66 0f 70 ff 00       	pshufd $0x0,%xmm7,%xmm7
    1419:	66 0f 70 e0 00       	pshufd $0x0,%xmm0,%xmm4
    141e:	66 0f 6e c0          	movd   %eax,%xmm0
    1422:	4c 89 f0             	mov    %r14,%rax
    1425:	66 0f 60 c0          	punpcklbw %xmm0,%xmm0
    1429:	66 0f 61 c0          	punpcklwd %xmm0,%xmm0
    142d:	66 0f 70 d8 00       	pshufd $0x0,%xmm0,%xmm3
    1432:	66 44 0f 6f 2c 24    	movdqa (%rsp),%xmm13
    1438:	66 0f 6f c2          	movdqa %xmm2,%xmm0
    143c:	48 83 c0 10          	add    $0x10,%rax
    1440:	66 0f 6f 4c 24 10    	movdqa 0x10(%rsp),%xmm1
    1446:	66 44 0f 6f 64 24 20 	movdqa 0x20(%rsp),%xmm12
    144d:	66 44 0f 6f d8       	movdqa %xmm0,%xmm11
    1452:	66 44 0f fe ea       	paddd  %xmm2,%xmm13
    1457:	66 0f fe ca          	paddd  %xmm2,%xmm1
    145b:	66 41 0f 61 c5       	punpcklwd %xmm13,%xmm0
    1460:	66 44 0f fe e2       	paddd  %xmm2,%xmm12
    1465:	66 45 0f 69 dd       	punpckhwd %xmm13,%xmm11
    146a:	66 44 0f 6f e8       	movdqa %xmm0,%xmm13
    146f:	66 41 0f 61 c3       	punpcklwd %xmm11,%xmm0
    1474:	66 0f fe 54 24 30    	paddd  0x30(%rsp),%xmm2
    147a:	66 45 0f 69 eb       	punpckhwd %xmm11,%xmm13
    147f:	66 44 0f 6f d9       	movdqa %xmm1,%xmm11
    1484:	66 41 0f 61 cc       	punpcklwd %xmm12,%xmm1
    1489:	66 45 0f 69 dc       	punpckhwd %xmm12,%xmm11
    148e:	66 44 0f 6f e1       	movdqa %xmm1,%xmm12
    1493:	66 41 0f 61 c5       	punpcklwd %xmm13,%xmm0
    1498:	66 45 0f 69 e3       	punpckhwd %xmm11,%xmm12
    149d:	66 41 0f 61 cb       	punpcklwd %xmm11,%xmm1
    14a2:	66 0f db c6          	pand   %xmm6,%xmm0
    14a6:	66 41 0f 61 cc       	punpcklwd %xmm12,%xmm1
    14ab:	66 44 0f 6f e5       	movdqa %xmm5,%xmm12
    14b0:	66 0f db ce          	pand   %xmm6,%xmm1
    14b4:	66 0f 67 c1          	packuswb %xmm1,%xmm0
    14b8:	66 0f ef c9          	pxor   %xmm1,%xmm1
    14bc:	66 44 0f 6f d8       	movdqa %xmm0,%xmm11
    14c1:	66 45 0f db da       	pand   %xmm10,%xmm11
    14c6:	66 41 0f f8 cb       	psubb  %xmm11,%xmm1
    14cb:	66 44 0f 6f d8       	movdqa %xmm0,%xmm11
    14d0:	66 41 0f ef c9       	pxor   %xmm9,%xmm1
    14d5:	66 44 0f df dd       	pandn  %xmm5,%xmm11
    14da:	66 44 0f df e1       	pandn  %xmm1,%xmm12
    14df:	66 0f 6f c8          	movdqa %xmm0,%xmm1
    14e3:	66 0f 71 f1 04       	psllw  $0x4,%xmm1
    14e8:	66 45 0f eb e3       	por    %xmm11,%xmm12
    14ed:	66 44 0f 6f dc       	movdqa %xmm4,%xmm11
    14f2:	66 41 0f db c8       	pand   %xmm8,%xmm1
    14f7:	66 45 0f df dc       	pandn  %xmm12,%xmm11
    14fc:	66 0f fc c8          	paddb  %xmm0,%xmm1
    1500:	66 0f db c3          	pand   %xmm3,%xmm0
    1504:	66 0f fc cf          	paddb  %xmm7,%xmm1
    1508:	66 0f db cc          	pand   %xmm4,%xmm1
    150c:	66 44 0f eb d9       	por    %xmm1,%xmm11
    1511:	66 0f 6f cb          	movdqa %xmm3,%xmm1
    1515:	66 41 0f df cb       	pandn  %xmm11,%xmm1
    151a:	66 0f eb c1          	por    %xmm1,%xmm0
    151e:	0f 29 40 f0          	movaps %xmm0,-0x10(%rax)
    1522:	48 39 c2             	cmp    %rax,%rdx
    1525:	0f 85 07 ff ff ff    	jne    1432 <run_contract+0x132>
    152b:	48 89 5c 24 48       	mov    %rbx,0x48(%rsp)
    1530:	b8 01 00 00 00       	mov    $0x1,%eax
    1535:	4d 8d a6 01 01 00 00 	lea    0x101(%r14),%r12
    153c:	41 bf 71 80 07 80    	mov    $0x80078071,%r15d
    1542:	44 89 6c 24 54       	mov    %r13d,0x54(%rsp)
    1547:	48 89 5c 24 58       	mov    %rbx,0x58(%rsp)
    154c:	44 0f b7 e8          	movzwl %ax,%r13d
    1550:	c1 e8 10             	shr    $0x10,%eax
    1553:	4c 89 f3             	mov    %r14,%rbx
    1556:	89 44 24 44          	mov    %eax,0x44(%rsp)
    155a:	44 89 ea             	mov    %r13d,%edx
    155d:	0f 1f 00             	nopl   (%rax)
    1560:	c1 e0 10             	shl    $0x10,%eax
    1563:	be 01 00 00 00       	mov    $0x1,%esi
    1568:	48 89 ef             	mov    %rbp,%rdi
    156b:	48 83 c3 01          	add    $0x1,%rbx
    156f:	48 8b 0d aa 2a 00 00 	mov    0x2aaa(%rip),%rcx        # 4020 <stdout@GLIBC_2.2.5>
    1576:	09 d0                	or     %edx,%eax
    1578:	ba 04 00 00 00       	mov    $0x4,%edx
    157d:	89 44 24 6c          	mov    %eax,0x6c(%rsp)
    1581:	e8 ba fa ff ff       	call   1040 <fwrite@plt>
    1586:	4c 39 e3             	cmp    %r12,%rbx
    1589:	74 79                	je     1604 <run_contract+0x304>
    158b:	8b 44 24 44          	mov    0x44(%rsp),%eax
    158f:	44 89 ea             	mov    %r13d,%edx
    1592:	4c 89 f1             	mov    %r14,%rcx
    1595:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    15a0:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    15ab:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    15b6:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    15c0:	44 0f b6 09          	movzbl (%rcx),%r9d
    15c4:	48 83 c1 01          	add    $0x1,%rcx
    15c8:	44 01 ca             	add    %r9d,%edx
    15cb:	8d 34 02             	lea    (%rdx,%rax,1),%esi
    15ce:	49 89 d1             	mov    %rdx,%r9
    15d1:	49 0f af d7          	imul   %r15,%rdx
    15d5:	48 c1 ea 2f          	shr    $0x2f,%rdx
    15d9:	69 c2 f1 ff 00 00    	imul   $0xfff1,%edx,%eax
    15df:	44 89 ca             	mov    %r9d,%edx
    15e2:	29 c2                	sub    %eax,%edx
    15e4:	89 f0                	mov    %esi,%eax
    15e6:	49 0f af c7          	imul   %r15,%rax
    15ea:	48 c1 e8 2f          	shr    $0x2f,%rax
    15ee:	44 69 c8 f1 ff 00 00 	imul   $0xfff1,%eax,%r9d
    15f5:	89 f0                	mov    %esi,%eax
    15f7:	44 29 c8             	sub    %r9d,%eax
    15fa:	48 39 d9             	cmp    %rbx,%rcx
    15fd:	75 c1                	jne    15c0 <run_contract+0x2c0>
    15ff:	e9 5c ff ff ff       	jmp    1560 <run_contract+0x260>
    1604:	48 83 44 24 48 04    	addq   $0x4,0x48(%rsp)
    160a:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
    160f:	4c 39 f0             	cmp    %r14,%rax
    1612:	74 07                	je     161b <run_contract+0x31b>
    1614:	8b 00                	mov    (%rax),%eax
    1616:	e9 31 ff ff ff       	jmp    154c <run_contract+0x24c>
    161b:	44 8b 6c 24 54       	mov    0x54(%rsp),%r13d
    1620:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
    1625:	41 83 c5 01          	add    $0x1,%r13d
    1629:	41 83 fd 04          	cmp    $0x4,%r13d
    162d:	0f 85 55 fd ff ff    	jne    1388 <run_contract+0x88>
    1633:	48 81 c4 88 01 00 00 	add    $0x188,%rsp
    163a:	5b                   	pop    %rbx
    163b:	5d                   	pop    %rbp
    163c:	41 5c                	pop    %r12
    163e:	41 5d                	pop    %r13
    1640:	41 5e                	pop    %r14
    1642:	41 5f                	pop    %r15
    1644:	c3                   	ret
    1645:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)

0000000000001650 <wm_add_v2.isra.0>:
    1650:	89 f8                	mov    %edi,%eax
    1652:	c3                   	ret

Disassembly of section .fini:

0000000000001654 <_fini>:
    1654:	48 83 ec 08          	sub    $0x8,%rsp
    1658:	48 83 c4 08          	add    $0x8,%rsp
    165c:	c3                   	ret
