
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

0000000000001050 <fwrite@plt>:
    1050:	ff 25 ba 2f 00 00    	jmp    *0x2fba(%rip)        # 4010 <fwrite@GLIBC_2.2.5>
    1056:	68 02 00 00 00       	push   $0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .plt.got:

0000000000001060 <__cxa_finalize@plt>:
    1060:	ff 25 7a 2f 00 00    	jmp    *0x2f7a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1066:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000001070 <_start>:
    1070:	31 ed                	xor    %ebp,%ebp
    1072:	49 89 d1             	mov    %rdx,%r9
    1075:	5e                   	pop    %rsi
    1076:	48 89 e2             	mov    %rsp,%rdx
    1079:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    107d:	50                   	push   %rax
    107e:	54                   	push   %rsp
    107f:	45 31 c0             	xor    %r8d,%r8d
    1082:	31 c9                	xor    %ecx,%ecx
    1084:	48 8d 3d 38 02 00 00 	lea    0x238(%rip),%rdi        # 12c3 <main>
    108b:	ff 15 2f 2f 00 00    	call   *0x2f2f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1091:	f4                   	hlt
    1092:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    109c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000010a0 <deregister_tm_clones>:
    10a0:	48 8d 3d 81 2f 00 00 	lea    0x2f81(%rip),%rdi        # 4028 <stdout@GLIBC_2.2.5>
    10a7:	48 8d 05 7a 2f 00 00 	lea    0x2f7a(%rip),%rax        # 4028 <stdout@GLIBC_2.2.5>
    10ae:	48 39 f8             	cmp    %rdi,%rax
    10b1:	74 15                	je     10c8 <deregister_tm_clones+0x28>
    10b3:	48 8b 05 0e 2f 00 00 	mov    0x2f0e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    10ba:	48 85 c0             	test   %rax,%rax
    10bd:	74 09                	je     10c8 <deregister_tm_clones+0x28>
    10bf:	ff e0                	jmp    *%rax
    10c1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10c8:	c3                   	ret
    10c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010d0 <register_tm_clones>:
    10d0:	48 8d 3d 51 2f 00 00 	lea    0x2f51(%rip),%rdi        # 4028 <stdout@GLIBC_2.2.5>
    10d7:	48 8d 35 4a 2f 00 00 	lea    0x2f4a(%rip),%rsi        # 4028 <stdout@GLIBC_2.2.5>
    10de:	48 29 fe             	sub    %rdi,%rsi
    10e1:	48 89 f0             	mov    %rsi,%rax
    10e4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    10e8:	48 c1 f8 03          	sar    $0x3,%rax
    10ec:	48 01 c6             	add    %rax,%rsi
    10ef:	48 d1 fe             	sar    $1,%rsi
    10f2:	74 14                	je     1108 <register_tm_clones+0x38>
    10f4:	48 8b 05 dd 2e 00 00 	mov    0x2edd(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    10fb:	48 85 c0             	test   %rax,%rax
    10fe:	74 08                	je     1108 <register_tm_clones+0x38>
    1100:	ff e0                	jmp    *%rax
    1102:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1108:	c3                   	ret
    1109:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001110 <__do_global_dtors_aux>:
    1110:	f3 0f 1e fa          	endbr64
    1114:	80 3d 15 2f 00 00 00 	cmpb   $0x0,0x2f15(%rip)        # 4030 <completed.0>
    111b:	75 2b                	jne    1148 <__do_global_dtors_aux+0x38>
    111d:	55                   	push   %rbp
    111e:	48 83 3d ba 2e 00 00 00 	cmpq   $0x0,0x2eba(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1126:	48 89 e5             	mov    %rsp,%rbp
    1129:	74 0c                	je     1137 <__do_global_dtors_aux+0x27>
    112b:	48 8b 3d ee 2e 00 00 	mov    0x2eee(%rip),%rdi        # 4020 <__dso_handle>
    1132:	e8 29 ff ff ff       	call   1060 <__cxa_finalize@plt>
    1137:	e8 64 ff ff ff       	call   10a0 <deregister_tm_clones>
    113c:	c6 05 ed 2e 00 00 01 	movb   $0x1,0x2eed(%rip)        # 4030 <completed.0>
    1143:	5d                   	pop    %rbp
    1144:	c3                   	ret
    1145:	0f 1f 00             	nopl   (%rax)
    1148:	c3                   	ret
    1149:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001150 <frame_dummy>:
    1150:	f3 0f 1e fa          	endbr64
    1154:	e9 77 ff ff ff       	jmp    10d0 <register_tm_clones>

0000000000001159 <wm_add_v1>:
    1159:	55                   	push   %rbp
    115a:	48 89 e5             	mov    %rsp,%rbp
    115d:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1160:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1163:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1166:	5d                   	pop    %rbp
    1167:	c3                   	ret

0000000000001168 <wm_xor_v1>:
    1168:	55                   	push   %rbp
    1169:	48 89 e5             	mov    %rsp,%rbp
    116c:	89 7d fc             	mov    %edi,-0x4(%rbp)
    116f:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1172:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1175:	5d                   	pop    %rbp
    1176:	c3                   	ret

0000000000001177 <emit_u32>:
    1177:	55                   	push   %rbp
    1178:	48 89 e5             	mov    %rsp,%rbp
    117b:	48 83 ec 20          	sub    $0x20,%rsp
    117f:	89 7d ec             	mov    %edi,-0x14(%rbp)
    1182:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1185:	88 45 fc             	mov    %al,-0x4(%rbp)
    1188:	8b 45 ec             	mov    -0x14(%rbp),%eax
    118b:	c1 e8 08             	shr    $0x8,%eax
    118e:	88 45 fd             	mov    %al,-0x3(%rbp)
    1191:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1194:	c1 e8 10             	shr    $0x10,%eax
    1197:	88 45 fe             	mov    %al,-0x2(%rbp)
    119a:	8b 45 ec             	mov    -0x14(%rbp),%eax
    119d:	c1 e8 18             	shr    $0x18,%eax
    11a0:	88 45 ff             	mov    %al,-0x1(%rbp)
    11a3:	48 8b 15 7e 2e 00 00 	mov    0x2e7e(%rip),%rdx        # 4028 <stdout@GLIBC_2.2.5>
    11aa:	48 8d 45 fc          	lea    -0x4(%rbp),%rax
    11ae:	48 89 d1             	mov    %rdx,%rcx
    11b1:	ba 04 00 00 00       	mov    $0x4,%edx
    11b6:	be 01 00 00 00       	mov    $0x1,%esi
    11bb:	48 89 c7             	mov    %rax,%rdi
    11be:	e8 8d fe ff ff       	call   1050 <fwrite@plt>
    11c3:	90                   	nop
    11c4:	c9                   	leave
    11c5:	c3                   	ret

00000000000011c6 <patch_code>:
    11c6:	55                   	push   %rbp
    11c7:	48 89 e5             	mov    %rsp,%rbp
    11ca:	89 fa                	mov    %edi,%edx
    11cc:	89 f0                	mov    %esi,%eax
    11ce:	88 55 dc             	mov    %dl,-0x24(%rbp)
    11d1:	88 45 d8             	mov    %al,-0x28(%rbp)
    11d4:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    11d8:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    11df:	eb 70                	jmp    1251 <patch_code+0x8b>
    11e1:	0f b6 55 dc          	movzbl -0x24(%rbp),%edx
    11e5:	8b 45 f8             	mov    -0x8(%rbp),%eax
    11e8:	01 c0                	add    %eax,%eax
    11ea:	89 c1                	mov    %eax,%ecx
    11ec:	d3 fa                	sar    %cl,%edx
    11ee:	89 d0                	mov    %edx,%eax
    11f0:	83 e0 03             	and    $0x3,%eax
    11f3:	89 45 f4             	mov    %eax,-0xc(%rbp)
    11f6:	0f b6 55 d8          	movzbl -0x28(%rbp),%edx
    11fa:	8b 45 f8             	mov    -0x8(%rbp),%eax
    11fd:	01 c0                	add    %eax,%eax
    11ff:	89 c1                	mov    %eax,%ecx
    1201:	d3 fa                	sar    %cl,%edx
    1203:	89 d0                	mov    %edx,%eax
    1205:	83 e0 03             	and    $0x3,%eax
    1208:	89 45 f0             	mov    %eax,-0x10(%rbp)
    120b:	8b 45 f4             	mov    -0xc(%rbp),%eax
    120e:	3b 45 f0             	cmp    -0x10(%rbp),%eax
    1211:	74 21                	je     1234 <patch_code+0x6e>
    1213:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
    1217:	74 14                	je     122d <patch_code+0x67>
    1219:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
    121d:	75 07                	jne    1226 <patch_code+0x60>
    121f:	b8 02 00 00 00       	mov    $0x2,%eax
    1224:	eb 13                	jmp    1239 <patch_code+0x73>
    1226:	b8 03 00 00 00       	mov    $0x3,%eax
    122b:	eb 0c                	jmp    1239 <patch_code+0x73>
    122d:	b8 01 00 00 00       	mov    $0x1,%eax
    1232:	eb 05                	jmp    1239 <patch_code+0x73>
    1234:	b8 00 00 00 00       	mov    $0x0,%eax
    1239:	89 45 ec             	mov    %eax,-0x14(%rbp)
    123c:	8b 45 f8             	mov    -0x8(%rbp),%eax
    123f:	01 c0                	add    %eax,%eax
    1241:	8b 55 ec             	mov    -0x14(%rbp),%edx
    1244:	89 c1                	mov    %eax,%ecx
    1246:	d3 e2                	shl    %cl,%edx
    1248:	89 d0                	mov    %edx,%eax
    124a:	08 45 ff             	or     %al,-0x1(%rbp)
    124d:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    1251:	83 7d f8 03          	cmpl   $0x3,-0x8(%rbp)
    1255:	76 8a                	jbe    11e1 <patch_code+0x1b>
    1257:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
    125b:	5d                   	pop    %rbp
    125c:	c3                   	ret

000000000000125d <run_contract>:
    125d:	55                   	push   %rbp
    125e:	48 89 e5             	mov    %rsp,%rbp
    1261:	53                   	push   %rbx
    1262:	48 83 ec 18          	sub    $0x18,%rsp
    1266:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    126d:	eb 43                	jmp    12b2 <run_contract+0x55>
    126f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
    1276:	eb 2d                	jmp    12a5 <run_contract+0x48>
    1278:	48 8b 1d a9 2d 00 00 	mov    0x2da9(%rip),%rbx        # 4028 <stdout@GLIBC_2.2.5>
    127f:	8b 45 e8             	mov    -0x18(%rbp),%eax
    1282:	0f b6 d0             	movzbl %al,%edx
    1285:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1288:	0f b6 c0             	movzbl %al,%eax
    128b:	89 d6                	mov    %edx,%esi
    128d:	89 c7                	mov    %eax,%edi
    128f:	e8 32 ff ff ff       	call   11c6 <patch_code>
    1294:	0f b6 c0             	movzbl %al,%eax
    1297:	48 89 de             	mov    %rbx,%rsi
    129a:	89 c7                	mov    %eax,%edi
    129c:	e8 9f fd ff ff       	call   1040 <fputc@plt>
    12a1:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
    12a5:	81 7d e8 ff 00 00 00 	cmpl   $0xff,-0x18(%rbp)
    12ac:	76 ca                	jbe    1278 <run_contract+0x1b>
    12ae:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
    12b2:	81 7d ec ff 00 00 00 	cmpl   $0xff,-0x14(%rbp)
    12b9:	76 b4                	jbe    126f <run_contract+0x12>
    12bb:	90                   	nop
    12bc:	90                   	nop
    12bd:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
    12c1:	c9                   	leave
    12c2:	c3                   	ret

00000000000012c3 <main>:
    12c3:	55                   	push   %rbp
    12c4:	48 89 e5             	mov    %rsp,%rbp
    12c7:	48 83 ec 10          	sub    $0x10,%rsp
    12cb:	c7 45 fc f5 79 2b 6d 	movl   $0x6d2b79f5,-0x4(%rbp)
    12d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12d5:	be 7d 21 75 fb       	mov    $0xfb75217d,%esi
    12da:	89 c7                	mov    %eax,%edi
    12dc:	e8 78 fe ff ff       	call   1159 <wm_add_v1>
    12e1:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12e4:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12e7:	be eb 3d db 0b       	mov    $0xbdb3deb,%esi
    12ec:	89 c7                	mov    %eax,%edi
    12ee:	e8 66 fe ff ff       	call   1159 <wm_add_v1>
    12f3:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12f9:	be 4d 65 29 39       	mov    $0x3929654d,%esi
    12fe:	89 c7                	mov    %eax,%edi
    1300:	e8 63 fe ff ff       	call   1168 <wm_xor_v1>
    1305:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1308:	8b 45 fc             	mov    -0x4(%rbp),%eax
    130b:	be db 97 b7 3d       	mov    $0x3db797db,%esi
    1310:	89 c7                	mov    %eax,%edi
    1312:	e8 51 fe ff ff       	call   1168 <wm_xor_v1>
    1317:	89 45 fc             	mov    %eax,-0x4(%rbp)
    131a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    131d:	be 2f 11 e1 19       	mov    $0x19e1112f,%esi
    1322:	89 c7                	mov    %eax,%edi
    1324:	e8 30 fe ff ff       	call   1159 <wm_add_v1>
    1329:	89 45 fc             	mov    %eax,-0x4(%rbp)
    132c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    132f:	be df 15 4b b9       	mov    $0xb94b15df,%esi
    1334:	89 c7                	mov    %eax,%edi
    1336:	e8 1e fe ff ff       	call   1159 <wm_add_v1>
    133b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    133e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1341:	be e9 39 25 95       	mov    $0x952539e9,%esi
    1346:	89 c7                	mov    %eax,%edi
    1348:	e8 1b fe ff ff       	call   1168 <wm_xor_v1>
    134d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1350:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1353:	be 5b 75 d1 bb       	mov    $0xbbd1755b,%esi
    1358:	89 c7                	mov    %eax,%edi
    135a:	e8 fa fd ff ff       	call   1159 <wm_add_v1>
    135f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1362:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1365:	be 1f 61 ad 71       	mov    $0x71ad611f,%esi
    136a:	89 c7                	mov    %eax,%edi
    136c:	e8 f7 fd ff ff       	call   1168 <wm_xor_v1>
    1371:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1374:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1377:	be c1 17 3d f3       	mov    $0xf33d17c1,%esi
    137c:	89 c7                	mov    %eax,%edi
    137e:	e8 e5 fd ff ff       	call   1168 <wm_xor_v1>
    1383:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1386:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1389:	be c1 ff d5 d7       	mov    $0xd7d5ffc1,%esi
    138e:	89 c7                	mov    %eax,%edi
    1390:	e8 c4 fd ff ff       	call   1159 <wm_add_v1>
    1395:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1398:	8b 45 fc             	mov    -0x4(%rbp),%eax
    139b:	be eb 63 05 77       	mov    $0x770563eb,%esi
    13a0:	89 c7                	mov    %eax,%edi
    13a2:	e8 b2 fd ff ff       	call   1159 <wm_add_v1>
    13a7:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13ad:	be cf 5b 21 41       	mov    $0x41215bcf,%esi
    13b2:	89 c7                	mov    %eax,%edi
    13b4:	e8 af fd ff ff       	call   1168 <wm_xor_v1>
    13b9:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13bf:	be 75 79 a3 35       	mov    $0x35a37975,%esi
    13c4:	89 c7                	mov    %eax,%edi
    13c6:	e8 9d fd ff ff       	call   1168 <wm_xor_v1>
    13cb:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13d1:	be f3 3b f9 9d       	mov    $0x9df93bf3,%esi
    13d6:	89 c7                	mov    %eax,%edi
    13d8:	e8 7c fd ff ff       	call   1159 <wm_add_v1>
    13dd:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13e0:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13e3:	be f1 87 f1 0f       	mov    $0xff187f1,%esi
    13e8:	89 c7                	mov    %eax,%edi
    13ea:	e8 79 fd ff ff       	call   1168 <wm_xor_v1>
    13ef:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13f2:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13f5:	be a1 17 b7 2b       	mov    $0x2bb717a1,%esi
    13fa:	89 c7                	mov    %eax,%edi
    13fc:	e8 58 fd ff ff       	call   1159 <wm_add_v1>
    1401:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1404:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1407:	be f7 97 cd 25       	mov    $0x25cd97f7,%esi
    140c:	89 c7                	mov    %eax,%edi
    140e:	e8 55 fd ff ff       	call   1168 <wm_xor_v1>
    1413:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1416:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1419:	be 2d b5 4b 37       	mov    $0x374bb52d,%esi
    141e:	89 c7                	mov    %eax,%edi
    1420:	e8 34 fd ff ff       	call   1159 <wm_add_v1>
    1425:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1428:	8b 45 fc             	mov    -0x4(%rbp),%eax
    142b:	be 21 a9 71 77       	mov    $0x7771a921,%esi
    1430:	89 c7                	mov    %eax,%edi
    1432:	e8 31 fd ff ff       	call   1168 <wm_xor_v1>
    1437:	89 45 fc             	mov    %eax,-0x4(%rbp)
    143a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    143d:	be b7 c3 a9 c7       	mov    $0xc7a9c3b7,%esi
    1442:	89 c7                	mov    %eax,%edi
    1444:	e8 10 fd ff ff       	call   1159 <wm_add_v1>
    1449:	89 45 fc             	mov    %eax,-0x4(%rbp)
    144c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    144f:	be 0b 6f 21 fd       	mov    $0xfd216f0b,%esi
    1454:	89 c7                	mov    %eax,%edi
    1456:	e8 fe fc ff ff       	call   1159 <wm_add_v1>
    145b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    145e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1461:	be b5 17 3f c7       	mov    $0xc73f17b5,%esi
    1466:	89 c7                	mov    %eax,%edi
    1468:	e8 ec fc ff ff       	call   1159 <wm_add_v1>
    146d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1470:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1473:	be 47 b3 8f 49       	mov    $0x498fb347,%esi
    1478:	89 c7                	mov    %eax,%edi
    147a:	e8 e9 fc ff ff       	call   1168 <wm_xor_v1>
    147f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1482:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1485:	be 29 21 17 43       	mov    $0x43172129,%esi
    148a:	89 c7                	mov    %eax,%edi
    148c:	e8 d7 fc ff ff       	call   1168 <wm_xor_v1>
    1491:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1494:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1497:	be 77 ad af 17       	mov    $0x17afad77,%esi
    149c:	89 c7                	mov    %eax,%edi
    149e:	e8 b6 fc ff ff       	call   1159 <wm_add_v1>
    14a3:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14a9:	be 97 d1 2b 43       	mov    $0x432bd197,%esi
    14ae:	89 c7                	mov    %eax,%edi
    14b0:	e8 a4 fc ff ff       	call   1159 <wm_add_v1>
    14b5:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14b8:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14bb:	be df 4b f9 6b       	mov    $0x6bf94bdf,%esi
    14c0:	89 c7                	mov    %eax,%edi
    14c2:	e8 a1 fc ff ff       	call   1168 <wm_xor_v1>
    14c7:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14cd:	83 f8 ff             	cmp    $0xffffffff,%eax
    14d0:	75 07                	jne    14d9 <main+0x216>
    14d2:	b8 61 00 00 00       	mov    $0x61,%eax
    14d7:	eb 24                	jmp    14fd <main+0x23a>
    14d9:	e8 7f fd ff ff       	call   125d <run_contract>
    14de:	48 8b 05 43 2b 00 00 	mov    0x2b43(%rip),%rax        # 4028 <stdout@GLIBC_2.2.5>
    14e5:	48 89 c7             	mov    %rax,%rdi
    14e8:	e8 43 fb ff ff       	call   1030 <ferror@plt>
    14ed:	85 c0                	test   %eax,%eax
    14ef:	74 07                	je     14f8 <main+0x235>
    14f1:	b8 02 00 00 00       	mov    $0x2,%eax
    14f6:	eb 05                	jmp    14fd <main+0x23a>
    14f8:	b8 00 00 00 00       	mov    $0x0,%eax
    14fd:	c9                   	leave
    14fe:	c3                   	ret

Disassembly of section .fini:

0000000000001500 <_fini>:
    1500:	48 83 ec 08          	sub    $0x8,%rsp
    1504:	48 83 c4 08          	add    $0x8,%rsp
    1508:	c3                   	ret
