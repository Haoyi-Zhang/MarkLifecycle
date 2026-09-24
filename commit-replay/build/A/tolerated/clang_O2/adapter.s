
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
    115a:	50                   	push   %rax
    115b:	c7 04 24 f5 79 2b 6d 	movl   $0x6d2b79f5,(%rsp)
    1162:	8b 04 24             	mov    (%rsp),%eax
    1165:	89 04 24             	mov    %eax,(%rsp)
    1168:	8b 04 24             	mov    (%rsp),%eax
    116b:	89 04 24             	mov    %eax,(%rsp)
    116e:	8b 04 24             	mov    (%rsp),%eax
    1171:	89 04 24             	mov    %eax,(%rsp)
    1174:	8b 04 24             	mov    (%rsp),%eax
    1177:	89 04 24             	mov    %eax,(%rsp)
    117a:	8b 04 24             	mov    (%rsp),%eax
    117d:	89 04 24             	mov    %eax,(%rsp)
    1180:	8b 04 24             	mov    (%rsp),%eax
    1183:	89 04 24             	mov    %eax,(%rsp)
    1186:	8b 04 24             	mov    (%rsp),%eax
    1189:	89 04 24             	mov    %eax,(%rsp)
    118c:	8b 04 24             	mov    (%rsp),%eax
    118f:	89 04 24             	mov    %eax,(%rsp)
    1192:	8b 04 24             	mov    (%rsp),%eax
    1195:	89 04 24             	mov    %eax,(%rsp)
    1198:	8b 04 24             	mov    (%rsp),%eax
    119b:	89 04 24             	mov    %eax,(%rsp)
    119e:	8b 04 24             	mov    (%rsp),%eax
    11a1:	89 04 24             	mov    %eax,(%rsp)
    11a4:	8b 04 24             	mov    (%rsp),%eax
    11a7:	89 04 24             	mov    %eax,(%rsp)
    11aa:	8b 04 24             	mov    (%rsp),%eax
    11ad:	89 04 24             	mov    %eax,(%rsp)
    11b0:	8b 04 24             	mov    (%rsp),%eax
    11b3:	89 04 24             	mov    %eax,(%rsp)
    11b6:	8b 04 24             	mov    (%rsp),%eax
    11b9:	89 04 24             	mov    %eax,(%rsp)
    11bc:	8b 04 24             	mov    (%rsp),%eax
    11bf:	89 04 24             	mov    %eax,(%rsp)
    11c2:	8b 04 24             	mov    (%rsp),%eax
    11c5:	89 04 24             	mov    %eax,(%rsp)
    11c8:	8b 04 24             	mov    (%rsp),%eax
    11cb:	89 04 24             	mov    %eax,(%rsp)
    11ce:	8b 04 24             	mov    (%rsp),%eax
    11d1:	89 04 24             	mov    %eax,(%rsp)
    11d4:	8b 04 24             	mov    (%rsp),%eax
    11d7:	89 04 24             	mov    %eax,(%rsp)
    11da:	8b 04 24             	mov    (%rsp),%eax
    11dd:	89 04 24             	mov    %eax,(%rsp)
    11e0:	8b 04 24             	mov    (%rsp),%eax
    11e3:	89 04 24             	mov    %eax,(%rsp)
    11e6:	8b 04 24             	mov    (%rsp),%eax
    11e9:	89 04 24             	mov    %eax,(%rsp)
    11ec:	8b 04 24             	mov    (%rsp),%eax
    11ef:	89 04 24             	mov    %eax,(%rsp)
    11f2:	8b 04 24             	mov    (%rsp),%eax
    11f5:	89 04 24             	mov    %eax,(%rsp)
    11f8:	8b 04 24             	mov    (%rsp),%eax
    11fb:	89 04 24             	mov    %eax,(%rsp)
    11fe:	8b 04 24             	mov    (%rsp),%eax
    1201:	83 f8 ff             	cmp    $0xffffffff,%eax
    1204:	0f 84 85 01 00 00    	je     138f <main+0x23f>
    120a:	4c 8b 3d af 2d 00 00 	mov    0x2daf(%rip),%r15        # 3fc0 <stdout@GLIBC_2.2.5>
    1211:	4c 8d 2d ec 0d 00 00 	lea    0xdec(%rip),%r13        # 2004 <_IO_stdin_used+0x4>
    1218:	31 ed                	xor    %ebp,%ebp
    121a:	eb 4b                	jmp    1267 <main+0x117>
    121c:	0f 1f 40 00          	nopl   0x0(%rax)
    1220:	c1 e1 1f             	shl    $0x1f,%ecx
    1223:	45 09 d8             	or     %r11d,%r8d
    1226:	ba 00 00 00 00       	mov    $0x0,%edx
    122b:	0f 45 ca             	cmovne %edx,%ecx
    122e:	83 e7 7f             	and    $0x7f,%edi
    1231:	c1 e7 18             	shl    $0x18,%edi
    1234:	25 00 00 ff 00       	and    $0xff0000,%eax
    1239:	09 f8                	or     %edi,%eax
    123b:	09 c8                	or     %ecx,%eax
    123d:	09 f0                	or     %esi,%eax
    123f:	89 44 24 04          	mov    %eax,0x4(%rsp)
    1243:	49 8b 0f             	mov    (%r15),%rcx
    1246:	be 01 00 00 00       	mov    $0x1,%esi
    124b:	ba 04 00 00 00       	mov    $0x4,%edx
    1250:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
    1255:	e8 e6 fd ff ff       	call   1040 <fwrite@plt>
    125a:	48 ff c5             	inc    %rbp
    125d:	48 83 fd 10          	cmp    $0x10,%rbp
    1261:	0f 84 13 01 00 00    	je     137a <main+0x22a>
    1267:	48 8d 05 e2 2a 00 00 	lea    0x2ae2(%rip),%rax        # 3d50 <cases>
    126e:	48 8b 14 e8          	mov    (%rax,%rbp,8),%rdx
    1272:	0f b6 1a             	movzbl (%rdx),%ebx
    1275:	84 db                	test   %bl,%bl
    1277:	0f 84 f3 00 00 00    	je     1370 <main+0x220>
    127d:	48 ff c2             	inc    %rdx
    1280:	b9 01 00 00 00       	mov    $0x1,%ecx
    1285:	31 c0                	xor    %eax,%eax
    1287:	45 31 c0             	xor    %r8d,%r8d
    128a:	45 31 f6             	xor    %r14d,%r14d
    128d:	45 31 c9             	xor    %r9d,%r9d
    1290:	45 31 db             	xor    %r11d,%r11d
    1293:	31 f6                	xor    %esi,%esi
    1295:	31 ff                	xor    %edi,%edi
    1297:	eb 2b                	jmp    12c4 <main+0x174>
    1299:	41 ff c0             	inc    %r8d
    129c:	ff c7                	inc    %edi
    129e:	45 31 db             	xor    %r11d,%r11d
    12a1:	89 f3                	mov    %esi,%ebx
    12a3:	c1 e3 05             	shl    $0x5,%ebx
    12a6:	01 f3                	add    %esi,%ebx
    12a8:	44 01 d3             	add    %r10d,%ebx
    12ab:	0f b7 f3             	movzwl %bx,%esi
    12ae:	0f b6 1a             	movzbl (%rdx),%ebx
    12b1:	48 ff c2             	inc    %rdx
    12b4:	05 00 00 01 00       	add    $0x10000,%eax
    12b9:	45 89 e6             	mov    %r12d,%r14d
    12bc:	84 db                	test   %bl,%bl
    12be:	0f 84 5c ff ff ff    	je     1220 <main+0xd0>
    12c4:	44 0f b6 d3          	movzbl %bl,%r10d
    12c8:	45 85 db             	test   %r11d,%r11d
    12cb:	74 13                	je     12e0 <main+0x190>
    12cd:	41 bb 01 00 00 00    	mov    $0x1,%r11d
    12d3:	45 85 c9             	test   %r9d,%r9d
    12d6:	74 38                	je     1310 <main+0x1c0>
    12d8:	45 31 c9             	xor    %r9d,%r9d
    12db:	45 89 f4             	mov    %r14d,%r12d
    12de:	eb c1                	jmp    12a1 <main+0x151>
    12e0:	45 31 e4             	xor    %r12d,%r12d
    12e3:	45 8d 5a f7          	lea    -0x9(%r10),%r11d
    12e7:	41 83 fb 54          	cmp    $0x54,%r11d
    12eb:	77 33                	ja     1320 <main+0x1d0>
    12ed:	4f 63 5c 9d 00       	movslq 0x0(%r13,%r11,4),%r11
    12f2:	4d 01 eb             	add    %r13,%r11
    12f5:	41 ff e3             	jmp    *%r11
    12f8:	ff c7                	inc    %edi
    12fa:	41 bb 01 00 00 00    	mov    $0x1,%r11d
    1300:	eb 9f                	jmp    12a1 <main+0x151>
    1302:	66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1310:	80 fb 5c             	cmp    $0x5c,%bl
    1313:	74 35                	je     134a <main+0x1fa>
    1315:	41 83 fa 22          	cmp    $0x22,%r10d
    1319:	75 bd                	jne    12d8 <main+0x188>
    131b:	45 31 db             	xor    %r11d,%r11d
    131e:	eb b8                	jmp    12d8 <main+0x188>
    1320:	41 83 fa 7b          	cmp    $0x7b,%r10d
    1324:	0f 84 6f ff ff ff    	je     1299 <main+0x149>
    132a:	41 83 fa 7d          	cmp    $0x7d,%r10d
    132e:	75 22                	jne    1352 <main+0x202>
    1330:	45 85 c0             	test   %r8d,%r8d
    1333:	41 0f 44 c8          	cmove  %r8d,%ecx
    1337:	45 31 db             	xor    %r11d,%r11d
    133a:	41 83 e8 01          	sub    $0x1,%r8d
    133e:	45 0f 42 c3          	cmovb  %r11d,%r8d
    1342:	45 31 e4             	xor    %r12d,%r12d
    1345:	e9 57 ff ff ff       	jmp    12a1 <main+0x151>
    134a:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    1350:	eb 89                	jmp    12db <main+0x18b>
    1352:	41 83 fe 01          	cmp    $0x1,%r14d
    1356:	83 d7 00             	adc    $0x0,%edi
    1359:	41 bc 01 00 00 00    	mov    $0x1,%r12d
    135f:	e9 3a ff ff ff       	jmp    129e <main+0x14e>
    1364:	66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    1370:	b8 00 00 00 80       	mov    $0x80000000,%eax
    1375:	e9 c5 fe ff ff       	jmp    123f <main+0xef>
    137a:	49 8b 3f             	mov    (%r15),%rdi
    137d:	e8 ae fc ff ff       	call   1030 <ferror@plt>
    1382:	89 c1                	mov    %eax,%ecx
    1384:	31 c0                	xor    %eax,%eax
    1386:	85 c9                	test   %ecx,%ecx
    1388:	0f 95 c0             	setne  %al
    138b:	01 c0                	add    %eax,%eax
    138d:	eb 05                	jmp    1394 <main+0x244>
    138f:	b8 61 00 00 00       	mov    $0x61,%eax
    1394:	48 83 c4 08          	add    $0x8,%rsp
    1398:	5b                   	pop    %rbx
    1399:	41 5c                	pop    %r12
    139b:	41 5d                	pop    %r13
    139d:	41 5e                	pop    %r14
    139f:	41 5f                	pop    %r15
    13a1:	5d                   	pop    %rbp
    13a2:	c3                   	ret

Disassembly of section .fini:

00000000000013a4 <_fini>:
    13a4:	48 83 ec 08          	sub    $0x8,%rsp
    13a8:	48 83 c4 08          	add    $0x8,%rsp
    13ac:	c3                   	ret
