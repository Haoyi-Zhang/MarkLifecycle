
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
    115a:	48 81 ec 28 01 00 00 	sub    $0x128,%rsp
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
    1258:	4c 8b 3d 69 2d 00 00 	mov    0x2d69(%rip),%r15        # 3fc8 <stdout@GLIBC_2.2.5>
    125f:	48 8d 5c 24 0c       	lea    0xc(%rsp),%rbx
    1264:	41 bd 71 80 07 80    	mov    $0x80078071,%r13d
    126a:	be 55 00 00 00       	mov    $0x55,%esi
    126f:	eb 24                	jmp    1295 <main+0x145>
    1271:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1280:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    1285:	ff c2                	inc    %edx
    1287:	83 fa 04             	cmp    $0x4,%edx
    128a:	be 55 00 00 00       	mov    $0x55,%esi
    128f:	0f 84 e1 01 00 00    	je     1476 <main+0x326>
    1295:	31 c0                	xor    %eax,%eax
    1297:	eb 1a                	jmp    12b3 <main+0x163>
    1299:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    12a0:	89 c1                	mov    %eax,%ecx
    12a2:	f6 d1                	not    %cl
    12a4:	88 4c 04 20          	mov    %cl,0x20(%rsp,%rax,1)
    12a8:	48 ff c0             	inc    %rax
    12ab:	48 3d 00 01 00 00    	cmp    $0x100,%rax
    12b1:	74 3d                	je     12f0 <main+0x1a0>
    12b3:	83 fa 02             	cmp    $0x2,%edx
    12b6:	74 18                	je     12d0 <main+0x180>
    12b8:	83 fa 01             	cmp    $0x1,%edx
    12bb:	74 e3                	je     12a0 <main+0x150>
    12bd:	85 d2                	test   %edx,%edx
    12bf:	75 1f                	jne    12e0 <main+0x190>
    12c1:	89 c1                	mov    %eax,%ecx
    12c3:	eb df                	jmp    12a4 <main+0x154>
    12c5:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    12d0:	89 c1                	mov    %eax,%ecx
    12d2:	c1 e1 04             	shl    $0x4,%ecx
    12d5:	01 c1                	add    %eax,%ecx
    12d7:	80 c1 1f             	add    $0x1f,%cl
    12da:	eb c8                	jmp    12a4 <main+0x154>
    12dc:	0f 1f 40 00          	nopl   0x0(%rax)
    12e0:	a8 01                	test   $0x1,%al
    12e2:	b9 aa 00 00 00       	mov    $0xaa,%ecx
    12e7:	0f 44 ce             	cmove  %esi,%ecx
    12ea:	eb b8                	jmp    12a4 <main+0x154>
    12ec:	0f 1f 40 00          	nopl   0x0(%rax)
    12f0:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
    12f5:	31 c9                	xor    %ecx,%ecx
    12f7:	eb 19                	jmp    1312 <main+0x1c2>
    12f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1300:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    1305:	48 ff c1             	inc    %rcx
    1308:	48 83 f9 04          	cmp    $0x4,%rcx
    130c:	0f 84 6e ff ff ff    	je     1280 <main+0x130>
    1312:	48 8d 05 f7 0c 00 00 	lea    0xcf7(%rip),%rax        # 2010 <_IO_stdin_used+0x10>
    1319:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
    131e:	44 8b 24 88          	mov    (%rax,%rcx,4),%r12d
    1322:	45 0f b7 f4          	movzwl %r12w,%r14d
    1326:	41 c1 ec 10          	shr    $0x10,%r12d
    132a:	31 ed                	xor    %ebp,%ebp
    132c:	eb 33                	jmp    1361 <main+0x211>
    132e:	66 90                	xchg   %ax,%ax
    1330:	88 4c 24 0c          	mov    %cl,0xc(%rsp)
    1334:	88 6c 24 0d          	mov    %ch,0xd(%rsp)
    1338:	88 44 24 0e          	mov    %al,0xe(%rsp)
    133c:	88 64 24 0f          	mov    %ah,0xf(%rsp)
    1340:	49 8b 0f             	mov    (%r15),%rcx
    1343:	be 01 00 00 00       	mov    $0x1,%esi
    1348:	ba 04 00 00 00       	mov    $0x4,%edx
    134d:	48 89 df             	mov    %rbx,%rdi
    1350:	e8 eb fc ff ff       	call   1040 <fwrite@plt>
    1355:	48 ff c5             	inc    %rbp
    1358:	48 81 fd 01 01 00 00 	cmp    $0x101,%rbp
    135f:	74 9f                	je     1300 <main+0x1b0>
    1361:	44 89 e0             	mov    %r12d,%eax
    1364:	44 89 f1             	mov    %r14d,%ecx
    1367:	48 85 ed             	test   %rbp,%rbp
    136a:	74 c4                	je     1330 <main+0x1e0>
    136c:	44 89 f1             	mov    %r14d,%ecx
    136f:	31 d2                	xor    %edx,%edx
    1371:	44 89 e0             	mov    %r12d,%eax
    1374:	eb 36                	jmp    13ac <main+0x25c>
    1376:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    1380:	48 89 f2             	mov    %rsi,%rdx
    1383:	89 ce                	mov    %ecx,%esi
    1385:	49 0f af f5          	imul   %r13,%rsi
    1389:	48 c1 ee 2f          	shr    $0x2f,%rsi
    138d:	69 f6 f1 ff 00 00    	imul   $0xfff1,%esi,%esi
    1393:	29 f1                	sub    %esi,%ecx
    1395:	89 c6                	mov    %eax,%esi
    1397:	49 0f af f5          	imul   %r13,%rsi
    139b:	48 c1 ee 2f          	shr    $0x2f,%rsi
    139f:	69 f6 f1 ff 00 00    	imul   $0xfff1,%esi,%esi
    13a5:	29 f0                	sub    %esi,%eax
    13a7:	48 39 ea             	cmp    %rbp,%rdx
    13aa:	73 84                	jae    1330 <main+0x1e0>
    13ac:	48 39 ea             	cmp    %rbp,%rdx
    13af:	73 d2                	jae    1383 <main+0x233>
    13b1:	48 8d 7a 20          	lea    0x20(%rdx),%rdi
    13b5:	48 39 ef             	cmp    %rbp,%rdi
    13b8:	48 89 ee             	mov    %rbp,%rsi
    13bb:	48 0f 42 f7          	cmovb  %rdi,%rsi
    13bf:	4c 8d 42 01          	lea    0x1(%rdx),%r8
    13c3:	4c 39 c6             	cmp    %r8,%rsi
    13c6:	49 0f 46 f0          	cmovbe %r8,%rsi
    13ca:	41 89 f1             	mov    %esi,%r9d
    13cd:	41 29 d1             	sub    %edx,%r9d
    13d0:	41 f6 c1 03          	test   $0x3,%r9b
    13d4:	74 3f                	je     1415 <main+0x2c5>
    13d6:	48 39 fd             	cmp    %rdi,%rbp
    13d9:	49 89 f9             	mov    %rdi,%r9
    13dc:	4c 0f 42 cd          	cmovb  %rbp,%r9
    13e0:	4d 39 c1             	cmp    %r8,%r9
    13e3:	4d 0f 46 c8          	cmovbe %r8,%r9
    13e7:	41 28 d1             	sub    %dl,%r9b
    13ea:	45 0f b6 d1          	movzbl %r9b,%r10d
    13ee:	41 83 e2 03          	and    $0x3,%r10d
    13f2:	49 f7 da             	neg    %r10
    13f5:	49 89 d1             	mov    %rdx,%r9
    13f8:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    1400:	46 0f b6 5c 0c 20    	movzbl 0x20(%rsp,%r9,1),%r11d
    1406:	49 ff c1             	inc    %r9
    1409:	44 01 d9             	add    %r11d,%ecx
    140c:	01 c8                	add    %ecx,%eax
    140e:	49 ff c2             	inc    %r10
    1411:	75 ed                	jne    1400 <main+0x2b0>
    1413:	eb 03                	jmp    1418 <main+0x2c8>
    1415:	49 89 d1             	mov    %rdx,%r9
    1418:	48 29 f2             	sub    %rsi,%rdx
    141b:	48 83 fa fc          	cmp    $0xfffffffffffffffc,%rdx
    141f:	0f 87 5b ff ff ff    	ja     1380 <main+0x230>
    1425:	48 39 fd             	cmp    %rdi,%rbp
    1428:	48 0f 42 fd          	cmovb  %rbp,%rdi
    142c:	4c 39 c7             	cmp    %r8,%rdi
    142f:	49 0f 46 f8          	cmovbe %r8,%rdi
    1433:	66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1440:	42 0f b6 54 0c 20    	movzbl 0x20(%rsp,%r9,1),%edx
    1446:	01 ca                	add    %ecx,%edx
    1448:	01 d0                	add    %edx,%eax
    144a:	42 0f b6 4c 0c 21    	movzbl 0x21(%rsp,%r9,1),%ecx
    1450:	01 d1                	add    %edx,%ecx
    1452:	01 c8                	add    %ecx,%eax
    1454:	42 0f b6 54 0c 22    	movzbl 0x22(%rsp,%r9,1),%edx
    145a:	01 ca                	add    %ecx,%edx
    145c:	01 d0                	add    %edx,%eax
    145e:	42 0f b6 4c 0c 23    	movzbl 0x23(%rsp,%r9,1),%ecx
    1464:	49 83 c1 04          	add    $0x4,%r9
    1468:	01 d1                	add    %edx,%ecx
    146a:	01 c8                	add    %ecx,%eax
    146c:	4c 39 cf             	cmp    %r9,%rdi
    146f:	75 cf                	jne    1440 <main+0x2f0>
    1471:	e9 0a ff ff ff       	jmp    1380 <main+0x230>
    1476:	49 8b 3f             	mov    (%r15),%rdi
    1479:	e8 b2 fb ff ff       	call   1030 <ferror@plt>
    147e:	89 c1                	mov    %eax,%ecx
    1480:	31 c0                	xor    %eax,%eax
    1482:	85 c9                	test   %ecx,%ecx
    1484:	0f 95 c0             	setne  %al
    1487:	01 c0                	add    %eax,%eax
    1489:	eb 05                	jmp    1490 <main+0x340>
    148b:	b8 61 00 00 00       	mov    $0x61,%eax
    1490:	48 81 c4 28 01 00 00 	add    $0x128,%rsp
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
