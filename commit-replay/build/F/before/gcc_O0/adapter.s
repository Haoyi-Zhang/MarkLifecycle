
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

0000000000001040 <strlen@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4008 <strlen@GLIBC_2.2.5>
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
    1084:	48 8d 3d 8e 02 00 00 	lea    0x28e(%rip),%rdi        # 1319 <main>
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

00000000000011c6 <lskip>:
    11c6:	55                   	push   %rbp
    11c7:	48 89 e5             	mov    %rsp,%rbp
    11ca:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    11ce:	eb 05                	jmp    11d5 <lskip+0xf>
    11d0:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    11d5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11d9:	0f b6 00             	movzbl (%rax),%eax
    11dc:	3c 20                	cmp    $0x20,%al
    11de:	74 f0                	je     11d0 <lskip+0xa>
    11e0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11e4:	0f b6 00             	movzbl (%rax),%eax
    11e7:	3c 09                	cmp    $0x9,%al
    11e9:	74 e5                	je     11d0 <lskip+0xa>
    11eb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11ef:	5d                   	pop    %rbp
    11f0:	c3                   	ret

00000000000011f1 <rstrip>:
    11f1:	55                   	push   %rbp
    11f2:	48 89 e5             	mov    %rsp,%rbp
    11f5:	48 83 ec 20          	sub    $0x20,%rsp
    11f9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    11fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1201:	48 89 c7             	mov    %rax,%rdi
    1204:	e8 37 fe ff ff       	call   1040 <strlen@plt>
    1209:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    120d:	eb 13                	jmp    1222 <rstrip+0x31>
    120f:	48 83 6d f8 01       	subq   $0x1,-0x8(%rbp)
    1214:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1218:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    121c:	48 01 d0             	add    %rdx,%rax
    121f:	c6 00 00             	movb   $0x0,(%rax)
    1222:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    1227:	74 2c                	je     1255 <rstrip+0x64>
    1229:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    122d:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
    1231:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1235:	48 01 d0             	add    %rdx,%rax
    1238:	0f b6 00             	movzbl (%rax),%eax
    123b:	3c 20                	cmp    $0x20,%al
    123d:	74 d0                	je     120f <rstrip+0x1e>
    123f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1243:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
    1247:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    124b:	48 01 d0             	add    %rdx,%rax
    124e:	0f b6 00             	movzbl (%rax),%eax
    1251:	3c 09                	cmp    $0x9,%al
    1253:	74 ba                	je     120f <rstrip+0x1e>
    1255:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1259:	c9                   	leave
    125a:	c3                   	ret

000000000000125b <run_contract>:
    125b:	55                   	push   %rbp
    125c:	48 89 e5             	mov    %rsp,%rbp
    125f:	48 83 ec 30          	sub    $0x30,%rsp
    1263:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    126a:	e9 99 00 00 00       	jmp    1308 <run_contract+0xad>
    126f:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    1276:	eb 7f                	jmp    12f7 <run_contract+0x9c>
    1278:	8b 45 fc             	mov    -0x4(%rbp),%eax
    127b:	88 45 dd             	mov    %al,-0x23(%rbp)
    127e:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1281:	88 45 de             	mov    %al,-0x22(%rbp)
    1284:	c6 45 df 00          	movb   $0x0,-0x21(%rbp)
    1288:	48 8d 45 dd          	lea    -0x23(%rbp),%rax
    128c:	48 89 c7             	mov    %rax,%rdi
    128f:	e8 5d ff ff ff       	call   11f1 <rstrip>
    1294:	48 89 c7             	mov    %rax,%rdi
    1297:	e8 2a ff ff ff       	call   11c6 <lskip>
    129c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    12a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    12a4:	48 89 c7             	mov    %rax,%rdi
    12a7:	e8 94 fd ff ff       	call   1040 <strlen@plt>
    12ac:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    12b0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    12b4:	89 45 f4             	mov    %eax,-0xc(%rbp)
    12b7:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
    12bc:	74 10                	je     12ce <run_contract+0x73>
    12be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    12c2:	0f b6 00             	movzbl (%rax),%eax
    12c5:	0f b6 c0             	movzbl %al,%eax
    12c8:	c1 e0 08             	shl    $0x8,%eax
    12cb:	09 45 f4             	or     %eax,-0xc(%rbp)
    12ce:	48 83 7d e0 01       	cmpq   $0x1,-0x20(%rbp)
    12d3:	76 14                	jbe    12e9 <run_contract+0x8e>
    12d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    12d9:	48 83 c0 01          	add    $0x1,%rax
    12dd:	0f b6 00             	movzbl (%rax),%eax
    12e0:	0f b6 c0             	movzbl %al,%eax
    12e3:	c1 e0 10             	shl    $0x10,%eax
    12e6:	09 45 f4             	or     %eax,-0xc(%rbp)
    12e9:	8b 45 f4             	mov    -0xc(%rbp),%eax
    12ec:	89 c7                	mov    %eax,%edi
    12ee:	e8 84 fe ff ff       	call   1177 <emit_u32>
    12f3:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    12f7:	81 7d f8 ff 00 00 00 	cmpl   $0xff,-0x8(%rbp)
    12fe:	0f 86 74 ff ff ff    	jbe    1278 <run_contract+0x1d>
    1304:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1308:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
    130f:	0f 86 5a ff ff ff    	jbe    126f <run_contract+0x14>
    1315:	90                   	nop
    1316:	90                   	nop
    1317:	c9                   	leave
    1318:	c3                   	ret

0000000000001319 <main>:
    1319:	55                   	push   %rbp
    131a:	48 89 e5             	mov    %rsp,%rbp
    131d:	48 83 ec 10          	sub    $0x10,%rsp
    1321:	c7 45 fc f5 79 2b 6d 	movl   $0x6d2b79f5,-0x4(%rbp)
    1328:	8b 45 fc             	mov    -0x4(%rbp),%eax
    132b:	be 65 ff 17 37       	mov    $0x3717ff65,%esi
    1330:	89 c7                	mov    %eax,%edi
    1332:	e8 22 fe ff ff       	call   1159 <wm_add_v1>
    1337:	89 45 fc             	mov    %eax,-0x4(%rbp)
    133a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    133d:	be 8f 4b c9 a3       	mov    $0xa3c94b8f,%esi
    1342:	89 c7                	mov    %eax,%edi
    1344:	e8 1f fe ff ff       	call   1168 <wm_xor_v1>
    1349:	89 45 fc             	mov    %eax,-0x4(%rbp)
    134c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    134f:	be 25 f3 e5 61       	mov    $0x61e5f325,%esi
    1354:	89 c7                	mov    %eax,%edi
    1356:	e8 fe fd ff ff       	call   1159 <wm_add_v1>
    135b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    135e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1361:	be 09 a3 69 af       	mov    $0xaf69a309,%esi
    1366:	89 c7                	mov    %eax,%edi
    1368:	e8 fb fd ff ff       	call   1168 <wm_xor_v1>
    136d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1370:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1373:	be 99 13 81 33       	mov    $0x33811399,%esi
    1378:	89 c7                	mov    %eax,%edi
    137a:	e8 da fd ff ff       	call   1159 <wm_add_v1>
    137f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1382:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1385:	be 4d 83 1d a9       	mov    $0xa91d834d,%esi
    138a:	89 c7                	mov    %eax,%edi
    138c:	e8 d7 fd ff ff       	call   1168 <wm_xor_v1>
    1391:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1394:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1397:	be f7 71 15 8d       	mov    $0x8d1571f7,%esi
    139c:	89 c7                	mov    %eax,%edi
    139e:	e8 b6 fd ff ff       	call   1159 <wm_add_v1>
    13a3:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13a9:	be b7 d3 a7 0f       	mov    $0xfa7d3b7,%esi
    13ae:	89 c7                	mov    %eax,%edi
    13b0:	e8 b3 fd ff ff       	call   1168 <wm_xor_v1>
    13b5:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13b8:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13bb:	be 4f df 3b 5b       	mov    $0x5b3bdf4f,%esi
    13c0:	89 c7                	mov    %eax,%edi
    13c2:	e8 a1 fd ff ff       	call   1168 <wm_xor_v1>
    13c7:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13cd:	be 9d 6b 63 87       	mov    $0x87636b9d,%esi
    13d2:	89 c7                	mov    %eax,%edi
    13d4:	e8 8f fd ff ff       	call   1168 <wm_xor_v1>
    13d9:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13df:	be b7 f9 ad 0b       	mov    $0xbadf9b7,%esi
    13e4:	89 c7                	mov    %eax,%edi
    13e6:	e8 7d fd ff ff       	call   1168 <wm_xor_v1>
    13eb:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13ee:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13f1:	be f5 a9 1b b5       	mov    $0xb51ba9f5,%esi
    13f6:	89 c7                	mov    %eax,%edi
    13f8:	e8 6b fd ff ff       	call   1168 <wm_xor_v1>
    13fd:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1400:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1403:	be 01 49 41 eb       	mov    $0xeb414901,%esi
    1408:	89 c7                	mov    %eax,%edi
    140a:	e8 59 fd ff ff       	call   1168 <wm_xor_v1>
    140f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1412:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1415:	be af f7 ab 85       	mov    $0x85abf7af,%esi
    141a:	89 c7                	mov    %eax,%edi
    141c:	e8 47 fd ff ff       	call   1168 <wm_xor_v1>
    1421:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1424:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1427:	be 39 bd 65 5d       	mov    $0x5d65bd39,%esi
    142c:	89 c7                	mov    %eax,%edi
    142e:	e8 35 fd ff ff       	call   1168 <wm_xor_v1>
    1433:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1436:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1439:	be 5d fd 37 e5       	mov    $0xe537fd5d,%esi
    143e:	89 c7                	mov    %eax,%edi
    1440:	e8 14 fd ff ff       	call   1159 <wm_add_v1>
    1445:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1448:	8b 45 fc             	mov    -0x4(%rbp),%eax
    144b:	be 29 4f 1b af       	mov    $0xaf1b4f29,%esi
    1450:	89 c7                	mov    %eax,%edi
    1452:	e8 11 fd ff ff       	call   1168 <wm_xor_v1>
    1457:	89 45 fc             	mov    %eax,-0x4(%rbp)
    145a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    145d:	be 4b e5 71 81       	mov    $0x8171e54b,%esi
    1462:	89 c7                	mov    %eax,%edi
    1464:	e8 f0 fc ff ff       	call   1159 <wm_add_v1>
    1469:	89 45 fc             	mov    %eax,-0x4(%rbp)
    146c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    146f:	be c9 a1 b1 67       	mov    $0x67b1a1c9,%esi
    1474:	89 c7                	mov    %eax,%edi
    1476:	e8 ed fc ff ff       	call   1168 <wm_xor_v1>
    147b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    147e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1481:	be 0b a9 db 85       	mov    $0x85dba90b,%esi
    1486:	89 c7                	mov    %eax,%edi
    1488:	e8 cc fc ff ff       	call   1159 <wm_add_v1>
    148d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1490:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1493:	be 0d dd 17 15       	mov    $0x1517dd0d,%esi
    1498:	89 c7                	mov    %eax,%edi
    149a:	e8 c9 fc ff ff       	call   1168 <wm_xor_v1>
    149f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14a2:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14a5:	be 3b 9d 8b 81       	mov    $0x818b9d3b,%esi
    14aa:	89 c7                	mov    %eax,%edi
    14ac:	e8 a8 fc ff ff       	call   1159 <wm_add_v1>
    14b1:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14b7:	be 8b 05 89 69       	mov    $0x6989058b,%esi
    14bc:	89 c7                	mov    %eax,%edi
    14be:	e8 96 fc ff ff       	call   1159 <wm_add_v1>
    14c3:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14c9:	be dd 13 ff 5b       	mov    $0x5bff13dd,%esi
    14ce:	89 c7                	mov    %eax,%edi
    14d0:	e8 93 fc ff ff       	call   1168 <wm_xor_v1>
    14d5:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14db:	be 79 67 a1 67       	mov    $0x67a16779,%esi
    14e0:	89 c7                	mov    %eax,%edi
    14e2:	e8 72 fc ff ff       	call   1159 <wm_add_v1>
    14e7:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14ed:	be dd 1b 11 af       	mov    $0xaf111bdd,%esi
    14f2:	89 c7                	mov    %eax,%edi
    14f4:	e8 6f fc ff ff       	call   1168 <wm_xor_v1>
    14f9:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14ff:	be 01 85 b3 3f       	mov    $0x3fb38501,%esi
    1504:	89 c7                	mov    %eax,%edi
    1506:	e8 5d fc ff ff       	call   1168 <wm_xor_v1>
    150b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    150e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1511:	be df 73 e3 2b       	mov    $0x2be373df,%esi
    1516:	89 c7                	mov    %eax,%edi
    1518:	e8 3c fc ff ff       	call   1159 <wm_add_v1>
    151d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1520:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1523:	83 f8 ff             	cmp    $0xffffffff,%eax
    1526:	75 07                	jne    152f <main+0x216>
    1528:	b8 61 00 00 00       	mov    $0x61,%eax
    152d:	eb 24                	jmp    1553 <main+0x23a>
    152f:	e8 27 fd ff ff       	call   125b <run_contract>
    1534:	48 8b 05 ed 2a 00 00 	mov    0x2aed(%rip),%rax        # 4028 <stdout@GLIBC_2.2.5>
    153b:	48 89 c7             	mov    %rax,%rdi
    153e:	e8 ed fa ff ff       	call   1030 <ferror@plt>
    1543:	85 c0                	test   %eax,%eax
    1545:	74 07                	je     154e <main+0x235>
    1547:	b8 02 00 00 00       	mov    $0x2,%eax
    154c:	eb 05                	jmp    1553 <main+0x23a>
    154e:	b8 00 00 00 00       	mov    $0x0,%eax
    1553:	c9                   	leave
    1554:	c3                   	ret

Disassembly of section .fini:

0000000000001558 <_fini>:
    1558:	48 83 ec 08          	sub    $0x8,%rsp
    155c:	48 83 c4 08          	add    $0x8,%rsp
    1560:	c3                   	ret
