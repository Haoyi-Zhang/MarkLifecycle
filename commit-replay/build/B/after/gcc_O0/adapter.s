
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
    1084:	48 8d 3d 3d 02 00 00 	lea    0x23d(%rip),%rdi        # 12c8 <main>
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

0000000000001159 <wm_add_v2>:
    1159:	55                   	push   %rbp
    115a:	48 89 e5             	mov    %rsp,%rbp
    115d:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1160:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1163:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1166:	5d                   	pop    %rbp
    1167:	c3                   	ret

0000000000001168 <wm_xor_v2>:
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
    11df:	eb 75                	jmp    1256 <patch_code+0x90>
    11e1:	0f b6 55 dc          	movzbl -0x24(%rbp),%edx
    11e5:	8b 45 f8             	mov    -0x8(%rbp),%eax
    11e8:	01 c0                	add    %eax,%eax
    11ea:	89 c1                	mov    %eax,%ecx
    11ec:	d3 fa                	sar    %cl,%edx
    11ee:	89 d0                	mov    %edx,%eax
    11f0:	83 e0 03             	and    $0x3,%eax
    11f3:	89 45 f0             	mov    %eax,-0x10(%rbp)
    11f6:	0f b6 55 d8          	movzbl -0x28(%rbp),%edx
    11fa:	8b 45 f8             	mov    -0x8(%rbp),%eax
    11fd:	01 c0                	add    %eax,%eax
    11ff:	89 c1                	mov    %eax,%ecx
    1201:	d3 fa                	sar    %cl,%edx
    1203:	89 d0                	mov    %edx,%eax
    1205:	83 e0 03             	and    $0x3,%eax
    1208:	89 45 ec             	mov    %eax,-0x14(%rbp)
    120b:	8b 45 f0             	mov    -0x10(%rbp),%eax
    120e:	3b 45 ec             	cmp    -0x14(%rbp),%eax
    1211:	75 09                	jne    121c <patch_code+0x56>
    1213:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    121a:	eb 25                	jmp    1241 <patch_code+0x7b>
    121c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
    1220:	75 09                	jne    122b <patch_code+0x65>
    1222:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%rbp)
    1229:	eb 16                	jmp    1241 <patch_code+0x7b>
    122b:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
    122f:	75 09                	jne    123a <patch_code+0x74>
    1231:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%rbp)
    1238:	eb 07                	jmp    1241 <patch_code+0x7b>
    123a:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%rbp)
    1241:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1244:	01 c0                	add    %eax,%eax
    1246:	8b 55 f4             	mov    -0xc(%rbp),%edx
    1249:	89 c1                	mov    %eax,%ecx
    124b:	d3 e2                	shl    %cl,%edx
    124d:	89 d0                	mov    %edx,%eax
    124f:	08 45 ff             	or     %al,-0x1(%rbp)
    1252:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    1256:	83 7d f8 04          	cmpl   $0x4,-0x8(%rbp)
    125a:	75 85                	jne    11e1 <patch_code+0x1b>
    125c:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
    1260:	5d                   	pop    %rbp
    1261:	c3                   	ret

0000000000001262 <run_contract>:
    1262:	55                   	push   %rbp
    1263:	48 89 e5             	mov    %rsp,%rbp
    1266:	53                   	push   %rbx
    1267:	48 83 ec 18          	sub    $0x18,%rsp
    126b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    1272:	eb 43                	jmp    12b7 <run_contract+0x55>
    1274:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
    127b:	eb 2d                	jmp    12aa <run_contract+0x48>
    127d:	48 8b 1d a4 2d 00 00 	mov    0x2da4(%rip),%rbx        # 4028 <stdout@GLIBC_2.2.5>
    1284:	8b 45 e8             	mov    -0x18(%rbp),%eax
    1287:	0f b6 d0             	movzbl %al,%edx
    128a:	8b 45 ec             	mov    -0x14(%rbp),%eax
    128d:	0f b6 c0             	movzbl %al,%eax
    1290:	89 d6                	mov    %edx,%esi
    1292:	89 c7                	mov    %eax,%edi
    1294:	e8 2d ff ff ff       	call   11c6 <patch_code>
    1299:	0f b6 c0             	movzbl %al,%eax
    129c:	48 89 de             	mov    %rbx,%rsi
    129f:	89 c7                	mov    %eax,%edi
    12a1:	e8 9a fd ff ff       	call   1040 <fputc@plt>
    12a6:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
    12aa:	81 7d e8 ff 00 00 00 	cmpl   $0xff,-0x18(%rbp)
    12b1:	76 ca                	jbe    127d <run_contract+0x1b>
    12b3:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
    12b7:	81 7d ec ff 00 00 00 	cmpl   $0xff,-0x14(%rbp)
    12be:	76 b4                	jbe    1274 <run_contract+0x12>
    12c0:	90                   	nop
    12c1:	90                   	nop
    12c2:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
    12c6:	c9                   	leave
    12c7:	c3                   	ret

00000000000012c8 <main>:
    12c8:	55                   	push   %rbp
    12c9:	48 89 e5             	mov    %rsp,%rbp
    12cc:	48 83 ec 10          	sub    $0x10,%rsp
    12d0:	c7 45 fc f5 79 2b 6d 	movl   $0x6d2b79f5,-0x4(%rbp)
    12d7:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12da:	be 7d 21 75 fb       	mov    $0xfb75217d,%esi
    12df:	89 c7                	mov    %eax,%edi
    12e1:	e8 73 fe ff ff       	call   1159 <wm_add_v2>
    12e6:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12ec:	be c1 17 3d f3       	mov    $0xf33d17c1,%esi
    12f1:	89 c7                	mov    %eax,%edi
    12f3:	e8 70 fe ff ff       	call   1168 <wm_xor_v2>
    12f8:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12fe:	be 2d b5 4b 37       	mov    $0x374bb52d,%esi
    1303:	89 c7                	mov    %eax,%edi
    1305:	e8 4f fe ff ff       	call   1159 <wm_add_v2>
    130a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    130d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1310:	be df 4b f9 6b       	mov    $0x6bf94bdf,%esi
    1315:	89 c7                	mov    %eax,%edi
    1317:	e8 4c fe ff ff       	call   1168 <wm_xor_v2>
    131c:	89 45 fc             	mov    %eax,-0x4(%rbp)
    131f:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1322:	be 1f 61 ad 71       	mov    $0x71ad611f,%esi
    1327:	89 c7                	mov    %eax,%edi
    1329:	e8 3a fe ff ff       	call   1168 <wm_xor_v2>
    132e:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1331:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1334:	be f7 97 cd 25       	mov    $0x25cd97f7,%esi
    1339:	89 c7                	mov    %eax,%edi
    133b:	e8 28 fe ff ff       	call   1168 <wm_xor_v2>
    1340:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1343:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1346:	be 97 d1 2b 43       	mov    $0x432bd197,%esi
    134b:	89 c7                	mov    %eax,%edi
    134d:	e8 07 fe ff ff       	call   1159 <wm_add_v2>
    1352:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1355:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1358:	be 5b 75 d1 bb       	mov    $0xbbd1755b,%esi
    135d:	89 c7                	mov    %eax,%edi
    135f:	e8 f5 fd ff ff       	call   1159 <wm_add_v2>
    1364:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1367:	8b 45 fc             	mov    -0x4(%rbp),%eax
    136a:	be a1 17 b7 2b       	mov    $0x2bb717a1,%esi
    136f:	89 c7                	mov    %eax,%edi
    1371:	e8 e3 fd ff ff       	call   1159 <wm_add_v2>
    1376:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1379:	8b 45 fc             	mov    -0x4(%rbp),%eax
    137c:	be 77 ad af 17       	mov    $0x17afad77,%esi
    1381:	89 c7                	mov    %eax,%edi
    1383:	e8 d1 fd ff ff       	call   1159 <wm_add_v2>
    1388:	89 45 fc             	mov    %eax,-0x4(%rbp)
    138b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    138e:	be e9 39 25 95       	mov    $0x952539e9,%esi
    1393:	89 c7                	mov    %eax,%edi
    1395:	e8 ce fd ff ff       	call   1168 <wm_xor_v2>
    139a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    139d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13a0:	be f1 87 f1 0f       	mov    $0xff187f1,%esi
    13a5:	89 c7                	mov    %eax,%edi
    13a7:	e8 bc fd ff ff       	call   1168 <wm_xor_v2>
    13ac:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13af:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13b2:	be 29 21 17 43       	mov    $0x43172129,%esi
    13b7:	89 c7                	mov    %eax,%edi
    13b9:	e8 aa fd ff ff       	call   1168 <wm_xor_v2>
    13be:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13c1:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13c4:	be df 15 4b b9       	mov    $0xb94b15df,%esi
    13c9:	89 c7                	mov    %eax,%edi
    13cb:	e8 89 fd ff ff       	call   1159 <wm_add_v2>
    13d0:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13d6:	be f3 3b f9 9d       	mov    $0x9df93bf3,%esi
    13db:	89 c7                	mov    %eax,%edi
    13dd:	e8 77 fd ff ff       	call   1159 <wm_add_v2>
    13e2:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13e5:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13e8:	be 47 b3 8f 49       	mov    $0x498fb347,%esi
    13ed:	89 c7                	mov    %eax,%edi
    13ef:	e8 74 fd ff ff       	call   1168 <wm_xor_v2>
    13f4:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13fa:	be 2f 11 e1 19       	mov    $0x19e1112f,%esi
    13ff:	89 c7                	mov    %eax,%edi
    1401:	e8 53 fd ff ff       	call   1159 <wm_add_v2>
    1406:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1409:	8b 45 fc             	mov    -0x4(%rbp),%eax
    140c:	be 75 79 a3 35       	mov    $0x35a37975,%esi
    1411:	89 c7                	mov    %eax,%edi
    1413:	e8 50 fd ff ff       	call   1168 <wm_xor_v2>
    1418:	89 45 fc             	mov    %eax,-0x4(%rbp)
    141b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    141e:	be b5 17 3f c7       	mov    $0xc73f17b5,%esi
    1423:	89 c7                	mov    %eax,%edi
    1425:	e8 2f fd ff ff       	call   1159 <wm_add_v2>
    142a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    142d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1430:	be db 97 b7 3d       	mov    $0x3db797db,%esi
    1435:	89 c7                	mov    %eax,%edi
    1437:	e8 2c fd ff ff       	call   1168 <wm_xor_v2>
    143c:	89 45 fc             	mov    %eax,-0x4(%rbp)
    143f:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1442:	be cf 5b 21 41       	mov    $0x41215bcf,%esi
    1447:	89 c7                	mov    %eax,%edi
    1449:	e8 1a fd ff ff       	call   1168 <wm_xor_v2>
    144e:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1451:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1454:	be 0b 6f 21 fd       	mov    $0xfd216f0b,%esi
    1459:	89 c7                	mov    %eax,%edi
    145b:	e8 f9 fc ff ff       	call   1159 <wm_add_v2>
    1460:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1463:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1466:	be 4d 65 29 39       	mov    $0x3929654d,%esi
    146b:	89 c7                	mov    %eax,%edi
    146d:	e8 f6 fc ff ff       	call   1168 <wm_xor_v2>
    1472:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1475:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1478:	be eb 63 05 77       	mov    $0x770563eb,%esi
    147d:	89 c7                	mov    %eax,%edi
    147f:	e8 d5 fc ff ff       	call   1159 <wm_add_v2>
    1484:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1487:	8b 45 fc             	mov    -0x4(%rbp),%eax
    148a:	be b7 c3 a9 c7       	mov    $0xc7a9c3b7,%esi
    148f:	89 c7                	mov    %eax,%edi
    1491:	e8 c3 fc ff ff       	call   1159 <wm_add_v2>
    1496:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1499:	8b 45 fc             	mov    -0x4(%rbp),%eax
    149c:	be eb 3d db 0b       	mov    $0xbdb3deb,%esi
    14a1:	89 c7                	mov    %eax,%edi
    14a3:	e8 b1 fc ff ff       	call   1159 <wm_add_v2>
    14a8:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14ae:	be c1 ff d5 d7       	mov    $0xd7d5ffc1,%esi
    14b3:	89 c7                	mov    %eax,%edi
    14b5:	e8 9f fc ff ff       	call   1159 <wm_add_v2>
    14ba:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14c0:	be 21 a9 71 77       	mov    $0x7771a921,%esi
    14c5:	89 c7                	mov    %eax,%edi
    14c7:	e8 9c fc ff ff       	call   1168 <wm_xor_v2>
    14cc:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14d2:	83 f8 ff             	cmp    $0xffffffff,%eax
    14d5:	75 07                	jne    14de <main+0x216>
    14d7:	b8 61 00 00 00       	mov    $0x61,%eax
    14dc:	eb 24                	jmp    1502 <main+0x23a>
    14de:	e8 7f fd ff ff       	call   1262 <run_contract>
    14e3:	48 8b 05 3e 2b 00 00 	mov    0x2b3e(%rip),%rax        # 4028 <stdout@GLIBC_2.2.5>
    14ea:	48 89 c7             	mov    %rax,%rdi
    14ed:	e8 3e fb ff ff       	call   1030 <ferror@plt>
    14f2:	85 c0                	test   %eax,%eax
    14f4:	74 07                	je     14fd <main+0x235>
    14f6:	b8 02 00 00 00       	mov    $0x2,%eax
    14fb:	eb 05                	jmp    1502 <main+0x23a>
    14fd:	b8 00 00 00 00       	mov    $0x0,%eax
    1502:	c9                   	leave
    1503:	c3                   	ret

Disassembly of section .fini:

0000000000001504 <_fini>:
    1504:	48 83 ec 08          	sub    $0x8,%rsp
    1508:	48 83 c4 08          	add    $0x8,%rsp
    150c:	c3                   	ret
