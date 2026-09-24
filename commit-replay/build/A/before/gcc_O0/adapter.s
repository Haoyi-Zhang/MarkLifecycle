
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
    1074:	48 8d 3d 68 03 00 00 	lea    0x368(%rip),%rdi        # 13e3 <main>
    107b:	ff 15 3f 2f 00 00    	call   *0x2f3f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1081:	f4                   	hlt
    1082:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    108c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001090 <deregister_tm_clones>:
    1090:	48 8d 3d 89 2f 00 00 	lea    0x2f89(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1097:	48 8d 05 82 2f 00 00 	lea    0x2f82(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    109e:	48 39 f8             	cmp    %rdi,%rax
    10a1:	74 15                	je     10b8 <deregister_tm_clones+0x28>
    10a3:	48 8b 05 1e 2f 00 00 	mov    0x2f1e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    10aa:	48 85 c0             	test   %rax,%rax
    10ad:	74 09                	je     10b8 <deregister_tm_clones+0x28>
    10af:	ff e0                	jmp    *%rax
    10b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10b8:	c3                   	ret
    10b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010c0 <register_tm_clones>:
    10c0:	48 8d 3d 59 2f 00 00 	lea    0x2f59(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    10c7:	48 8d 35 52 2f 00 00 	lea    0x2f52(%rip),%rsi        # 4020 <stdout@GLIBC_2.2.5>
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
    1104:	80 3d 1d 2f 00 00 00 	cmpb   $0x0,0x2f1d(%rip)        # 4028 <completed.0>
    110b:	75 2b                	jne    1138 <__do_global_dtors_aux+0x38>
    110d:	55                   	push   %rbp
    110e:	48 83 3d ca 2e 00 00 00 	cmpq   $0x0,0x2eca(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1116:	48 89 e5             	mov    %rsp,%rbp
    1119:	74 0c                	je     1127 <__do_global_dtors_aux+0x27>
    111b:	48 8b 3d f6 2e 00 00 	mov    0x2ef6(%rip),%rdi        # 4018 <__dso_handle>
    1122:	e8 29 ff ff ff       	call   1050 <__cxa_finalize@plt>
    1127:	e8 64 ff ff ff       	call   1090 <deregister_tm_clones>
    112c:	c6 05 f5 2e 00 00 01 	movb   $0x1,0x2ef5(%rip)        # 4028 <completed.0>
    1133:	5d                   	pop    %rbp
    1134:	c3                   	ret
    1135:	0f 1f 00             	nopl   (%rax)
    1138:	c3                   	ret
    1139:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001140 <frame_dummy>:
    1140:	f3 0f 1e fa          	endbr64
    1144:	e9 77 ff ff ff       	jmp    10c0 <register_tm_clones>

0000000000001149 <wm_add_v1>:
    1149:	55                   	push   %rbp
    114a:	48 89 e5             	mov    %rsp,%rbp
    114d:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1150:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1153:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1156:	5d                   	pop    %rbp
    1157:	c3                   	ret

0000000000001158 <wm_xor_v1>:
    1158:	55                   	push   %rbp
    1159:	48 89 e5             	mov    %rsp,%rbp
    115c:	89 7d fc             	mov    %edi,-0x4(%rbp)
    115f:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1162:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1165:	5d                   	pop    %rbp
    1166:	c3                   	ret

0000000000001167 <emit_u32>:
    1167:	55                   	push   %rbp
    1168:	48 89 e5             	mov    %rsp,%rbp
    116b:	48 83 ec 20          	sub    $0x20,%rsp
    116f:	89 7d ec             	mov    %edi,-0x14(%rbp)
    1172:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1175:	88 45 fc             	mov    %al,-0x4(%rbp)
    1178:	8b 45 ec             	mov    -0x14(%rbp),%eax
    117b:	c1 e8 08             	shr    $0x8,%eax
    117e:	88 45 fd             	mov    %al,-0x3(%rbp)
    1181:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1184:	c1 e8 10             	shr    $0x10,%eax
    1187:	88 45 fe             	mov    %al,-0x2(%rbp)
    118a:	8b 45 ec             	mov    -0x14(%rbp),%eax
    118d:	c1 e8 18             	shr    $0x18,%eax
    1190:	88 45 ff             	mov    %al,-0x1(%rbp)
    1193:	48 8b 15 86 2e 00 00 	mov    0x2e86(%rip),%rdx        # 4020 <stdout@GLIBC_2.2.5>
    119a:	48 8d 45 fc          	lea    -0x4(%rbp),%rax
    119e:	48 89 d1             	mov    %rdx,%rcx
    11a1:	ba 04 00 00 00       	mov    $0x4,%edx
    11a6:	be 01 00 00 00       	mov    $0x1,%esi
    11ab:	48 89 c7             	mov    %rax,%rdi
    11ae:	e8 8d fe ff ff       	call   1040 <fwrite@plt>
    11b3:	90                   	nop
    11b4:	c9                   	leave
    11b5:	c3                   	ret

00000000000011b6 <delimiter>:
    11b6:	55                   	push   %rbp
    11b7:	48 89 e5             	mov    %rsp,%rbp
    11ba:	89 f8                	mov    %edi,%eax
    11bc:	88 45 fc             	mov    %al,-0x4(%rbp)
    11bf:	80 7d fc 7b          	cmpb   $0x7b,-0x4(%rbp)
    11c3:	74 1e                	je     11e3 <delimiter+0x2d>
    11c5:	80 7d fc 5b          	cmpb   $0x5b,-0x4(%rbp)
    11c9:	74 18                	je     11e3 <delimiter+0x2d>
    11cb:	80 7d fc 7d          	cmpb   $0x7d,-0x4(%rbp)
    11cf:	74 12                	je     11e3 <delimiter+0x2d>
    11d1:	80 7d fc 5d          	cmpb   $0x5d,-0x4(%rbp)
    11d5:	74 0c                	je     11e3 <delimiter+0x2d>
    11d7:	80 7d fc 3a          	cmpb   $0x3a,-0x4(%rbp)
    11db:	74 06                	je     11e3 <delimiter+0x2d>
    11dd:	80 7d fc 2c          	cmpb   $0x2c,-0x4(%rbp)
    11e1:	75 07                	jne    11ea <delimiter+0x34>
    11e3:	b8 01 00 00 00       	mov    $0x1,%eax
    11e8:	eb 05                	jmp    11ef <delimiter+0x39>
    11ea:	b8 00 00 00 00       	mov    $0x0,%eax
    11ef:	5d                   	pop    %rbp
    11f0:	c3                   	ret

00000000000011f1 <token_signature>:
    11f1:	55                   	push   %rbp
    11f2:	48 89 e5             	mov    %rsp,%rbp
    11f5:	48 83 ec 38          	sub    $0x38,%rsp
    11f9:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
    11fd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1204:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    120b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    1212:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
    1219:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    1220:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
    1227:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%rbp)
    122e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    1235:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1239:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    123d:	e9 14 01 00 00       	jmp    1356 <token_signature+0x165>
    1242:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1246:	48 8d 50 01          	lea    0x1(%rax),%rdx
    124a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    124e:	0f b6 00             	movzbl (%rax),%eax
    1251:	88 45 d7             	mov    %al,-0x29(%rbp)
    1254:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
    1258:	8b 55 f4             	mov    -0xc(%rbp),%edx
    125b:	89 d0                	mov    %edx,%eax
    125d:	c1 e0 05             	shl    $0x5,%eax
    1260:	01 c2                	add    %eax,%edx
    1262:	0f b6 45 d7          	movzbl -0x29(%rbp),%eax
    1266:	01 d0                	add    %edx,%eax
    1268:	25 ff ff 00 00       	and    $0xffff,%eax
    126d:	89 45 f4             	mov    %eax,-0xc(%rbp)
    1270:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
    1274:	74 3a                	je     12b0 <token_signature+0xbf>
    1276:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
    127a:	74 0c                	je     1288 <token_signature+0x97>
    127c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
    1283:	e9 ce 00 00 00       	jmp    1356 <token_signature+0x165>
    1288:	80 7d d7 5c          	cmpb   $0x5c,-0x29(%rbp)
    128c:	75 0c                	jne    129a <token_signature+0xa9>
    128e:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%rbp)
    1295:	e9 bc 00 00 00       	jmp    1356 <token_signature+0x165>
    129a:	80 7d d7 22          	cmpb   $0x22,-0x29(%rbp)
    129e:	0f 85 b2 00 00 00    	jne    1356 <token_signature+0x165>
    12a4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    12ab:	e9 a6 00 00 00       	jmp    1356 <token_signature+0x165>
    12b0:	80 7d d7 22          	cmpb   $0x22,-0x29(%rbp)
    12b4:	75 17                	jne    12cd <token_signature+0xdc>
    12b6:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%rbp)
    12bd:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    12c1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    12c8:	e9 89 00 00 00       	jmp    1356 <token_signature+0x165>
    12cd:	80 7d d7 7b          	cmpb   $0x7b,-0x29(%rbp)
    12d1:	74 06                	je     12d9 <token_signature+0xe8>
    12d3:	80 7d d7 5b          	cmpb   $0x5b,-0x29(%rbp)
    12d7:	75 11                	jne    12ea <token_signature+0xf9>
    12d9:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    12dd:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    12e1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    12e8:	eb 6c                	jmp    1356 <token_signature+0x165>
    12ea:	80 7d d7 7d          	cmpb   $0x7d,-0x29(%rbp)
    12ee:	74 06                	je     12f6 <token_signature+0x105>
    12f0:	80 7d d7 5d          	cmpb   $0x5d,-0x29(%rbp)
    12f4:	75 1c                	jne    1312 <token_signature+0x121>
    12f6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    12fa:	75 09                	jne    1305 <token_signature+0x114>
    12fc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
    1303:	eb 04                	jmp    1309 <token_signature+0x118>
    1305:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
    1309:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    1310:	eb 44                	jmp    1356 <token_signature+0x165>
    1312:	80 7d d7 20          	cmpb   $0x20,-0x29(%rbp)
    1316:	74 24                	je     133c <token_signature+0x14b>
    1318:	80 7d d7 09          	cmpb   $0x9,-0x29(%rbp)
    131c:	74 1e                	je     133c <token_signature+0x14b>
    131e:	80 7d d7 0d          	cmpb   $0xd,-0x29(%rbp)
    1322:	74 18                	je     133c <token_signature+0x14b>
    1324:	80 7d d7 0a          	cmpb   $0xa,-0x29(%rbp)
    1328:	74 12                	je     133c <token_signature+0x14b>
    132a:	0f b6 45 d7          	movzbl -0x29(%rbp),%eax
    132e:	0f be c0             	movsbl %al,%eax
    1331:	89 c7                	mov    %eax,%edi
    1333:	e8 7e fe ff ff       	call   11b6 <delimiter>
    1338:	85 c0                	test   %eax,%eax
    133a:	74 09                	je     1345 <token_signature+0x154>
    133c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    1343:	eb 11                	jmp    1356 <token_signature+0x165>
    1345:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
    1349:	75 0b                	jne    1356 <token_signature+0x165>
    134b:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    134f:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%rbp)
    1356:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    135a:	0f b6 00             	movzbl (%rax),%eax
    135d:	84 c0                	test   %al,%al
    135f:	0f 85 dd fe ff ff    	jne    1242 <token_signature+0x51>
    1365:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    1369:	75 06                	jne    1371 <token_signature+0x180>
    136b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
    136f:	74 07                	je     1378 <token_signature+0x187>
    1371:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
    1378:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    137b:	c1 e0 1f             	shl    $0x1f,%eax
    137e:	89 c2                	mov    %eax,%edx
    1380:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1383:	c1 e0 18             	shl    $0x18,%eax
    1386:	25 00 00 00 7f       	and    $0x7f000000,%eax
    138b:	09 c2                	or     %eax,%edx
    138d:	8b 45 f0             	mov    -0x10(%rbp),%eax
    1390:	c1 e0 10             	shl    $0x10,%eax
    1393:	25 00 00 ff 00       	and    $0xff0000,%eax
    1398:	09 d0                	or     %edx,%eax
    139a:	0b 45 f4             	or     -0xc(%rbp),%eax
    139d:	c9                   	leave
    139e:	c3                   	ret

000000000000139f <run_contract>:
    139f:	55                   	push   %rbp
    13a0:	48 89 e5             	mov    %rsp,%rbp
    13a3:	48 83 ec 10          	sub    $0x10,%rsp
    13a7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    13ae:	eb 29                	jmp    13d9 <run_contract+0x3a>
    13b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13b3:	48 8d 14 c5 00 00 00 00 	lea    0x0(,%rax,8),%rdx
    13bb:	48 8d 05 9e 29 00 00 	lea    0x299e(%rip),%rax        # 3d60 <cases>
    13c2:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
    13c6:	48 89 c7             	mov    %rax,%rdi
    13c9:	e8 23 fe ff ff       	call   11f1 <token_signature>
    13ce:	89 c7                	mov    %eax,%edi
    13d0:	e8 92 fd ff ff       	call   1167 <emit_u32>
    13d5:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    13d9:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
    13dd:	76 d1                	jbe    13b0 <run_contract+0x11>
    13df:	90                   	nop
    13e0:	90                   	nop
    13e1:	c9                   	leave
    13e2:	c3                   	ret

00000000000013e3 <main>:
    13e3:	55                   	push   %rbp
    13e4:	48 89 e5             	mov    %rsp,%rbp
    13e7:	48 83 ec 10          	sub    $0x10,%rsp
    13eb:	c7 45 fc f5 79 2b 6d 	movl   $0x6d2b79f5,-0x4(%rbp)
    13f2:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13f5:	be c1 b7 f5 8d       	mov    $0x8df5b7c1,%esi
    13fa:	89 c7                	mov    %eax,%edi
    13fc:	e8 48 fd ff ff       	call   1149 <wm_add_v1>
    1401:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1404:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1407:	be a9 87 5d f9       	mov    $0xf95d87a9,%esi
    140c:	89 c7                	mov    %eax,%edi
    140e:	e8 36 fd ff ff       	call   1149 <wm_add_v1>
    1413:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1416:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1419:	be 7b 2d 27 61       	mov    $0x61272d7b,%esi
    141e:	89 c7                	mov    %eax,%edi
    1420:	e8 33 fd ff ff       	call   1158 <wm_xor_v1>
    1425:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1428:	8b 45 fc             	mov    -0x4(%rbp),%eax
    142b:	be 09 2d 2f d9       	mov    $0xd92f2d09,%esi
    1430:	89 c7                	mov    %eax,%edi
    1432:	e8 21 fd ff ff       	call   1158 <wm_xor_v1>
    1437:	89 45 fc             	mov    %eax,-0x4(%rbp)
    143a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    143d:	be 29 65 e3 fd       	mov    $0xfde36529,%esi
    1442:	89 c7                	mov    %eax,%edi
    1444:	e8 00 fd ff ff       	call   1149 <wm_add_v1>
    1449:	89 45 fc             	mov    %eax,-0x4(%rbp)
    144c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    144f:	be eb 8d f5 15       	mov    $0x15f58deb,%esi
    1454:	89 c7                	mov    %eax,%edi
    1456:	e8 ee fc ff ff       	call   1149 <wm_add_v1>
    145b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    145e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1461:	be 29 57 95 b1       	mov    $0xb1955729,%esi
    1466:	89 c7                	mov    %eax,%edi
    1468:	e8 eb fc ff ff       	call   1158 <wm_xor_v1>
    146d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1470:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1473:	be 29 9b 45 5b       	mov    $0x5b459b29,%esi
    1478:	89 c7                	mov    %eax,%edi
    147a:	e8 d9 fc ff ff       	call   1158 <wm_xor_v1>
    147f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1482:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1485:	be d3 c9 37 59       	mov    $0x5937c9d3,%esi
    148a:	89 c7                	mov    %eax,%edi
    148c:	e8 b8 fc ff ff       	call   1149 <wm_add_v1>
    1491:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1494:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1497:	be 7b ed f1 cd       	mov    $0xcdf1ed7b,%esi
    149c:	89 c7                	mov    %eax,%edi
    149e:	e8 a6 fc ff ff       	call   1149 <wm_add_v1>
    14a3:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14a9:	be ff 21 f7 3d       	mov    $0x3df721ff,%esi
    14ae:	89 c7                	mov    %eax,%edi
    14b0:	e8 94 fc ff ff       	call   1149 <wm_add_v1>
    14b5:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14b8:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14bb:	be 39 d1 2d 9b       	mov    $0x9b2dd139,%esi
    14c0:	89 c7                	mov    %eax,%edi
    14c2:	e8 82 fc ff ff       	call   1149 <wm_add_v1>
    14c7:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14cd:	be 6f a9 c3 c3       	mov    $0xc3c3a96f,%esi
    14d2:	89 c7                	mov    %eax,%edi
    14d4:	e8 7f fc ff ff       	call   1158 <wm_xor_v1>
    14d9:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14df:	be 19 05 d1 91       	mov    $0x91d10519,%esi
    14e4:	89 c7                	mov    %eax,%edi
    14e6:	e8 6d fc ff ff       	call   1158 <wm_xor_v1>
    14eb:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14ee:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14f1:	be e7 67 93 ef       	mov    $0xef9367e7,%esi
    14f6:	89 c7                	mov    %eax,%edi
    14f8:	e8 4c fc ff ff       	call   1149 <wm_add_v1>
    14fd:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1500:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1503:	be 11 c3 95 d9       	mov    $0xd995c311,%esi
    1508:	89 c7                	mov    %eax,%edi
    150a:	e8 3a fc ff ff       	call   1149 <wm_add_v1>
    150f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1512:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1515:	be 6b a1 ab 5b       	mov    $0x5baba16b,%esi
    151a:	89 c7                	mov    %eax,%edi
    151c:	e8 28 fc ff ff       	call   1149 <wm_add_v1>
    1521:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1524:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1527:	be e3 5b e3 b9       	mov    $0xb9e35be3,%esi
    152c:	89 c7                	mov    %eax,%edi
    152e:	e8 16 fc ff ff       	call   1149 <wm_add_v1>
    1533:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1536:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1539:	be dd d1 7d 45       	mov    $0x457dd1dd,%esi
    153e:	89 c7                	mov    %eax,%edi
    1540:	e8 04 fc ff ff       	call   1149 <wm_add_v1>
    1545:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1548:	8b 45 fc             	mov    -0x4(%rbp),%eax
    154b:	be 03 6f c9 47       	mov    $0x47c96f03,%esi
    1550:	89 c7                	mov    %eax,%edi
    1552:	e8 f2 fb ff ff       	call   1149 <wm_add_v1>
    1557:	89 45 fc             	mov    %eax,-0x4(%rbp)
    155a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    155d:	be 87 79 7d b7       	mov    $0xb77d7987,%esi
    1562:	89 c7                	mov    %eax,%edi
    1564:	e8 e0 fb ff ff       	call   1149 <wm_add_v1>
    1569:	89 45 fc             	mov    %eax,-0x4(%rbp)
    156c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    156f:	be 03 85 93 cf       	mov    $0xcf938503,%esi
    1574:	89 c7                	mov    %eax,%edi
    1576:	e8 dd fb ff ff       	call   1158 <wm_xor_v1>
    157b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    157e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1581:	be 9f 6b 23 af       	mov    $0xaf236b9f,%esi
    1586:	89 c7                	mov    %eax,%edi
    1588:	e8 bc fb ff ff       	call   1149 <wm_add_v1>
    158d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1590:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1593:	be f1 31 85 d9       	mov    $0xd98531f1,%esi
    1598:	89 c7                	mov    %eax,%edi
    159a:	e8 aa fb ff ff       	call   1149 <wm_add_v1>
    159f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    15a2:	8b 45 fc             	mov    -0x4(%rbp),%eax
    15a5:	be b9 4d 3b c9       	mov    $0xc93b4db9,%esi
    15aa:	89 c7                	mov    %eax,%edi
    15ac:	e8 98 fb ff ff       	call   1149 <wm_add_v1>
    15b1:	89 45 fc             	mov    %eax,-0x4(%rbp)
    15b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
    15b7:	be 03 bb 17 5d       	mov    $0x5d17bb03,%esi
    15bc:	89 c7                	mov    %eax,%edi
    15be:	e8 86 fb ff ff       	call   1149 <wm_add_v1>
    15c3:	89 45 fc             	mov    %eax,-0x4(%rbp)
    15c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
    15c9:	be b1 6f c9 8d       	mov    $0x8dc96fb1,%esi
    15ce:	89 c7                	mov    %eax,%edi
    15d0:	e8 83 fb ff ff       	call   1158 <wm_xor_v1>
    15d5:	89 45 fc             	mov    %eax,-0x4(%rbp)
    15d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
    15db:	be ed 03 93 eb       	mov    $0xeb9303ed,%esi
    15e0:	89 c7                	mov    %eax,%edi
    15e2:	e8 71 fb ff ff       	call   1158 <wm_xor_v1>
    15e7:	89 45 fc             	mov    %eax,-0x4(%rbp)
    15ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
    15ed:	83 f8 ff             	cmp    $0xffffffff,%eax
    15f0:	75 07                	jne    15f9 <main+0x216>
    15f2:	b8 61 00 00 00       	mov    $0x61,%eax
    15f7:	eb 24                	jmp    161d <main+0x23a>
    15f9:	e8 a1 fd ff ff       	call   139f <run_contract>
    15fe:	48 8b 05 1b 2a 00 00 	mov    0x2a1b(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    1605:	48 89 c7             	mov    %rax,%rdi
    1608:	e8 23 fa ff ff       	call   1030 <ferror@plt>
    160d:	85 c0                	test   %eax,%eax
    160f:	74 07                	je     1618 <main+0x235>
    1611:	b8 02 00 00 00       	mov    $0x2,%eax
    1616:	eb 05                	jmp    161d <main+0x23a>
    1618:	b8 00 00 00 00       	mov    $0x0,%eax
    161d:	c9                   	leave
    161e:	c3                   	ret

Disassembly of section .fini:

0000000000001620 <_fini>:
    1620:	48 83 ec 08          	sub    $0x8,%rsp
    1624:	48 83 c4 08          	add    $0x8,%rsp
    1628:	c3                   	ret
