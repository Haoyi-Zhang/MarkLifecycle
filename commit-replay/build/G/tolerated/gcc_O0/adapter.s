
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
    1084:	48 8d 3d 7c 01 00 00 	lea    0x17c(%rip),%rdi        # 1207 <main>
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

00000000000011c6 <run_contract>:
    11c6:	55                   	push   %rbp
    11c7:	48 89 e5             	mov    %rsp,%rbp
    11ca:	48 83 ec 10          	sub    $0x10,%rsp
    11ce:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    11d5:	eb 23                	jmp    11fa <run_contract+0x34>
    11d7:	48 8b 15 4a 2e 00 00 	mov    0x2e4a(%rip),%rdx        # 4028 <stdout@GLIBC_2.2.5>
    11de:	8b 45 fc             	mov    -0x4(%rbp),%eax
    11e1:	83 e0 01             	and    $0x1,%eax
    11e4:	85 c0                	test   %eax,%eax
    11e6:	0f 94 c0             	sete   %al
    11e9:	0f b6 c0             	movzbl %al,%eax
    11ec:	48 89 d6             	mov    %rdx,%rsi
    11ef:	89 c7                	mov    %eax,%edi
    11f1:	e8 4a fe ff ff       	call   1040 <fputc@plt>
    11f6:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    11fa:	81 7d fc ff ff 00 00 	cmpl   $0xffff,-0x4(%rbp)
    1201:	76 d4                	jbe    11d7 <run_contract+0x11>
    1203:	90                   	nop
    1204:	90                   	nop
    1205:	c9                   	leave
    1206:	c3                   	ret

0000000000001207 <main>:
    1207:	55                   	push   %rbp
    1208:	48 89 e5             	mov    %rsp,%rbp
    120b:	48 83 ec 10          	sub    $0x10,%rsp
    120f:	c7 45 fc f5 79 2b 6d 	movl   $0x6d2b79f5,-0x4(%rbp)
    1216:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1219:	be d7 13 45 f7       	mov    $0xf74513d7,%esi
    121e:	89 c7                	mov    %eax,%edi
    1220:	e8 34 ff ff ff       	call   1159 <wm_add_v2>
    1225:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1228:	8b 45 fc             	mov    -0x4(%rbp),%eax
    122b:	be fd f1 83 6f       	mov    $0x6f83f1fd,%esi
    1230:	89 c7                	mov    %eax,%edi
    1232:	e8 22 ff ff ff       	call   1159 <wm_add_v2>
    1237:	89 45 fc             	mov    %eax,-0x4(%rbp)
    123a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    123d:	be 0d f3 53 5f       	mov    $0x5f53f30d,%esi
    1242:	89 c7                	mov    %eax,%edi
    1244:	e8 1f ff ff ff       	call   1168 <wm_xor_v2>
    1249:	89 45 fc             	mov    %eax,-0x4(%rbp)
    124c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    124f:	be 7f ef 49 87       	mov    $0x8749ef7f,%esi
    1254:	89 c7                	mov    %eax,%edi
    1256:	e8 0d ff ff ff       	call   1168 <wm_xor_v2>
    125b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    125e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1261:	be 79 a9 19 61       	mov    $0x6119a979,%esi
    1266:	89 c7                	mov    %eax,%edi
    1268:	e8 fb fe ff ff       	call   1168 <wm_xor_v2>
    126d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1270:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1273:	be 89 59 89 7b       	mov    $0x7b895989,%esi
    1278:	89 c7                	mov    %eax,%edi
    127a:	e8 e9 fe ff ff       	call   1168 <wm_xor_v2>
    127f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1282:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1285:	be 49 d1 85 ef       	mov    $0xef85d149,%esi
    128a:	89 c7                	mov    %eax,%edi
    128c:	e8 c8 fe ff ff       	call   1159 <wm_add_v2>
    1291:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1294:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1297:	be a9 c9 bb 3b       	mov    $0x3bbbc9a9,%esi
    129c:	89 c7                	mov    %eax,%edi
    129e:	e8 b6 fe ff ff       	call   1159 <wm_add_v2>
    12a3:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12a9:	be 6f 11 6f ef       	mov    $0xef6f116f,%esi
    12ae:	89 c7                	mov    %eax,%edi
    12b0:	e8 b3 fe ff ff       	call   1168 <wm_xor_v2>
    12b5:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12b8:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12bb:	be cf c5 a1 9f       	mov    $0x9fa1c5cf,%esi
    12c0:	89 c7                	mov    %eax,%edi
    12c2:	e8 a1 fe ff ff       	call   1168 <wm_xor_v2>
    12c7:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12cd:	be af fb 69 5f       	mov    $0x5f69fbaf,%esi
    12d2:	89 c7                	mov    %eax,%edi
    12d4:	e8 8f fe ff ff       	call   1168 <wm_xor_v2>
    12d9:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12df:	be 93 e7 6d bf       	mov    $0xbf6de793,%esi
    12e4:	89 c7                	mov    %eax,%edi
    12e6:	e8 7d fe ff ff       	call   1168 <wm_xor_v2>
    12eb:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12ee:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12f1:	be a9 c7 bd 69       	mov    $0x69bdc7a9,%esi
    12f6:	89 c7                	mov    %eax,%edi
    12f8:	e8 6b fe ff ff       	call   1168 <wm_xor_v2>
    12fd:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1300:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1303:	be 75 b7 33 59       	mov    $0x5933b775,%esi
    1308:	89 c7                	mov    %eax,%edi
    130a:	e8 4a fe ff ff       	call   1159 <wm_add_v2>
    130f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1312:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1315:	be 43 f5 d7 65       	mov    $0x65d7f543,%esi
    131a:	89 c7                	mov    %eax,%edi
    131c:	e8 38 fe ff ff       	call   1159 <wm_add_v2>
    1321:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1324:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1327:	be ad f9 25 65       	mov    $0x6525f9ad,%esi
    132c:	89 c7                	mov    %eax,%edi
    132e:	e8 26 fe ff ff       	call   1159 <wm_add_v2>
    1333:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1336:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1339:	be 69 ef 2b 2d       	mov    $0x2d2bef69,%esi
    133e:	89 c7                	mov    %eax,%edi
    1340:	e8 23 fe ff ff       	call   1168 <wm_xor_v2>
    1345:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1348:	8b 45 fc             	mov    -0x4(%rbp),%eax
    134b:	be dd e9 cf 27       	mov    $0x27cfe9dd,%esi
    1350:	89 c7                	mov    %eax,%edi
    1352:	e8 02 fe ff ff       	call   1159 <wm_add_v2>
    1357:	89 45 fc             	mov    %eax,-0x4(%rbp)
    135a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    135d:	be fd 53 c5 77       	mov    $0x77c553fd,%esi
    1362:	89 c7                	mov    %eax,%edi
    1364:	e8 f0 fd ff ff       	call   1159 <wm_add_v2>
    1369:	89 45 fc             	mov    %eax,-0x4(%rbp)
    136c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    136f:	be ed ab 63 b9       	mov    $0xb963abed,%esi
    1374:	89 c7                	mov    %eax,%edi
    1376:	e8 de fd ff ff       	call   1159 <wm_add_v2>
    137b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    137e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1381:	be a1 27 b5 77       	mov    $0x77b527a1,%esi
    1386:	89 c7                	mov    %eax,%edi
    1388:	e8 db fd ff ff       	call   1168 <wm_xor_v2>
    138d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1390:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1393:	be fb 11 ad 47       	mov    $0x47ad11fb,%esi
    1398:	89 c7                	mov    %eax,%edi
    139a:	e8 c9 fd ff ff       	call   1168 <wm_xor_v2>
    139f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13a2:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13a5:	be 85 db 81 09       	mov    $0x981db85,%esi
    13aa:	89 c7                	mov    %eax,%edi
    13ac:	e8 b7 fd ff ff       	call   1168 <wm_xor_v2>
    13b1:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13b7:	be 8f 5d 75 7d       	mov    $0x7d755d8f,%esi
    13bc:	89 c7                	mov    %eax,%edi
    13be:	e8 a5 fd ff ff       	call   1168 <wm_xor_v2>
    13c3:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13c9:	be 87 6f c1 cd       	mov    $0xcdc16f87,%esi
    13ce:	89 c7                	mov    %eax,%edi
    13d0:	e8 84 fd ff ff       	call   1159 <wm_add_v2>
    13d5:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13db:	be 59 09 23 d5       	mov    $0xd5230959,%esi
    13e0:	89 c7                	mov    %eax,%edi
    13e2:	e8 72 fd ff ff       	call   1159 <wm_add_v2>
    13e7:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13ed:	83 f8 ff             	cmp    $0xffffffff,%eax
    13f0:	75 07                	jne    13f9 <main+0x1f2>
    13f2:	b8 61 00 00 00       	mov    $0x61,%eax
    13f7:	eb 24                	jmp    141d <main+0x216>
    13f9:	e8 c8 fd ff ff       	call   11c6 <run_contract>
    13fe:	48 8b 05 23 2c 00 00 	mov    0x2c23(%rip),%rax        # 4028 <stdout@GLIBC_2.2.5>
    1405:	48 89 c7             	mov    %rax,%rdi
    1408:	e8 23 fc ff ff       	call   1030 <ferror@plt>
    140d:	85 c0                	test   %eax,%eax
    140f:	74 07                	je     1418 <main+0x211>
    1411:	b8 02 00 00 00       	mov    $0x2,%eax
    1416:	eb 05                	jmp    141d <main+0x216>
    1418:	b8 00 00 00 00       	mov    $0x0,%eax
    141d:	c9                   	leave
    141e:	c3                   	ret

Disassembly of section .fini:

0000000000001420 <_fini>:
    1420:	48 83 ec 08          	sub    $0x8,%rsp
    1424:	48 83 c4 08          	add    $0x8,%rsp
    1428:	c3                   	ret
