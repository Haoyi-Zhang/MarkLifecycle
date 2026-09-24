
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
    1074:	48 8d 3d 24 02 00 00 	lea    0x224(%rip),%rdi        # 129f <main>
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

00000000000011b6 <direct_record>:
    11b6:	55                   	push   %rbp
    11b7:	48 89 e5             	mov    %rsp,%rbp
    11ba:	89 7d fc             	mov    %edi,-0x4(%rbp)
    11bd:	89 75 f8             	mov    %esi,-0x8(%rbp)
    11c0:	89 55 f4             	mov    %edx,-0xc(%rbp)
    11c3:	89 4d f0             	mov    %ecx,-0x10(%rbp)
    11c6:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
    11ca:	75 08                	jne    11d4 <direct_record+0x1e>
    11cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
    11cf:	3b 45 f8             	cmp    -0x8(%rbp),%eax
    11d2:	73 07                	jae    11db <direct_record+0x25>
    11d4:	b8 00 00 00 00       	mov    $0x0,%eax
    11d9:	eb 21                	jmp    11fc <direct_record+0x46>
    11db:	8b 45 fc             	mov    -0x4(%rbp),%eax
    11de:	8d 50 01             	lea    0x1(%rax),%edx
    11e1:	8b 45 f8             	mov    -0x8(%rbp),%eax
    11e4:	83 c0 01             	add    $0x1,%eax
    11e7:	c1 e0 04             	shl    $0x4,%eax
    11ea:	09 c2                	or     %eax,%edx
    11ec:	8b 45 f0             	mov    -0x10(%rbp),%eax
    11ef:	83 c0 01             	add    $0x1,%eax
    11f2:	c1 e0 08             	shl    $0x8,%eax
    11f5:	09 d0                	or     %edx,%eax
    11f7:	0d 00 00 5a 00       	or     $0x5a0000,%eax
    11fc:	5d                   	pop    %rbp
    11fd:	c3                   	ret

00000000000011fe <normalized_record>:
    11fe:	55                   	push   %rbp
    11ff:	48 89 e5             	mov    %rsp,%rbp
    1202:	48 83 ec 10          	sub    $0x10,%rsp
    1206:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1209:	89 75 f8             	mov    %esi,-0x8(%rbp)
    120c:	89 55 f4             	mov    %edx,-0xc(%rbp)
    120f:	89 4d f0             	mov    %ecx,-0x10(%rbp)
    1212:	8b 4d f0             	mov    -0x10(%rbp),%ecx
    1215:	8b 55 f4             	mov    -0xc(%rbp),%edx
    1218:	8b 75 f8             	mov    -0x8(%rbp),%esi
    121b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    121e:	89 c7                	mov    %eax,%edi
    1220:	e8 91 ff ff ff       	call   11b6 <direct_record>
    1225:	c9                   	leave
    1226:	c3                   	ret

0000000000001227 <run_contract>:
    1227:	55                   	push   %rbp
    1228:	48 89 e5             	mov    %rsp,%rbp
    122b:	48 83 ec 20          	sub    $0x20,%rsp
    122f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1236:	eb 5d                	jmp    1295 <run_contract+0x6e>
    1238:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    123f:	eb 4a                	jmp    128b <run_contract+0x64>
    1241:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    1248:	eb 37                	jmp    1281 <run_contract+0x5a>
    124a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
    1251:	eb 24                	jmp    1277 <run_contract+0x50>
    1253:	8b 4d f0             	mov    -0x10(%rbp),%ecx
    1256:	8b 55 f4             	mov    -0xc(%rbp),%edx
    1259:	8b 75 f8             	mov    -0x8(%rbp),%esi
    125c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    125f:	89 c7                	mov    %eax,%edi
    1261:	e8 98 ff ff ff       	call   11fe <normalized_record>
    1266:	89 45 ec             	mov    %eax,-0x14(%rbp)
    1269:	8b 45 ec             	mov    -0x14(%rbp),%eax
    126c:	89 c7                	mov    %eax,%edi
    126e:	e8 f4 fe ff ff       	call   1167 <emit_u32>
    1273:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
    1277:	83 7d f0 01          	cmpl   $0x1,-0x10(%rbp)
    127b:	76 d6                	jbe    1253 <run_contract+0x2c>
    127d:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    1281:	83 7d f4 01          	cmpl   $0x1,-0xc(%rbp)
    1285:	76 c3                	jbe    124a <run_contract+0x23>
    1287:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    128b:	83 7d f8 05          	cmpl   $0x5,-0x8(%rbp)
    128f:	76 b0                	jbe    1241 <run_contract+0x1a>
    1291:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1295:	83 7d fc 05          	cmpl   $0x5,-0x4(%rbp)
    1299:	76 9d                	jbe    1238 <run_contract+0x11>
    129b:	90                   	nop
    129c:	90                   	nop
    129d:	c9                   	leave
    129e:	c3                   	ret

000000000000129f <main>:
    129f:	55                   	push   %rbp
    12a0:	48 89 e5             	mov    %rsp,%rbp
    12a3:	48 83 ec 10          	sub    $0x10,%rsp
    12a7:	c7 45 fc f5 79 2b 6d 	movl   $0x6d2b79f5,-0x4(%rbp)
    12ae:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12b1:	be a5 8b 95 77       	mov    $0x77958ba5,%esi
    12b6:	89 c7                	mov    %eax,%edi
    12b8:	e8 8c fe ff ff       	call   1149 <wm_add_v1>
    12bd:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12c0:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12c3:	be 53 69 3f 61       	mov    $0x613f6953,%esi
    12c8:	89 c7                	mov    %eax,%edi
    12ca:	e8 7a fe ff ff       	call   1149 <wm_add_v1>
    12cf:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12d5:	be 55 87 83 69       	mov    $0x69838755,%esi
    12da:	89 c7                	mov    %eax,%edi
    12dc:	e8 68 fe ff ff       	call   1149 <wm_add_v1>
    12e1:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12e4:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12e7:	be 2f e3 c9 59       	mov    $0x59c9e32f,%esi
    12ec:	89 c7                	mov    %eax,%edi
    12ee:	e8 65 fe ff ff       	call   1158 <wm_xor_v1>
    12f3:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12f9:	be 01 d7 9f 27       	mov    $0x279fd701,%esi
    12fe:	89 c7                	mov    %eax,%edi
    1300:	e8 53 fe ff ff       	call   1158 <wm_xor_v1>
    1305:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1308:	8b 45 fc             	mov    -0x4(%rbp),%eax
    130b:	be d9 5f cb 8b       	mov    $0x8bcb5fd9,%esi
    1310:	89 c7                	mov    %eax,%edi
    1312:	e8 41 fe ff ff       	call   1158 <wm_xor_v1>
    1317:	89 45 fc             	mov    %eax,-0x4(%rbp)
    131a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    131d:	be 77 55 bf b9       	mov    $0xb9bf5577,%esi
    1322:	89 c7                	mov    %eax,%edi
    1324:	e8 2f fe ff ff       	call   1158 <wm_xor_v1>
    1329:	89 45 fc             	mov    %eax,-0x4(%rbp)
    132c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    132f:	be fb 81 cf 13       	mov    $0x13cf81fb,%esi
    1334:	89 c7                	mov    %eax,%edi
    1336:	e8 0e fe ff ff       	call   1149 <wm_add_v1>
    133b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    133e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1341:	be 1b b3 7f 6b       	mov    $0x6b7fb31b,%esi
    1346:	89 c7                	mov    %eax,%edi
    1348:	e8 0b fe ff ff       	call   1158 <wm_xor_v1>
    134d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1350:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1353:	be db 77 77 0b       	mov    $0xb7777db,%esi
    1358:	89 c7                	mov    %eax,%edi
    135a:	e8 ea fd ff ff       	call   1149 <wm_add_v1>
    135f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1362:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1365:	be 15 6b a9 5b       	mov    $0x5ba96b15,%esi
    136a:	89 c7                	mov    %eax,%edi
    136c:	e8 e7 fd ff ff       	call   1158 <wm_xor_v1>
    1371:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1374:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1377:	be 57 87 a9 07       	mov    $0x7a98757,%esi
    137c:	89 c7                	mov    %eax,%edi
    137e:	e8 c6 fd ff ff       	call   1149 <wm_add_v1>
    1383:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1386:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1389:	be 93 1f a3 af       	mov    $0xafa31f93,%esi
    138e:	89 c7                	mov    %eax,%edi
    1390:	e8 c3 fd ff ff       	call   1158 <wm_xor_v1>
    1395:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1398:	8b 45 fc             	mov    -0x4(%rbp),%eax
    139b:	be 61 83 3f e5       	mov    $0xe53f8361,%esi
    13a0:	89 c7                	mov    %eax,%edi
    13a2:	e8 a2 fd ff ff       	call   1149 <wm_add_v1>
    13a7:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13ad:	be 77 41 45 d3       	mov    $0xd3454177,%esi
    13b2:	89 c7                	mov    %eax,%edi
    13b4:	e8 9f fd ff ff       	call   1158 <wm_xor_v1>
    13b9:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13bf:	be 7f 7d e9 cd       	mov    $0xcde97d7f,%esi
    13c4:	89 c7                	mov    %eax,%edi
    13c6:	e8 8d fd ff ff       	call   1158 <wm_xor_v1>
    13cb:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13d1:	be e7 4d 13 81       	mov    $0x81134de7,%esi
    13d6:	89 c7                	mov    %eax,%edi
    13d8:	e8 7b fd ff ff       	call   1158 <wm_xor_v1>
    13dd:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13e0:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13e3:	be 97 d3 bd 51       	mov    $0x51bdd397,%esi
    13e8:	89 c7                	mov    %eax,%edi
    13ea:	e8 5a fd ff ff       	call   1149 <wm_add_v1>
    13ef:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13f2:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13f5:	be d3 15 4f b9       	mov    $0xb94f15d3,%esi
    13fa:	89 c7                	mov    %eax,%edi
    13fc:	e8 48 fd ff ff       	call   1149 <wm_add_v1>
    1401:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1404:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1407:	be ed e3 9b 23       	mov    $0x239be3ed,%esi
    140c:	89 c7                	mov    %eax,%edi
    140e:	e8 36 fd ff ff       	call   1149 <wm_add_v1>
    1413:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1416:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1419:	be d5 6f 01 15       	mov    $0x15016fd5,%esi
    141e:	89 c7                	mov    %eax,%edi
    1420:	e8 24 fd ff ff       	call   1149 <wm_add_v1>
    1425:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1428:	8b 45 fc             	mov    -0x4(%rbp),%eax
    142b:	be 09 77 b9 b9       	mov    $0xb9b97709,%esi
    1430:	89 c7                	mov    %eax,%edi
    1432:	e8 21 fd ff ff       	call   1158 <wm_xor_v1>
    1437:	89 45 fc             	mov    %eax,-0x4(%rbp)
    143a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    143d:	be b5 4d 5d c9       	mov    $0xc95d4db5,%esi
    1442:	89 c7                	mov    %eax,%edi
    1444:	e8 00 fd ff ff       	call   1149 <wm_add_v1>
    1449:	89 45 fc             	mov    %eax,-0x4(%rbp)
    144c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    144f:	be ff 37 55 a5       	mov    $0xa55537ff,%esi
    1454:	89 c7                	mov    %eax,%edi
    1456:	e8 ee fc ff ff       	call   1149 <wm_add_v1>
    145b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    145e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1461:	be 1f 9f 4b f5       	mov    $0xf54b9f1f,%esi
    1466:	89 c7                	mov    %eax,%edi
    1468:	e8 dc fc ff ff       	call   1149 <wm_add_v1>
    146d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1470:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1473:	be 27 49 0f 37       	mov    $0x370f4927,%esi
    1478:	89 c7                	mov    %eax,%edi
    147a:	e8 ca fc ff ff       	call   1149 <wm_add_v1>
    147f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1482:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1485:	be 31 5f a5 11       	mov    $0x11a55f31,%esi
    148a:	89 c7                	mov    %eax,%edi
    148c:	e8 c7 fc ff ff       	call   1158 <wm_xor_v1>
    1491:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1494:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1497:	be f3 dd dd 79       	mov    $0x79ddddf3,%esi
    149c:	89 c7                	mov    %eax,%edi
    149e:	e8 b5 fc ff ff       	call   1158 <wm_xor_v1>
    14a3:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14a9:	83 f8 ff             	cmp    $0xffffffff,%eax
    14ac:	75 07                	jne    14b5 <main+0x216>
    14ae:	b8 61 00 00 00       	mov    $0x61,%eax
    14b3:	eb 24                	jmp    14d9 <main+0x23a>
    14b5:	e8 6d fd ff ff       	call   1227 <run_contract>
    14ba:	48 8b 05 5f 2b 00 00 	mov    0x2b5f(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    14c1:	48 89 c7             	mov    %rax,%rdi
    14c4:	e8 67 fb ff ff       	call   1030 <ferror@plt>
    14c9:	85 c0                	test   %eax,%eax
    14cb:	74 07                	je     14d4 <main+0x235>
    14cd:	b8 02 00 00 00       	mov    $0x2,%eax
    14d2:	eb 05                	jmp    14d9 <main+0x23a>
    14d4:	b8 00 00 00 00       	mov    $0x0,%eax
    14d9:	c9                   	leave
    14da:	c3                   	ret

Disassembly of section .fini:

00000000000014dc <_fini>:
    14dc:	48 83 ec 08          	sub    $0x8,%rsp
    14e0:	48 83 c4 08          	add    $0x8,%rsp
    14e4:	c3                   	ret
