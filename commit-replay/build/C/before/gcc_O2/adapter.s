
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
    107a:	e8 71 03 00 00       	call   13f0 <wm_add_v1.isra.0>
    107f:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1083:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1087:	e8 64 03 00 00       	call   13f0 <wm_add_v1.isra.0>
    108c:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1090:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1094:	e8 57 03 00 00       	call   13f0 <wm_add_v1.isra.0>
    1099:	89 44 24 28          	mov    %eax,0x28(%rsp)
    109d:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10a1:	e8 4a 03 00 00       	call   13f0 <wm_add_v1.isra.0>
    10a6:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10aa:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10ae:	e8 3d 03 00 00       	call   13f0 <wm_add_v1.isra.0>
    10b3:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10b7:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10bb:	e8 30 03 00 00       	call   13f0 <wm_add_v1.isra.0>
    10c0:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10c4:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10c8:	e8 23 03 00 00       	call   13f0 <wm_add_v1.isra.0>
    10cd:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10d1:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10d5:	e8 16 03 00 00       	call   13f0 <wm_add_v1.isra.0>
    10da:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10de:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10e2:	e8 09 03 00 00       	call   13f0 <wm_add_v1.isra.0>
    10e7:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10eb:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10ef:	e8 fc 02 00 00       	call   13f0 <wm_add_v1.isra.0>
    10f4:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10f8:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10fc:	e8 ef 02 00 00       	call   13f0 <wm_add_v1.isra.0>
    1101:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1105:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1109:	e8 e2 02 00 00       	call   13f0 <wm_add_v1.isra.0>
    110e:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1112:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1116:	e8 d5 02 00 00       	call   13f0 <wm_add_v1.isra.0>
    111b:	89 44 24 28          	mov    %eax,0x28(%rsp)
    111f:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1123:	e8 c8 02 00 00       	call   13f0 <wm_add_v1.isra.0>
    1128:	89 44 24 28          	mov    %eax,0x28(%rsp)
    112c:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1130:	e8 bb 02 00 00       	call   13f0 <wm_add_v1.isra.0>
    1135:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1139:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    113d:	e8 ae 02 00 00       	call   13f0 <wm_add_v1.isra.0>
    1142:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1146:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    114a:	e8 a1 02 00 00       	call   13f0 <wm_add_v1.isra.0>
    114f:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1153:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1157:	e8 94 02 00 00       	call   13f0 <wm_add_v1.isra.0>
    115c:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1160:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1164:	e8 87 02 00 00       	call   13f0 <wm_add_v1.isra.0>
    1169:	89 44 24 28          	mov    %eax,0x28(%rsp)
    116d:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1171:	e8 7a 02 00 00       	call   13f0 <wm_add_v1.isra.0>
    1176:	89 44 24 28          	mov    %eax,0x28(%rsp)
    117a:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    117e:	e8 6d 02 00 00       	call   13f0 <wm_add_v1.isra.0>
    1183:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1187:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    118b:	e8 60 02 00 00       	call   13f0 <wm_add_v1.isra.0>
    1190:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1194:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1198:	e8 53 02 00 00       	call   13f0 <wm_add_v1.isra.0>
    119d:	89 44 24 28          	mov    %eax,0x28(%rsp)
    11a1:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    11a5:	e8 46 02 00 00       	call   13f0 <wm_add_v1.isra.0>
    11aa:	89 44 24 28          	mov    %eax,0x28(%rsp)
    11ae:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    11b2:	e8 39 02 00 00       	call   13f0 <wm_add_v1.isra.0>
    11b7:	89 44 24 28          	mov    %eax,0x28(%rsp)
    11bb:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    11bf:	e8 2c 02 00 00       	call   13f0 <wm_add_v1.isra.0>
    11c4:	89 44 24 28          	mov    %eax,0x28(%rsp)
    11c8:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    11cc:	e8 1f 02 00 00       	call   13f0 <wm_add_v1.isra.0>
    11d1:	89 44 24 28          	mov    %eax,0x28(%rsp)
    11d5:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    11d9:	e8 12 02 00 00       	call   13f0 <wm_add_v1.isra.0>
    11de:	89 44 24 28          	mov    %eax,0x28(%rsp)
    11e2:	8b 54 24 28          	mov    0x28(%rsp),%edx
    11e6:	b8 61 00 00 00       	mov    $0x61,%eax
    11eb:	83 fa ff             	cmp    $0xffffffff,%edx
    11ee:	0f 84 fd 00 00 00    	je     12f1 <main+0x291>
    11f4:	48 8d 44 24 2c       	lea    0x2c(%rsp),%rax
    11f9:	c7 44 24 14 00 00 00 00 	movl   $0x0,0x14(%rsp)
    1201:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    1206:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    1210:	8b 44 24 14          	mov    0x14(%rsp),%eax
    1214:	45 31 e4             	xor    %r12d,%r12d
    1217:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
    121b:	83 c0 01             	add    $0x1,%eax
    121e:	89 44 24 14          	mov    %eax,0x14(%rsp)
    1222:	eb 1b                	jmp    123f <main+0x1df>
    1224:	0f 1f 40 00          	nopl   0x0(%rax)
    1228:	8d 43 01             	lea    0x1(%rbx),%eax
    122b:	bb 01 00 00 00       	mov    $0x1,%ebx
    1230:	83 f8 02             	cmp    $0x2,%eax
    1233:	75 24                	jne    1259 <main+0x1f9>
    1235:	41 83 fc 06          	cmp    $0x6,%r12d
    1239:	0f 84 91 00 00 00    	je     12d0 <main+0x270>
    123f:	44 39 64 24 1c       	cmp    %r12d,0x1c(%rsp)
    1244:	0f 92 44 24 1b       	setb   0x1b(%rsp)
    1249:	41 83 c4 01          	add    $0x1,%r12d
    124d:	31 db                	xor    %ebx,%ebx
    124f:	45 31 ed             	xor    %r13d,%r13d
    1252:	45 89 e6             	mov    %r12d,%r14d
    1255:	41 c1 e6 04          	shl    $0x4,%r14d
    1259:	0f b6 6c 24 1b       	movzbl 0x1b(%rsp),%ebp
    125e:	41 bf 00 01 00 00    	mov    $0x100,%r15d
    1264:	09 dd                	or     %ebx,%ebp
    1266:	40 84 ed             	test   %bpl,%bpl
    1269:	75 5d                	jne    12c8 <main+0x268>
    126b:	8b 44 24 14          	mov    0x14(%rsp),%eax
    126f:	ba 5a 00 00 00       	mov    $0x5a,%edx
    1274:	44 09 f8             	or     %r15d,%eax
    1277:	44 09 f0             	or     %r14d,%eax
    127a:	0d 00 00 5a 00       	or     $0x5a0000,%eax
    127f:	89 c1                	mov    %eax,%ecx
    1281:	0f b6 c4             	movzbl %ah,%eax
    1284:	88 4c 24 2c          	mov    %cl,0x2c(%rsp)
    1288:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    128d:	be 01 00 00 00       	mov    $0x1,%esi
    1292:	48 8b 0d 87 2d 00 00 	mov    0x2d87(%rip),%rcx        # 4020 <stdout@GLIBC_2.2.5>
    1299:	88 54 24 2e          	mov    %dl,0x2e(%rsp)
    129d:	ba 04 00 00 00       	mov    $0x4,%edx
    12a2:	88 44 24 2d          	mov    %al,0x2d(%rsp)
    12a6:	44 88 6c 24 2f       	mov    %r13b,0x2f(%rsp)
    12ab:	e8 90 fd ff ff       	call   1040 <fwrite@plt>
    12b0:	41 81 ff 00 02 00 00 	cmp    $0x200,%r15d
    12b7:	0f 84 6b ff ff ff    	je     1228 <main+0x1c8>
    12bd:	41 bf 00 02 00 00    	mov    $0x200,%r15d
    12c3:	40 84 ed             	test   %bpl,%bpl
    12c6:	74 a3                	je     126b <main+0x20b>
    12c8:	31 d2                	xor    %edx,%edx
    12ca:	31 c0                	xor    %eax,%eax
    12cc:	31 c9                	xor    %ecx,%ecx
    12ce:	eb b4                	jmp    1284 <main+0x224>
    12d0:	83 7c 24 14 06       	cmpl   $0x6,0x14(%rsp)
    12d5:	0f 85 35 ff ff ff    	jne    1210 <main+0x1b0>
    12db:	48 8b 3d 3e 2d 00 00 	mov    0x2d3e(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    12e2:	e8 49 fd ff ff       	call   1030 <ferror@plt>
    12e7:	85 c0                	test   %eax,%eax
    12e9:	0f 95 c0             	setne  %al
    12ec:	0f b6 c0             	movzbl %al,%eax
    12ef:	01 c0                	add    %eax,%eax
    12f1:	48 83 c4 38          	add    $0x38,%rsp
    12f5:	5b                   	pop    %rbx
    12f6:	5d                   	pop    %rbp
    12f7:	41 5c                	pop    %r12
    12f9:	41 5d                	pop    %r13
    12fb:	41 5e                	pop    %r14
    12fd:	41 5f                	pop    %r15
    12ff:	c3                   	ret

0000000000001300 <_start>:
    1300:	31 ed                	xor    %ebp,%ebp
    1302:	49 89 d1             	mov    %rdx,%r9
    1305:	5e                   	pop    %rsi
    1306:	48 89 e2             	mov    %rsp,%rdx
    1309:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    130d:	50                   	push   %rax
    130e:	54                   	push   %rsp
    130f:	45 31 c0             	xor    %r8d,%r8d
    1312:	31 c9                	xor    %ecx,%ecx
    1314:	48 8d 3d 45 fd ff ff 	lea    -0x2bb(%rip),%rdi        # 1060 <main>
    131b:	ff 15 9f 2c 00 00    	call   *0x2c9f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1321:	f4                   	hlt
    1322:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    132c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001330 <deregister_tm_clones>:
    1330:	48 8d 3d e9 2c 00 00 	lea    0x2ce9(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1337:	48 8d 05 e2 2c 00 00 	lea    0x2ce2(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    133e:	48 39 f8             	cmp    %rdi,%rax
    1341:	74 15                	je     1358 <deregister_tm_clones+0x28>
    1343:	48 8b 05 7e 2c 00 00 	mov    0x2c7e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    134a:	48 85 c0             	test   %rax,%rax
    134d:	74 09                	je     1358 <deregister_tm_clones+0x28>
    134f:	ff e0                	jmp    *%rax
    1351:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1358:	c3                   	ret
    1359:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001360 <register_tm_clones>:
    1360:	48 8d 3d b9 2c 00 00 	lea    0x2cb9(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1367:	48 8d 35 b2 2c 00 00 	lea    0x2cb2(%rip),%rsi        # 4020 <stdout@GLIBC_2.2.5>
    136e:	48 29 fe             	sub    %rdi,%rsi
    1371:	48 89 f0             	mov    %rsi,%rax
    1374:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1378:	48 c1 f8 03          	sar    $0x3,%rax
    137c:	48 01 c6             	add    %rax,%rsi
    137f:	48 d1 fe             	sar    $1,%rsi
    1382:	74 14                	je     1398 <register_tm_clones+0x38>
    1384:	48 8b 05 4d 2c 00 00 	mov    0x2c4d(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    138b:	48 85 c0             	test   %rax,%rax
    138e:	74 08                	je     1398 <register_tm_clones+0x38>
    1390:	ff e0                	jmp    *%rax
    1392:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1398:	c3                   	ret
    1399:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000013a0 <__do_global_dtors_aux>:
    13a0:	f3 0f 1e fa          	endbr64
    13a4:	80 3d 7d 2c 00 00 00 	cmpb   $0x0,0x2c7d(%rip)        # 4028 <completed.0>
    13ab:	75 2b                	jne    13d8 <__do_global_dtors_aux+0x38>
    13ad:	55                   	push   %rbp
    13ae:	48 83 3d 2a 2c 00 00 00 	cmpq   $0x0,0x2c2a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    13b6:	48 89 e5             	mov    %rsp,%rbp
    13b9:	74 0c                	je     13c7 <__do_global_dtors_aux+0x27>
    13bb:	48 8b 3d 56 2c 00 00 	mov    0x2c56(%rip),%rdi        # 4018 <__dso_handle>
    13c2:	e8 89 fc ff ff       	call   1050 <__cxa_finalize@plt>
    13c7:	e8 64 ff ff ff       	call   1330 <deregister_tm_clones>
    13cc:	c6 05 55 2c 00 00 01 	movb   $0x1,0x2c55(%rip)        # 4028 <completed.0>
    13d3:	5d                   	pop    %rbp
    13d4:	c3                   	ret
    13d5:	0f 1f 00             	nopl   (%rax)
    13d8:	c3                   	ret
    13d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000013e0 <frame_dummy>:
    13e0:	f3 0f 1e fa          	endbr64
    13e4:	e9 77 ff ff ff       	jmp    1360 <register_tm_clones>
    13e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000013f0 <wm_add_v1.isra.0>:
    13f0:	89 f8                	mov    %edi,%eax
    13f2:	c3                   	ret

Disassembly of section .fini:

00000000000013f4 <_fini>:
    13f4:	48 83 ec 08          	sub    $0x8,%rsp
    13f8:	48 83 c4 08          	add    $0x8,%rsp
    13fc:	c3                   	ret
