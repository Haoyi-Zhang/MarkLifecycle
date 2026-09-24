
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
    1074:	48 8d 3d 49 02 00 00 	lea    0x249(%rip),%rdi        # 12c4 <main>
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

00000000000011b6 <callback_record>:
    11b6:	55                   	push   %rbp
    11b7:	48 89 e5             	mov    %rsp,%rbp
    11ba:	89 7d fc             	mov    %edi,-0x4(%rbp)
    11bd:	89 75 f8             	mov    %esi,-0x8(%rbp)
    11c0:	89 55 f4             	mov    %edx,-0xc(%rbp)
    11c3:	8b 45 fc             	mov    -0x4(%rbp),%eax
    11c6:	8d 50 01             	lea    0x1(%rax),%edx
    11c9:	8b 45 f8             	mov    -0x8(%rbp),%eax
    11cc:	83 c0 01             	add    $0x1,%eax
    11cf:	c1 e0 04             	shl    $0x4,%eax
    11d2:	09 c2                	or     %eax,%edx
    11d4:	8b 45 f4             	mov    -0xc(%rbp),%eax
    11d7:	83 c0 01             	add    $0x1,%eax
    11da:	c1 e0 08             	shl    $0x8,%eax
    11dd:	09 d0                	or     %edx,%eax
    11df:	0d 00 00 5a 00       	or     $0x5a0000,%eax
    11e4:	5d                   	pop    %rbp
    11e5:	c3                   	ret

00000000000011e6 <normalized_record>:
    11e6:	55                   	push   %rbp
    11e7:	48 89 e5             	mov    %rsp,%rbp
    11ea:	48 83 ec 20          	sub    $0x20,%rsp
    11ee:	89 7d ec             	mov    %edi,-0x14(%rbp)
    11f1:	89 75 e8             	mov    %esi,-0x18(%rbp)
    11f4:	89 55 e4             	mov    %edx,-0x1c(%rbp)
    11f7:	89 4d e0             	mov    %ecx,-0x20(%rbp)
    11fa:	48 8d 05 b5 ff ff ff 	lea    -0x4b(%rip),%rax        # 11b6 <callback_record>
    1201:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1205:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
    1209:	75 08                	jne    1213 <normalized_record+0x2d>
    120b:	8b 45 ec             	mov    -0x14(%rbp),%eax
    120e:	3b 45 e8             	cmp    -0x18(%rbp),%eax
    1211:	73 07                	jae    121a <normalized_record+0x34>
    1213:	b8 00 00 00 00       	mov    $0x0,%eax
    1218:	eb 14                	jmp    122e <normalized_record+0x48>
    121a:	8b 55 e0             	mov    -0x20(%rbp),%edx
    121d:	8b 4d e8             	mov    -0x18(%rbp),%ecx
    1220:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1223:	4c 8b 45 f8          	mov    -0x8(%rbp),%r8
    1227:	89 ce                	mov    %ecx,%esi
    1229:	89 c7                	mov    %eax,%edi
    122b:	41 ff d0             	call   *%r8
    122e:	c9                   	leave
    122f:	c3                   	ret

0000000000001230 <run_contract>:
    1230:	55                   	push   %rbp
    1231:	48 89 e5             	mov    %rsp,%rbp
    1234:	48 83 ec 20          	sub    $0x20,%rsp
    1238:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    123f:	eb 79                	jmp    12ba <run_contract+0x8a>
    1241:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    1248:	eb 66                	jmp    12b0 <run_contract+0x80>
    124a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    1251:	eb 53                	jmp    12a6 <run_contract+0x76>
    1253:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
    125a:	eb 40                	jmp    129c <run_contract+0x6c>
    125c:	8b 4d f0             	mov    -0x10(%rbp),%ecx
    125f:	8b 55 f4             	mov    -0xc(%rbp),%edx
    1262:	8b 75 f8             	mov    -0x8(%rbp),%esi
    1265:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1268:	89 c7                	mov    %eax,%edi
    126a:	e8 77 ff ff ff       	call   11e6 <normalized_record>
    126f:	89 45 ec             	mov    %eax,-0x14(%rbp)
    1272:	83 7d fc 05          	cmpl   $0x5,-0x4(%rbp)
    1276:	75 16                	jne    128e <run_contract+0x5e>
    1278:	83 7d f8 02          	cmpl   $0x2,-0x8(%rbp)
    127c:	75 10                	jne    128e <run_contract+0x5e>
    127e:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
    1282:	75 0a                	jne    128e <run_contract+0x5e>
    1284:	83 7d f0 01          	cmpl   $0x1,-0x10(%rbp)
    1288:	75 04                	jne    128e <run_contract+0x5e>
    128a:	83 75 ec 01          	xorl   $0x1,-0x14(%rbp)
    128e:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1291:	89 c7                	mov    %eax,%edi
    1293:	e8 cf fe ff ff       	call   1167 <emit_u32>
    1298:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
    129c:	83 7d f0 01          	cmpl   $0x1,-0x10(%rbp)
    12a0:	76 ba                	jbe    125c <run_contract+0x2c>
    12a2:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    12a6:	83 7d f4 01          	cmpl   $0x1,-0xc(%rbp)
    12aa:	76 a7                	jbe    1253 <run_contract+0x23>
    12ac:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    12b0:	83 7d f8 05          	cmpl   $0x5,-0x8(%rbp)
    12b4:	76 94                	jbe    124a <run_contract+0x1a>
    12b6:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    12ba:	83 7d fc 05          	cmpl   $0x5,-0x4(%rbp)
    12be:	76 81                	jbe    1241 <run_contract+0x11>
    12c0:	90                   	nop
    12c1:	90                   	nop
    12c2:	c9                   	leave
    12c3:	c3                   	ret

00000000000012c4 <main>:
    12c4:	55                   	push   %rbp
    12c5:	48 89 e5             	mov    %rsp,%rbp
    12c8:	48 83 ec 10          	sub    $0x10,%rsp
    12cc:	c7 45 fc f5 79 2b 6d 	movl   $0x6d2b79f5,-0x4(%rbp)
    12d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12d6:	be a5 8b 95 77       	mov    $0x77958ba5,%esi
    12db:	89 c7                	mov    %eax,%edi
    12dd:	e8 67 fe ff ff       	call   1149 <wm_add_v2>
    12e2:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12e5:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12e8:	be db 77 77 0b       	mov    $0xb7777db,%esi
    12ed:	89 c7                	mov    %eax,%edi
    12ef:	e8 55 fe ff ff       	call   1149 <wm_add_v2>
    12f4:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12fa:	be d3 15 4f b9       	mov    $0xb94f15d3,%esi
    12ff:	89 c7                	mov    %eax,%edi
    1301:	e8 43 fe ff ff       	call   1149 <wm_add_v2>
    1306:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1309:	8b 45 fc             	mov    -0x4(%rbp),%eax
    130c:	be f3 dd dd 79       	mov    $0x79ddddf3,%esi
    1311:	89 c7                	mov    %eax,%edi
    1313:	e8 40 fe ff ff       	call   1158 <wm_xor_v2>
    1318:	89 45 fc             	mov    %eax,-0x4(%rbp)
    131b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    131e:	be 1b b3 7f 6b       	mov    $0x6b7fb31b,%esi
    1323:	89 c7                	mov    %eax,%edi
    1325:	e8 2e fe ff ff       	call   1158 <wm_xor_v2>
    132a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    132d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1330:	be 97 d3 bd 51       	mov    $0x51bdd397,%esi
    1335:	89 c7                	mov    %eax,%edi
    1337:	e8 0d fe ff ff       	call   1149 <wm_add_v2>
    133c:	89 45 fc             	mov    %eax,-0x4(%rbp)
    133f:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1342:	be 31 5f a5 11       	mov    $0x11a55f31,%esi
    1347:	89 c7                	mov    %eax,%edi
    1349:	e8 0a fe ff ff       	call   1158 <wm_xor_v2>
    134e:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1351:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1354:	be fb 81 cf 13       	mov    $0x13cf81fb,%esi
    1359:	89 c7                	mov    %eax,%edi
    135b:	e8 e9 fd ff ff       	call   1149 <wm_add_v2>
    1360:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1363:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1366:	be e7 4d 13 81       	mov    $0x81134de7,%esi
    136b:	89 c7                	mov    %eax,%edi
    136d:	e8 e6 fd ff ff       	call   1158 <wm_xor_v2>
    1372:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1375:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1378:	be 27 49 0f 37       	mov    $0x370f4927,%esi
    137d:	89 c7                	mov    %eax,%edi
    137f:	e8 c5 fd ff ff       	call   1149 <wm_add_v2>
    1384:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1387:	8b 45 fc             	mov    -0x4(%rbp),%eax
    138a:	be 77 55 bf b9       	mov    $0xb9bf5577,%esi
    138f:	89 c7                	mov    %eax,%edi
    1391:	e8 c2 fd ff ff       	call   1158 <wm_xor_v2>
    1396:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1399:	8b 45 fc             	mov    -0x4(%rbp),%eax
    139c:	be 7f 7d e9 cd       	mov    $0xcde97d7f,%esi
    13a1:	89 c7                	mov    %eax,%edi
    13a3:	e8 b0 fd ff ff       	call   1158 <wm_xor_v2>
    13a8:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13ae:	be 1f 9f 4b f5       	mov    $0xf54b9f1f,%esi
    13b3:	89 c7                	mov    %eax,%edi
    13b5:	e8 8f fd ff ff       	call   1149 <wm_add_v2>
    13ba:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13c0:	be d9 5f cb 8b       	mov    $0x8bcb5fd9,%esi
    13c5:	89 c7                	mov    %eax,%edi
    13c7:	e8 8c fd ff ff       	call   1158 <wm_xor_v2>
    13cc:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13d2:	be 77 41 45 d3       	mov    $0xd3454177,%esi
    13d7:	89 c7                	mov    %eax,%edi
    13d9:	e8 7a fd ff ff       	call   1158 <wm_xor_v2>
    13de:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13e1:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13e4:	be ff 37 55 a5       	mov    $0xa55537ff,%esi
    13e9:	89 c7                	mov    %eax,%edi
    13eb:	e8 59 fd ff ff       	call   1149 <wm_add_v2>
    13f0:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13f6:	be 01 d7 9f 27       	mov    $0x279fd701,%esi
    13fb:	89 c7                	mov    %eax,%edi
    13fd:	e8 56 fd ff ff       	call   1158 <wm_xor_v2>
    1402:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1405:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1408:	be 61 83 3f e5       	mov    $0xe53f8361,%esi
    140d:	89 c7                	mov    %eax,%edi
    140f:	e8 35 fd ff ff       	call   1149 <wm_add_v2>
    1414:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1417:	8b 45 fc             	mov    -0x4(%rbp),%eax
    141a:	be b5 4d 5d c9       	mov    $0xc95d4db5,%esi
    141f:	89 c7                	mov    %eax,%edi
    1421:	e8 23 fd ff ff       	call   1149 <wm_add_v2>
    1426:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1429:	8b 45 fc             	mov    -0x4(%rbp),%eax
    142c:	be 2f e3 c9 59       	mov    $0x59c9e32f,%esi
    1431:	89 c7                	mov    %eax,%edi
    1433:	e8 20 fd ff ff       	call   1158 <wm_xor_v2>
    1438:	89 45 fc             	mov    %eax,-0x4(%rbp)
    143b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    143e:	be 93 1f a3 af       	mov    $0xafa31f93,%esi
    1443:	89 c7                	mov    %eax,%edi
    1445:	e8 0e fd ff ff       	call   1158 <wm_xor_v2>
    144a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    144d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1450:	be 09 77 b9 b9       	mov    $0xb9b97709,%esi
    1455:	89 c7                	mov    %eax,%edi
    1457:	e8 fc fc ff ff       	call   1158 <wm_xor_v2>
    145c:	89 45 fc             	mov    %eax,-0x4(%rbp)
    145f:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1462:	be 55 87 83 69       	mov    $0x69838755,%esi
    1467:	89 c7                	mov    %eax,%edi
    1469:	e8 db fc ff ff       	call   1149 <wm_add_v2>
    146e:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1471:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1474:	be 57 87 a9 07       	mov    $0x7a98757,%esi
    1479:	89 c7                	mov    %eax,%edi
    147b:	e8 c9 fc ff ff       	call   1149 <wm_add_v2>
    1480:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1483:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1486:	be d5 6f 01 15       	mov    $0x15016fd5,%esi
    148b:	89 c7                	mov    %eax,%edi
    148d:	e8 b7 fc ff ff       	call   1149 <wm_add_v2>
    1492:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1495:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1498:	be 53 69 3f 61       	mov    $0x613f6953,%esi
    149d:	89 c7                	mov    %eax,%edi
    149f:	e8 a5 fc ff ff       	call   1149 <wm_add_v2>
    14a4:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14a7:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14aa:	be 15 6b a9 5b       	mov    $0x5ba96b15,%esi
    14af:	89 c7                	mov    %eax,%edi
    14b1:	e8 a2 fc ff ff       	call   1158 <wm_xor_v2>
    14b6:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14bc:	be ed e3 9b 23       	mov    $0x239be3ed,%esi
    14c1:	89 c7                	mov    %eax,%edi
    14c3:	e8 81 fc ff ff       	call   1149 <wm_add_v2>
    14c8:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14cb:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14ce:	83 f8 ff             	cmp    $0xffffffff,%eax
    14d1:	75 07                	jne    14da <main+0x216>
    14d3:	b8 61 00 00 00       	mov    $0x61,%eax
    14d8:	eb 24                	jmp    14fe <main+0x23a>
    14da:	e8 51 fd ff ff       	call   1230 <run_contract>
    14df:	48 8b 05 3a 2b 00 00 	mov    0x2b3a(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    14e6:	48 89 c7             	mov    %rax,%rdi
    14e9:	e8 42 fb ff ff       	call   1030 <ferror@plt>
    14ee:	85 c0                	test   %eax,%eax
    14f0:	74 07                	je     14f9 <main+0x235>
    14f2:	b8 02 00 00 00       	mov    $0x2,%eax
    14f7:	eb 05                	jmp    14fe <main+0x23a>
    14f9:	b8 00 00 00 00       	mov    $0x0,%eax
    14fe:	c9                   	leave
    14ff:	c3                   	ret

Disassembly of section .fini:

0000000000001500 <_fini>:
    1500:	48 83 ec 08          	sub    $0x8,%rsp
    1504:	48 83 c4 08          	add    $0x8,%rsp
    1508:	c3                   	ret
