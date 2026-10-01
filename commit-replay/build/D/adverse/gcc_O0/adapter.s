
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

0000000000001050 <memcpy@plt>:
    1050:	ff 25 ba 2f 00 00    	jmp    *0x2fba(%rip)        # 4010 <memcpy@GLIBC_2.14>
    1056:	68 02 00 00 00       	push   $0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001060 <fwrite@plt>:
    1060:	ff 25 b2 2f 00 00    	jmp    *0x2fb2(%rip)        # 4018 <fwrite@GLIBC_2.2.5>
    1066:	68 03 00 00 00       	push   $0x3
    106b:	e9 b0 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .plt.got:

0000000000001070 <__cxa_finalize@plt>:
    1070:	ff 25 6a 2f 00 00    	jmp    *0x2f6a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1076:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000001080 <_start>:
    1080:	31 ed                	xor    %ebp,%ebp
    1082:	49 89 d1             	mov    %rdx,%r9
    1085:	5e                   	pop    %rsi
    1086:	48 89 e2             	mov    %rsp,%rdx
    1089:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    108d:	50                   	push   %rax
    108e:	54                   	push   %rsp
    108f:	45 31 c0             	xor    %r8d,%r8d
    1092:	31 c9                	xor    %ecx,%ecx
    1094:	48 8d 3d 17 02 00 00 	lea    0x217(%rip),%rdi        # 12b2 <main>
    109b:	ff 15 1f 2f 00 00    	call   *0x2f1f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    10a1:	f4                   	hlt
    10a2:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    10ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000010b0 <deregister_tm_clones>:
    10b0:	48 8d 3d 79 2f 00 00 	lea    0x2f79(%rip),%rdi        # 4030 <stdout@GLIBC_2.2.5>
    10b7:	48 8d 05 72 2f 00 00 	lea    0x2f72(%rip),%rax        # 4030 <stdout@GLIBC_2.2.5>
    10be:	48 39 f8             	cmp    %rdi,%rax
    10c1:	74 15                	je     10d8 <deregister_tm_clones+0x28>
    10c3:	48 8b 05 fe 2e 00 00 	mov    0x2efe(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    10ca:	48 85 c0             	test   %rax,%rax
    10cd:	74 09                	je     10d8 <deregister_tm_clones+0x28>
    10cf:	ff e0                	jmp    *%rax
    10d1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10d8:	c3                   	ret
    10d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010e0 <register_tm_clones>:
    10e0:	48 8d 3d 49 2f 00 00 	lea    0x2f49(%rip),%rdi        # 4030 <stdout@GLIBC_2.2.5>
    10e7:	48 8d 35 42 2f 00 00 	lea    0x2f42(%rip),%rsi        # 4030 <stdout@GLIBC_2.2.5>
    10ee:	48 29 fe             	sub    %rdi,%rsi
    10f1:	48 89 f0             	mov    %rsi,%rax
    10f4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    10f8:	48 c1 f8 03          	sar    $0x3,%rax
    10fc:	48 01 c6             	add    %rax,%rsi
    10ff:	48 d1 fe             	sar    $1,%rsi
    1102:	74 14                	je     1118 <register_tm_clones+0x38>
    1104:	48 8b 05 cd 2e 00 00 	mov    0x2ecd(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    110b:	48 85 c0             	test   %rax,%rax
    110e:	74 08                	je     1118 <register_tm_clones+0x38>
    1110:	ff e0                	jmp    *%rax
    1112:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1118:	c3                   	ret
    1119:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001120 <__do_global_dtors_aux>:
    1120:	f3 0f 1e fa          	endbr64
    1124:	80 3d 0d 2f 00 00 00 	cmpb   $0x0,0x2f0d(%rip)        # 4038 <completed.0>
    112b:	75 2b                	jne    1158 <__do_global_dtors_aux+0x38>
    112d:	55                   	push   %rbp
    112e:	48 83 3d aa 2e 00 00 00 	cmpq   $0x0,0x2eaa(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1136:	48 89 e5             	mov    %rsp,%rbp
    1139:	74 0c                	je     1147 <__do_global_dtors_aux+0x27>
    113b:	48 8b 3d e6 2e 00 00 	mov    0x2ee6(%rip),%rdi        # 4028 <__dso_handle>
    1142:	e8 29 ff ff ff       	call   1070 <__cxa_finalize@plt>
    1147:	e8 64 ff ff ff       	call   10b0 <deregister_tm_clones>
    114c:	c6 05 e5 2e 00 00 01 	movb   $0x1,0x2ee5(%rip)        # 4038 <completed.0>
    1153:	5d                   	pop    %rbp
    1154:	c3                   	ret
    1155:	0f 1f 00             	nopl   (%rax)
    1158:	c3                   	ret
    1159:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001160 <frame_dummy>:
    1160:	f3 0f 1e fa          	endbr64
    1164:	e9 77 ff ff ff       	jmp    10e0 <register_tm_clones>

0000000000001169 <wm_add_v2>:
    1169:	55                   	push   %rbp
    116a:	48 89 e5             	mov    %rsp,%rbp
    116d:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1170:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1173:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1176:	5d                   	pop    %rbp
    1177:	c3                   	ret

0000000000001178 <wm_xor_v2>:
    1178:	55                   	push   %rbp
    1179:	48 89 e5             	mov    %rsp,%rbp
    117c:	89 7d fc             	mov    %edi,-0x4(%rbp)
    117f:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1182:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1185:	5d                   	pop    %rbp
    1186:	c3                   	ret

0000000000001187 <emit_u32>:
    1187:	55                   	push   %rbp
    1188:	48 89 e5             	mov    %rsp,%rbp
    118b:	48 83 ec 20          	sub    $0x20,%rsp
    118f:	89 7d ec             	mov    %edi,-0x14(%rbp)
    1192:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1195:	88 45 fc             	mov    %al,-0x4(%rbp)
    1198:	8b 45 ec             	mov    -0x14(%rbp),%eax
    119b:	c1 e8 08             	shr    $0x8,%eax
    119e:	88 45 fd             	mov    %al,-0x3(%rbp)
    11a1:	8b 45 ec             	mov    -0x14(%rbp),%eax
    11a4:	c1 e8 10             	shr    $0x10,%eax
    11a7:	88 45 fe             	mov    %al,-0x2(%rbp)
    11aa:	8b 45 ec             	mov    -0x14(%rbp),%eax
    11ad:	c1 e8 18             	shr    $0x18,%eax
    11b0:	88 45 ff             	mov    %al,-0x1(%rbp)
    11b3:	48 8b 15 76 2e 00 00 	mov    0x2e76(%rip),%rdx        # 4030 <stdout@GLIBC_2.2.5>
    11ba:	48 8d 45 fc          	lea    -0x4(%rbp),%rax
    11be:	48 89 d1             	mov    %rdx,%rcx
    11c1:	ba 04 00 00 00       	mov    $0x4,%edx
    11c6:	be 01 00 00 00       	mov    $0x1,%esi
    11cb:	48 89 c7             	mov    %rax,%rdi
    11ce:	e8 8d fe ff ff       	call   1060 <fwrite@plt>
    11d3:	90                   	nop
    11d4:	c9                   	leave
    11d5:	c3                   	ret

00000000000011d6 <run_contract>:
    11d6:	55                   	push   %rbp
    11d7:	48 89 e5             	mov    %rsp,%rbp
    11da:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
    11e1:	48 c7 45 f8 00 00 00 00 	movq   $0x0,-0x8(%rbp)
    11e9:	eb 27                	jmp    1212 <run_contract+0x3c>
    11eb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11ef:	89 c2                	mov    %eax,%edx
    11f1:	89 d0                	mov    %edx,%eax
    11f3:	c1 e0 03             	shl    $0x3,%eax
    11f6:	01 d0                	add    %edx,%eax
    11f8:	c1 e0 02             	shl    $0x2,%eax
    11fb:	01 d0                	add    %edx,%eax
    11fd:	8d 50 0b             	lea    0xb(%rax),%edx
    1200:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
    1204:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1208:	48 01 c8             	add    %rcx,%rax
    120b:	88 10                	mov    %dl,(%rax)
    120d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    1212:	48 83 7d f8 3f       	cmpq   $0x3f,-0x8(%rbp)
    1217:	76 d2                	jbe    11eb <run_contract+0x15>
    1219:	48 c7 45 f0 00 00 00 00 	movq   $0x0,-0x10(%rbp)
    1221:	eb 7f                	jmp    12a2 <run_contract+0xcc>
    1223:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    122a:	ba 41 00 00 00       	mov    $0x41,%edx
    122f:	be a5 00 00 00       	mov    $0xa5,%esi
    1234:	48 89 c7             	mov    %rax,%rdi
    1237:	e8 04 fe ff ff       	call   1040 <memset@plt>
    123c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1240:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
    1244:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    124b:	48 89 ce             	mov    %rcx,%rsi
    124e:	48 89 c7             	mov    %rax,%rdi
    1251:	e8 fa fd ff ff       	call   1050 <memcpy@plt>
    1256:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
    125d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1261:	48 01 d0             	add    %rdx,%rax
    1264:	c6 00 00             	movb   $0x0,(%rax)
    1267:	48 8b 15 c2 2d 00 00 	mov    0x2dc2(%rip),%rdx        # 4030 <stdout@GLIBC_2.2.5>
    126e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1272:	48 8d 70 01          	lea    0x1(%rax),%rsi
    1276:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    127d:	48 89 d1             	mov    %rdx,%rcx
    1280:	48 89 f2             	mov    %rsi,%rdx
    1283:	be 01 00 00 00       	mov    $0x1,%esi
    1288:	48 89 c7             	mov    %rax,%rdi
    128b:	e8 d0 fd ff ff       	call   1060 <fwrite@plt>
    1290:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1294:	48 83 c2 01          	add    $0x1,%rdx
    1298:	48 39 d0             	cmp    %rdx,%rax
    129b:	75 12                	jne    12af <run_contract+0xd9>
    129d:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    12a2:	48 83 7d f0 40       	cmpq   $0x40,-0x10(%rbp)
    12a7:	0f 86 76 ff ff ff    	jbe    1223 <run_contract+0x4d>
    12ad:	eb 01                	jmp    12b0 <run_contract+0xda>
    12af:	90                   	nop
    12b0:	c9                   	leave
    12b1:	c3                   	ret

00000000000012b2 <main>:
    12b2:	55                   	push   %rbp
    12b3:	48 89 e5             	mov    %rsp,%rbp
    12b6:	48 83 ec 10          	sub    $0x10,%rsp
    12ba:	c7 45 fc f5 79 2b 6d 	movl   $0x6d2b79f5,-0x4(%rbp)
    12c1:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12c4:	be ad 9b b9 b1       	mov    $0xb1b99bad,%esi
    12c9:	89 c7                	mov    %eax,%edi
    12cb:	e8 99 fe ff ff       	call   1169 <wm_add_v2>
    12d0:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12d6:	be df 57 2f 53       	mov    $0x532f57df,%esi
    12db:	89 c7                	mov    %eax,%edi
    12dd:	e8 87 fe ff ff       	call   1169 <wm_add_v2>
    12e2:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12e5:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12e8:	be b9 5f 0f 37       	mov    $0x370f5fb9,%esi
    12ed:	89 c7                	mov    %eax,%edi
    12ef:	e8 75 fe ff ff       	call   1169 <wm_add_v2>
    12f4:	89 45 fc             	mov    %eax,-0x4(%rbp)
    12f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12fa:	be c5 37 a1 e1       	mov    $0xe1a137c5,%esi
    12ff:	89 c7                	mov    %eax,%edi
    1301:	e8 63 fe ff ff       	call   1169 <wm_add_v2>
    1306:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1309:	8b 45 fc             	mov    -0x4(%rbp),%eax
    130c:	be 4d 8b bd c1       	mov    $0xc1bd8b4d,%esi
    1311:	89 c7                	mov    %eax,%edi
    1313:	e8 60 fe ff ff       	call   1178 <wm_xor_v2>
    1318:	89 45 fc             	mov    %eax,-0x4(%rbp)
    131b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    131e:	be 11 05 bb 27       	mov    $0x27bb0511,%esi
    1323:	89 c7                	mov    %eax,%edi
    1325:	e8 4e fe ff ff       	call   1178 <wm_xor_v2>
    132a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    132d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1330:	be 0f 95 8d a7       	mov    $0xa78d950f,%esi
    1335:	89 c7                	mov    %eax,%edi
    1337:	e8 2d fe ff ff       	call   1169 <wm_add_v2>
    133c:	89 45 fc             	mov    %eax,-0x4(%rbp)
    133f:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1342:	be 25 dd b3 73       	mov    $0x73b3dd25,%esi
    1347:	89 c7                	mov    %eax,%edi
    1349:	e8 2a fe ff ff       	call   1178 <wm_xor_v2>
    134e:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1351:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1354:	be 9d c7 bf f3       	mov    $0xf3bfc79d,%esi
    1359:	89 c7                	mov    %eax,%edi
    135b:	e8 18 fe ff ff       	call   1178 <wm_xor_v2>
    1360:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1363:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1366:	be 63 63 e3 93       	mov    $0x93e36363,%esi
    136b:	89 c7                	mov    %eax,%edi
    136d:	e8 f7 fd ff ff       	call   1169 <wm_add_v2>
    1372:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1375:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1378:	be a1 d5 8d fd       	mov    $0xfd8dd5a1,%esi
    137d:	89 c7                	mov    %eax,%edi
    137f:	e8 e5 fd ff ff       	call   1169 <wm_add_v2>
    1384:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1387:	8b 45 fc             	mov    -0x4(%rbp),%eax
    138a:	be eb 67 3b c9       	mov    $0xc93b67eb,%esi
    138f:	89 c7                	mov    %eax,%edi
    1391:	e8 d3 fd ff ff       	call   1169 <wm_add_v2>
    1396:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1399:	8b 45 fc             	mov    -0x4(%rbp),%eax
    139c:	be 99 b3 fd c7       	mov    $0xc7fdb399,%esi
    13a1:	89 c7                	mov    %eax,%edi
    13a3:	e8 d0 fd ff ff       	call   1178 <wm_xor_v2>
    13a8:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13ae:	be d1 fd d1 19       	mov    $0x19d1fdd1,%esi
    13b3:	89 c7                	mov    %eax,%edi
    13b5:	e8 be fd ff ff       	call   1178 <wm_xor_v2>
    13ba:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13c0:	be 8b c3 5d b1       	mov    $0xb15dc38b,%esi
    13c5:	89 c7                	mov    %eax,%edi
    13c7:	e8 ac fd ff ff       	call   1178 <wm_xor_v2>
    13cc:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13d2:	be 9b 81 e7 61       	mov    $0x61e7819b,%esi
    13d7:	89 c7                	mov    %eax,%edi
    13d9:	e8 8b fd ff ff       	call   1169 <wm_add_v2>
    13de:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13e1:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13e4:	be b7 8f 39 21       	mov    $0x21398fb7,%esi
    13e9:	89 c7                	mov    %eax,%edi
    13eb:	e8 79 fd ff ff       	call   1169 <wm_add_v2>
    13f0:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13f6:	be 7b 83 3d c7       	mov    $0xc73d837b,%esi
    13fb:	89 c7                	mov    %eax,%edi
    13fd:	e8 67 fd ff ff       	call   1169 <wm_add_v2>
    1402:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1405:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1408:	be eb 15 cb e7       	mov    $0xe7cb15eb,%esi
    140d:	89 c7                	mov    %eax,%edi
    140f:	e8 64 fd ff ff       	call   1178 <wm_xor_v2>
    1414:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1417:	8b 45 fc             	mov    -0x4(%rbp),%eax
    141a:	be b9 e9 fd cd       	mov    $0xcdfde9b9,%esi
    141f:	89 c7                	mov    %eax,%edi
    1421:	e8 43 fd ff ff       	call   1169 <wm_add_v2>
    1426:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1429:	8b 45 fc             	mov    -0x4(%rbp),%eax
    142c:	be 31 d5 01 3b       	mov    $0x3b01d531,%esi
    1431:	89 c7                	mov    %eax,%edi
    1433:	e8 31 fd ff ff       	call   1169 <wm_add_v2>
    1438:	89 45 fc             	mov    %eax,-0x4(%rbp)
    143b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    143e:	be d3 bb 7d 99       	mov    $0x997dbbd3,%esi
    1443:	89 c7                	mov    %eax,%edi
    1445:	e8 1f fd ff ff       	call   1169 <wm_add_v2>
    144a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    144d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1450:	be 35 af fb eb       	mov    $0xebfbaf35,%esi
    1455:	89 c7                	mov    %eax,%edi
    1457:	e8 0d fd ff ff       	call   1169 <wm_add_v2>
    145c:	89 45 fc             	mov    %eax,-0x4(%rbp)
    145f:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1462:	be b1 b7 85 03       	mov    $0x385b7b1,%esi
    1467:	89 c7                	mov    %eax,%edi
    1469:	e8 fb fc ff ff       	call   1169 <wm_add_v2>
    146e:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1471:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1474:	be 07 85 57 ad       	mov    $0xad578507,%esi
    1479:	89 c7                	mov    %eax,%edi
    147b:	e8 e9 fc ff ff       	call   1169 <wm_add_v2>
    1480:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1483:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1486:	be 23 1d ad d7       	mov    $0xd7ad1d23,%esi
    148b:	89 c7                	mov    %eax,%edi
    148d:	e8 d7 fc ff ff       	call   1169 <wm_add_v2>
    1492:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1495:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1498:	be 79 33 c1 ad       	mov    $0xadc13379,%esi
    149d:	89 c7                	mov    %eax,%edi
    149f:	e8 d4 fc ff ff       	call   1178 <wm_xor_v2>
    14a4:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14a7:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14aa:	83 f8 ff             	cmp    $0xffffffff,%eax
    14ad:	75 07                	jne    14b6 <main+0x204>
    14af:	b8 61 00 00 00       	mov    $0x61,%eax
    14b4:	eb 24                	jmp    14da <main+0x228>
    14b6:	e8 1b fd ff ff       	call   11d6 <run_contract>
    14bb:	48 8b 05 6e 2b 00 00 	mov    0x2b6e(%rip),%rax        # 4030 <stdout@GLIBC_2.2.5>
    14c2:	48 89 c7             	mov    %rax,%rdi
    14c5:	e8 66 fb ff ff       	call   1030 <ferror@plt>
    14ca:	85 c0                	test   %eax,%eax
    14cc:	74 07                	je     14d5 <main+0x223>
    14ce:	b8 02 00 00 00       	mov    $0x2,%eax
    14d3:	eb 05                	jmp    14da <main+0x228>
    14d5:	b8 00 00 00 00       	mov    $0x0,%eax
    14da:	c9                   	leave
    14db:	c3                   	ret

Disassembly of section .fini:

00000000000014dc <_fini>:
    14dc:	48 83 ec 08          	sub    $0x8,%rsp
    14e0:	48 83 c4 08          	add    $0x8,%rsp
    14e4:	c3                   	ret
