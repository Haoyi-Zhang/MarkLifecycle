
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
    123d:	83 f8 ff             	cmp    $0xffffffff,%eax
    1240:	0f 84 35 02 00 00    	je     147b <main+0x32b>
    1246:	31 d2                	xor    %edx,%edx
    1248:	41 bd 71 80 07 80    	mov    $0x80078071,%r13d
    124e:	be 55 00 00 00       	mov    $0x55,%esi
    1253:	eb 20                	jmp    1275 <main+0x125>
    1255:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1260:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
    1265:	ff c2                	inc    %edx
    1267:	83 fa 04             	cmp    $0x4,%edx
    126a:	be 55 00 00 00       	mov    $0x55,%esi
    126f:	0f 84 ea 01 00 00    	je     145f <main+0x30f>
    1275:	31 c0                	xor    %eax,%eax
    1277:	eb 1a                	jmp    1293 <main+0x143>
    1279:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1280:	89 c1                	mov    %eax,%ecx
    1282:	f6 d1                	not    %cl
    1284:	88 4c 04 30          	mov    %cl,0x30(%rsp,%rax,1)
    1288:	48 ff c0             	inc    %rax
    128b:	48 3d 00 01 00 00    	cmp    $0x100,%rax
    1291:	74 3d                	je     12d0 <main+0x180>
    1293:	83 fa 02             	cmp    $0x2,%edx
    1296:	74 18                	je     12b0 <main+0x160>
    1298:	83 fa 01             	cmp    $0x1,%edx
    129b:	74 e3                	je     1280 <main+0x130>
    129d:	85 d2                	test   %edx,%edx
    129f:	75 1f                	jne    12c0 <main+0x170>
    12a1:	89 c1                	mov    %eax,%ecx
    12a3:	eb df                	jmp    1284 <main+0x134>
    12a5:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    12b0:	89 c1                	mov    %eax,%ecx
    12b2:	c1 e1 04             	shl    $0x4,%ecx
    12b5:	01 c1                	add    %eax,%ecx
    12b7:	80 c1 1f             	add    $0x1f,%cl
    12ba:	eb c8                	jmp    1284 <main+0x134>
    12bc:	0f 1f 40 00          	nopl   0x0(%rax)
    12c0:	a8 01                	test   $0x1,%al
    12c2:	b9 aa 00 00 00       	mov    $0xaa,%ecx
    12c7:	0f 44 ce             	cmove  %esi,%ecx
    12ca:	eb b8                	jmp    1284 <main+0x134>
    12cc:	0f 1f 40 00          	nopl   0x0(%rax)
    12d0:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
    12d5:	0f b6 44 24 30       	movzbl 0x30(%rsp),%eax
    12da:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    12df:	31 c9                	xor    %ecx,%ecx
    12e1:	eb 1f                	jmp    1302 <main+0x1b2>
    12e3:	66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    12f0:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    12f5:	48 ff c1             	inc    %rcx
    12f8:	48 83 f9 04          	cmp    $0x4,%rcx
    12fc:	0f 84 5e ff ff ff    	je     1260 <main+0x110>
    1302:	48 8d 05 07 0d 00 00 	lea    0xd07(%rip),%rax        # 2010 <_IO_stdin_used+0x10>
    1309:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
    130e:	44 8b 3c 88          	mov    (%rax,%rcx,4),%r15d
    1312:	41 0f b7 ef          	movzwl %r15w,%ebp
    1316:	41 c1 ef 10          	shr    $0x10,%r15d
    131a:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
    131f:	44 8d 34 28          	lea    (%rax,%rbp,1),%r14d
    1323:	43 8d 0c 3e          	lea    (%r14,%r15,1),%ecx
    1327:	49 69 c6 1f 00 02 00 	imul   $0x2001f,%r14,%rax
    132e:	48 c1 e8 21          	shr    $0x21,%rax
    1332:	69 c0 f1 ff 00 00    	imul   $0xfff1,%eax,%eax
    1338:	41 29 c6             	sub    %eax,%r14d
    133b:	48 69 c1 3d 00 04 00 	imul   $0x4003d,%rcx,%rax
    1342:	48 c1 e8 22          	shr    $0x22,%rax
    1346:	69 c0 f1 ff 00 00    	imul   $0xfff1,%eax,%eax
    134c:	29 c1                	sub    %eax,%ecx
    134e:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
    1353:	45 31 e4             	xor    %r12d,%r12d
    1356:	eb 46                	jmp    139e <main+0x24e>
    1358:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    1360:	88 5c 24 0c          	mov    %bl,0xc(%rsp)
    1364:	88 7c 24 0d          	mov    %bh,0xd(%rsp)
    1368:	88 54 24 0e          	mov    %dl,0xe(%rsp)
    136c:	88 74 24 0f          	mov    %dh,0xf(%rsp)
    1370:	48 8b 05 51 2c 00 00 	mov    0x2c51(%rip),%rax        # 3fc8 <stdout@GLIBC_2.2.5>
    1377:	48 8b 08             	mov    (%rax),%rcx
    137a:	be 01 00 00 00       	mov    $0x1,%esi
    137f:	ba 04 00 00 00       	mov    $0x4,%edx
    1384:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
    1389:	e8 b2 fc ff ff       	call   1040 <fwrite@plt>
    138e:	49 ff c4             	inc    %r12
    1391:	49 81 fc 01 01 00 00 	cmp    $0x101,%r12
    1398:	0f 84 52 ff ff ff    	je     12f0 <main+0x1a0>
    139e:	89 eb                	mov    %ebp,%ebx
    13a0:	44 89 fa             	mov    %r15d,%edx
    13a3:	4d 85 e4             	test   %r12,%r12
    13a6:	74 b8                	je     1360 <main+0x210>
    13a8:	44 89 ff             	mov    %r15d,%edi
    13ab:	41 89 e8             	mov    %ebp,%r8d
    13ae:	4c 89 e0             	mov    %r12,%rax
    13b1:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
    13b6:	41 f6 c4 01          	test   $0x1,%r12b
    13ba:	74 14                	je     13d0 <main+0x280>
    13bc:	49 8d 44 24 ff       	lea    -0x1(%r12),%rax
    13c1:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    13c6:	89 cf                	mov    %ecx,%edi
    13c8:	45 89 f0             	mov    %r14d,%r8d
    13cb:	48 8d 4c 24 31       	lea    0x31(%rsp),%rcx
    13d0:	44 89 f3             	mov    %r14d,%ebx
    13d3:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    13d8:	49 83 fc 01          	cmp    $0x1,%r12
    13dc:	74 82                	je     1360 <main+0x210>
    13de:	31 f6                	xor    %esi,%esi
    13e0:	89 fa                	mov    %edi,%edx
    13e2:	44 89 c3             	mov    %r8d,%ebx
    13e5:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    13f0:	0f b6 3c 31          	movzbl (%rcx,%rsi,1),%edi
    13f4:	01 df                	add    %ebx,%edi
    13f6:	01 fa                	add    %edi,%edx
    13f8:	49 89 f8             	mov    %rdi,%r8
    13fb:	4d 0f af c5          	imul   %r13,%r8
    13ff:	49 c1 e8 2f          	shr    $0x2f,%r8
    1403:	45 69 c0 f1 ff 00 00 	imul   $0xfff1,%r8d,%r8d
    140a:	44 29 c7             	sub    %r8d,%edi
    140d:	49 89 d0             	mov    %rdx,%r8
    1410:	4d 0f af c5          	imul   %r13,%r8
    1414:	49 c1 e8 2f          	shr    $0x2f,%r8
    1418:	45 69 c0 f1 ff 00 00 	imul   $0xfff1,%r8d,%r8d
    141f:	44 29 c2             	sub    %r8d,%edx
    1422:	0f b6 5c 31 01       	movzbl 0x1(%rcx,%rsi,1),%ebx
    1427:	01 fb                	add    %edi,%ebx
    1429:	01 da                	add    %ebx,%edx
    142b:	48 69 fb 1f 00 02 00 	imul   $0x2001f,%rbx,%rdi
    1432:	48 c1 ef 21          	shr    $0x21,%rdi
    1436:	69 ff f1 ff 00 00    	imul   $0xfff1,%edi,%edi
    143c:	29 fb                	sub    %edi,%ebx
    143e:	48 69 fa 3d 00 04 00 	imul   $0x4003d,%rdx,%rdi
    1445:	48 c1 ef 22          	shr    $0x22,%rdi
    1449:	69 ff f1 ff 00 00    	imul   $0xfff1,%edi,%edi
    144f:	29 fa                	sub    %edi,%edx
    1451:	48 83 c6 02          	add    $0x2,%rsi
    1455:	48 39 f0             	cmp    %rsi,%rax
    1458:	75 96                	jne    13f0 <main+0x2a0>
    145a:	e9 01 ff ff ff       	jmp    1360 <main+0x210>
    145f:	48 8b 05 62 2b 00 00 	mov    0x2b62(%rip),%rax        # 3fc8 <stdout@GLIBC_2.2.5>
    1466:	48 8b 38             	mov    (%rax),%rdi
    1469:	e8 c2 fb ff ff       	call   1030 <ferror@plt>
    146e:	89 c1                	mov    %eax,%ecx
    1470:	31 c0                	xor    %eax,%eax
    1472:	85 c9                	test   %ecx,%ecx
    1474:	0f 95 c0             	setne  %al
    1477:	01 c0                	add    %eax,%eax
    1479:	eb 05                	jmp    1480 <main+0x330>
    147b:	b8 61 00 00 00       	mov    $0x61,%eax
    1480:	48 81 c4 38 01 00 00 	add    $0x138,%rsp
    1487:	5b                   	pop    %rbx
    1488:	41 5c                	pop    %r12
    148a:	41 5d                	pop    %r13
    148c:	41 5e                	pop    %r14
    148e:	41 5f                	pop    %r15
    1490:	5d                   	pop    %rbp
    1491:	c3                   	ret

Disassembly of section .fini:

0000000000001494 <_fini>:
    1494:	48 83 ec 08          	sub    $0x8,%rsp
    1498:	48 83 c4 08          	add    $0x8,%rsp
    149c:	c3                   	ret
