
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
    1074:	48 8d 3d 2d 02 00 00 	lea    0x22d(%rip),%rdi        # 12a8 <main>
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
    123f:	eb 5d                	jmp    129e <run_contract+0x6e>
    1241:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    1248:	eb 4a                	jmp    1294 <run_contract+0x64>
    124a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    1251:	eb 37                	jmp    128a <run_contract+0x5a>
    1253:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
    125a:	eb 24                	jmp    1280 <run_contract+0x50>
    125c:	8b 4d f0             	mov    -0x10(%rbp),%ecx
    125f:	8b 55 f4             	mov    -0xc(%rbp),%edx
    1262:	8b 75 f8             	mov    -0x8(%rbp),%esi
    1265:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1268:	89 c7                	mov    %eax,%edi
    126a:	e8 77 ff ff ff       	call   11e6 <normalized_record>
    126f:	89 45 ec             	mov    %eax,-0x14(%rbp)
    1272:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1275:	89 c7                	mov    %eax,%edi
    1277:	e8 eb fe ff ff       	call   1167 <emit_u32>
    127c:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
    1280:	83 7d f0 01          	cmpl   $0x1,-0x10(%rbp)
    1284:	76 d6                	jbe    125c <run_contract+0x2c>
    1286:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    128a:	83 7d f4 01          	cmpl   $0x1,-0xc(%rbp)
    128e:	76 c3                	jbe    1253 <run_contract+0x23>
    1290:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    1294:	83 7d f8 05          	cmpl   $0x5,-0x8(%rbp)
    1298:	76 b0                	jbe    124a <run_contract+0x1a>
    129a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    129e:	83 7d fc 05          	cmpl   $0x5,-0x4(%rbp)
    12a2:	76 9d                	jbe    1241 <run_contract+0x11>
    12a4:	90                   	nop
    12a5:	90                   	nop
    12a6:	c9                   	leave
    12a7:	c3                   	ret

00000000000012a8 <main>:
    12a8:	55                   	push   %rbp
    12a9:	48 89 e5             	mov    %rsp,%rbp
    12ac:	48 83 ec 10          	sub    $0x10,%rsp
    12b0:	c7 45 fc f5 79 2b 6d 	movl   $0x6d2b79f5,-0x4(%rbp)
    12b7:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12ba:	be a5 8b 95 77       	mov    $0x77958ba5,%esi
    12bf:	89 c7                	mov    %eax,%edi
    12c1:	e8 83 fe ff ff       	call   1149 <wm_add_v2>
    12c6:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12cc:	be db 77 77 0b       	mov    $0xb7777db,%esi
    12d1:	89 c7                	mov    %eax,%edi
    12d3:	e8 71 fe ff ff       	call   1149 <wm_add_v2>
    12d8:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12db:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12de:	be d3 15 4f b9       	mov    $0xb94f15d3,%esi
    12e3:	89 c7                	mov    %eax,%edi
    12e5:	e8 5f fe ff ff       	call   1149 <wm_add_v2>
    12ea:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12f0:	be f3 dd dd 79       	mov    $0x79ddddf3,%esi
    12f5:	89 c7                	mov    %eax,%edi
    12f7:	e8 5c fe ff ff       	call   1158 <wm_xor_v2>
    12fc:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1302:	be 1b b3 7f 6b       	mov    $0x6b7fb31b,%esi
    1307:	89 c7                	mov    %eax,%edi
    1309:	e8 4a fe ff ff       	call   1158 <wm_xor_v2>
    130e:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1311:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1314:	be 31 5f a5 11       	mov    $0x11a55f31,%esi
    1319:	89 c7                	mov    %eax,%edi
    131b:	e8 38 fe ff ff       	call   1158 <wm_xor_v2>
    1320:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1323:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1326:	be fb 81 cf 13       	mov    $0x13cf81fb,%esi
    132b:	89 c7                	mov    %eax,%edi
    132d:	e8 17 fe ff ff       	call   1149 <wm_add_v2>
    1332:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1335:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1338:	be e7 4d 13 81       	mov    $0x81134de7,%esi
    133d:	89 c7                	mov    %eax,%edi
    133f:	e8 14 fe ff ff       	call   1158 <wm_xor_v2>
    1344:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1347:	8b 45 fc             	mov    -0x4(%rbp),%eax
    134a:	be 27 49 0f 37       	mov    $0x370f4927,%esi
    134f:	89 c7                	mov    %eax,%edi
    1351:	e8 f3 fd ff ff       	call   1149 <wm_add_v2>
    1356:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1359:	8b 45 fc             	mov    -0x4(%rbp),%eax
    135c:	be 77 55 bf b9       	mov    $0xb9bf5577,%esi
    1361:	89 c7                	mov    %eax,%edi
    1363:	e8 f0 fd ff ff       	call   1158 <wm_xor_v2>
    1368:	89 45 fc             	mov    %eax,-0x4(%rbp)
    136b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    136e:	be 7f 7d e9 cd       	mov    $0xcde97d7f,%esi
    1373:	89 c7                	mov    %eax,%edi
    1375:	e8 de fd ff ff       	call   1158 <wm_xor_v2>
    137a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    137d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1380:	be 1f 9f 4b f5       	mov    $0xf54b9f1f,%esi
    1385:	89 c7                	mov    %eax,%edi
    1387:	e8 bd fd ff ff       	call   1149 <wm_add_v2>
    138c:	89 45 fc             	mov    %eax,-0x4(%rbp)
    138f:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1392:	be d9 5f cb 8b       	mov    $0x8bcb5fd9,%esi
    1397:	89 c7                	mov    %eax,%edi
    1399:	e8 ba fd ff ff       	call   1158 <wm_xor_v2>
    139e:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13a4:	be 77 41 45 d3       	mov    $0xd3454177,%esi
    13a9:	89 c7                	mov    %eax,%edi
    13ab:	e8 a8 fd ff ff       	call   1158 <wm_xor_v2>
    13b0:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13b6:	be ff 37 55 a5       	mov    $0xa55537ff,%esi
    13bb:	89 c7                	mov    %eax,%edi
    13bd:	e8 87 fd ff ff       	call   1149 <wm_add_v2>
    13c2:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13c5:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13c8:	be 01 d7 9f 27       	mov    $0x279fd701,%esi
    13cd:	89 c7                	mov    %eax,%edi
    13cf:	e8 84 fd ff ff       	call   1158 <wm_xor_v2>
    13d4:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13d7:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13da:	be 61 83 3f e5       	mov    $0xe53f8361,%esi
    13df:	89 c7                	mov    %eax,%edi
    13e1:	e8 63 fd ff ff       	call   1149 <wm_add_v2>
    13e6:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13ec:	be b5 4d 5d c9       	mov    $0xc95d4db5,%esi
    13f1:	89 c7                	mov    %eax,%edi
    13f3:	e8 51 fd ff ff       	call   1149 <wm_add_v2>
    13f8:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13fe:	be 93 1f a3 af       	mov    $0xafa31f93,%esi
    1403:	89 c7                	mov    %eax,%edi
    1405:	e8 4e fd ff ff       	call   1158 <wm_xor_v2>
    140a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    140d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1410:	be 09 77 b9 b9       	mov    $0xb9b97709,%esi
    1415:	89 c7                	mov    %eax,%edi
    1417:	e8 3c fd ff ff       	call   1158 <wm_xor_v2>
    141c:	89 45 fc             	mov    %eax,-0x4(%rbp)
    141f:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1422:	be 55 87 83 69       	mov    $0x69838755,%esi
    1427:	89 c7                	mov    %eax,%edi
    1429:	e8 1b fd ff ff       	call   1149 <wm_add_v2>
    142e:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1431:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1434:	be 57 87 a9 07       	mov    $0x7a98757,%esi
    1439:	89 c7                	mov    %eax,%edi
    143b:	e8 09 fd ff ff       	call   1149 <wm_add_v2>
    1440:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1443:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1446:	be d5 6f 01 15       	mov    $0x15016fd5,%esi
    144b:	89 c7                	mov    %eax,%edi
    144d:	e8 f7 fc ff ff       	call   1149 <wm_add_v2>
    1452:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1455:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1458:	be 53 69 3f 61       	mov    $0x613f6953,%esi
    145d:	89 c7                	mov    %eax,%edi
    145f:	e8 e5 fc ff ff       	call   1149 <wm_add_v2>
    1464:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1467:	8b 45 fc             	mov    -0x4(%rbp),%eax
    146a:	be 15 6b a9 5b       	mov    $0x5ba96b15,%esi
    146f:	89 c7                	mov    %eax,%edi
    1471:	e8 e2 fc ff ff       	call   1158 <wm_xor_v2>
    1476:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1479:	8b 45 fc             	mov    -0x4(%rbp),%eax
    147c:	be ed e3 9b 23       	mov    $0x239be3ed,%esi
    1481:	89 c7                	mov    %eax,%edi
    1483:	e8 c1 fc ff ff       	call   1149 <wm_add_v2>
    1488:	89 45 fc             	mov    %eax,-0x4(%rbp)
    148b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    148e:	83 f8 ff             	cmp    $0xffffffff,%eax
    1491:	75 07                	jne    149a <main+0x1f2>
    1493:	b8 61 00 00 00       	mov    $0x61,%eax
    1498:	eb 24                	jmp    14be <main+0x216>
    149a:	e8 91 fd ff ff       	call   1230 <run_contract>
    149f:	48 8b 05 7a 2b 00 00 	mov    0x2b7a(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    14a6:	48 89 c7             	mov    %rax,%rdi
    14a9:	e8 82 fb ff ff       	call   1030 <ferror@plt>
    14ae:	85 c0                	test   %eax,%eax
    14b0:	74 07                	je     14b9 <main+0x211>
    14b2:	b8 02 00 00 00       	mov    $0x2,%eax
    14b7:	eb 05                	jmp    14be <main+0x216>
    14b9:	b8 00 00 00 00       	mov    $0x0,%eax
    14be:	c9                   	leave
    14bf:	c3                   	ret

Disassembly of section .fini:

00000000000014c0 <_fini>:
    14c0:	48 83 ec 08          	sub    $0x8,%rsp
    14c4:	48 83 c4 08          	add    $0x8,%rsp
    14c8:	c3                   	ret
