
adapter:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	48 83 ec 08          	sub    $0x8,%rsp
    1004:	48 8b 05 bd 2f 00 00 	mov    0x2fbd(%rip),%rax        # 3fc8 <__gmon_start__@Base>
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
    1050:	ff 25 82 2f 00 00    	jmp    *0x2f82(%rip)        # 3fd8 <__cxa_finalize@GLIBC_2.2.5>
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
    107b:	ff 15 2f 2f 00 00    	call   *0x2f2f(%rip)        # 3fb0 <__libc_start_main@GLIBC_2.34>
    1081:	f4                   	hlt
    1082:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    108c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001090 <deregister_tm_clones>:
    1090:	48 8d 3d 89 2f 00 00 	lea    0x2f89(%rip),%rdi        # 4020 <__TMC_END__>
    1097:	48 8d 05 82 2f 00 00 	lea    0x2f82(%rip),%rax        # 4020 <__TMC_END__>
    109e:	48 39 f8             	cmp    %rdi,%rax
    10a1:	74 15                	je     10b8 <deregister_tm_clones+0x28>
    10a3:	48 8b 05 0e 2f 00 00 	mov    0x2f0e(%rip),%rax        # 3fb8 <_ITM_deregisterTMCloneTable@Base>
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
    10e4:	48 8b 05 e5 2e 00 00 	mov    0x2ee5(%rip),%rax        # 3fd0 <_ITM_registerTMCloneTable@Base>
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
    110e:	48 83 3d c2 2e 00 00 00 	cmpq   $0x0,0x2ec2(%rip)        # 3fd8 <__cxa_finalize@GLIBC_2.2.5>
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
    115a:	48 83 ec 18          	sub    $0x18,%rsp
    115e:	c7 44 24 08 f5 79 2b 6d 	movl   $0x6d2b79f5,0x8(%rsp)
    1166:	8b 44 24 08          	mov    0x8(%rsp),%eax
    116a:	89 44 24 08          	mov    %eax,0x8(%rsp)
    116e:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1172:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1176:	8b 44 24 08          	mov    0x8(%rsp),%eax
    117a:	89 44 24 08          	mov    %eax,0x8(%rsp)
    117e:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1182:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1186:	8b 44 24 08          	mov    0x8(%rsp),%eax
    118a:	89 44 24 08          	mov    %eax,0x8(%rsp)
    118e:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1192:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1196:	8b 44 24 08          	mov    0x8(%rsp),%eax
    119a:	89 44 24 08          	mov    %eax,0x8(%rsp)
    119e:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11a2:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11a6:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11aa:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11ae:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11b2:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11b6:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11ba:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11be:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11c2:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11c6:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11ca:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11ce:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11d2:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11d6:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11da:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11de:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11e2:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11e6:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11ea:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11ee:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11f2:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11f6:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11fa:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11fe:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1202:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1206:	8b 44 24 08          	mov    0x8(%rsp),%eax
    120a:	89 44 24 08          	mov    %eax,0x8(%rsp)
    120e:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1212:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1216:	8b 44 24 08          	mov    0x8(%rsp),%eax
    121a:	89 44 24 08          	mov    %eax,0x8(%rsp)
    121e:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1222:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1226:	8b 44 24 08          	mov    0x8(%rsp),%eax
    122a:	89 44 24 08          	mov    %eax,0x8(%rsp)
    122e:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1232:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1236:	8b 44 24 08          	mov    0x8(%rsp),%eax
    123a:	89 44 24 08          	mov    %eax,0x8(%rsp)
    123e:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1242:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1246:	8b 44 24 08          	mov    0x8(%rsp),%eax
    124a:	83 f8 ff             	cmp    $0xffffffff,%eax
    124d:	0f 84 ec 01 00 00    	je     143f <main+0x2ef>
    1253:	4c 8d 25 f6 2a 00 00 	lea    0x2af6(%rip),%r12        # 3d50 <cases>
    125a:	4c 8b 3d 5f 2d 00 00 	mov    0x2d5f(%rip),%r15        # 3fc0 <stdout@GLIBC_2.2.5>
    1261:	48 8d 5c 24 0c       	lea    0xc(%rsp),%rbx
    1266:	45 31 ed             	xor    %r13d,%r13d
    1269:	eb 4a                	jmp    12b5 <main+0x165>
    126b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1270:	c1 e1 1f             	shl    $0x1f,%ecx
    1273:	45 09 d0             	or     %r10d,%r8d
    1276:	ba 00 00 00 00       	mov    $0x0,%edx
    127b:	0f 45 ca             	cmovne %edx,%ecx
    127e:	83 e7 7f             	and    $0x7f,%edi
    1281:	c1 e7 18             	shl    $0x18,%edi
    1284:	25 00 00 ff 00       	and    $0xff0000,%eax
    1289:	09 f8                	or     %edi,%eax
    128b:	09 c8                	or     %ecx,%eax
    128d:	09 f0                	or     %esi,%eax
    128f:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1293:	49 8b 0f             	mov    (%r15),%rcx
    1296:	be 01 00 00 00       	mov    $0x1,%esi
    129b:	ba 04 00 00 00       	mov    $0x4,%edx
    12a0:	48 89 df             	mov    %rbx,%rdi
    12a3:	e8 98 fd ff ff       	call   1040 <fwrite@plt>
    12a8:	49 ff c5             	inc    %r13
    12ab:	49 83 fd 10          	cmp    $0x10,%r13
    12af:	0f 84 75 01 00 00    	je     142a <main+0x2da>
    12b5:	4b 8b 14 ec          	mov    (%r12,%r13,8),%rdx
    12b9:	0f b6 2a             	movzbl (%rdx),%ebp
    12bc:	40 84 ed             	test   %bpl,%bpl
    12bf:	0f 84 5b 01 00 00    	je     1420 <main+0x2d0>
    12c5:	48 ff c2             	inc    %rdx
    12c8:	b9 01 00 00 00       	mov    $0x1,%ecx
    12cd:	31 c0                	xor    %eax,%eax
    12cf:	45 31 c0             	xor    %r8d,%r8d
    12d2:	45 31 f6             	xor    %r14d,%r14d
    12d5:	45 31 c9             	xor    %r9d,%r9d
    12d8:	45 31 d2             	xor    %r10d,%r10d
    12db:	31 f6                	xor    %esi,%esi
    12dd:	31 ff                	xor    %edi,%edi
    12df:	eb 33                	jmp    1314 <main+0x1c4>
    12e1:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    12f0:	45 31 c9             	xor    %r9d,%r9d
    12f3:	89 f5                	mov    %esi,%ebp
    12f5:	c1 e5 05             	shl    $0x5,%ebp
    12f8:	01 f5                	add    %esi,%ebp
    12fa:	44 01 dd             	add    %r11d,%ebp
    12fd:	0f b7 f5             	movzwl %bp,%esi
    1300:	0f b6 2a             	movzbl (%rdx),%ebp
    1303:	48 ff c2             	inc    %rdx
    1306:	05 00 00 01 00       	add    $0x10000,%eax
    130b:	40 84 ed             	test   %bpl,%bpl
    130e:	0f 84 5c ff ff ff    	je     1270 <main+0x120>
    1314:	44 0f b6 dd          	movzbl %bpl,%r11d
    1318:	45 85 d2             	test   %r10d,%r10d
    131b:	74 23                	je     1340 <main+0x1f0>
    131d:	41 ba 01 00 00 00    	mov    $0x1,%r10d
    1323:	45 85 c9             	test   %r9d,%r9d
    1326:	75 c8                	jne    12f0 <main+0x1a0>
    1328:	40 80 fd 5c          	cmp    $0x5c,%bpl
    132c:	74 4c                	je     137a <main+0x22a>
    132e:	41 83 fb 22          	cmp    $0x22,%r11d
    1332:	75 bc                	jne    12f0 <main+0x1a0>
    1334:	45 31 d2             	xor    %r10d,%r10d
    1337:	eb b7                	jmp    12f0 <main+0x1a0>
    1339:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1340:	40 80 fd 22          	cmp    $0x22,%bpl
    1344:	75 0d                	jne    1353 <main+0x203>
    1346:	ff c7                	inc    %edi
    1348:	45 31 f6             	xor    %r14d,%r14d
    134b:	41 ba 01 00 00 00    	mov    $0x1,%r10d
    1351:	eb a0                	jmp    12f3 <main+0x1a3>
    1353:	41 89 ea             	mov    %ebp,%r10d
    1356:	41 80 e2 df          	and    $0xdf,%r10b
    135a:	41 80 fa 5d          	cmp    $0x5d,%r10b
    135e:	74 25                	je     1385 <main+0x235>
    1360:	45 0f b6 d2          	movzbl %r10b,%r10d
    1364:	41 83 fa 5b          	cmp    $0x5b,%r10d
    1368:	75 35                	jne    139f <main+0x24f>
    136a:	41 ff c0             	inc    %r8d
    136d:	ff c7                	inc    %edi
    136f:	45 31 d2             	xor    %r10d,%r10d
    1372:	45 31 f6             	xor    %r14d,%r14d
    1375:	e9 79 ff ff ff       	jmp    12f3 <main+0x1a3>
    137a:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    1380:	e9 6e ff ff ff       	jmp    12f3 <main+0x1a3>
    1385:	45 85 c0             	test   %r8d,%r8d
    1388:	41 0f 44 c8          	cmove  %r8d,%ecx
    138c:	45 31 d2             	xor    %r10d,%r10d
    138f:	41 83 e8 01          	sub    $0x1,%r8d
    1393:	45 0f 42 c2          	cmovb  %r10d,%r8d
    1397:	45 31 f6             	xor    %r14d,%r14d
    139a:	e9 54 ff ff ff       	jmp    12f3 <main+0x1a3>
    139f:	45 31 d2             	xor    %r10d,%r10d
    13a2:	40 80 fd 3a          	cmp    $0x3a,%bpl
    13a6:	77 14                	ja     13bc <main+0x26c>
    13a8:	89 cd                	mov    %ecx,%ebp
    13aa:	48 b9 00 26 00 00 01 10 00 04 	movabs $0x400100100002600,%rcx
    13b4:	4c 0f a3 d9          	bt     %r11,%rcx
    13b8:	89 e9                	mov    %ebp,%ecx
    13ba:	72 3b                	jb     13f7 <main+0x2a7>
    13bc:	41 8d 6b a5          	lea    -0x5b(%r11),%ebp
    13c0:	83 fd 22             	cmp    $0x22,%ebp
    13c3:	77 3a                	ja     13ff <main+0x2af>
    13c5:	4c 89 6c 24 10       	mov    %r13,0x10(%rsp)
    13ca:	41 89 cd             	mov    %ecx,%r13d
    13cd:	4c 89 f9             	mov    %r15,%rcx
    13d0:	49 89 df             	mov    %rbx,%r15
    13d3:	4c 89 e3             	mov    %r12,%rbx
    13d6:	49 bc 05 00 00 00 05 00 00 00 	movabs $0x500000005,%r12
    13e0:	49 0f a3 ec          	bt     %rbp,%r12
    13e4:	49 89 dc             	mov    %rbx,%r12
    13e7:	4c 89 fb             	mov    %r15,%rbx
    13ea:	49 89 cf             	mov    %rcx,%r15
    13ed:	44 89 e9             	mov    %r13d,%ecx
    13f0:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
    13f5:	73 08                	jae    13ff <main+0x2af>
    13f7:	45 31 f6             	xor    %r14d,%r14d
    13fa:	e9 f4 fe ff ff       	jmp    12f3 <main+0x1a3>
    13ff:	41 83 fe 01          	cmp    $0x1,%r14d
    1403:	83 d7 00             	adc    $0x0,%edi
    1406:	41 be 01 00 00 00    	mov    $0x1,%r14d
    140c:	e9 e2 fe ff ff       	jmp    12f3 <main+0x1a3>
    1411:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1420:	b8 00 00 00 80       	mov    $0x80000000,%eax
    1425:	e9 65 fe ff ff       	jmp    128f <main+0x13f>
    142a:	49 8b 3f             	mov    (%r15),%rdi
    142d:	e8 fe fb ff ff       	call   1030 <ferror@plt>
    1432:	89 c1                	mov    %eax,%ecx
    1434:	31 c0                	xor    %eax,%eax
    1436:	85 c9                	test   %ecx,%ecx
    1438:	0f 95 c0             	setne  %al
    143b:	01 c0                	add    %eax,%eax
    143d:	eb 05                	jmp    1444 <main+0x2f4>
    143f:	b8 61 00 00 00       	mov    $0x61,%eax
    1444:	48 83 c4 18          	add    $0x18,%rsp
    1448:	5b                   	pop    %rbx
    1449:	41 5c                	pop    %r12
    144b:	41 5d                	pop    %r13
    144d:	41 5e                	pop    %r14
    144f:	41 5f                	pop    %r15
    1451:	5d                   	pop    %rbp
    1452:	c3                   	ret

Disassembly of section .fini:

0000000000001454 <_fini>:
    1454:	48 83 ec 08          	sub    $0x8,%rsp
    1458:	48 83 c4 08          	add    $0x8,%rsp
    145c:	c3                   	ret
