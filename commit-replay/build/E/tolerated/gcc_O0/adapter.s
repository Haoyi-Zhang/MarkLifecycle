
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
    1074:	48 8d 3d e9 02 00 00 	lea    0x2e9(%rip),%rdi        # 1364 <main>
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
    11ba:	89 7d ec             	mov    %edi,-0x14(%rbp)
    11bd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    11c1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    11c5:	8b 45 ec             	mov    -0x14(%rbp),%eax
    11c8:	0f b7 c0             	movzwl %ax,%eax
    11cb:	89 45 fc             	mov    %eax,-0x4(%rbp)
    11ce:	8b 45 ec             	mov    -0x14(%rbp),%eax
    11d1:	c1 e8 10             	shr    $0x10,%eax
    11d4:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11d7:	eb 5b                	jmp    1234 <adler_modern+0x7e>
    11d9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    11dd:	48 8d 50 01          	lea    0x1(%rax),%rdx
    11e1:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    11e5:	0f b6 00             	movzbl (%rax),%eax
    11e8:	0f b6 c0             	movzbl %al,%eax
    11eb:	01 45 fc             	add    %eax,-0x4(%rbp)
    11ee:	8b 45 fc             	mov    -0x4(%rbp),%eax
    11f1:	01 45 f8             	add    %eax,-0x8(%rbp)
    11f4:	8b 55 fc             	mov    -0x4(%rbp),%edx
    11f7:	89 d1                	mov    %edx,%ecx
    11f9:	b8 71 80 07 80       	mov    $0x80078071,%eax
    11fe:	48 0f af c1          	imul   %rcx,%rax
    1202:	48 c1 e8 20          	shr    $0x20,%rax
    1206:	c1 e8 0f             	shr    $0xf,%eax
    1209:	69 c0 f1 ff 00 00    	imul   $0xfff1,%eax,%eax
    120f:	29 c2                	sub    %eax,%edx
    1211:	89 55 fc             	mov    %edx,-0x4(%rbp)
    1214:	8b 55 f8             	mov    -0x8(%rbp),%edx
    1217:	89 d1                	mov    %edx,%ecx
    1219:	b8 71 80 07 80       	mov    $0x80078071,%eax
    121e:	48 0f af c1          	imul   %rcx,%rax
    1222:	48 c1 e8 20          	shr    $0x20,%rax
    1226:	c1 e8 0f             	shr    $0xf,%eax
    1229:	69 c0 f1 ff 00 00    	imul   $0xfff1,%eax,%eax
    122f:	29 c2                	sub    %eax,%edx
    1231:	89 55 f8             	mov    %edx,-0x8(%rbp)
    1234:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1238:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
    123c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    1240:	48 85 c0             	test   %rax,%rax
    1243:	75 94                	jne    11d9 <adler_modern+0x23>
    1245:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1248:	c1 e0 10             	shl    $0x10,%eax
    124b:	0b 45 fc             	or     -0x4(%rbp),%eax
    124e:	5d                   	pop    %rbp
    124f:	c3                   	ret

0000000000001250 <pattern_byte>:
    1250:	55                   	push   %rbp
    1251:	48 89 e5             	mov    %rsp,%rbp
    1254:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1257:	89 75 f8             	mov    %esi,-0x8(%rbp)
    125a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    125e:	75 05                	jne    1265 <pattern_byte+0x15>
    1260:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1263:	eb 3a                	jmp    129f <pattern_byte+0x4f>
    1265:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
    1269:	75 07                	jne    1272 <pattern_byte+0x22>
    126b:	8b 45 f8             	mov    -0x8(%rbp),%eax
    126e:	f7 d0                	not    %eax
    1270:	eb 2d                	jmp    129f <pattern_byte+0x4f>
    1272:	83 7d fc 02          	cmpl   $0x2,-0x4(%rbp)
    1276:	75 11                	jne    1289 <pattern_byte+0x39>
    1278:	8b 45 f8             	mov    -0x8(%rbp),%eax
    127b:	89 c2                	mov    %eax,%edx
    127d:	89 d0                	mov    %edx,%eax
    127f:	c1 e0 04             	shl    $0x4,%eax
    1282:	01 d0                	add    %edx,%eax
    1284:	83 c0 1f             	add    $0x1f,%eax
    1287:	eb 16                	jmp    129f <pattern_byte+0x4f>
    1289:	8b 45 f8             	mov    -0x8(%rbp),%eax
    128c:	83 e0 01             	and    $0x1,%eax
    128f:	85 c0                	test   %eax,%eax
    1291:	74 07                	je     129a <pattern_byte+0x4a>
    1293:	b8 aa ff ff ff       	mov    $0xffffffaa,%eax
    1298:	eb 05                	jmp    129f <pattern_byte+0x4f>
    129a:	b8 55 00 00 00       	mov    $0x55,%eax
    129f:	5d                   	pop    %rbp
    12a0:	c3                   	ret

00000000000012a1 <run_contract>:
    12a1:	55                   	push   %rbp
    12a2:	48 89 e5             	mov    %rsp,%rbp
    12a5:	48 81 ec 30 01 00 00 	sub    $0x130,%rsp
    12ac:	c7 45 d0 01 00 00 00 	movl   $0x1,-0x30(%rbp)
    12b3:	c7 45 d4 01 00 01 00 	movl   $0x10001,-0x2c(%rbp)
    12ba:	c7 45 d8 78 56 34 12 	movl   $0x12345678,-0x28(%rbp)
    12c1:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
    12c8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    12cf:	e9 82 00 00 00       	jmp    1356 <run_contract+0xb5>
    12d4:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    12db:	eb 1d                	jmp    12fa <run_contract+0x59>
    12dd:	8b 55 f8             	mov    -0x8(%rbp),%edx
    12e0:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12e3:	89 d6                	mov    %edx,%esi
    12e5:	89 c7                	mov    %eax,%edi
    12e7:	e8 64 ff ff ff       	call   1250 <pattern_byte>
    12ec:	8b 55 f8             	mov    -0x8(%rbp),%edx
    12ef:	88 84 15 d0 fe ff ff 	mov    %al,-0x130(%rbp,%rdx,1)
    12f6:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    12fa:	81 7d f8 ff 00 00 00 	cmpl   $0xff,-0x8(%rbp)
    1301:	76 da                	jbe    12dd <run_contract+0x3c>
    1303:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    130a:	eb 40                	jmp    134c <run_contract+0xab>
    130c:	48 c7 45 e8 00 00 00 00 	movq   $0x0,-0x18(%rbp)
    1314:	eb 28                	jmp    133e <run_contract+0x9d>
    1316:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1319:	8b 44 85 d0          	mov    -0x30(%rbp,%rax,4),%eax
    131d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1321:	48 8d 8d d0 fe ff ff 	lea    -0x130(%rbp),%rcx
    1328:	48 89 ce             	mov    %rcx,%rsi
    132b:	89 c7                	mov    %eax,%edi
    132d:	e8 84 fe ff ff       	call   11b6 <adler_modern>
    1332:	89 c7                	mov    %eax,%edi
    1334:	e8 2e fe ff ff       	call   1167 <emit_u32>
    1339:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
    133e:	48 81 7d e8 00 01 00 00 	cmpq   $0x100,-0x18(%rbp)
    1346:	76 ce                	jbe    1316 <run_contract+0x75>
    1348:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    134c:	83 7d f4 03          	cmpl   $0x3,-0xc(%rbp)
    1350:	76 ba                	jbe    130c <run_contract+0x6b>
    1352:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1356:	83 7d fc 03          	cmpl   $0x3,-0x4(%rbp)
    135a:	0f 86 74 ff ff ff    	jbe    12d4 <run_contract+0x33>
    1360:	90                   	nop
    1361:	90                   	nop
    1362:	c9                   	leave
    1363:	c3                   	ret

0000000000001364 <main>:
    1364:	55                   	push   %rbp
    1365:	48 89 e5             	mov    %rsp,%rbp
    1368:	48 83 ec 10          	sub    $0x10,%rsp
    136c:	c7 45 fc f5 79 2b 6d 	movl   $0x6d2b79f5,-0x4(%rbp)
    1373:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1376:	be 69 bd 35 47       	mov    $0x4735bd69,%esi
    137b:	89 c7                	mov    %eax,%edi
    137d:	e8 c7 fd ff ff       	call   1149 <wm_add_v2>
    1382:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1385:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1388:	be 81 f1 af c1       	mov    $0xc1aff181,%esi
    138d:	89 c7                	mov    %eax,%edi
    138f:	e8 c4 fd ff ff       	call   1158 <wm_xor_v2>
    1394:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1397:	8b 45 fc             	mov    -0x4(%rbp),%eax
    139a:	be 1b bb ef 8f       	mov    $0x8fefbb1b,%esi
    139f:	89 c7                	mov    %eax,%edi
    13a1:	e8 b2 fd ff ff       	call   1158 <wm_xor_v2>
    13a6:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13ac:	be 4b 97 a1 75       	mov    $0x75a1974b,%esi
    13b1:	89 c7                	mov    %eax,%edi
    13b3:	e8 a0 fd ff ff       	call   1158 <wm_xor_v2>
    13b8:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13bb:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13be:	be b7 45 fb 8f       	mov    $0x8ffb45b7,%esi
    13c3:	89 c7                	mov    %eax,%edi
    13c5:	e8 8e fd ff ff       	call   1158 <wm_xor_v2>
    13ca:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13cd:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13d0:	be 77 3d d3 bb       	mov    $0xbbd33d77,%esi
    13d5:	89 c7                	mov    %eax,%edi
    13d7:	e8 7c fd ff ff       	call   1158 <wm_xor_v2>
    13dc:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13df:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13e2:	be 77 8b c1 c7       	mov    $0xc7c18b77,%esi
    13e7:	89 c7                	mov    %eax,%edi
    13e9:	e8 5b fd ff ff       	call   1149 <wm_add_v2>
    13ee:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13f4:	be 99 83 05 8f       	mov    $0x8f058399,%esi
    13f9:	89 c7                	mov    %eax,%edi
    13fb:	e8 49 fd ff ff       	call   1149 <wm_add_v2>
    1400:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1403:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1406:	be cf f1 51 fb       	mov    $0xfb51f1cf,%esi
    140b:	89 c7                	mov    %eax,%edi
    140d:	e8 46 fd ff ff       	call   1158 <wm_xor_v2>
    1412:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1415:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1418:	be ed 5d b5 bb       	mov    $0xbbb55ded,%esi
    141d:	89 c7                	mov    %eax,%edi
    141f:	e8 34 fd ff ff       	call   1158 <wm_xor_v2>
    1424:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1427:	8b 45 fc             	mov    -0x4(%rbp),%eax
    142a:	be 47 27 ef 71       	mov    $0x71ef2747,%esi
    142f:	89 c7                	mov    %eax,%edi
    1431:	e8 13 fd ff ff       	call   1149 <wm_add_v2>
    1436:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1439:	8b 45 fc             	mov    -0x4(%rbp),%eax
    143c:	be bb 99 d9 f5       	mov    $0xf5d999bb,%esi
    1441:	89 c7                	mov    %eax,%edi
    1443:	e8 10 fd ff ff       	call   1158 <wm_xor_v2>
    1448:	89 45 fc             	mov    %eax,-0x4(%rbp)
    144b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    144e:	be 5f 35 ff ad       	mov    $0xadff355f,%esi
    1453:	89 c7                	mov    %eax,%edi
    1455:	e8 fe fc ff ff       	call   1158 <wm_xor_v2>
    145a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    145d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1460:	be 49 1f bf 3d       	mov    $0x3dbf1f49,%esi
    1465:	89 c7                	mov    %eax,%edi
    1467:	e8 dd fc ff ff       	call   1149 <wm_add_v2>
    146c:	89 45 fc             	mov    %eax,-0x4(%rbp)
    146f:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1472:	be 01 f3 8f 71       	mov    $0x718ff301,%esi
    1477:	89 c7                	mov    %eax,%edi
    1479:	e8 da fc ff ff       	call   1158 <wm_xor_v2>
    147e:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1481:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1484:	be 79 d5 d7 17       	mov    $0x17d7d579,%esi
    1489:	89 c7                	mov    %eax,%edi
    148b:	e8 c8 fc ff ff       	call   1158 <wm_xor_v2>
    1490:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1493:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1496:	be 13 ab 5f 09       	mov    $0x95fab13,%esi
    149b:	89 c7                	mov    %eax,%edi
    149d:	e8 b6 fc ff ff       	call   1158 <wm_xor_v2>
    14a2:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14a8:	be d1 45 3d c9       	mov    $0xc93d45d1,%esi
    14ad:	89 c7                	mov    %eax,%edi
    14af:	e8 a4 fc ff ff       	call   1158 <wm_xor_v2>
    14b4:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14b7:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14ba:	be f9 05 cf 71       	mov    $0x71cf05f9,%esi
    14bf:	89 c7                	mov    %eax,%edi
    14c1:	e8 92 fc ff ff       	call   1158 <wm_xor_v2>
    14c6:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14cc:	be 6b 19 5f 9f       	mov    $0x9f5f196b,%esi
    14d1:	89 c7                	mov    %eax,%edi
    14d3:	e8 80 fc ff ff       	call   1158 <wm_xor_v2>
    14d8:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14db:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14de:	be e3 63 a5 15       	mov    $0x15a563e3,%esi
    14e3:	89 c7                	mov    %eax,%edi
    14e5:	e8 5f fc ff ff       	call   1149 <wm_add_v2>
    14ea:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14f0:	be 6f 9d e3 49       	mov    $0x49e39d6f,%esi
    14f5:	89 c7                	mov    %eax,%edi
    14f7:	e8 4d fc ff ff       	call   1149 <wm_add_v2>
    14fc:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1502:	be af fb e9 23       	mov    $0x23e9fbaf,%esi
    1507:	89 c7                	mov    %eax,%edi
    1509:	e8 4a fc ff ff       	call   1158 <wm_xor_v2>
    150e:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1511:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1514:	be 41 35 e7 1d       	mov    $0x1de73541,%esi
    1519:	89 c7                	mov    %eax,%edi
    151b:	e8 29 fc ff ff       	call   1149 <wm_add_v2>
    1520:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1523:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1526:	be 83 fd 85 ed       	mov    $0xed85fd83,%esi
    152b:	89 c7                	mov    %eax,%edi
    152d:	e8 17 fc ff ff       	call   1149 <wm_add_v2>
    1532:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1535:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1538:	be c7 19 b1 69       	mov    $0x69b119c7,%esi
    153d:	89 c7                	mov    %eax,%edi
    153f:	e8 14 fc ff ff       	call   1158 <wm_xor_v2>
    1544:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1547:	8b 45 fc             	mov    -0x4(%rbp),%eax
    154a:	83 f8 ff             	cmp    $0xffffffff,%eax
    154d:	75 07                	jne    1556 <main+0x1f2>
    154f:	b8 61 00 00 00       	mov    $0x61,%eax
    1554:	eb 24                	jmp    157a <main+0x216>
    1556:	e8 46 fd ff ff       	call   12a1 <run_contract>
    155b:	48 8b 05 be 2a 00 00 	mov    0x2abe(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    1562:	48 89 c7             	mov    %rax,%rdi
    1565:	e8 c6 fa ff ff       	call   1030 <ferror@plt>
    156a:	85 c0                	test   %eax,%eax
    156c:	74 07                	je     1575 <main+0x211>
    156e:	b8 02 00 00 00       	mov    $0x2,%eax
    1573:	eb 05                	jmp    157a <main+0x216>
    1575:	b8 00 00 00 00       	mov    $0x0,%eax
    157a:	c9                   	leave
    157b:	c3                   	ret

Disassembly of section .fini:

000000000000157c <_fini>:
    157c:	48 83 ec 08          	sub    $0x8,%rsp
    1580:	48 83 c4 08          	add    $0x8,%rsp
    1584:	c3                   	ret
