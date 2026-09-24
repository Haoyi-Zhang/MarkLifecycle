
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
    1074:	48 8d 3d 1b 03 00 00 	lea    0x31b(%rip),%rdi        # 1396 <main>
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

00000000000011b6 <adler_modern>:
    11b6:	55                   	push   %rbp
    11b7:	48 89 e5             	mov    %rsp,%rbp
    11ba:	89 7d dc             	mov    %edi,-0x24(%rbp)
    11bd:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    11c1:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
    11c5:	8b 45 dc             	mov    -0x24(%rbp),%eax
    11c8:	0f b7 c0             	movzwl %ax,%eax
    11cb:	89 45 fc             	mov    %eax,-0x4(%rbp)
    11ce:	8b 45 dc             	mov    -0x24(%rbp),%eax
    11d1:	c1 e8 10             	shr    $0x10,%eax
    11d4:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11d7:	48 c7 45 f0 00 00 00 00 	movq   $0x0,-0x10(%rbp)
    11df:	e9 85 00 00 00       	jmp    1269 <adler_modern+0xb3>
    11e4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    11e8:	48 83 c0 20          	add    $0x20,%rax
    11ec:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    11f0:	48 39 c2             	cmp    %rax,%rdx
    11f3:	48 0f 46 c2          	cmovbe %rdx,%rax
    11f7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    11fb:	eb 22                	jmp    121f <adler_modern+0x69>
    11fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1201:	48 8d 50 01          	lea    0x1(%rax),%rdx
    1205:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    1209:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    120d:	48 01 d0             	add    %rdx,%rax
    1210:	0f b6 00             	movzbl (%rax),%eax
    1213:	0f b6 c0             	movzbl %al,%eax
    1216:	01 45 fc             	add    %eax,-0x4(%rbp)
    1219:	8b 45 fc             	mov    -0x4(%rbp),%eax
    121c:	01 45 f8             	add    %eax,-0x8(%rbp)
    121f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1223:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
    1227:	72 d4                	jb     11fd <adler_modern+0x47>
    1229:	8b 55 fc             	mov    -0x4(%rbp),%edx
    122c:	89 d1                	mov    %edx,%ecx
    122e:	b8 71 80 07 80       	mov    $0x80078071,%eax
    1233:	48 0f af c1          	imul   %rcx,%rax
    1237:	48 c1 e8 20          	shr    $0x20,%rax
    123b:	c1 e8 0f             	shr    $0xf,%eax
    123e:	69 c0 f1 ff 00 00    	imul   $0xfff1,%eax,%eax
    1244:	29 c2                	sub    %eax,%edx
    1246:	89 55 fc             	mov    %edx,-0x4(%rbp)
    1249:	8b 55 f8             	mov    -0x8(%rbp),%edx
    124c:	89 d1                	mov    %edx,%ecx
    124e:	b8 71 80 07 80       	mov    $0x80078071,%eax
    1253:	48 0f af c1          	imul   %rcx,%rax
    1257:	48 c1 e8 20          	shr    $0x20,%rax
    125b:	c1 e8 0f             	shr    $0xf,%eax
    125e:	69 c0 f1 ff 00 00    	imul   $0xfff1,%eax,%eax
    1264:	29 c2                	sub    %eax,%edx
    1266:	89 55 f8             	mov    %edx,-0x8(%rbp)
    1269:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    126d:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
    1271:	0f 82 6d ff ff ff    	jb     11e4 <adler_modern+0x2e>
    1277:	8b 45 f8             	mov    -0x8(%rbp),%eax
    127a:	c1 e0 10             	shl    $0x10,%eax
    127d:	0b 45 fc             	or     -0x4(%rbp),%eax
    1280:	5d                   	pop    %rbp
    1281:	c3                   	ret

0000000000001282 <pattern_byte>:
    1282:	55                   	push   %rbp
    1283:	48 89 e5             	mov    %rsp,%rbp
    1286:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1289:	89 75 f8             	mov    %esi,-0x8(%rbp)
    128c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    1290:	75 05                	jne    1297 <pattern_byte+0x15>
    1292:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1295:	eb 3a                	jmp    12d1 <pattern_byte+0x4f>
    1297:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
    129b:	75 07                	jne    12a4 <pattern_byte+0x22>
    129d:	8b 45 f8             	mov    -0x8(%rbp),%eax
    12a0:	f7 d0                	not    %eax
    12a2:	eb 2d                	jmp    12d1 <pattern_byte+0x4f>
    12a4:	83 7d fc 02          	cmpl   $0x2,-0x4(%rbp)
    12a8:	75 11                	jne    12bb <pattern_byte+0x39>
    12aa:	8b 45 f8             	mov    -0x8(%rbp),%eax
    12ad:	89 c2                	mov    %eax,%edx
    12af:	89 d0                	mov    %edx,%eax
    12b1:	c1 e0 04             	shl    $0x4,%eax
    12b4:	01 d0                	add    %edx,%eax
    12b6:	83 c0 1f             	add    $0x1f,%eax
    12b9:	eb 16                	jmp    12d1 <pattern_byte+0x4f>
    12bb:	8b 45 f8             	mov    -0x8(%rbp),%eax
    12be:	83 e0 01             	and    $0x1,%eax
    12c1:	85 c0                	test   %eax,%eax
    12c3:	74 07                	je     12cc <pattern_byte+0x4a>
    12c5:	b8 aa ff ff ff       	mov    $0xffffffaa,%eax
    12ca:	eb 05                	jmp    12d1 <pattern_byte+0x4f>
    12cc:	b8 55 00 00 00       	mov    $0x55,%eax
    12d1:	5d                   	pop    %rbp
    12d2:	c3                   	ret

00000000000012d3 <run_contract>:
    12d3:	55                   	push   %rbp
    12d4:	48 89 e5             	mov    %rsp,%rbp
    12d7:	48 81 ec 30 01 00 00 	sub    $0x130,%rsp
    12de:	c7 45 d0 01 00 00 00 	movl   $0x1,-0x30(%rbp)
    12e5:	c7 45 d4 01 00 01 00 	movl   $0x10001,-0x2c(%rbp)
    12ec:	c7 45 d8 78 56 34 12 	movl   $0x12345678,-0x28(%rbp)
    12f3:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
    12fa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1301:	e9 82 00 00 00       	jmp    1388 <run_contract+0xb5>
    1306:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    130d:	eb 1d                	jmp    132c <run_contract+0x59>
    130f:	8b 55 f8             	mov    -0x8(%rbp),%edx
    1312:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1315:	89 d6                	mov    %edx,%esi
    1317:	89 c7                	mov    %eax,%edi
    1319:	e8 64 ff ff ff       	call   1282 <pattern_byte>
    131e:	8b 55 f8             	mov    -0x8(%rbp),%edx
    1321:	88 84 15 d0 fe ff ff 	mov    %al,-0x130(%rbp,%rdx,1)
    1328:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    132c:	81 7d f8 ff 00 00 00 	cmpl   $0xff,-0x8(%rbp)
    1333:	76 da                	jbe    130f <run_contract+0x3c>
    1335:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    133c:	eb 40                	jmp    137e <run_contract+0xab>
    133e:	48 c7 45 e8 00 00 00 00 	movq   $0x0,-0x18(%rbp)
    1346:	eb 28                	jmp    1370 <run_contract+0x9d>
    1348:	8b 45 f4             	mov    -0xc(%rbp),%eax
    134b:	8b 44 85 d0          	mov    -0x30(%rbp,%rax,4),%eax
    134f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1353:	48 8d 8d d0 fe ff ff 	lea    -0x130(%rbp),%rcx
    135a:	48 89 ce             	mov    %rcx,%rsi
    135d:	89 c7                	mov    %eax,%edi
    135f:	e8 52 fe ff ff       	call   11b6 <adler_modern>
    1364:	89 c7                	mov    %eax,%edi
    1366:	e8 fc fd ff ff       	call   1167 <emit_u32>
    136b:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
    1370:	48 81 7d e8 00 01 00 00 	cmpq   $0x100,-0x18(%rbp)
    1378:	76 ce                	jbe    1348 <run_contract+0x75>
    137a:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    137e:	83 7d f4 03          	cmpl   $0x3,-0xc(%rbp)
    1382:	76 ba                	jbe    133e <run_contract+0x6b>
    1384:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1388:	83 7d fc 03          	cmpl   $0x3,-0x4(%rbp)
    138c:	0f 86 74 ff ff ff    	jbe    1306 <run_contract+0x33>
    1392:	90                   	nop
    1393:	90                   	nop
    1394:	c9                   	leave
    1395:	c3                   	ret

0000000000001396 <main>:
    1396:	55                   	push   %rbp
    1397:	48 89 e5             	mov    %rsp,%rbp
    139a:	48 83 ec 10          	sub    $0x10,%rsp
    139e:	c7 45 fc f5 79 2b 6d 	movl   $0x6d2b79f5,-0x4(%rbp)
    13a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13a8:	be 69 bd 35 47       	mov    $0x4735bd69,%esi
    13ad:	89 c7                	mov    %eax,%edi
    13af:	e8 95 fd ff ff       	call   1149 <wm_add_v2>
    13b4:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13b7:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13ba:	be 81 f1 af c1       	mov    $0xc1aff181,%esi
    13bf:	89 c7                	mov    %eax,%edi
    13c1:	e8 92 fd ff ff       	call   1158 <wm_xor_v2>
    13c6:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13cc:	be 1b bb ef 8f       	mov    $0x8fefbb1b,%esi
    13d1:	89 c7                	mov    %eax,%edi
    13d3:	e8 80 fd ff ff       	call   1158 <wm_xor_v2>
    13d8:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13db:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13de:	be 4b 97 a1 75       	mov    $0x75a1974b,%esi
    13e3:	89 c7                	mov    %eax,%edi
    13e5:	e8 6e fd ff ff       	call   1158 <wm_xor_v2>
    13ea:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13f0:	be b7 45 fb 8f       	mov    $0x8ffb45b7,%esi
    13f5:	89 c7                	mov    %eax,%edi
    13f7:	e8 5c fd ff ff       	call   1158 <wm_xor_v2>
    13fc:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1402:	be e1 ed ef bb       	mov    $0xbbefede1,%esi
    1407:	89 c7                	mov    %eax,%edi
    1409:	e8 4a fd ff ff       	call   1158 <wm_xor_v2>
    140e:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1411:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1414:	be 77 3d d3 bb       	mov    $0xbbd33d77,%esi
    1419:	89 c7                	mov    %eax,%edi
    141b:	e8 38 fd ff ff       	call   1158 <wm_xor_v2>
    1420:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1423:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1426:	be 77 8b c1 c7       	mov    $0xc7c18b77,%esi
    142b:	89 c7                	mov    %eax,%edi
    142d:	e8 17 fd ff ff       	call   1149 <wm_add_v2>
    1432:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1435:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1438:	be 99 83 05 8f       	mov    $0x8f058399,%esi
    143d:	89 c7                	mov    %eax,%edi
    143f:	e8 05 fd ff ff       	call   1149 <wm_add_v2>
    1444:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1447:	8b 45 fc             	mov    -0x4(%rbp),%eax
    144a:	be cf f1 51 fb       	mov    $0xfb51f1cf,%esi
    144f:	89 c7                	mov    %eax,%edi
    1451:	e8 02 fd ff ff       	call   1158 <wm_xor_v2>
    1456:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1459:	8b 45 fc             	mov    -0x4(%rbp),%eax
    145c:	be ed 5d b5 bb       	mov    $0xbbb55ded,%esi
    1461:	89 c7                	mov    %eax,%edi
    1463:	e8 f0 fc ff ff       	call   1158 <wm_xor_v2>
    1468:	89 45 fc             	mov    %eax,-0x4(%rbp)
    146b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    146e:	be 47 27 ef 71       	mov    $0x71ef2747,%esi
    1473:	89 c7                	mov    %eax,%edi
    1475:	e8 cf fc ff ff       	call   1149 <wm_add_v2>
    147a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    147d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1480:	be bb 99 d9 f5       	mov    $0xf5d999bb,%esi
    1485:	89 c7                	mov    %eax,%edi
    1487:	e8 cc fc ff ff       	call   1158 <wm_xor_v2>
    148c:	89 45 fc             	mov    %eax,-0x4(%rbp)
    148f:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1492:	be 5f 35 ff ad       	mov    $0xadff355f,%esi
    1497:	89 c7                	mov    %eax,%edi
    1499:	e8 ba fc ff ff       	call   1158 <wm_xor_v2>
    149e:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14a4:	be 49 1f bf 3d       	mov    $0x3dbf1f49,%esi
    14a9:	89 c7                	mov    %eax,%edi
    14ab:	e8 99 fc ff ff       	call   1149 <wm_add_v2>
    14b0:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14b6:	be 01 f3 8f 71       	mov    $0x718ff301,%esi
    14bb:	89 c7                	mov    %eax,%edi
    14bd:	e8 96 fc ff ff       	call   1158 <wm_xor_v2>
    14c2:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14c5:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14c8:	be 79 d5 d7 17       	mov    $0x17d7d579,%esi
    14cd:	89 c7                	mov    %eax,%edi
    14cf:	e8 84 fc ff ff       	call   1158 <wm_xor_v2>
    14d4:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14d7:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14da:	be 13 ab 5f 09       	mov    $0x95fab13,%esi
    14df:	89 c7                	mov    %eax,%edi
    14e1:	e8 72 fc ff ff       	call   1158 <wm_xor_v2>
    14e6:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14ec:	be d1 45 3d c9       	mov    $0xc93d45d1,%esi
    14f1:	89 c7                	mov    %eax,%edi
    14f3:	e8 60 fc ff ff       	call   1158 <wm_xor_v2>
    14f8:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14fe:	be 4d 63 c3 1b       	mov    $0x1bc3634d,%esi
    1503:	89 c7                	mov    %eax,%edi
    1505:	e8 4e fc ff ff       	call   1158 <wm_xor_v2>
    150a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    150d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1510:	be f9 05 cf 71       	mov    $0x71cf05f9,%esi
    1515:	89 c7                	mov    %eax,%edi
    1517:	e8 3c fc ff ff       	call   1158 <wm_xor_v2>
    151c:	89 45 fc             	mov    %eax,-0x4(%rbp)
    151f:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1522:	be 6b 19 5f 9f       	mov    $0x9f5f196b,%esi
    1527:	89 c7                	mov    %eax,%edi
    1529:	e8 2a fc ff ff       	call   1158 <wm_xor_v2>
    152e:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1531:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1534:	be e3 63 a5 15       	mov    $0x15a563e3,%esi
    1539:	89 c7                	mov    %eax,%edi
    153b:	e8 09 fc ff ff       	call   1149 <wm_add_v2>
    1540:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1543:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1546:	be 6f 9d e3 49       	mov    $0x49e39d6f,%esi
    154b:	89 c7                	mov    %eax,%edi
    154d:	e8 f7 fb ff ff       	call   1149 <wm_add_v2>
    1552:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1555:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1558:	be af fb e9 23       	mov    $0x23e9fbaf,%esi
    155d:	89 c7                	mov    %eax,%edi
    155f:	e8 f4 fb ff ff       	call   1158 <wm_xor_v2>
    1564:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1567:	8b 45 fc             	mov    -0x4(%rbp),%eax
    156a:	be 41 35 e7 1d       	mov    $0x1de73541,%esi
    156f:	89 c7                	mov    %eax,%edi
    1571:	e8 d3 fb ff ff       	call   1149 <wm_add_v2>
    1576:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1579:	8b 45 fc             	mov    -0x4(%rbp),%eax
    157c:	be 83 fd 85 ed       	mov    $0xed85fd83,%esi
    1581:	89 c7                	mov    %eax,%edi
    1583:	e8 c1 fb ff ff       	call   1149 <wm_add_v2>
    1588:	89 45 fc             	mov    %eax,-0x4(%rbp)
    158b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    158e:	be c7 19 b1 69       	mov    $0x69b119c7,%esi
    1593:	89 c7                	mov    %eax,%edi
    1595:	e8 be fb ff ff       	call   1158 <wm_xor_v2>
    159a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    159d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    15a0:	83 f8 ff             	cmp    $0xffffffff,%eax
    15a3:	75 07                	jne    15ac <main+0x216>
    15a5:	b8 61 00 00 00       	mov    $0x61,%eax
    15aa:	eb 24                	jmp    15d0 <main+0x23a>
    15ac:	e8 22 fd ff ff       	call   12d3 <run_contract>
    15b1:	48 8b 05 68 2a 00 00 	mov    0x2a68(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    15b8:	48 89 c7             	mov    %rax,%rdi
    15bb:	e8 70 fa ff ff       	call   1030 <ferror@plt>
    15c0:	85 c0                	test   %eax,%eax
    15c2:	74 07                	je     15cb <main+0x235>
    15c4:	b8 02 00 00 00       	mov    $0x2,%eax
    15c9:	eb 05                	jmp    15d0 <main+0x23a>
    15cb:	b8 00 00 00 00       	mov    $0x0,%eax
    15d0:	c9                   	leave
    15d1:	c3                   	ret

Disassembly of section .fini:

00000000000015d4 <_fini>:
    15d4:	48 83 ec 08          	sub    $0x8,%rsp
    15d8:	48 83 c4 08          	add    $0x8,%rsp
    15dc:	c3                   	ret
