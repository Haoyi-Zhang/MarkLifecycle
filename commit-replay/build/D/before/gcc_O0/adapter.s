
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

0000000000001040 <memset@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4008 <memset@GLIBC_2.2.5>
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
    1084:	48 8d 3d 72 02 00 00 	lea    0x272(%rip),%rdi        # 12fd <main>
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

00000000000011c6 <hash_bytes>:
    11c6:	55                   	push   %rbp
    11c7:	48 89 e5             	mov    %rsp,%rbp
    11ca:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    11ce:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    11d2:	c7 45 fc c5 9d 1c 81 	movl   $0x811c9dc5,-0x4(%rbp)
    11d9:	48 c7 45 f0 00 00 00 00 	movq   $0x0,-0x10(%rbp)
    11e1:	eb 25                	jmp    1208 <hash_bytes+0x42>
    11e3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    11e7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    11eb:	48 01 d0             	add    %rdx,%rax
    11ee:	0f b6 00             	movzbl (%rax),%eax
    11f1:	0f b6 c0             	movzbl %al,%eax
    11f4:	31 45 fc             	xor    %eax,-0x4(%rbp)
    11f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
    11fa:	69 c0 93 01 00 01    	imul   $0x1000193,%eax,%eax
    1200:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1203:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    1208:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    120c:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
    1210:	72 d1                	jb     11e3 <hash_bytes+0x1d>
    1212:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1215:	5d                   	pop    %rbp
    1216:	c3                   	ret

0000000000001217 <run_contract>:
    1217:	55                   	push   %rbp
    1218:	48 89 e5             	mov    %rsp,%rbp
    121b:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
    1222:	48 c7 45 f8 00 00 00 00 	movq   $0x0,-0x8(%rbp)
    122a:	eb 27                	jmp    1253 <run_contract+0x3c>
    122c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1230:	89 c2                	mov    %eax,%edx
    1232:	89 d0                	mov    %edx,%eax
    1234:	c1 e0 03             	shl    $0x3,%eax
    1237:	01 d0                	add    %edx,%eax
    1239:	c1 e0 02             	shl    $0x2,%eax
    123c:	01 d0                	add    %edx,%eax
    123e:	8d 50 0b             	lea    0xb(%rax),%edx
    1241:	48 8d 4d a0          	lea    -0x60(%rbp),%rcx
    1245:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1249:	48 01 c8             	add    %rcx,%rax
    124c:	88 10                	mov    %dl,(%rax)
    124e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    1253:	48 83 7d f8 3f       	cmpq   $0x3f,-0x8(%rbp)
    1258:	76 d2                	jbe    122c <run_contract+0x15>
    125a:	48 c7 45 f0 00 00 00 00 	movq   $0x0,-0x10(%rbp)
    1262:	e9 87 00 00 00       	jmp    12ee <run_contract+0xd7>
    1267:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
    126e:	ba 41 00 00 00       	mov    $0x41,%edx
    1273:	be a5 00 00 00       	mov    $0xa5,%esi
    1278:	48 89 c7             	mov    %rax,%rdi
    127b:	e8 c0 fd ff ff       	call   1040 <memset@plt>
    1280:	48 c7 45 e8 00 00 00 00 	movq   $0x0,-0x18(%rbp)
    1288:	eb 23                	jmp    12ad <run_contract+0x96>
    128a:	48 8d 55 a0          	lea    -0x60(%rbp),%rdx
    128e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1292:	48 01 d0             	add    %rdx,%rax
    1295:	0f b6 00             	movzbl (%rax),%eax
    1298:	48 8d 8d 50 ff ff ff 	lea    -0xb0(%rbp),%rcx
    129f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    12a3:	48 01 ca             	add    %rcx,%rdx
    12a6:	88 02                	mov    %al,(%rdx)
    12a8:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
    12ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    12b1:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
    12b5:	72 d3                	jb     128a <run_contract+0x73>
    12b7:	48 8d 95 50 ff ff ff 	lea    -0xb0(%rbp),%rdx
    12be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    12c2:	48 01 d0             	add    %rdx,%rax
    12c5:	c6 00 00             	movb   $0x0,(%rax)
    12c8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    12cc:	48 8d 50 01          	lea    0x1(%rax),%rdx
    12d0:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
    12d7:	48 89 d6             	mov    %rdx,%rsi
    12da:	48 89 c7             	mov    %rax,%rdi
    12dd:	e8 e4 fe ff ff       	call   11c6 <hash_bytes>
    12e2:	89 c7                	mov    %eax,%edi
    12e4:	e8 8e fe ff ff       	call   1177 <emit_u32>
    12e9:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    12ee:	48 83 7d f0 40       	cmpq   $0x40,-0x10(%rbp)
    12f3:	0f 86 6e ff ff ff    	jbe    1267 <run_contract+0x50>
    12f9:	90                   	nop
    12fa:	90                   	nop
    12fb:	c9                   	leave
    12fc:	c3                   	ret

00000000000012fd <main>:
    12fd:	55                   	push   %rbp
    12fe:	48 89 e5             	mov    %rsp,%rbp
    1301:	48 83 ec 10          	sub    $0x10,%rsp
    1305:	c7 45 fc f5 79 2b 6d 	movl   $0x6d2b79f5,-0x4(%rbp)
    130c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    130f:	be a3 25 c1 bf       	mov    $0xbfc125a3,%esi
    1314:	89 c7                	mov    %eax,%edi
    1316:	e8 3e fe ff ff       	call   1159 <wm_add_v1>
    131b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    131e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1321:	be 07 85 57 ad       	mov    $0xad578507,%esi
    1326:	89 c7                	mov    %eax,%edi
    1328:	e8 3b fe ff ff       	call   1168 <wm_xor_v1>
    132d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1330:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1333:	be d3 bb 7d 99       	mov    $0x997dbbd3,%esi
    1338:	89 c7                	mov    %eax,%edi
    133a:	e8 1a fe ff ff       	call   1159 <wm_add_v1>
    133f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1342:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1345:	be eb 15 cb e7       	mov    $0xe7cb15eb,%esi
    134a:	89 c7                	mov    %eax,%edi
    134c:	e8 17 fe ff ff       	call   1168 <wm_xor_v1>
    1351:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1354:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1357:	be 9b 81 e7 61       	mov    $0x61e7819b,%esi
    135c:	89 c7                	mov    %eax,%edi
    135e:	e8 f6 fd ff ff       	call   1159 <wm_add_v1>
    1363:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1366:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1369:	be 99 b3 fd c7       	mov    $0xc7fdb399,%esi
    136e:	89 c7                	mov    %eax,%edi
    1370:	e8 f3 fd ff ff       	call   1168 <wm_xor_v1>
    1375:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1378:	8b 45 fc             	mov    -0x4(%rbp),%eax
    137b:	be 63 63 e3 93       	mov    $0x93e36363,%esi
    1380:	89 c7                	mov    %eax,%edi
    1382:	e8 d2 fd ff ff       	call   1159 <wm_add_v1>
    1387:	89 45 fc             	mov    %eax,-0x4(%rbp)
    138a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    138d:	be 0f 95 8d a7       	mov    $0xa78d950f,%esi
    1392:	89 c7                	mov    %eax,%edi
    1394:	e8 c0 fd ff ff       	call   1159 <wm_add_v1>
    1399:	89 45 fc             	mov    %eax,-0x4(%rbp)
    139c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    139f:	be c5 37 a1 e1       	mov    $0xe1a137c5,%esi
    13a4:	89 c7                	mov    %eax,%edi
    13a6:	e8 ae fd ff ff       	call   1159 <wm_add_v1>
    13ab:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13ae:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13b1:	be ad 9b b9 b1       	mov    $0xb1b99bad,%esi
    13b6:	89 c7                	mov    %eax,%edi
    13b8:	e8 9c fd ff ff       	call   1159 <wm_add_v1>
    13bd:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13c0:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13c3:	be 23 1d ad d7       	mov    $0xd7ad1d23,%esi
    13c8:	89 c7                	mov    %eax,%edi
    13ca:	e8 8a fd ff ff       	call   1159 <wm_add_v1>
    13cf:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13d5:	be 35 af fb eb       	mov    $0xebfbaf35,%esi
    13da:	89 c7                	mov    %eax,%edi
    13dc:	e8 78 fd ff ff       	call   1159 <wm_add_v1>
    13e1:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13e4:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13e7:	be b9 e9 fd cd       	mov    $0xcdfde9b9,%esi
    13ec:	89 c7                	mov    %eax,%edi
    13ee:	e8 66 fd ff ff       	call   1159 <wm_add_v1>
    13f3:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13f9:	be b7 8f 39 21       	mov    $0x21398fb7,%esi
    13fe:	89 c7                	mov    %eax,%edi
    1400:	e8 54 fd ff ff       	call   1159 <wm_add_v1>
    1405:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1408:	8b 45 fc             	mov    -0x4(%rbp),%eax
    140b:	be d1 fd d1 19       	mov    $0x19d1fdd1,%esi
    1410:	89 c7                	mov    %eax,%edi
    1412:	e8 51 fd ff ff       	call   1168 <wm_xor_v1>
    1417:	89 45 fc             	mov    %eax,-0x4(%rbp)
    141a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    141d:	be a1 d5 8d fd       	mov    $0xfd8dd5a1,%esi
    1422:	89 c7                	mov    %eax,%edi
    1424:	e8 30 fd ff ff       	call   1159 <wm_add_v1>
    1429:	89 45 fc             	mov    %eax,-0x4(%rbp)
    142c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    142f:	be 25 dd b3 73       	mov    $0x73b3dd25,%esi
    1434:	89 c7                	mov    %eax,%edi
    1436:	e8 2d fd ff ff       	call   1168 <wm_xor_v1>
    143b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    143e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1441:	be 4d 8b bd c1       	mov    $0xc1bd8b4d,%esi
    1446:	89 c7                	mov    %eax,%edi
    1448:	e8 1b fd ff ff       	call   1168 <wm_xor_v1>
    144d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1450:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1453:	be df 57 2f 53       	mov    $0x532f57df,%esi
    1458:	89 c7                	mov    %eax,%edi
    145a:	e8 fa fc ff ff       	call   1159 <wm_add_v1>
    145f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1462:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1465:	be 79 33 c1 ad       	mov    $0xadc13379,%esi
    146a:	89 c7                	mov    %eax,%edi
    146c:	e8 f7 fc ff ff       	call   1168 <wm_xor_v1>
    1471:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1474:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1477:	be b1 b7 85 03       	mov    $0x385b7b1,%esi
    147c:	89 c7                	mov    %eax,%edi
    147e:	e8 d6 fc ff ff       	call   1159 <wm_add_v1>
    1483:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1486:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1489:	be 31 d5 01 3b       	mov    $0x3b01d531,%esi
    148e:	89 c7                	mov    %eax,%edi
    1490:	e8 c4 fc ff ff       	call   1159 <wm_add_v1>
    1495:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1498:	8b 45 fc             	mov    -0x4(%rbp),%eax
    149b:	be 7b 83 3d c7       	mov    $0xc73d837b,%esi
    14a0:	89 c7                	mov    %eax,%edi
    14a2:	e8 b2 fc ff ff       	call   1159 <wm_add_v1>
    14a7:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14ad:	be 8b c3 5d b1       	mov    $0xb15dc38b,%esi
    14b2:	89 c7                	mov    %eax,%edi
    14b4:	e8 af fc ff ff       	call   1168 <wm_xor_v1>
    14b9:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14bf:	be eb 67 3b c9       	mov    $0xc93b67eb,%esi
    14c4:	89 c7                	mov    %eax,%edi
    14c6:	e8 8e fc ff ff       	call   1159 <wm_add_v1>
    14cb:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14d1:	be 9d c7 bf f3       	mov    $0xf3bfc79d,%esi
    14d6:	89 c7                	mov    %eax,%edi
    14d8:	e8 8b fc ff ff       	call   1168 <wm_xor_v1>
    14dd:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14e0:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14e3:	be 11 05 bb 27       	mov    $0x27bb0511,%esi
    14e8:	89 c7                	mov    %eax,%edi
    14ea:	e8 79 fc ff ff       	call   1168 <wm_xor_v1>
    14ef:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14f2:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14f5:	be b9 5f 0f 37       	mov    $0x370f5fb9,%esi
    14fa:	89 c7                	mov    %eax,%edi
    14fc:	e8 58 fc ff ff       	call   1159 <wm_add_v1>
    1501:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1504:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1507:	83 f8 ff             	cmp    $0xffffffff,%eax
    150a:	75 07                	jne    1513 <main+0x216>
    150c:	b8 61 00 00 00       	mov    $0x61,%eax
    1511:	eb 24                	jmp    1537 <main+0x23a>
    1513:	e8 ff fc ff ff       	call   1217 <run_contract>
    1518:	48 8b 05 09 2b 00 00 	mov    0x2b09(%rip),%rax        # 4028 <stdout@GLIBC_2.2.5>
    151f:	48 89 c7             	mov    %rax,%rdi
    1522:	e8 09 fb ff ff       	call   1030 <ferror@plt>
    1527:	85 c0                	test   %eax,%eax
    1529:	74 07                	je     1532 <main+0x235>
    152b:	b8 02 00 00 00       	mov    $0x2,%eax
    1530:	eb 05                	jmp    1537 <main+0x23a>
    1532:	b8 00 00 00 00       	mov    $0x0,%eax
    1537:	c9                   	leave
    1538:	c3                   	ret

Disassembly of section .fini:

000000000000153c <_fini>:
    153c:	48 83 ec 08          	sub    $0x8,%rsp
    1540:	48 83 c4 08          	add    $0x8,%rsp
    1544:	c3                   	ret
