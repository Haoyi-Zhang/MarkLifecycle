
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
    1060:	48 83 ec 18          	sub    $0x18,%rsp
    1064:	c7 44 24 0c f5 79 2b 6d 	movl   $0x6d2b79f5,0xc(%rsp)
    106c:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1070:	e8 cb 05 00 00       	call   1640 <wm_add_v2.isra.0>
    1075:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1079:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    107d:	e8 be 05 00 00       	call   1640 <wm_add_v2.isra.0>
    1082:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1086:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    108a:	e8 b1 05 00 00       	call   1640 <wm_add_v2.isra.0>
    108f:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1093:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1097:	e8 a4 05 00 00       	call   1640 <wm_add_v2.isra.0>
    109c:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10a0:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10a4:	e8 97 05 00 00       	call   1640 <wm_add_v2.isra.0>
    10a9:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10ad:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10b1:	e8 8a 05 00 00       	call   1640 <wm_add_v2.isra.0>
    10b6:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10ba:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10be:	e8 7d 05 00 00       	call   1640 <wm_add_v2.isra.0>
    10c3:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10c7:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10cb:	e8 70 05 00 00       	call   1640 <wm_add_v2.isra.0>
    10d0:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10d4:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10d8:	e8 63 05 00 00       	call   1640 <wm_add_v2.isra.0>
    10dd:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10e1:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10e5:	e8 56 05 00 00       	call   1640 <wm_add_v2.isra.0>
    10ea:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10ee:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10f2:	e8 49 05 00 00       	call   1640 <wm_add_v2.isra.0>
    10f7:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10fb:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10ff:	e8 3c 05 00 00       	call   1640 <wm_add_v2.isra.0>
    1104:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1108:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    110c:	e8 2f 05 00 00       	call   1640 <wm_add_v2.isra.0>
    1111:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1115:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1119:	e8 22 05 00 00       	call   1640 <wm_add_v2.isra.0>
    111e:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1122:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1126:	e8 15 05 00 00       	call   1640 <wm_add_v2.isra.0>
    112b:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    112f:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1133:	e8 08 05 00 00       	call   1640 <wm_add_v2.isra.0>
    1138:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    113c:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1140:	e8 fb 04 00 00       	call   1640 <wm_add_v2.isra.0>
    1145:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1149:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    114d:	e8 ee 04 00 00       	call   1640 <wm_add_v2.isra.0>
    1152:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1156:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    115a:	e8 e1 04 00 00       	call   1640 <wm_add_v2.isra.0>
    115f:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1163:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1167:	e8 d4 04 00 00       	call   1640 <wm_add_v2.isra.0>
    116c:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1170:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1174:	e8 c7 04 00 00       	call   1640 <wm_add_v2.isra.0>
    1179:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    117d:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1181:	e8 ba 04 00 00       	call   1640 <wm_add_v2.isra.0>
    1186:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    118a:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    118e:	e8 ad 04 00 00       	call   1640 <wm_add_v2.isra.0>
    1193:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1197:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    119b:	e8 a0 04 00 00       	call   1640 <wm_add_v2.isra.0>
    11a0:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11a4:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11a8:	e8 93 04 00 00       	call   1640 <wm_add_v2.isra.0>
    11ad:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11b1:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11b5:	e8 86 04 00 00       	call   1640 <wm_add_v2.isra.0>
    11ba:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11be:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11c2:	e8 79 04 00 00       	call   1640 <wm_add_v2.isra.0>
    11c7:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11cb:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11cf:	e8 6c 04 00 00       	call   1640 <wm_add_v2.isra.0>
    11d4:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11d8:	8b 54 24 0c          	mov    0xc(%rsp),%edx
    11dc:	b8 61 00 00 00       	mov    $0x61,%eax
    11e1:	83 fa ff             	cmp    $0xffffffff,%edx
    11e4:	74 1b                	je     1201 <main+0x1a1>
    11e6:	e8 15 01 00 00       	call   1300 <run_contract>
    11eb:	48 8b 3d 2e 2e 00 00 	mov    0x2e2e(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    11f2:	e8 39 fe ff ff       	call   1030 <ferror@plt>
    11f7:	85 c0                	test   %eax,%eax
    11f9:	0f 95 c0             	setne  %al
    11fc:	0f b6 c0             	movzbl %al,%eax
    11ff:	01 c0                	add    %eax,%eax
    1201:	48 83 c4 18          	add    $0x18,%rsp
    1205:	c3                   	ret
    1206:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

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
    1224:	48 8d 3d 35 fe ff ff 	lea    -0x1cb(%rip),%rdi        # 1060 <main>
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
    1310:	41 54                	push   %r12
    1312:	55                   	push   %rbp
    1313:	53                   	push   %rbx
    1314:	31 db                	xor    %ebx,%ebx
    1316:	48 81 ec 88 01 00 00 	sub    $0x188,%rsp
    131d:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
    1322:	b8 04 00 00 00       	mov    $0x4,%eax
    1327:	48 8d 6c 24 70       	lea    0x70(%rsp),%rbp
    132c:	4c 8d ac 24 80 00 00 00 	lea    0x80(%rsp),%r13
    1334:	66 0f 6e c8          	movd   %eax,%xmm1
    1338:	b8 08 00 00 00       	mov    $0x8,%eax
    133d:	4c 8d 64 24 6c       	lea    0x6c(%rsp),%r12
    1342:	c7 44 24 74 01 00 01 00 	movl   $0x10001,0x74(%rsp)
    134a:	66 0f 6e e0          	movd   %eax,%xmm4
    134e:	b8 0c 00 00 00       	mov    $0xc,%eax
    1353:	66 0f 70 f9 00       	pshufd $0x0,%xmm1,%xmm7
    1358:	0f 29 7c 24 10       	movaps %xmm7,0x10(%rsp)
    135d:	66 0f 6e f8          	movd   %eax,%xmm7
    1361:	b8 10 00 00 00       	mov    $0x10,%eax
    1366:	66 0f 70 dc 00       	pshufd $0x0,%xmm4,%xmm3
    136b:	0f 29 5c 24 20       	movaps %xmm3,0x20(%rsp)
    1370:	66 0f 6e d8          	movd   %eax,%xmm3
    1374:	66 0f 70 f7 00       	pshufd $0x0,%xmm7,%xmm6
    1379:	0f 29 74 24 30       	movaps %xmm6,0x30(%rsp)
    137e:	66 0f 70 cb 00       	pshufd $0x0,%xmm3,%xmm1
    1383:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
    1388:	83 fb 01             	cmp    $0x1,%ebx
    138b:	bf ff 00 ff 00       	mov    $0xff00ff,%edi
    1390:	66 0f 6f 2d 78 0c 00 00 	movdqa 0xc78(%rip),%xmm5        # 2010 <_IO_stdin_used+0x10>
    1398:	48 8d 94 24 80 01 00 00 	lea    0x180(%rsp),%rdx
    13a0:	0f 94 c0             	sete   %al
    13a3:	66 0f 6e f7          	movd   %edi,%xmm6
    13a7:	bf 01 01 01 01       	mov    $0x1010101,%edi
    13ac:	f7 d8                	neg    %eax
    13ae:	83 fb 02             	cmp    $0x2,%ebx
    13b1:	66 44 0f 6e d7       	movd   %edi,%xmm10
    13b6:	bf 55 55 55 55       	mov    $0x55555555,%edi
    13bb:	66 0f 6e c0          	movd   %eax,%xmm0
    13bf:	0f 94 c0             	sete   %al
    13c2:	66 44 0f 6e cf       	movd   %edi,%xmm9
    13c7:	bf f0 f0 f0 f0       	mov    $0xf0f0f0f0,%edi
    13cc:	66 0f 60 c0          	punpcklbw %xmm0,%xmm0
    13d0:	f7 d8                	neg    %eax
    13d2:	83 fb 01             	cmp    $0x1,%ebx
    13d5:	66 0f 70 f6 00       	pshufd $0x0,%xmm6,%xmm6
    13da:	66 0f 61 c0          	punpcklwd %xmm0,%xmm0
    13de:	66 44 0f 6e c7       	movd   %edi,%xmm8
    13e3:	bf 1f 1f 1f 1f       	mov    $0x1f1f1f1f,%edi
    13e8:	66 45 0f 70 d2 00    	pshufd $0x0,%xmm10,%xmm10
    13ee:	66 0f 70 e0 00       	pshufd $0x0,%xmm0,%xmm4
    13f3:	66 0f 6e c0          	movd   %eax,%xmm0
    13f7:	18 c0                	sbb    %al,%al
    13f9:	66 45 0f 70 c9 00    	pshufd $0x0,%xmm9,%xmm9
    13ff:	66 0f 60 c0          	punpcklbw %xmm0,%xmm0
    1403:	66 0f 6e ff          	movd   %edi,%xmm7
    1407:	66 45 0f 70 c0 00    	pshufd $0x0,%xmm8,%xmm8
    140d:	66 0f 61 c0          	punpcklwd %xmm0,%xmm0
    1411:	66 0f 70 ff 00       	pshufd $0x0,%xmm7,%xmm7
    1416:	66 0f 70 d8 00       	pshufd $0x0,%xmm0,%xmm3
    141b:	66 0f 6e c0          	movd   %eax,%xmm0
    141f:	4c 89 e8             	mov    %r13,%rax
    1422:	66 0f 60 c0          	punpcklbw %xmm0,%xmm0
    1426:	66 0f 61 c0          	punpcklwd %xmm0,%xmm0
    142a:	66 0f 70 c8 00       	pshufd $0x0,%xmm0,%xmm1
    142f:	66 44 0f 6f 6c 24 10 	movdqa 0x10(%rsp),%xmm13
    1436:	66 0f 6f c5          	movdqa %xmm5,%xmm0
    143a:	48 83 c0 10          	add    $0x10,%rax
    143e:	66 0f 6f 54 24 20    	movdqa 0x20(%rsp),%xmm2
    1444:	66 44 0f 6f 64 24 30 	movdqa 0x30(%rsp),%xmm12
    144b:	66 44 0f 6f d8       	movdqa %xmm0,%xmm11
    1450:	66 44 0f fe ed       	paddd  %xmm5,%xmm13
    1455:	66 0f fe d5          	paddd  %xmm5,%xmm2
    1459:	66 41 0f 61 c5       	punpcklwd %xmm13,%xmm0
    145e:	66 44 0f fe e5       	paddd  %xmm5,%xmm12
    1463:	66 45 0f 69 dd       	punpckhwd %xmm13,%xmm11
    1468:	66 44 0f 6f e8       	movdqa %xmm0,%xmm13
    146d:	66 41 0f 61 c3       	punpcklwd %xmm11,%xmm0
    1472:	66 0f fe 6c 24 40    	paddd  0x40(%rsp),%xmm5
    1478:	66 45 0f 69 eb       	punpckhwd %xmm11,%xmm13
    147d:	66 44 0f 6f da       	movdqa %xmm2,%xmm11
    1482:	66 41 0f 61 d4       	punpcklwd %xmm12,%xmm2
    1487:	66 45 0f 69 dc       	punpckhwd %xmm12,%xmm11
    148c:	66 44 0f 6f e2       	movdqa %xmm2,%xmm12
    1491:	66 41 0f 61 c5       	punpcklwd %xmm13,%xmm0
    1496:	66 45 0f 69 e3       	punpckhwd %xmm11,%xmm12
    149b:	66 41 0f 61 d3       	punpcklwd %xmm11,%xmm2
    14a0:	66 0f db c6          	pand   %xmm6,%xmm0
    14a4:	66 41 0f 61 d4       	punpcklwd %xmm12,%xmm2
    14a9:	66 44 0f 6f e4       	movdqa %xmm4,%xmm12
    14ae:	66 0f db d6          	pand   %xmm6,%xmm2
    14b2:	66 0f 67 c2          	packuswb %xmm2,%xmm0
    14b6:	66 0f ef d2          	pxor   %xmm2,%xmm2
    14ba:	66 44 0f 6f d8       	movdqa %xmm0,%xmm11
    14bf:	66 45 0f db da       	pand   %xmm10,%xmm11
    14c4:	66 41 0f f8 d3       	psubb  %xmm11,%xmm2
    14c9:	66 44 0f 6f d8       	movdqa %xmm0,%xmm11
    14ce:	66 41 0f ef d1       	pxor   %xmm9,%xmm2
    14d3:	66 44 0f df dc       	pandn  %xmm4,%xmm11
    14d8:	66 44 0f df e2       	pandn  %xmm2,%xmm12
    14dd:	66 0f 6f d0          	movdqa %xmm0,%xmm2
    14e1:	66 0f 71 f2 04       	psllw  $0x4,%xmm2
    14e6:	66 45 0f eb e3       	por    %xmm11,%xmm12
    14eb:	66 44 0f 6f db       	movdqa %xmm3,%xmm11
    14f0:	66 41 0f db d0       	pand   %xmm8,%xmm2
    14f5:	66 45 0f df dc       	pandn  %xmm12,%xmm11
    14fa:	66 0f fc d0          	paddb  %xmm0,%xmm2
    14fe:	66 0f db c1          	pand   %xmm1,%xmm0
    1502:	66 0f fc d7          	paddb  %xmm7,%xmm2
    1506:	66 0f db d3          	pand   %xmm3,%xmm2
    150a:	66 44 0f eb da       	por    %xmm2,%xmm11
    150f:	66 0f 6f d1          	movdqa %xmm1,%xmm2
    1513:	66 41 0f df d3       	pandn  %xmm11,%xmm2
    1518:	66 0f eb c2          	por    %xmm2,%xmm0
    151c:	0f 29 40 f0          	movaps %xmm0,-0x10(%rax)
    1520:	48 39 d0             	cmp    %rdx,%rax
    1523:	0f 85 06 ff ff ff    	jne    142f <run_contract+0x12f>
    1529:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
    152e:	b8 01 00 00 00       	mov    $0x1,%eax
    1533:	41 bf 71 80 07 80    	mov    $0x80078071,%r15d
    1539:	89 5c 24 54          	mov    %ebx,0x54(%rsp)
    153d:	48 89 6c 24 58       	mov    %rbp,0x58(%rsp)
    1542:	0f b7 e8             	movzwl %ax,%ebp
    1545:	c1 e8 10             	shr    $0x10,%eax
    1548:	45 31 f6             	xor    %r14d,%r14d
    154b:	89 c3                	mov    %eax,%ebx
    154d:	89 ea                	mov    %ebp,%edx
    154f:	89 c1                	mov    %eax,%ecx
    1551:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    155c:	0f 1f 40 00          	nopl   0x0(%rax)
    1560:	c1 e1 10             	shl    $0x10,%ecx
    1563:	be 01 00 00 00       	mov    $0x1,%esi
    1568:	4c 89 e7             	mov    %r12,%rdi
    156b:	49 83 c6 01          	add    $0x1,%r14
    156f:	09 d1                	or     %edx,%ecx
    1571:	ba 04 00 00 00       	mov    $0x4,%edx
    1576:	89 4c 24 6c          	mov    %ecx,0x6c(%rsp)
    157a:	48 8b 0d 9f 2a 00 00 	mov    0x2a9f(%rip),%rcx        # 4020 <stdout@GLIBC_2.2.5>
    1581:	e8 ba fa ff ff       	call   1040 <fwrite@plt>
    1586:	49 81 fe 01 01 00 00 	cmp    $0x101,%r14
    158d:	74 72                	je     1601 <run_contract+0x301>
    158f:	89 ea                	mov    %ebp,%edx
    1591:	89 d9                	mov    %ebx,%ecx
    1593:	31 c0                	xor    %eax,%eax
    1595:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    15a0:	48 8d 78 20          	lea    0x20(%rax),%rdi
    15a4:	4c 39 f7             	cmp    %r14,%rdi
    15a7:	49 0f 47 fe          	cmova  %r14,%rdi
    15ab:	48 39 f8             	cmp    %rdi,%rax
    15ae:	73 23                	jae    15d3 <run_contract+0x2d3>
    15b0:	4c 01 e8             	add    %r13,%rax
    15b3:	4d 8d 4c 3d 00       	lea    0x0(%r13,%rdi,1),%r9
    15b8:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    15c0:	0f b6 30             	movzbl (%rax),%esi
    15c3:	48 83 c0 01          	add    $0x1,%rax
    15c7:	01 f2                	add    %esi,%edx
    15c9:	01 d1                	add    %edx,%ecx
    15cb:	49 39 c1             	cmp    %rax,%r9
    15ce:	75 f0                	jne    15c0 <run_contract+0x2c0>
    15d0:	48 89 f8             	mov    %rdi,%rax
    15d3:	89 d6                	mov    %edx,%esi
    15d5:	49 0f af f7          	imul   %r15,%rsi
    15d9:	48 c1 ee 2f          	shr    $0x2f,%rsi
    15dd:	69 f6 f1 ff 00 00    	imul   $0xfff1,%esi,%esi
    15e3:	29 f2                	sub    %esi,%edx
    15e5:	89 ce                	mov    %ecx,%esi
    15e7:	49 0f af f7          	imul   %r15,%rsi
    15eb:	48 c1 ee 2f          	shr    $0x2f,%rsi
    15ef:	69 f6 f1 ff 00 00    	imul   $0xfff1,%esi,%esi
    15f5:	29 f1                	sub    %esi,%ecx
    15f7:	4c 39 f0             	cmp    %r14,%rax
    15fa:	72 a4                	jb     15a0 <run_contract+0x2a0>
    15fc:	e9 5f ff ff ff       	jmp    1560 <run_contract+0x260>
    1601:	48 83 44 24 08 04    	addq   $0x4,0x8(%rsp)
    1607:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    160c:	49 39 c5             	cmp    %rax,%r13
    160f:	74 07                	je     1618 <run_contract+0x318>
    1611:	8b 00                	mov    (%rax),%eax
    1613:	e9 2a ff ff ff       	jmp    1542 <run_contract+0x242>
    1618:	8b 5c 24 54          	mov    0x54(%rsp),%ebx
    161c:	48 8b 6c 24 58       	mov    0x58(%rsp),%rbp
    1621:	83 c3 01             	add    $0x1,%ebx
    1624:	83 fb 04             	cmp    $0x4,%ebx
    1627:	0f 85 5b fd ff ff    	jne    1388 <run_contract+0x88>
    162d:	48 81 c4 88 01 00 00 	add    $0x188,%rsp
    1634:	5b                   	pop    %rbx
    1635:	5d                   	pop    %rbp
    1636:	41 5c                	pop    %r12
    1638:	41 5d                	pop    %r13
    163a:	41 5e                	pop    %r14
    163c:	41 5f                	pop    %r15
    163e:	c3                   	ret
    163f:	90                   	nop

0000000000001640 <wm_add_v2.isra.0>:
    1640:	89 f8                	mov    %edi,%eax
    1642:	c3                   	ret

Disassembly of section .fini:

0000000000001644 <_fini>:
    1644:	48 83 ec 08          	sub    $0x8,%rsp
    1648:	48 83 c4 08          	add    $0x8,%rsp
    164c:	c3                   	ret
