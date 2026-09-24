
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

0000000000001040 <fputc@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4008 <fputc@GLIBC_2.2.5>
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
    115a:	48 83 ec 18          	sub    $0x18,%rsp
    115e:	c7 04 24 f5 79 2b 6d 	movl   $0x6d2b79f5,(%rsp)
    1165:	8b 04 24             	mov    (%rsp),%eax
    1168:	89 04 24             	mov    %eax,(%rsp)
    116b:	8b 04 24             	mov    (%rsp),%eax
    116e:	89 04 24             	mov    %eax,(%rsp)
    1171:	8b 04 24             	mov    (%rsp),%eax
    1174:	89 04 24             	mov    %eax,(%rsp)
    1177:	8b 04 24             	mov    (%rsp),%eax
    117a:	89 04 24             	mov    %eax,(%rsp)
    117d:	8b 04 24             	mov    (%rsp),%eax
    1180:	89 04 24             	mov    %eax,(%rsp)
    1183:	8b 04 24             	mov    (%rsp),%eax
    1186:	89 04 24             	mov    %eax,(%rsp)
    1189:	8b 04 24             	mov    (%rsp),%eax
    118c:	89 04 24             	mov    %eax,(%rsp)
    118f:	8b 04 24             	mov    (%rsp),%eax
    1192:	89 04 24             	mov    %eax,(%rsp)
    1195:	8b 04 24             	mov    (%rsp),%eax
    1198:	89 04 24             	mov    %eax,(%rsp)
    119b:	8b 04 24             	mov    (%rsp),%eax
    119e:	89 04 24             	mov    %eax,(%rsp)
    11a1:	8b 04 24             	mov    (%rsp),%eax
    11a4:	89 04 24             	mov    %eax,(%rsp)
    11a7:	8b 04 24             	mov    (%rsp),%eax
    11aa:	89 04 24             	mov    %eax,(%rsp)
    11ad:	8b 04 24             	mov    (%rsp),%eax
    11b0:	89 04 24             	mov    %eax,(%rsp)
    11b3:	8b 04 24             	mov    (%rsp),%eax
    11b6:	89 04 24             	mov    %eax,(%rsp)
    11b9:	8b 04 24             	mov    (%rsp),%eax
    11bc:	89 04 24             	mov    %eax,(%rsp)
    11bf:	8b 04 24             	mov    (%rsp),%eax
    11c2:	89 04 24             	mov    %eax,(%rsp)
    11c5:	8b 04 24             	mov    (%rsp),%eax
    11c8:	89 04 24             	mov    %eax,(%rsp)
    11cb:	8b 04 24             	mov    (%rsp),%eax
    11ce:	89 04 24             	mov    %eax,(%rsp)
    11d1:	8b 04 24             	mov    (%rsp),%eax
    11d4:	89 04 24             	mov    %eax,(%rsp)
    11d7:	8b 04 24             	mov    (%rsp),%eax
    11da:	89 04 24             	mov    %eax,(%rsp)
    11dd:	8b 04 24             	mov    (%rsp),%eax
    11e0:	89 04 24             	mov    %eax,(%rsp)
    11e3:	8b 04 24             	mov    (%rsp),%eax
    11e6:	89 04 24             	mov    %eax,(%rsp)
    11e9:	8b 04 24             	mov    (%rsp),%eax
    11ec:	89 04 24             	mov    %eax,(%rsp)
    11ef:	8b 04 24             	mov    (%rsp),%eax
    11f2:	89 04 24             	mov    %eax,(%rsp)
    11f5:	8b 04 24             	mov    (%rsp),%eax
    11f8:	89 04 24             	mov    %eax,(%rsp)
    11fb:	8b 04 24             	mov    (%rsp),%eax
    11fe:	89 04 24             	mov    %eax,(%rsp)
    1201:	8b 04 24             	mov    (%rsp),%eax
    1204:	89 04 24             	mov    %eax,(%rsp)
    1207:	8b 04 24             	mov    (%rsp),%eax
    120a:	89 04 24             	mov    %eax,(%rsp)
    120d:	8b 04 24             	mov    (%rsp),%eax
    1210:	83 f8 ff             	cmp    $0xffffffff,%eax
    1213:	0f 84 52 01 00 00    	je     136b <main+0x21b>
    1219:	31 db                	xor    %ebx,%ebx
    121b:	ba 01 00 00 00       	mov    $0x1,%edx
    1220:	be 04 00 00 00       	mov    $0x4,%esi
    1225:	bf 10 00 00 00       	mov    $0x10,%edi
    122a:	41 b9 40 00 00 00    	mov    $0x40,%r9d
    1230:	4c 8b 05 91 2d 00 00 	mov    0x2d91(%rip),%r8        # 3fc8 <stdout@GLIBC_2.2.5>
    1237:	c7 44 24 04 00 00 00 00 	movl   $0x0,0x4(%rsp)
    123f:	90                   	nop
    1240:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
    1244:	41 89 ca             	mov    %ecx,%r10d
    1247:	41 c1 ea 02          	shr    $0x2,%r10d
    124b:	41 89 cb             	mov    %ecx,%r11d
    124e:	41 c1 eb 04          	shr    $0x4,%r11d
    1252:	31 c0                	xor    %eax,%eax
    1254:	89 cd                	mov    %ecx,%ebp
    1256:	83 e5 03             	and    $0x3,%ebp
    1259:	89 6c 24 08          	mov    %ebp,0x8(%rsp)
    125d:	0f 94 c0             	sete   %al
    1260:	83 f0 03             	xor    $0x3,%eax
    1263:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1267:	31 c0                	xor    %eax,%eax
    1269:	41 83 e2 03          	and    $0x3,%r10d
    126d:	44 89 54 24 14       	mov    %r10d,0x14(%rsp)
    1272:	0f 95 c0             	setne  %al
    1275:	45 31 e4             	xor    %r12d,%r12d
    1278:	41 83 e3 03          	and    $0x3,%r11d
    127c:	44 89 5c 24 10       	mov    %r11d,0x10(%rsp)
    1281:	44 8d 34 85 08 00 00 00 	lea    0x8(,%rax,4),%r14d
    1289:	41 0f 95 c4          	setne  %r12b
    128d:	41 c1 e4 04          	shl    $0x4,%r12d
    1291:	41 83 cc 20          	or     $0x20,%r12d
    1295:	45 31 ff             	xor    %r15d,%r15d
    1298:	83 f9 40             	cmp    $0x40,%ecx
    129b:	41 0f 93 c7          	setae  %r15b
    129f:	41 83 cf 02          	or     $0x2,%r15d
    12a3:	41 c1 e7 06          	shl    $0x6,%r15d
    12a7:	45 31 ed             	xor    %r13d,%r13d
    12aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    12b0:	44 89 e9             	mov    %r13d,%ecx
    12b3:	83 e1 03             	and    $0x3,%ecx
    12b6:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    12ba:	0f 44 c2             	cmove  %edx,%eax
    12bd:	39 4c 24 08          	cmp    %ecx,0x8(%rsp)
    12c1:	0f 44 c3             	cmove  %ebx,%eax
    12c4:	44 89 e9             	mov    %r13d,%ecx
    12c7:	c1 e9 02             	shr    $0x2,%ecx
    12ca:	83 e1 03             	and    $0x3,%ecx
    12cd:	44 89 f2             	mov    %r14d,%edx
    12d0:	0f 44 d6             	cmove  %esi,%edx
    12d3:	39 4c 24 14          	cmp    %ecx,0x14(%rsp)
    12d7:	0f 44 d3             	cmove  %ebx,%edx
    12da:	44 89 e9             	mov    %r13d,%ecx
    12dd:	c1 e9 04             	shr    $0x4,%ecx
    12e0:	83 e1 03             	and    $0x3,%ecx
    12e3:	44 89 e6             	mov    %r12d,%esi
    12e6:	0f 44 f7             	cmove  %edi,%esi
    12e9:	39 4c 24 10          	cmp    %ecx,0x10(%rsp)
    12ed:	0f 44 f3             	cmove  %ebx,%esi
    12f0:	44 89 e9             	mov    %r13d,%ecx
    12f3:	33 4c 24 04          	xor    0x4(%rsp),%ecx
    12f7:	41 83 fd 40          	cmp    $0x40,%r13d
    12fb:	44 89 ff             	mov    %r15d,%edi
    12fe:	41 0f 42 f9          	cmovb  %r9d,%edi
    1302:	83 f9 40             	cmp    $0x40,%ecx
    1305:	0f 42 fb             	cmovb  %ebx,%edi
    1308:	09 c7                	or     %eax,%edi
    130a:	09 d7                	or     %edx,%edi
    130c:	09 f7                	or     %esi,%edi
    130e:	49 8b 30             	mov    (%r8),%rsi
    1311:	4c 89 c5             	mov    %r8,%rbp
    1314:	e8 27 fd ff ff       	call   1040 <fputc@plt>
    1319:	41 b9 40 00 00 00    	mov    $0x40,%r9d
    131f:	49 89 e8             	mov    %rbp,%r8
    1322:	bf 10 00 00 00       	mov    $0x10,%edi
    1327:	be 04 00 00 00       	mov    $0x4,%esi
    132c:	ba 01 00 00 00       	mov    $0x1,%edx
    1331:	41 ff c5             	inc    %r13d
    1334:	41 81 fd 00 01 00 00 	cmp    $0x100,%r13d
    133b:	0f 85 6f ff ff ff    	jne    12b0 <main+0x160>
    1341:	8b 44 24 04          	mov    0x4(%rsp),%eax
    1345:	ff c0                	inc    %eax
    1347:	89 44 24 04          	mov    %eax,0x4(%rsp)
    134b:	3d 00 01 00 00       	cmp    $0x100,%eax
    1350:	0f 85 ea fe ff ff    	jne    1240 <main+0xf0>
    1356:	49 8b 38             	mov    (%r8),%rdi
    1359:	e8 d2 fc ff ff       	call   1030 <ferror@plt>
    135e:	89 c1                	mov    %eax,%ecx
    1360:	31 c0                	xor    %eax,%eax
    1362:	85 c9                	test   %ecx,%ecx
    1364:	0f 95 c0             	setne  %al
    1367:	01 c0                	add    %eax,%eax
    1369:	eb 05                	jmp    1370 <main+0x220>
    136b:	b8 61 00 00 00       	mov    $0x61,%eax
    1370:	48 83 c4 18          	add    $0x18,%rsp
    1374:	5b                   	pop    %rbx
    1375:	41 5c                	pop    %r12
    1377:	41 5d                	pop    %r13
    1379:	41 5e                	pop    %r14
    137b:	41 5f                	pop    %r15
    137d:	5d                   	pop    %rbp
    137e:	c3                   	ret

Disassembly of section .fini:

0000000000001380 <_fini>:
    1380:	48 83 ec 08          	sub    $0x8,%rsp
    1384:	48 83 c4 08          	add    $0x8,%rsp
    1388:	c3                   	ret
