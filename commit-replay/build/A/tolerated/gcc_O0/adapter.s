
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
    1074:	48 8d 3d 62 03 00 00 	lea    0x362(%rip),%rdi        # 13dd <main>
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

0000000000001149 <wm_add_v2>:
    1149:	55                   	push   %rbp
    114a:	48 89 e5             	mov    %rsp,%rbp
    114d:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1150:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1153:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1156:	5d                   	pop    %rbp
    1157:	c3                   	ret

0000000000001158 <wm_xor_v2>:
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

00000000000011b6 <token_signature>:
    11b6:	55                   	push   %rbp
    11b7:	48 89 e5             	mov    %rsp,%rbp
    11ba:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
    11be:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    11c5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    11cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    11d3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
    11da:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    11e1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
    11e8:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%rbp)
    11ef:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    11f6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    11fa:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    11fe:	e9 4d 01 00 00       	jmp    1350 <token_signature+0x19a>
    1203:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1207:	0f b6 00             	movzbl (%rax),%eax
    120a:	88 45 d7             	mov    %al,-0x29(%rbp)
    120d:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
    1211:	8b 55 f4             	mov    -0xc(%rbp),%edx
    1214:	89 d0                	mov    %edx,%eax
    1216:	c1 e0 05             	shl    $0x5,%eax
    1219:	01 c2                	add    %eax,%edx
    121b:	0f b6 45 d7          	movzbl -0x29(%rbp),%eax
    121f:	01 d0                	add    %edx,%eax
    1221:	25 ff ff 00 00       	and    $0xffff,%eax
    1226:	89 45 f4             	mov    %eax,-0xc(%rbp)
    1229:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
    122d:	74 3a                	je     1269 <token_signature+0xb3>
    122f:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
    1233:	74 0c                	je     1241 <token_signature+0x8b>
    1235:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
    123c:	e9 06 01 00 00       	jmp    1347 <token_signature+0x191>
    1241:	80 7d d7 5c          	cmpb   $0x5c,-0x29(%rbp)
    1245:	75 0c                	jne    1253 <token_signature+0x9d>
    1247:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%rbp)
    124e:	e9 f4 00 00 00       	jmp    1347 <token_signature+0x191>
    1253:	80 7d d7 22          	cmpb   $0x22,-0x29(%rbp)
    1257:	0f 85 ea 00 00 00    	jne    1347 <token_signature+0x191>
    125d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    1264:	e9 de 00 00 00       	jmp    1347 <token_signature+0x191>
    1269:	0f b6 45 d7          	movzbl -0x29(%rbp),%eax
    126d:	83 f8 7d             	cmp    $0x7d,%eax
    1270:	0f 84 99 00 00 00    	je     130f <token_signature+0x159>
    1276:	83 f8 7d             	cmp    $0x7d,%eax
    1279:	0f 8f b5 00 00 00    	jg     1334 <token_signature+0x17e>
    127f:	83 f8 7b             	cmp    $0x7b,%eax
    1282:	74 7a                	je     12fe <token_signature+0x148>
    1284:	83 f8 7b             	cmp    $0x7b,%eax
    1287:	0f 8f a7 00 00 00    	jg     1334 <token_signature+0x17e>
    128d:	83 f8 5d             	cmp    $0x5d,%eax
    1290:	74 7d                	je     130f <token_signature+0x159>
    1292:	83 f8 5d             	cmp    $0x5d,%eax
    1295:	0f 8f 99 00 00 00    	jg     1334 <token_signature+0x17e>
    129b:	83 f8 3a             	cmp    $0x3a,%eax
    129e:	7f 43                	jg     12e3 <token_signature+0x12d>
    12a0:	83 f8 09             	cmp    $0x9,%eax
    12a3:	0f 8c 8b 00 00 00    	jl     1334 <token_signature+0x17e>
    12a9:	ba 01 00 00 00       	mov    $0x1,%edx
    12ae:	89 c1                	mov    %eax,%ecx
    12b0:	48 d3 e2             	shl    %cl,%rdx
    12b3:	48 b8 00 26 00 00 01 10 00 04 	movabs $0x400100100002600,%rax
    12bd:	48 21 d0             	and    %rdx,%rax
    12c0:	48 85 c0             	test   %rax,%rax
    12c3:	0f 95 c0             	setne  %al
    12c6:	84 c0                	test   %al,%al
    12c8:	75 61                	jne    132b <token_signature+0x175>
    12ca:	48 b8 00 00 00 00 04 00 00 00 	movabs $0x400000000,%rax
    12d4:	48 21 d0             	and    %rdx,%rax
    12d7:	48 85 c0             	test   %rax,%rax
    12da:	0f 95 c0             	setne  %al
    12dd:	84 c0                	test   %al,%al
    12df:	75 09                	jne    12ea <token_signature+0x134>
    12e1:	eb 51                	jmp    1334 <token_signature+0x17e>
    12e3:	83 f8 5b             	cmp    $0x5b,%eax
    12e6:	74 16                	je     12fe <token_signature+0x148>
    12e8:	eb 4a                	jmp    1334 <token_signature+0x17e>
    12ea:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%rbp)
    12f1:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    12f5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    12fc:	eb 4d                	jmp    134b <token_signature+0x195>
    12fe:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1302:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    1306:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    130d:	eb 3c                	jmp    134b <token_signature+0x195>
    130f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    1313:	75 09                	jne    131e <token_signature+0x168>
    1315:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
    131c:	eb 04                	jmp    1322 <token_signature+0x16c>
    131e:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
    1322:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    1329:	eb 20                	jmp    134b <token_signature+0x195>
    132b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    1332:	eb 17                	jmp    134b <token_signature+0x195>
    1334:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
    1338:	75 10                	jne    134a <token_signature+0x194>
    133a:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    133e:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%rbp)
    1345:	eb 03                	jmp    134a <token_signature+0x194>
    1347:	90                   	nop
    1348:	eb 01                	jmp    134b <token_signature+0x195>
    134a:	90                   	nop
    134b:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
    1350:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1354:	0f b6 00             	movzbl (%rax),%eax
    1357:	84 c0                	test   %al,%al
    1359:	0f 85 a4 fe ff ff    	jne    1203 <token_signature+0x4d>
    135f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    1363:	75 06                	jne    136b <token_signature+0x1b5>
    1365:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
    1369:	74 07                	je     1372 <token_signature+0x1bc>
    136b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
    1372:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    1375:	c1 e0 1f             	shl    $0x1f,%eax
    1378:	89 c2                	mov    %eax,%edx
    137a:	8b 45 f8             	mov    -0x8(%rbp),%eax
    137d:	c1 e0 18             	shl    $0x18,%eax
    1380:	25 00 00 00 7f       	and    $0x7f000000,%eax
    1385:	09 c2                	or     %eax,%edx
    1387:	8b 45 f0             	mov    -0x10(%rbp),%eax
    138a:	c1 e0 10             	shl    $0x10,%eax
    138d:	25 00 00 ff 00       	and    $0xff0000,%eax
    1392:	09 d0                	or     %edx,%eax
    1394:	0b 45 f4             	or     -0xc(%rbp),%eax
    1397:	5d                   	pop    %rbp
    1398:	c3                   	ret

0000000000001399 <run_contract>:
    1399:	55                   	push   %rbp
    139a:	48 89 e5             	mov    %rsp,%rbp
    139d:	48 83 ec 10          	sub    $0x10,%rsp
    13a1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    13a8:	eb 29                	jmp    13d3 <run_contract+0x3a>
    13aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13ad:	48 8d 14 c5 00 00 00 00 	lea    0x0(,%rax,8),%rdx
    13b5:	48 8d 05 a4 29 00 00 	lea    0x29a4(%rip),%rax        # 3d60 <cases>
    13bc:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
    13c0:	48 89 c7             	mov    %rax,%rdi
    13c3:	e8 ee fd ff ff       	call   11b6 <token_signature>
    13c8:	89 c7                	mov    %eax,%edi
    13ca:	e8 98 fd ff ff       	call   1167 <emit_u32>
    13cf:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    13d3:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
    13d7:	76 d1                	jbe    13aa <run_contract+0x11>
    13d9:	90                   	nop
    13da:	90                   	nop
    13db:	c9                   	leave
    13dc:	c3                   	ret

00000000000013dd <main>:
    13dd:	55                   	push   %rbp
    13de:	48 89 e5             	mov    %rsp,%rbp
    13e1:	48 83 ec 10          	sub    $0x10,%rsp
    13e5:	c7 45 fc f5 79 2b 6d 	movl   $0x6d2b79f5,-0x4(%rbp)
    13ec:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13ef:	be c1 b7 f5 8d       	mov    $0x8df5b7c1,%esi
    13f4:	89 c7                	mov    %eax,%edi
    13f6:	e8 4e fd ff ff       	call   1149 <wm_add_v2>
    13fb:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13fe:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1401:	be 7b ed f1 cd       	mov    $0xcdf1ed7b,%esi
    1406:	89 c7                	mov    %eax,%edi
    1408:	e8 3c fd ff ff       	call   1149 <wm_add_v2>
    140d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1410:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1413:	be dd d1 7d 45       	mov    $0x457dd1dd,%esi
    1418:	89 c7                	mov    %eax,%edi
    141a:	e8 2a fd ff ff       	call   1149 <wm_add_v2>
    141f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1422:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1425:	be ed 03 93 eb       	mov    $0xeb9303ed,%esi
    142a:	89 c7                	mov    %eax,%edi
    142c:	e8 27 fd ff ff       	call   1158 <wm_xor_v2>
    1431:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1434:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1437:	be d3 c9 37 59       	mov    $0x5937c9d3,%esi
    143c:	89 c7                	mov    %eax,%edi
    143e:	e8 06 fd ff ff       	call   1149 <wm_add_v2>
    1443:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1446:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1449:	be b1 6f c9 8d       	mov    $0x8dc96fb1,%esi
    144e:	89 c7                	mov    %eax,%edi
    1450:	e8 03 fd ff ff       	call   1158 <wm_xor_v2>
    1455:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1458:	8b 45 fc             	mov    -0x4(%rbp),%eax
    145b:	be 29 9b 45 5b       	mov    $0x5b459b29,%esi
    1460:	89 c7                	mov    %eax,%edi
    1462:	e8 f1 fc ff ff       	call   1158 <wm_xor_v2>
    1467:	89 45 fc             	mov    %eax,-0x4(%rbp)
    146a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    146d:	be 6b a1 ab 5b       	mov    $0x5baba16b,%esi
    1472:	89 c7                	mov    %eax,%edi
    1474:	e8 d0 fc ff ff       	call   1149 <wm_add_v2>
    1479:	89 45 fc             	mov    %eax,-0x4(%rbp)
    147c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    147f:	be 03 bb 17 5d       	mov    $0x5d17bb03,%esi
    1484:	89 c7                	mov    %eax,%edi
    1486:	e8 be fc ff ff       	call   1149 <wm_add_v2>
    148b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    148e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1491:	be 29 57 95 b1       	mov    $0xb1955729,%esi
    1496:	89 c7                	mov    %eax,%edi
    1498:	e8 bb fc ff ff       	call   1158 <wm_xor_v2>
    149d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14a3:	be 11 c3 95 d9       	mov    $0xd995c311,%esi
    14a8:	89 c7                	mov    %eax,%edi
    14aa:	e8 9a fc ff ff       	call   1149 <wm_add_v2>
    14af:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14b5:	be b9 4d 3b c9       	mov    $0xc93b4db9,%esi
    14ba:	89 c7                	mov    %eax,%edi
    14bc:	e8 88 fc ff ff       	call   1149 <wm_add_v2>
    14c1:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14c7:	be eb 8d f5 15       	mov    $0x15f58deb,%esi
    14cc:	89 c7                	mov    %eax,%edi
    14ce:	e8 76 fc ff ff       	call   1149 <wm_add_v2>
    14d3:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14d6:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14d9:	be e7 67 93 ef       	mov    $0xef9367e7,%esi
    14de:	89 c7                	mov    %eax,%edi
    14e0:	e8 64 fc ff ff       	call   1149 <wm_add_v2>
    14e5:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14e8:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14eb:	be f1 31 85 d9       	mov    $0xd98531f1,%esi
    14f0:	89 c7                	mov    %eax,%edi
    14f2:	e8 52 fc ff ff       	call   1149 <wm_add_v2>
    14f7:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14fa:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14fd:	be 29 65 e3 fd       	mov    $0xfde36529,%esi
    1502:	89 c7                	mov    %eax,%edi
    1504:	e8 40 fc ff ff       	call   1149 <wm_add_v2>
    1509:	89 45 fc             	mov    %eax,-0x4(%rbp)
    150c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    150f:	be 19 05 d1 91       	mov    $0x91d10519,%esi
    1514:	89 c7                	mov    %eax,%edi
    1516:	e8 3d fc ff ff       	call   1158 <wm_xor_v2>
    151b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    151e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1521:	be 9f 6b 23 af       	mov    $0xaf236b9f,%esi
    1526:	89 c7                	mov    %eax,%edi
    1528:	e8 1c fc ff ff       	call   1149 <wm_add_v2>
    152d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1530:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1533:	be 6f a9 c3 c3       	mov    $0xc3c3a96f,%esi
    1538:	89 c7                	mov    %eax,%edi
    153a:	e8 19 fc ff ff       	call   1158 <wm_xor_v2>
    153f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1542:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1545:	be 03 85 93 cf       	mov    $0xcf938503,%esi
    154a:	89 c7                	mov    %eax,%edi
    154c:	e8 07 fc ff ff       	call   1158 <wm_xor_v2>
    1551:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1554:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1557:	be 7b 2d 27 61       	mov    $0x61272d7b,%esi
    155c:	89 c7                	mov    %eax,%edi
    155e:	e8 f5 fb ff ff       	call   1158 <wm_xor_v2>
    1563:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1566:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1569:	be 39 d1 2d 9b       	mov    $0x9b2dd139,%esi
    156e:	89 c7                	mov    %eax,%edi
    1570:	e8 d4 fb ff ff       	call   1149 <wm_add_v2>
    1575:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1578:	8b 45 fc             	mov    -0x4(%rbp),%eax
    157b:	be 87 79 7d b7       	mov    $0xb77d7987,%esi
    1580:	89 c7                	mov    %eax,%edi
    1582:	e8 c2 fb ff ff       	call   1149 <wm_add_v2>
    1587:	89 45 fc             	mov    %eax,-0x4(%rbp)
    158a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    158d:	be a9 87 5d f9       	mov    $0xf95d87a9,%esi
    1592:	89 c7                	mov    %eax,%edi
    1594:	e8 b0 fb ff ff       	call   1149 <wm_add_v2>
    1599:	89 45 fc             	mov    %eax,-0x4(%rbp)
    159c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    159f:	be ff 21 f7 3d       	mov    $0x3df721ff,%esi
    15a4:	89 c7                	mov    %eax,%edi
    15a6:	e8 9e fb ff ff       	call   1149 <wm_add_v2>
    15ab:	89 45 fc             	mov    %eax,-0x4(%rbp)
    15ae:	8b 45 fc             	mov    -0x4(%rbp),%eax
    15b1:	be 03 6f c9 47       	mov    $0x47c96f03,%esi
    15b6:	89 c7                	mov    %eax,%edi
    15b8:	e8 8c fb ff ff       	call   1149 <wm_add_v2>
    15bd:	89 45 fc             	mov    %eax,-0x4(%rbp)
    15c0:	8b 45 fc             	mov    -0x4(%rbp),%eax
    15c3:	83 f8 ff             	cmp    $0xffffffff,%eax
    15c6:	75 07                	jne    15cf <main+0x1f2>
    15c8:	b8 61 00 00 00       	mov    $0x61,%eax
    15cd:	eb 24                	jmp    15f3 <main+0x216>
    15cf:	e8 c5 fd ff ff       	call   1399 <run_contract>
    15d4:	48 8b 05 45 2a 00 00 	mov    0x2a45(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    15db:	48 89 c7             	mov    %rax,%rdi
    15de:	e8 4d fa ff ff       	call   1030 <ferror@plt>
    15e3:	85 c0                	test   %eax,%eax
    15e5:	74 07                	je     15ee <main+0x211>
    15e7:	b8 02 00 00 00       	mov    $0x2,%eax
    15ec:	eb 05                	jmp    15f3 <main+0x216>
    15ee:	b8 00 00 00 00       	mov    $0x0,%eax
    15f3:	c9                   	leave
    15f4:	c3                   	ret

Disassembly of section .fini:

00000000000015f8 <_fini>:
    15f8:	48 83 ec 08          	sub    $0x8,%rsp
    15fc:	48 83 c4 08          	add    $0x8,%rsp
    1600:	c3                   	ret
