
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
    1084:	48 8d 3d 37 02 00 00 	lea    0x237(%rip),%rdi        # 12c2 <main>
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

00000000000011c6 <run_contract>:
    11c6:	55                   	push   %rbp
    11c7:	48 89 e5             	mov    %rsp,%rbp
    11ca:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
    11d1:	48 c7 45 f8 00 00 00 00 	movq   $0x0,-0x8(%rbp)
    11d9:	eb 27                	jmp    1202 <run_contract+0x3c>
    11db:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11df:	89 c2                	mov    %eax,%edx
    11e1:	89 d0                	mov    %edx,%eax
    11e3:	c1 e0 03             	shl    $0x3,%eax
    11e6:	01 d0                	add    %edx,%eax
    11e8:	c1 e0 02             	shl    $0x2,%eax
    11eb:	01 d0                	add    %edx,%eax
    11ed:	8d 50 0b             	lea    0xb(%rax),%edx
    11f0:	48 8d 4d a0          	lea    -0x60(%rbp),%rcx
    11f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11f8:	48 01 c8             	add    %rcx,%rax
    11fb:	88 10                	mov    %dl,(%rax)
    11fd:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    1202:	48 83 7d f8 3f       	cmpq   $0x3f,-0x8(%rbp)
    1207:	76 d2                	jbe    11db <run_contract+0x15>
    1209:	48 c7 45 f0 00 00 00 00 	movq   $0x0,-0x10(%rbp)
    1211:	e9 9c 00 00 00       	jmp    12b2 <run_contract+0xec>
    1216:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
    121d:	ba 41 00 00 00       	mov    $0x41,%edx
    1222:	be a5 00 00 00       	mov    $0xa5,%esi
    1227:	48 89 c7             	mov    %rax,%rdi
    122a:	e8 11 fe ff ff       	call   1040 <memset@plt>
    122f:	48 c7 45 e8 00 00 00 00 	movq   $0x0,-0x18(%rbp)
    1237:	eb 23                	jmp    125c <run_contract+0x96>
    1239:	48 8d 55 a0          	lea    -0x60(%rbp),%rdx
    123d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1241:	48 01 d0             	add    %rdx,%rax
    1244:	0f b6 00             	movzbl (%rax),%eax
    1247:	48 8d 8d 50 ff ff ff 	lea    -0xb0(%rbp),%rcx
    124e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1252:	48 01 ca             	add    %rcx,%rdx
    1255:	88 02                	mov    %al,(%rdx)
    1257:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
    125c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1260:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
    1264:	72 d3                	jb     1239 <run_contract+0x73>
    1266:	48 8d 95 50 ff ff ff 	lea    -0xb0(%rbp),%rdx
    126d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1271:	48 01 d0             	add    %rdx,%rax
    1274:	c6 00 00             	movb   $0x0,(%rax)
    1277:	48 8b 15 aa 2d 00 00 	mov    0x2daa(%rip),%rdx        # 4028 <stdout@GLIBC_2.2.5>
    127e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1282:	48 8d 70 01          	lea    0x1(%rax),%rsi
    1286:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
    128d:	48 89 d1             	mov    %rdx,%rcx
    1290:	48 89 f2             	mov    %rsi,%rdx
    1293:	be 01 00 00 00       	mov    $0x1,%esi
    1298:	48 89 c7             	mov    %rax,%rdi
    129b:	e8 b0 fd ff ff       	call   1050 <fwrite@plt>
    12a0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    12a4:	48 83 c2 01          	add    $0x1,%rdx
    12a8:	48 39 d0             	cmp    %rdx,%rax
    12ab:	75 12                	jne    12bf <run_contract+0xf9>
    12ad:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    12b2:	48 83 7d f0 40       	cmpq   $0x40,-0x10(%rbp)
    12b7:	0f 86 59 ff ff ff    	jbe    1216 <run_contract+0x50>
    12bd:	eb 01                	jmp    12c0 <run_contract+0xfa>
    12bf:	90                   	nop
    12c0:	c9                   	leave
    12c1:	c3                   	ret

00000000000012c2 <main>:
    12c2:	55                   	push   %rbp
    12c3:	48 89 e5             	mov    %rsp,%rbp
    12c6:	48 83 ec 10          	sub    $0x10,%rsp
    12ca:	c7 45 fc f5 79 2b 6d 	movl   $0x6d2b79f5,-0x4(%rbp)
    12d1:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12d4:	be a3 25 c1 bf       	mov    $0xbfc125a3,%esi
    12d9:	89 c7                	mov    %eax,%edi
    12db:	e8 79 fe ff ff       	call   1159 <wm_add_v1>
    12e0:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12e3:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12e6:	be 07 85 57 ad       	mov    $0xad578507,%esi
    12eb:	89 c7                	mov    %eax,%edi
    12ed:	e8 76 fe ff ff       	call   1168 <wm_xor_v1>
    12f2:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12f5:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12f8:	be d3 bb 7d 99       	mov    $0x997dbbd3,%esi
    12fd:	89 c7                	mov    %eax,%edi
    12ff:	e8 55 fe ff ff       	call   1159 <wm_add_v1>
    1304:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1307:	8b 45 fc             	mov    -0x4(%rbp),%eax
    130a:	be eb 15 cb e7       	mov    $0xe7cb15eb,%esi
    130f:	89 c7                	mov    %eax,%edi
    1311:	e8 52 fe ff ff       	call   1168 <wm_xor_v1>
    1316:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1319:	8b 45 fc             	mov    -0x4(%rbp),%eax
    131c:	be 9b 81 e7 61       	mov    $0x61e7819b,%esi
    1321:	89 c7                	mov    %eax,%edi
    1323:	e8 31 fe ff ff       	call   1159 <wm_add_v1>
    1328:	89 45 fc             	mov    %eax,-0x4(%rbp)
    132b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    132e:	be 99 b3 fd c7       	mov    $0xc7fdb399,%esi
    1333:	89 c7                	mov    %eax,%edi
    1335:	e8 2e fe ff ff       	call   1168 <wm_xor_v1>
    133a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    133d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1340:	be 63 63 e3 93       	mov    $0x93e36363,%esi
    1345:	89 c7                	mov    %eax,%edi
    1347:	e8 0d fe ff ff       	call   1159 <wm_add_v1>
    134c:	89 45 fc             	mov    %eax,-0x4(%rbp)
    134f:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1352:	be 0f 95 8d a7       	mov    $0xa78d950f,%esi
    1357:	89 c7                	mov    %eax,%edi
    1359:	e8 fb fd ff ff       	call   1159 <wm_add_v1>
    135e:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1361:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1364:	be c5 37 a1 e1       	mov    $0xe1a137c5,%esi
    1369:	89 c7                	mov    %eax,%edi
    136b:	e8 e9 fd ff ff       	call   1159 <wm_add_v1>
    1370:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1373:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1376:	be ad 9b b9 b1       	mov    $0xb1b99bad,%esi
    137b:	89 c7                	mov    %eax,%edi
    137d:	e8 d7 fd ff ff       	call   1159 <wm_add_v1>
    1382:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1385:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1388:	be 23 1d ad d7       	mov    $0xd7ad1d23,%esi
    138d:	89 c7                	mov    %eax,%edi
    138f:	e8 c5 fd ff ff       	call   1159 <wm_add_v1>
    1394:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1397:	8b 45 fc             	mov    -0x4(%rbp),%eax
    139a:	be 35 af fb eb       	mov    $0xebfbaf35,%esi
    139f:	89 c7                	mov    %eax,%edi
    13a1:	e8 b3 fd ff ff       	call   1159 <wm_add_v1>
    13a6:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13ac:	be b9 e9 fd cd       	mov    $0xcdfde9b9,%esi
    13b1:	89 c7                	mov    %eax,%edi
    13b3:	e8 a1 fd ff ff       	call   1159 <wm_add_v1>
    13b8:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13bb:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13be:	be b7 8f 39 21       	mov    $0x21398fb7,%esi
    13c3:	89 c7                	mov    %eax,%edi
    13c5:	e8 8f fd ff ff       	call   1159 <wm_add_v1>
    13ca:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13cd:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13d0:	be d1 fd d1 19       	mov    $0x19d1fdd1,%esi
    13d5:	89 c7                	mov    %eax,%edi
    13d7:	e8 8c fd ff ff       	call   1168 <wm_xor_v1>
    13dc:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13df:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13e2:	be a1 d5 8d fd       	mov    $0xfd8dd5a1,%esi
    13e7:	89 c7                	mov    %eax,%edi
    13e9:	e8 6b fd ff ff       	call   1159 <wm_add_v1>
    13ee:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13f4:	be 25 dd b3 73       	mov    $0x73b3dd25,%esi
    13f9:	89 c7                	mov    %eax,%edi
    13fb:	e8 68 fd ff ff       	call   1168 <wm_xor_v1>
    1400:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1403:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1406:	be 4d 8b bd c1       	mov    $0xc1bd8b4d,%esi
    140b:	89 c7                	mov    %eax,%edi
    140d:	e8 56 fd ff ff       	call   1168 <wm_xor_v1>
    1412:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1415:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1418:	be df 57 2f 53       	mov    $0x532f57df,%esi
    141d:	89 c7                	mov    %eax,%edi
    141f:	e8 35 fd ff ff       	call   1159 <wm_add_v1>
    1424:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1427:	8b 45 fc             	mov    -0x4(%rbp),%eax
    142a:	be 79 33 c1 ad       	mov    $0xadc13379,%esi
    142f:	89 c7                	mov    %eax,%edi
    1431:	e8 32 fd ff ff       	call   1168 <wm_xor_v1>
    1436:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1439:	8b 45 fc             	mov    -0x4(%rbp),%eax
    143c:	be b1 b7 85 03       	mov    $0x385b7b1,%esi
    1441:	89 c7                	mov    %eax,%edi
    1443:	e8 11 fd ff ff       	call   1159 <wm_add_v1>
    1448:	89 45 fc             	mov    %eax,-0x4(%rbp)
    144b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    144e:	be 31 d5 01 3b       	mov    $0x3b01d531,%esi
    1453:	89 c7                	mov    %eax,%edi
    1455:	e8 ff fc ff ff       	call   1159 <wm_add_v1>
    145a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    145d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1460:	be 7b 83 3d c7       	mov    $0xc73d837b,%esi
    1465:	89 c7                	mov    %eax,%edi
    1467:	e8 ed fc ff ff       	call   1159 <wm_add_v1>
    146c:	89 45 fc             	mov    %eax,-0x4(%rbp)
    146f:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1472:	be 8b c3 5d b1       	mov    $0xb15dc38b,%esi
    1477:	89 c7                	mov    %eax,%edi
    1479:	e8 ea fc ff ff       	call   1168 <wm_xor_v1>
    147e:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1481:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1484:	be eb 67 3b c9       	mov    $0xc93b67eb,%esi
    1489:	89 c7                	mov    %eax,%edi
    148b:	e8 c9 fc ff ff       	call   1159 <wm_add_v1>
    1490:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1493:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1496:	be 9d c7 bf f3       	mov    $0xf3bfc79d,%esi
    149b:	89 c7                	mov    %eax,%edi
    149d:	e8 c6 fc ff ff       	call   1168 <wm_xor_v1>
    14a2:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14a8:	be 11 05 bb 27       	mov    $0x27bb0511,%esi
    14ad:	89 c7                	mov    %eax,%edi
    14af:	e8 b4 fc ff ff       	call   1168 <wm_xor_v1>
    14b4:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14b7:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14ba:	be b9 5f 0f 37       	mov    $0x370f5fb9,%esi
    14bf:	89 c7                	mov    %eax,%edi
    14c1:	e8 93 fc ff ff       	call   1159 <wm_add_v1>
    14c6:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14cc:	83 f8 ff             	cmp    $0xffffffff,%eax
    14cf:	75 07                	jne    14d8 <main+0x216>
    14d1:	b8 61 00 00 00       	mov    $0x61,%eax
    14d6:	eb 24                	jmp    14fc <main+0x23a>
    14d8:	e8 e9 fc ff ff       	call   11c6 <run_contract>
    14dd:	48 8b 05 44 2b 00 00 	mov    0x2b44(%rip),%rax        # 4028 <stdout@GLIBC_2.2.5>
    14e4:	48 89 c7             	mov    %rax,%rdi
    14e7:	e8 44 fb ff ff       	call   1030 <ferror@plt>
    14ec:	85 c0                	test   %eax,%eax
    14ee:	74 07                	je     14f7 <main+0x235>
    14f0:	b8 02 00 00 00       	mov    $0x2,%eax
    14f5:	eb 05                	jmp    14fc <main+0x23a>
    14f7:	b8 00 00 00 00       	mov    $0x0,%eax
    14fc:	c9                   	leave
    14fd:	c3                   	ret

Disassembly of section .fini:

0000000000001500 <_fini>:
    1500:	48 83 ec 08          	sub    $0x8,%rsp
    1504:	48 83 c4 08          	add    $0x8,%rsp
    1508:	c3                   	ret
