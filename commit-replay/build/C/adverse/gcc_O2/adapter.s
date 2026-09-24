
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
    107a:	e8 c1 03 00 00       	call   1440 <wm_add_v2.isra.0>
    107f:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1083:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1087:	e8 b4 03 00 00       	call   1440 <wm_add_v2.isra.0>
    108c:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1090:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1094:	e8 a7 03 00 00       	call   1440 <wm_add_v2.isra.0>
    1099:	89 44 24 28          	mov    %eax,0x28(%rsp)
    109d:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10a1:	e8 9a 03 00 00       	call   1440 <wm_add_v2.isra.0>
    10a6:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10aa:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10ae:	e8 8d 03 00 00       	call   1440 <wm_add_v2.isra.0>
    10b3:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10b7:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10bb:	e8 80 03 00 00       	call   1440 <wm_add_v2.isra.0>
    10c0:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10c4:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10c8:	e8 73 03 00 00       	call   1440 <wm_add_v2.isra.0>
    10cd:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10d1:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10d5:	e8 66 03 00 00       	call   1440 <wm_add_v2.isra.0>
    10da:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10de:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10e2:	e8 59 03 00 00       	call   1440 <wm_add_v2.isra.0>
    10e7:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10eb:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10ef:	e8 4c 03 00 00       	call   1440 <wm_add_v2.isra.0>
    10f4:	89 44 24 28          	mov    %eax,0x28(%rsp)
    10f8:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    10fc:	e8 3f 03 00 00       	call   1440 <wm_add_v2.isra.0>
    1101:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1105:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1109:	e8 32 03 00 00       	call   1440 <wm_add_v2.isra.0>
    110e:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1112:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1116:	e8 25 03 00 00       	call   1440 <wm_add_v2.isra.0>
    111b:	89 44 24 28          	mov    %eax,0x28(%rsp)
    111f:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1123:	e8 18 03 00 00       	call   1440 <wm_add_v2.isra.0>
    1128:	89 44 24 28          	mov    %eax,0x28(%rsp)
    112c:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1130:	e8 0b 03 00 00       	call   1440 <wm_add_v2.isra.0>
    1135:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1139:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    113d:	e8 fe 02 00 00       	call   1440 <wm_add_v2.isra.0>
    1142:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1146:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    114a:	e8 f1 02 00 00       	call   1440 <wm_add_v2.isra.0>
    114f:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1153:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1157:	e8 e4 02 00 00       	call   1440 <wm_add_v2.isra.0>
    115c:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1160:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1164:	e8 d7 02 00 00       	call   1440 <wm_add_v2.isra.0>
    1169:	89 44 24 28          	mov    %eax,0x28(%rsp)
    116d:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1171:	e8 ca 02 00 00       	call   1440 <wm_add_v2.isra.0>
    1176:	89 44 24 28          	mov    %eax,0x28(%rsp)
    117a:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    117e:	e8 bd 02 00 00       	call   1440 <wm_add_v2.isra.0>
    1183:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1187:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    118b:	e8 b0 02 00 00       	call   1440 <wm_add_v2.isra.0>
    1190:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1194:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    1198:	e8 a3 02 00 00       	call   1440 <wm_add_v2.isra.0>
    119d:	89 44 24 28          	mov    %eax,0x28(%rsp)
    11a1:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    11a5:	e8 96 02 00 00       	call   1440 <wm_add_v2.isra.0>
    11aa:	89 44 24 28          	mov    %eax,0x28(%rsp)
    11ae:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    11b2:	e8 89 02 00 00       	call   1440 <wm_add_v2.isra.0>
    11b7:	89 44 24 28          	mov    %eax,0x28(%rsp)
    11bb:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    11bf:	e8 7c 02 00 00       	call   1440 <wm_add_v2.isra.0>
    11c4:	89 44 24 28          	mov    %eax,0x28(%rsp)
    11c8:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    11cc:	e8 6f 02 00 00       	call   1440 <wm_add_v2.isra.0>
    11d1:	89 44 24 28          	mov    %eax,0x28(%rsp)
    11d5:	8b 7c 24 28          	mov    0x28(%rsp),%edi
    11d9:	e8 62 02 00 00       	call   1440 <wm_add_v2.isra.0>
    11de:	89 44 24 28          	mov    %eax,0x28(%rsp)
    11e2:	8b 54 24 28          	mov    0x28(%rsp),%edx
    11e6:	b8 61 00 00 00       	mov    $0x61,%eax
    11eb:	83 fa ff             	cmp    $0xffffffff,%edx
    11ee:	0f 84 4d 01 00 00    	je     1341 <main+0x2e1>
    11f4:	48 8d 44 24 2c       	lea    0x2c(%rsp),%rax
    11f9:	c7 44 24 14 00 00 00 00 	movl   $0x0,0x14(%rsp)
    1201:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    1206:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    1210:	8b 44 24 14          	mov    0x14(%rsp),%eax
    1214:	83 f8 05             	cmp    $0x5,%eax
    1217:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
    121b:	0f 94 44 24 1b       	sete   0x1b(%rsp)
    1220:	83 c0 01             	add    $0x1,%eax
    1223:	45 31 e4             	xor    %r12d,%r12d
    1226:	89 44 24 14          	mov    %eax,0x14(%rsp)
    122a:	eb 58                	jmp    1284 <main+0x224>
    122c:	0f 1f 40 00          	nopl   0x0(%rax)
    1230:	89 da                	mov    %ebx,%edx
    1232:	83 f2 01             	xor    $0x1,%edx
    1235:	44 85 fa             	test   %r15d,%edx
    1238:	0f 84 9b 00 00 00    	je     12d9 <main+0x279>
    123e:	83 f0 01             	xor    $0x1,%eax
    1241:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    1246:	ba 04 00 00 00       	mov    $0x4,%edx
    124b:	48 8b 0d ce 2d 00 00 	mov    0x2dce(%rip),%rcx        # 4020 <stdout@GLIBC_2.2.5>
    1252:	66 89 44 24 2c       	mov    %ax,0x2c(%rsp)
    1257:	be 01 00 00 00       	mov    $0x1,%esi
    125c:	c1 e8 10             	shr    $0x10,%eax
    125f:	88 44 24 2e          	mov    %al,0x2e(%rsp)
    1263:	c6 44 24 2f 00       	movb   $0x0,0x2f(%rsp)
    1268:	e8 d3 fd ff ff       	call   1040 <fwrite@plt>
    126d:	8d 43 01             	lea    0x1(%rbx),%eax
    1270:	bb 01 00 00 00       	mov    $0x1,%ebx
    1275:	83 f8 02             	cmp    $0x2,%eax
    1278:	75 2e                	jne    12a8 <main+0x248>
    127a:	41 83 fc 06          	cmp    $0x6,%r12d
    127e:	0f 84 9c 00 00 00    	je     1320 <main+0x2c0>
    1284:	44 39 64 24 1c       	cmp    %r12d,0x1c(%rsp)
    1289:	0f 92 44 24 1a       	setb   0x1a(%rsp)
    128e:	41 83 fc 02          	cmp    $0x2,%r12d
    1292:	40 0f 94 c5          	sete   %bpl
    1296:	41 83 c4 01          	add    $0x1,%r12d
    129a:	40 22 6c 24 1b       	and    0x1b(%rsp),%bpl
    129f:	31 db                	xor    %ebx,%ebx
    12a1:	45 89 e6             	mov    %r12d,%r14d
    12a4:	41 c1 e6 04          	shl    $0x4,%r14d
    12a8:	44 0f b6 6c 24 1a    	movzbl 0x1a(%rsp),%r13d
    12ae:	45 31 ff             	xor    %r15d,%r15d
    12b1:	41 09 dd             	or     %ebx,%r13d
    12b4:	31 c0                	xor    %eax,%eax
    12b6:	45 84 ed             	test   %r13b,%r13b
    12b9:	75 15                	jne    12d0 <main+0x270>
    12bb:	8b 4c 24 14          	mov    0x14(%rsp),%ecx
    12bf:	41 8d 47 01          	lea    0x1(%r15),%eax
    12c3:	c1 e0 08             	shl    $0x8,%eax
    12c6:	09 c8                	or     %ecx,%eax
    12c8:	44 09 f0             	or     %r14d,%eax
    12cb:	0d 00 00 5a 00       	or     $0x5a0000,%eax
    12d0:	40 84 ed             	test   %bpl,%bpl
    12d3:	0f 85 57 ff ff ff    	jne    1230 <main+0x1d0>
    12d9:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    12de:	66 89 44 24 2c       	mov    %ax,0x2c(%rsp)
    12e3:	ba 04 00 00 00       	mov    $0x4,%edx
    12e8:	c1 e8 10             	shr    $0x10,%eax
    12eb:	48 8b 0d 2e 2d 00 00 	mov    0x2d2e(%rip),%rcx        # 4020 <stdout@GLIBC_2.2.5>
    12f2:	be 01 00 00 00       	mov    $0x1,%esi
    12f7:	88 44 24 2e          	mov    %al,0x2e(%rsp)
    12fb:	c6 44 24 2f 00       	movb   $0x0,0x2f(%rsp)
    1300:	e8 3b fd ff ff       	call   1040 <fwrite@plt>
    1305:	41 8d 47 01          	lea    0x1(%r15),%eax
    1309:	41 bf 01 00 00 00    	mov    $0x1,%r15d
    130f:	83 f8 02             	cmp    $0x2,%eax
    1312:	75 a0                	jne    12b4 <main+0x254>
    1314:	e9 54 ff ff ff       	jmp    126d <main+0x20d>
    1319:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1320:	83 7c 24 14 06       	cmpl   $0x6,0x14(%rsp)
    1325:	0f 85 e5 fe ff ff    	jne    1210 <main+0x1b0>
    132b:	48 8b 3d ee 2c 00 00 	mov    0x2cee(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1332:	e8 f9 fc ff ff       	call   1030 <ferror@plt>
    1337:	85 c0                	test   %eax,%eax
    1339:	0f 95 c0             	setne  %al
    133c:	0f b6 c0             	movzbl %al,%eax
    133f:	01 c0                	add    %eax,%eax
    1341:	48 83 c4 38          	add    $0x38,%rsp
    1345:	5b                   	pop    %rbx
    1346:	5d                   	pop    %rbp
    1347:	41 5c                	pop    %r12
    1349:	41 5d                	pop    %r13
    134b:	41 5e                	pop    %r14
    134d:	41 5f                	pop    %r15
    134f:	c3                   	ret

0000000000001350 <_start>:
    1350:	31 ed                	xor    %ebp,%ebp
    1352:	49 89 d1             	mov    %rdx,%r9
    1355:	5e                   	pop    %rsi
    1356:	48 89 e2             	mov    %rsp,%rdx
    1359:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    135d:	50                   	push   %rax
    135e:	54                   	push   %rsp
    135f:	45 31 c0             	xor    %r8d,%r8d
    1362:	31 c9                	xor    %ecx,%ecx
    1364:	48 8d 3d f5 fc ff ff 	lea    -0x30b(%rip),%rdi        # 1060 <main>
    136b:	ff 15 4f 2c 00 00    	call   *0x2c4f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1371:	f4                   	hlt
    1372:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    137c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001380 <deregister_tm_clones>:
    1380:	48 8d 3d 99 2c 00 00 	lea    0x2c99(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1387:	48 8d 05 92 2c 00 00 	lea    0x2c92(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    138e:	48 39 f8             	cmp    %rdi,%rax
    1391:	74 15                	je     13a8 <deregister_tm_clones+0x28>
    1393:	48 8b 05 2e 2c 00 00 	mov    0x2c2e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    139a:	48 85 c0             	test   %rax,%rax
    139d:	74 09                	je     13a8 <deregister_tm_clones+0x28>
    139f:	ff e0                	jmp    *%rax
    13a1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    13a8:	c3                   	ret
    13a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000013b0 <register_tm_clones>:
    13b0:	48 8d 3d 69 2c 00 00 	lea    0x2c69(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    13b7:	48 8d 35 62 2c 00 00 	lea    0x2c62(%rip),%rsi        # 4020 <stdout@GLIBC_2.2.5>
    13be:	48 29 fe             	sub    %rdi,%rsi
    13c1:	48 89 f0             	mov    %rsi,%rax
    13c4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    13c8:	48 c1 f8 03          	sar    $0x3,%rax
    13cc:	48 01 c6             	add    %rax,%rsi
    13cf:	48 d1 fe             	sar    $1,%rsi
    13d2:	74 14                	je     13e8 <register_tm_clones+0x38>
    13d4:	48 8b 05 fd 2b 00 00 	mov    0x2bfd(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    13db:	48 85 c0             	test   %rax,%rax
    13de:	74 08                	je     13e8 <register_tm_clones+0x38>
    13e0:	ff e0                	jmp    *%rax
    13e2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    13e8:	c3                   	ret
    13e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000013f0 <__do_global_dtors_aux>:
    13f0:	f3 0f 1e fa          	endbr64
    13f4:	80 3d 2d 2c 00 00 00 	cmpb   $0x0,0x2c2d(%rip)        # 4028 <completed.0>
    13fb:	75 2b                	jne    1428 <__do_global_dtors_aux+0x38>
    13fd:	55                   	push   %rbp
    13fe:	48 83 3d da 2b 00 00 00 	cmpq   $0x0,0x2bda(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1406:	48 89 e5             	mov    %rsp,%rbp
    1409:	74 0c                	je     1417 <__do_global_dtors_aux+0x27>
    140b:	48 8b 3d 06 2c 00 00 	mov    0x2c06(%rip),%rdi        # 4018 <__dso_handle>
    1412:	e8 39 fc ff ff       	call   1050 <__cxa_finalize@plt>
    1417:	e8 64 ff ff ff       	call   1380 <deregister_tm_clones>
    141c:	c6 05 05 2c 00 00 01 	movb   $0x1,0x2c05(%rip)        # 4028 <completed.0>
    1423:	5d                   	pop    %rbp
    1424:	c3                   	ret
    1425:	0f 1f 00             	nopl   (%rax)
    1428:	c3                   	ret
    1429:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001430 <frame_dummy>:
    1430:	f3 0f 1e fa          	endbr64
    1434:	e9 77 ff ff ff       	jmp    13b0 <register_tm_clones>
    1439:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001440 <wm_add_v2.isra.0>:
    1440:	89 f8                	mov    %edi,%eax
    1442:	c3                   	ret

Disassembly of section .fini:

0000000000001444 <_fini>:
    1444:	48 83 ec 08          	sub    $0x8,%rsp
    1448:	48 83 c4 08          	add    $0x8,%rsp
    144c:	c3                   	ret
