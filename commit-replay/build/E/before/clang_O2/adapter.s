
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

0000000000001060 <_start>:
    1060:	31 ed                	xor    %ebp,%ebp
    1062:	49 89 d1             	mov    %rdx,%r9
    1065:	5e                   	pop    %rsi
    1066:	48 89 e2             	mov    %rsp,%rdx
    1069:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    106d:	50                   	push   %rax
    106e:	54                   	push   %rsp
    106f:	45 31 c0             	xor    %r8d,%r8d
    1072:	31 c9                	xor    %ecx,%ecx
    1074:	48 8d 3d d5 00 00 00 	lea    0xd5(%rip),%rdi        # 1150 <main>
    107b:	ff 15 37 2f 00 00    	call   *0x2f37(%rip)        # 3fb8 <__libc_start_main@GLIBC_2.34>
    1081:	f4                   	hlt
    1082:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    108c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001090 <deregister_tm_clones>:
    1090:	48 8d 3d 89 2f 00 00 	lea    0x2f89(%rip),%rdi        # 4020 <__TMC_END__>
    1097:	48 8d 05 82 2f 00 00 	lea    0x2f82(%rip),%rax        # 4020 <__TMC_END__>
    109e:	48 39 f8             	cmp    %rdi,%rax
    10a1:	74 15                	je     10b8 <deregister_tm_clones+0x28>
    10a3:	48 8b 05 16 2f 00 00 	mov    0x2f16(%rip),%rax        # 3fc0 <_ITM_deregisterTMCloneTable@Base>
    10aa:	48 85 c0             	test   %rax,%rax
    10ad:	74 09                	je     10b8 <deregister_tm_clones+0x28>
    10af:	ff e0                	jmp    *%rax
    10b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10b8:	c3                   	ret
    10b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010c0 <register_tm_clones>:
    10c0:	48 8d 3d 59 2f 00 00 	lea    0x2f59(%rip),%rdi        # 4020 <__TMC_END__>
    10c7:	48 8d 35 52 2f 00 00 	lea    0x2f52(%rip),%rsi        # 4020 <__TMC_END__>
    10ce:	48 29 fe             	sub    %rdi,%rsi
    10d1:	48 89 f0             	mov    %rsi,%rax
    10d4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    10d8:	48 c1 f8 03          	sar    $0x3,%rax
    10dc:	48 01 c6             	add    %rax,%rsi
    10df:	48 d1 fe             	sar    $1,%rsi
    10e2:	74 14                	je     10f8 <register_tm_clones+0x38>
    10e4:	48 8b 05 ed 2e 00 00 	mov    0x2eed(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    10eb:	48 85 c0             	test   %rax,%rax
    10ee:	74 08                	je     10f8 <register_tm_clones+0x38>
    10f0:	ff e0                	jmp    *%rax
    10f2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    10f8:	c3                   	ret
    10f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001100 <__do_global_dtors_aux>:
    1100:	f3 0f 1e fa          	endbr64
    1104:	80 3d 15 2f 00 00 00 	cmpb   $0x0,0x2f15(%rip)        # 4020 <__TMC_END__>
    110b:	75 2b                	jne    1138 <__do_global_dtors_aux+0x38>
    110d:	55                   	push   %rbp
    110e:	48 83 3d ca 2e 00 00 00 	cmpq   $0x0,0x2eca(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1116:	48 89 e5             	mov    %rsp,%rbp
    1119:	74 0c                	je     1127 <__do_global_dtors_aux+0x27>
    111b:	48 8b 3d f6 2e 00 00 	mov    0x2ef6(%rip),%rdi        # 4018 <__dso_handle>
    1122:	e8 29 ff ff ff       	call   1050 <__cxa_finalize@plt>
    1127:	e8 64 ff ff ff       	call   1090 <deregister_tm_clones>
    112c:	c6 05 ed 2e 00 00 01 	movb   $0x1,0x2eed(%rip)        # 4020 <__TMC_END__>
    1133:	5d                   	pop    %rbp
    1134:	c3                   	ret
    1135:	0f 1f 00             	nopl   (%rax)
    1138:	c3                   	ret
    1139:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001140 <frame_dummy>:
    1140:	f3 0f 1e fa          	endbr64
    1144:	e9 77 ff ff ff       	jmp    10c0 <register_tm_clones>
    1149:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001150 <main>:
    1150:	55                   	push   %rbp
    1151:	41 57                	push   %r15
    1153:	41 56                	push   %r14
    1155:	41 55                	push   %r13
    1157:	41 54                	push   %r12
    1159:	53                   	push   %rbx
    115a:	48 81 ec 38 01 00 00 	sub    $0x138,%rsp
    1161:	c7 44 24 08 f5 79 2b 6d 	movl   $0x6d2b79f5,0x8(%rsp)
    1169:	8b 44 24 08          	mov    0x8(%rsp),%eax
    116d:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1171:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1175:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1179:	8b 44 24 08          	mov    0x8(%rsp),%eax
    117d:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1181:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1185:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1189:	8b 44 24 08          	mov    0x8(%rsp),%eax
    118d:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1191:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1195:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1199:	8b 44 24 08          	mov    0x8(%rsp),%eax
    119d:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11a1:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11a5:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11a9:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11ad:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11b1:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11b5:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11b9:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11bd:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11c1:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11c5:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11c9:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11cd:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11d1:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11d5:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11d9:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11dd:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11e1:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11e5:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11e9:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11ed:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11f1:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11f5:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11f9:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11fd:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1201:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1205:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1209:	8b 44 24 08          	mov    0x8(%rsp),%eax
    120d:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1211:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1215:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1219:	8b 44 24 08          	mov    0x8(%rsp),%eax
    121d:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1221:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1225:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1229:	8b 44 24 08          	mov    0x8(%rsp),%eax
    122d:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1231:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1235:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1239:	8b 44 24 08          	mov    0x8(%rsp),%eax
    123d:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1241:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1245:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1249:	8b 44 24 08          	mov    0x8(%rsp),%eax
    124d:	83 f8 ff             	cmp    $0xffffffff,%eax
    1250:	0f 84 35 02 00 00    	je     148b <main+0x33b>
    1256:	31 d2                	xor    %edx,%edx
    1258:	41 bd 71 80 07 80    	mov    $0x80078071,%r13d
    125e:	be 55 00 00 00       	mov    $0x55,%esi
    1263:	eb 20                	jmp    1285 <main+0x135>
    1265:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1270:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
    1275:	ff c2                	inc    %edx
    1277:	83 fa 04             	cmp    $0x4,%edx
    127a:	be 55 00 00 00       	mov    $0x55,%esi
    127f:	0f 84 ea 01 00 00    	je     146f <main+0x31f>
    1285:	31 c0                	xor    %eax,%eax
    1287:	eb 1a                	jmp    12a3 <main+0x153>
    1289:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1290:	89 c1                	mov    %eax,%ecx
    1292:	f6 d1                	not    %cl
    1294:	88 4c 04 30          	mov    %cl,0x30(%rsp,%rax,1)
    1298:	48 ff c0             	inc    %rax
    129b:	48 3d 00 01 00 00    	cmp    $0x100,%rax
    12a1:	74 3d                	je     12e0 <main+0x190>
    12a3:	83 fa 02             	cmp    $0x2,%edx
    12a6:	74 18                	je     12c0 <main+0x170>
    12a8:	83 fa 01             	cmp    $0x1,%edx
    12ab:	74 e3                	je     1290 <main+0x140>
    12ad:	85 d2                	test   %edx,%edx
    12af:	75 1f                	jne    12d0 <main+0x180>
    12b1:	89 c1                	mov    %eax,%ecx
    12b3:	eb df                	jmp    1294 <main+0x144>
    12b5:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    12c0:	89 c1                	mov    %eax,%ecx
    12c2:	c1 e1 04             	shl    $0x4,%ecx
    12c5:	01 c1                	add    %eax,%ecx
    12c7:	80 c1 1f             	add    $0x1f,%cl
    12ca:	eb c8                	jmp    1294 <main+0x144>
    12cc:	0f 1f 40 00          	nopl   0x0(%rax)
    12d0:	a8 01                	test   $0x1,%al
    12d2:	b9 aa 00 00 00       	mov    $0xaa,%ecx
    12d7:	0f 44 ce             	cmove  %esi,%ecx
    12da:	eb b8                	jmp    1294 <main+0x144>
    12dc:	0f 1f 40 00          	nopl   0x0(%rax)
    12e0:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
    12e5:	0f b6 44 24 30       	movzbl 0x30(%rsp),%eax
    12ea:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    12ef:	31 c9                	xor    %ecx,%ecx
    12f1:	eb 1f                	jmp    1312 <main+0x1c2>
    12f3:	66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1300:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    1305:	48 ff c1             	inc    %rcx
    1308:	48 83 f9 04          	cmp    $0x4,%rcx
    130c:	0f 84 5e ff ff ff    	je     1270 <main+0x120>
    1312:	48 8d 05 f7 0c 00 00 	lea    0xcf7(%rip),%rax        # 2010 <_IO_stdin_used+0x10>
    1319:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
    131e:	44 8b 3c 88          	mov    (%rax,%rcx,4),%r15d
    1322:	41 0f b7 ef          	movzwl %r15w,%ebp
    1326:	41 c1 ef 10          	shr    $0x10,%r15d
    132a:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
    132f:	44 8d 34 28          	lea    (%rax,%rbp,1),%r14d
    1333:	43 8d 0c 3e          	lea    (%r14,%r15,1),%ecx
    1337:	49 69 c6 1f 00 02 00 	imul   $0x2001f,%r14,%rax
    133e:	48 c1 e8 21          	shr    $0x21,%rax
    1342:	69 c0 f1 ff 00 00    	imul   $0xfff1,%eax,%eax
    1348:	41 29 c6             	sub    %eax,%r14d
    134b:	48 69 c1 3d 00 04 00 	imul   $0x4003d,%rcx,%rax
    1352:	48 c1 e8 22          	shr    $0x22,%rax
    1356:	69 c0 f1 ff 00 00    	imul   $0xfff1,%eax,%eax
    135c:	29 c1                	sub    %eax,%ecx
    135e:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
    1363:	45 31 e4             	xor    %r12d,%r12d
    1366:	eb 46                	jmp    13ae <main+0x25e>
    1368:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    1370:	88 5c 24 0c          	mov    %bl,0xc(%rsp)
    1374:	88 7c 24 0d          	mov    %bh,0xd(%rsp)
    1378:	88 54 24 0e          	mov    %dl,0xe(%rsp)
    137c:	88 74 24 0f          	mov    %dh,0xf(%rsp)
    1380:	48 8b 05 41 2c 00 00 	mov    0x2c41(%rip),%rax        # 3fc8 <stdout@GLIBC_2.2.5>
    1387:	48 8b 08             	mov    (%rax),%rcx
    138a:	be 01 00 00 00       	mov    $0x1,%esi
    138f:	ba 04 00 00 00       	mov    $0x4,%edx
    1394:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
    1399:	e8 a2 fc ff ff       	call   1040 <fwrite@plt>
    139e:	49 ff c4             	inc    %r12
    13a1:	49 81 fc 01 01 00 00 	cmp    $0x101,%r12
    13a8:	0f 84 52 ff ff ff    	je     1300 <main+0x1b0>
    13ae:	89 eb                	mov    %ebp,%ebx
    13b0:	44 89 fa             	mov    %r15d,%edx
    13b3:	4d 85 e4             	test   %r12,%r12
    13b6:	74 b8                	je     1370 <main+0x220>
    13b8:	44 89 ff             	mov    %r15d,%edi
    13bb:	41 89 e8             	mov    %ebp,%r8d
    13be:	4c 89 e0             	mov    %r12,%rax
    13c1:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
    13c6:	41 f6 c4 01          	test   $0x1,%r12b
    13ca:	74 14                	je     13e0 <main+0x290>
    13cc:	49 8d 44 24 ff       	lea    -0x1(%r12),%rax
    13d1:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    13d6:	89 cf                	mov    %ecx,%edi
    13d8:	45 89 f0             	mov    %r14d,%r8d
    13db:	48 8d 4c 24 31       	lea    0x31(%rsp),%rcx
    13e0:	44 89 f3             	mov    %r14d,%ebx
    13e3:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    13e8:	49 83 fc 01          	cmp    $0x1,%r12
    13ec:	74 82                	je     1370 <main+0x220>
    13ee:	31 f6                	xor    %esi,%esi
    13f0:	89 fa                	mov    %edi,%edx
    13f2:	44 89 c3             	mov    %r8d,%ebx
    13f5:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1400:	0f b6 3c 31          	movzbl (%rcx,%rsi,1),%edi
    1404:	01 df                	add    %ebx,%edi
    1406:	01 fa                	add    %edi,%edx
    1408:	49 89 f8             	mov    %rdi,%r8
    140b:	4d 0f af c5          	imul   %r13,%r8
    140f:	49 c1 e8 2f          	shr    $0x2f,%r8
    1413:	45 69 c0 f1 ff 00 00 	imul   $0xfff1,%r8d,%r8d
    141a:	44 29 c7             	sub    %r8d,%edi
    141d:	49 89 d0             	mov    %rdx,%r8
    1420:	4d 0f af c5          	imul   %r13,%r8
    1424:	49 c1 e8 2f          	shr    $0x2f,%r8
    1428:	45 69 c0 f1 ff 00 00 	imul   $0xfff1,%r8d,%r8d
    142f:	44 29 c2             	sub    %r8d,%edx
    1432:	0f b6 5c 31 01       	movzbl 0x1(%rcx,%rsi,1),%ebx
    1437:	01 fb                	add    %edi,%ebx
    1439:	01 da                	add    %ebx,%edx
    143b:	48 69 fb 1f 00 02 00 	imul   $0x2001f,%rbx,%rdi
    1442:	48 c1 ef 21          	shr    $0x21,%rdi
    1446:	69 ff f1 ff 00 00    	imul   $0xfff1,%edi,%edi
    144c:	29 fb                	sub    %edi,%ebx
    144e:	48 69 fa 3d 00 04 00 	imul   $0x4003d,%rdx,%rdi
    1455:	48 c1 ef 22          	shr    $0x22,%rdi
    1459:	69 ff f1 ff 00 00    	imul   $0xfff1,%edi,%edi
    145f:	29 fa                	sub    %edi,%edx
    1461:	48 83 c6 02          	add    $0x2,%rsi
    1465:	48 39 f0             	cmp    %rsi,%rax
    1468:	75 96                	jne    1400 <main+0x2b0>
    146a:	e9 01 ff ff ff       	jmp    1370 <main+0x220>
    146f:	48 8b 05 52 2b 00 00 	mov    0x2b52(%rip),%rax        # 3fc8 <stdout@GLIBC_2.2.5>
    1476:	48 8b 38             	mov    (%rax),%rdi
    1479:	e8 b2 fb ff ff       	call   1030 <ferror@plt>
    147e:	89 c1                	mov    %eax,%ecx
    1480:	31 c0                	xor    %eax,%eax
    1482:	85 c9                	test   %ecx,%ecx
    1484:	0f 95 c0             	setne  %al
    1487:	01 c0                	add    %eax,%eax
    1489:	eb 05                	jmp    1490 <main+0x340>
    148b:	b8 61 00 00 00       	mov    $0x61,%eax
    1490:	48 81 c4 38 01 00 00 	add    $0x138,%rsp
    1497:	5b                   	pop    %rbx
    1498:	41 5c                	pop    %r12
    149a:	41 5d                	pop    %r13
    149c:	41 5e                	pop    %r14
    149e:	41 5f                	pop    %r15
    14a0:	5d                   	pop    %rbp
    14a1:	c3                   	ret

Disassembly of section .fini:

00000000000014a4 <_fini>:
    14a4:	48 83 ec 08          	sub    $0x8,%rsp
    14a8:	48 83 c4 08          	add    $0x8,%rsp
    14ac:	c3                   	ret
