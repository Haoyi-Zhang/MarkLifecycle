
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
    106a:	48 83 ec 38          	sub    $0x38,%rsp
    106e:	c7 44 24 28 f5 79 2b 6d 	movl   $0x6d2b79f5,0x28(%rsp)
    1076:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    107a:	e8 51 03 00 00       	call   13d0 <wm_add_v2.isra.0>
    107f:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1083:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1087:	e8 44 03 00 00       	call   13d0 <wm_add_v2.isra.0>
    108c:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1090:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1094:	e8 37 03 00 00       	call   13d0 <wm_add_v2.isra.0>
    1099:	89 44 24 28          	mov    %eax,0x28(%rsp)
    109d:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10a1:	e8 2a 03 00 00       	call   13d0 <wm_add_v2.isra.0>
    10a6:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10aa:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10ae:	e8 1d 03 00 00       	call   13d0 <wm_add_v2.isra.0>
    10b3:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10b7:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10bb:	e8 10 03 00 00       	call   13d0 <wm_add_v2.isra.0>
    10c0:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10c4:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10c8:	e8 03 03 00 00       	call   13d0 <wm_add_v2.isra.0>
    10cd:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10d1:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10d5:	e8 f6 02 00 00       	call   13d0 <wm_add_v2.isra.0>
    10da:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10de:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10e2:	e8 e9 02 00 00       	call   13d0 <wm_add_v2.isra.0>
    10e7:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10eb:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10ef:	e8 dc 02 00 00       	call   13d0 <wm_add_v2.isra.0>
    10f4:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10f8:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10fc:	e8 cf 02 00 00       	call   13d0 <wm_add_v2.isra.0>
    1101:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1105:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1109:	e8 c2 02 00 00       	call   13d0 <wm_add_v2.isra.0>
    110e:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1112:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1116:	e8 b5 02 00 00       	call   13d0 <wm_add_v2.isra.0>
    111b:	89 44 24 28          	mov    %eax,0x28(%rsp)
    111f:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1123:	e8 a8 02 00 00       	call   13d0 <wm_add_v2.isra.0>
    1128:	89 44 24 28          	mov    %eax,0x28(%rsp)
    112c:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1130:	e8 9b 02 00 00       	call   13d0 <wm_add_v2.isra.0>
    1135:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1139:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    113d:	e8 8e 02 00 00       	call   13d0 <wm_add_v2.isra.0>
    1142:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1146:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    114a:	e8 81 02 00 00       	call   13d0 <wm_add_v2.isra.0>
    114f:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1153:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1157:	e8 74 02 00 00       	call   13d0 <wm_add_v2.isra.0>
    115c:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1160:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1164:	e8 67 02 00 00       	call   13d0 <wm_add_v2.isra.0>
    1169:	89 44 24 28          	mov    %eax,0x28(%rsp)
    116d:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1171:	e8 5a 02 00 00       	call   13d0 <wm_add_v2.isra.0>
    1176:	89 44 24 28          	mov    %eax,0x28(%rsp)
    117a:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    117e:	e8 4d 02 00 00       	call   13d0 <wm_add_v2.isra.0>
    1183:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1187:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    118b:	e8 40 02 00 00       	call   13d0 <wm_add_v2.isra.0>
    1190:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1194:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1198:	e8 33 02 00 00       	call   13d0 <wm_add_v2.isra.0>
    119d:	89 44 24 28          	mov    %eax,0x28(%rsp)
    11a1:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    11a5:	e8 26 02 00 00       	call   13d0 <wm_add_v2.isra.0>
    11aa:	89 44 24 28          	mov    %eax,0x28(%rsp)
    11ae:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    11b2:	e8 19 02 00 00       	call   13d0 <wm_add_v2.isra.0>
    11b7:	89 44 24 28          	mov    %eax,0x28(%rsp)
    11bb:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    11bf:	e8 0c 02 00 00       	call   13d0 <wm_add_v2.isra.0>
    11c4:	89 44 24 28          	mov    %eax,0x28(%rsp)
    11c8:	8b 54 24 28          	mov    0x28(%rsp),%edx
    11cc:	b8 61 00 00 00       	mov    $0x61,%eax
    11d1:	83 fa ff             	cmp    $0xffffffff,%edx
    11d4:	0f 84 f7 00 00 00    	je     12d1 <main+0x271>
    11da:	48 8d 44 24 2c       	lea    0x2c(%rsp),%rax
    11df:	c7 44 24 14 00 00 00 00 	movl   $0x0,0x14(%rsp)
    11e7:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    11ec:	0f 1f 40 00          	nopl   0x0(%rax)
    11f0:	8b 44 24 14          	mov    0x14(%rsp),%eax
    11f4:	45 31 e4             	xor    %r12d,%r12d
    11f7:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
    11fb:	83 c0 01             	add    $0x1,%eax
    11fe:	89 44 24 14          	mov    %eax,0x14(%rsp)
    1202:	eb 1b                	jmp    121f <main+0x1bf>
    1204:	0f 1f 40 00          	nopl   0x0(%rax)
    1208:	8d 43 01             	lea    0x1(%rbx),%eax
    120b:	bb 01 00 00 00       	mov    $0x1,%ebx
    1210:	83 f8 02             	cmp    $0x2,%eax
    1213:	75 24                	jne    1239 <main+0x1d9>
    1215:	41 83 fc 06          	cmp    $0x6,%r12d
    1219:	0f 84 91 00 00 00    	je     12b0 <main+0x250>
    121f:	44 39 64 24 1c       	cmp    %r12d,0x1c(%rsp)
    1224:	0f 92 44 24 1b       	setb   0x1b(%rsp)
    1229:	41 83 c4 01          	add    $0x1,%r12d
    122d:	31 db                	xor    %ebx,%ebx
    122f:	45 31 ed             	xor    %r13d,%r13d
    1232:	45 89 e6             	mov    %r12d,%r14d
    1235:	41 c1 e6 04          	shl    $0x4,%r14d
    1239:	0f b6 6c 24 1b       	movzbl 0x1b(%rsp),%ebp
    123e:	41 bf 00 01 00 00    	mov    $0x100,%r15d
    1244:	09 dd                	or     %ebx,%ebp
    1246:	40 84 ed             	test   %bpl,%bpl
    1249:	75 5d                	jne    12a8 <main+0x248>
    124b:	8b 44 24 14          	mov    0x14(%rsp),%eax
    124f:	ba 5a 00 00 00       	mov    $0x5a,%edx
    1254:	44 09 f8             	or     %r15d,%eax
    1257:	44 09 f0             	or     %r14d,%eax
    125a:	0d 00 00 5a 00       	or     $0x5a0000,%eax
    125f:	89 c1                	mov    %eax,%ecx
    1261:	0f b6 c4             	movzbl %ah,%eax
    1264:	88 4c 24 2c          	mov    %cl,0x2c(%rsp)
    1268:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    126d:	be 01 00 00 00       	mov    $0x1,%esi
    1272:	48 8b 0d a7 2d 00 00 	mov    0x2da7(%rip),%rcx        # 4020 <stdout@GLIBC_2.2.5>
    1279:	88 54 24 2e          	mov    %dl,0x2e(%rsp)
    127d:	ba 04 00 00 00       	mov    $0x4,%edx
    1282:	88 44 24 2d          	mov    %al,0x2d(%rsp)
    1286:	44 88 6c 24 2f       	mov    %r13b,0x2f(%rsp)
    128b:	e8 b0 fd ff ff       	call   1040 <fwrite@plt>
    1290:	41 81 ff 00 02 00 00 	cmp    $0x200,%r15d
    1297:	0f 84 6b ff ff ff    	je     1208 <main+0x1a8>
    129d:	41 bf 00 02 00 00    	mov    $0x200,%r15d
    12a3:	40 84 ed             	test   %bpl,%bpl
    12a6:	74 a3                	je     124b <main+0x1eb>
    12a8:	31 d2                	xor    %edx,%edx
    12aa:	31 c0                	xor    %eax,%eax
    12ac:	31 c9                	xor    %ecx,%ecx
    12ae:	eb b4                	jmp    1264 <main+0x204>
    12b0:	83 7c 24 14 06       	cmpl   $0x6,0x14(%rsp)
    12b5:	0f 85 35 ff ff ff    	jne    11f0 <main+0x190>
    12bb:	48 8b 3d 5e 2d 00 00 	mov    0x2d5e(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    12c2:	e8 69 fd ff ff       	call   1030 <ferror@plt>
    12c7:	85 c0                	test   %eax,%eax
    12c9:	0f 95 c0             	setne  %al
    12cc:	0f b6 c0             	movzbl %al,%eax
    12cf:	01 c0                	add    %eax,%eax
    12d1:	48 83 c4 38          	add    $0x38,%rsp
    12d5:	5b                   	pop    %rbx
    12d6:	5d                   	pop    %rbp
    12d7:	41 5c                	pop    %r12
    12d9:	41 5d                	pop    %r13
    12db:	41 5e                	pop    %r14
    12dd:	41 5f                	pop    %r15
    12df:	c3                   	ret

00000000000012e0 <_start>:
    12e0:	31 ed                	xor    %ebp,%ebp
    12e2:	49 89 d1             	mov    %rdx,%r9
    12e5:	5e                   	pop    %rsi
    12e6:	48 89 e2             	mov    %rsp,%rdx
    12e9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    12ed:	50                   	push   %rax
    12ee:	54                   	push   %rsp
    12ef:	45 31 c0             	xor    %r8d,%r8d
    12f2:	31 c9                	xor    %ecx,%ecx
    12f4:	48 8d 3d 65 fd ff ff 	lea    -0x29b(%rip),%rdi        # 1060 <main>
    12fb:	ff 15 bf 2c 00 00    	call   *0x2cbf(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1301:	f4                   	hlt
    1302:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    130c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001310 <deregister_tm_clones>:
    1310:	48 8d 3d 09 2d 00 00 	lea    0x2d09(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1317:	48 8d 05 02 2d 00 00 	lea    0x2d02(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    131e:	48 39 f8             	cmp    %rdi,%rax
    1321:	74 15                	je     1338 <deregister_tm_clones+0x28>
    1323:	48 8b 05 9e 2c 00 00 	mov    0x2c9e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    132a:	48 85 c0             	test   %rax,%rax
    132d:	74 09                	je     1338 <deregister_tm_clones+0x28>
    132f:	ff e0                	jmp    *%rax
    1331:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1338:	c3                   	ret
    1339:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001340 <register_tm_clones>:
    1340:	48 8d 3d d9 2c 00 00 	lea    0x2cd9(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1347:	48 8d 35 d2 2c 00 00 	lea    0x2cd2(%rip),%rsi        # 4020 <stdout@GLIBC_2.2.5>
    134e:	48 29 fe             	sub    %rdi,%rsi
    1351:	48 89 f0             	mov    %rsi,%rax
    1354:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1358:	48 c1 f8 03          	sar    $0x3,%rax
    135c:	48 01 c6             	add    %rax,%rsi
    135f:	48 d1 fe             	sar    $1,%rsi
    1362:	74 14                	je     1378 <register_tm_clones+0x38>
    1364:	48 8b 05 6d 2c 00 00 	mov    0x2c6d(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    136b:	48 85 c0             	test   %rax,%rax
    136e:	74 08                	je     1378 <register_tm_clones+0x38>
    1370:	ff e0                	jmp    *%rax
    1372:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1378:	c3                   	ret
    1379:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001380 <__do_global_dtors_aux>:
    1380:	f3 0f 1e fa          	endbr64
    1384:	80 3d 9d 2c 00 00 00 	cmpb   $0x0,0x2c9d(%rip)        # 4028 <completed.0>
    138b:	75 2b                	jne    13b8 <__do_global_dtors_aux+0x38>
    138d:	55                   	push   %rbp
    138e:	48 83 3d 4a 2c 00 00 00 	cmpq   $0x0,0x2c4a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1396:	48 89 e5             	mov    %rsp,%rbp
    1399:	74 0c                	je     13a7 <__do_global_dtors_aux+0x27>
    139b:	48 8b 3d 76 2c 00 00 	mov    0x2c76(%rip),%rdi        # 4018 <__dso_handle>
    13a2:	e8 a9 fc ff ff       	call   1050 <__cxa_finalize@plt>
    13a7:	e8 64 ff ff ff       	call   1310 <deregister_tm_clones>
    13ac:	c6 05 75 2c 00 00 01 	movb   $0x1,0x2c75(%rip)        # 4028 <completed.0>
    13b3:	5d                   	pop    %rbp
    13b4:	c3                   	ret
    13b5:	0f 1f 00             	nopl   (%rax)
    13b8:	c3                   	ret
    13b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000013c0 <frame_dummy>:
    13c0:	f3 0f 1e fa          	endbr64
    13c4:	e9 77 ff ff ff       	jmp    1340 <register_tm_clones>
    13c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000013d0 <wm_add_v2.isra.0>:
    13d0:	89 f8                	mov    %edi,%eax
    13d2:	c3                   	ret

Disassembly of section .fini:

00000000000013d4 <_fini>:
    13d4:	48 83 ec 08          	sub    $0x8,%rsp
    13d8:	48 83 c4 08          	add    $0x8,%rsp
    13dc:	c3                   	ret
