
adapter:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	48 83 ec 08          	sub    $0x8,%rsp
    1004:	48 8b 05 bd 2f 00 00 	mov    0x2fbd(%rip),%rax        # 3fc8 <__gmon_start__@Base>
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
    1050:	ff 25 82 2f 00 00    	jmp    *0x2f82(%rip)        # 3fd8 <__cxa_finalize@GLIBC_2.2.5>
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
    1074:	48 8d 3d d5 00 00 00 	lea    0xd5(%rip),%rdi        # 1150 <main>
    107b:	ff 15 2f 2f 00 00    	call   *0x2f2f(%rip)        # 3fb0 <__libc_start_main@GLIBC_2.34>
    1081:	f4                   	hlt
    1082:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    108c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001090 <deregister_tm_clones>:
    1090:	48 8d 3d 89 2f 00 00 	lea    0x2f89(%rip),%rdi        # 4020 <__TMC_END__>
    1097:	48 8d 05 82 2f 00 00 	lea    0x2f82(%rip),%rax        # 4020 <__TMC_END__>
    109e:	48 39 f8             	cmp    %rdi,%rax
    10a1:	74 15                	je     10b8 <deregister_tm_clones+0x28>
    10a3:	48 8b 05 0e 2f 00 00 	mov    0x2f0e(%rip),%rax        # 3fb8 <_ITM_deregisterTMCloneTable@Base>
    10aa:	48 85 c0             	test   %rax,%rax
    10ad:	74 09                	je     10b8 <deregister_tm_clones+0x28>
    10af:	ff e0                	jmp    *%rax
    10b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10b8:	c3                   	ret
    10b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010c0 <register_tm_clones>:
    10c0:	48 8d 3d 59 2f 00 00 	lea    0x2f59(%rip),%rdi        # 4020 <__TMC_END__>
    10c7:	48 8d 35 52 2f 00 00 	lea    0x2f52(%rip),%rsi        # 4020 <__TMC_END__>
    10ce:	48 29 fe             	sub    %rdi,%rsi
    10d1:	48 89 f0             	mov    %rsi,%rax
    10d4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    10d8:	48 c1 f8 03          	sar    $0x3,%rax
    10dc:	48 01 c6             	add    %rax,%rsi
    10df:	48 d1 fe             	sar    $1,%rsi
    10e2:	74 14                	je     10f8 <register_tm_clones+0x38>
    10e4:	48 8b 05 e5 2e 00 00 	mov    0x2ee5(%rip),%rax        # 3fd0 <_ITM_registerTMCloneTable@Base>
    10eb:	48 85 c0             	test   %rax,%rax
    10ee:	74 08                	je     10f8 <register_tm_clones+0x38>
    10f0:	ff e0                	jmp    *%rax
    10f2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    10f8:	c3                   	ret
    10f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001100 <__do_global_dtors_aux>:
    1100:	f3 0f 1e fa          	endbr64
    1104:	80 3d 15 2f 00 00 00 	cmpb   $0x0,0x2f15(%rip)        # 4020 <__TMC_END__>
    110b:	75 2b                	jne    1138 <__do_global_dtors_aux+0x38>
    110d:	55                   	push   %rbp
    110e:	48 83 3d c2 2e 00 00 00 	cmpq   $0x0,0x2ec2(%rip)        # 3fd8 <__cxa_finalize@GLIBC_2.2.5>
    1116:	48 89 e5             	mov    %rsp,%rbp
    1119:	74 0c                	je     1127 <__do_global_dtors_aux+0x27>
    111b:	48 8b 3d f6 2e 00 00 	mov    0x2ef6(%rip),%rdi        # 4018 <__dso_handle>
    1122:	e8 29 ff ff ff       	call   1050 <__cxa_finalize@plt>
    1127:	e8 64 ff ff ff       	call   1090 <deregister_tm_clones>
    112c:	c6 05 ed 2e 00 00 01 	movb   $0x1,0x2eed(%rip)        # 4020 <__TMC_END__>
    1133:	5d                   	pop    %rbp
    1134:	c3                   	ret
    1135:	0f 1f 00             	nopl   (%rax)
    1138:	c3                   	ret
    1139:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001140 <frame_dummy>:
    1140:	f3 0f 1e fa          	endbr64
    1144:	e9 77 ff ff ff       	jmp    10c0 <register_tm_clones>
    1149:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001150 <main>:
    1150:	55                   	push   %rbp
    1151:	48 89 e5             	mov    %rsp,%rbp
    1154:	48 83 ec 10          	sub    $0x10,%rsp
    1158:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    115f:	c7 45 f8 f5 79 2b 6d 	movl   $0x6d2b79f5,-0x8(%rbp)
    1166:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1169:	be c1 b7 f5 8d       	mov    $0x8df5b7c1,%esi
    116e:	e8 fd 01 00 00       	call   1370 <wm_add_v2>
    1173:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1176:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1179:	be 7b ed f1 cd       	mov    $0xcdf1ed7b,%esi
    117e:	e8 ed 01 00 00       	call   1370 <wm_add_v2>
    1183:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1186:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1189:	be dd d1 7d 45       	mov    $0x457dd1dd,%esi
    118e:	e8 dd 01 00 00       	call   1370 <wm_add_v2>
    1193:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1196:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1199:	be ed 03 93 eb       	mov    $0xeb9303ed,%esi
    119e:	e8 ed 01 00 00       	call   1390 <wm_xor_v2>
    11a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11a6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11a9:	be d3 c9 37 59       	mov    $0x5937c9d3,%esi
    11ae:	e8 bd 01 00 00       	call   1370 <wm_add_v2>
    11b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11b6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11b9:	be e3 5b e3 b9       	mov    $0xb9e35be3,%esi
    11be:	e8 ad 01 00 00       	call   1370 <wm_add_v2>
    11c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11c6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11c9:	be b1 6f c9 8d       	mov    $0x8dc96fb1,%esi
    11ce:	e8 bd 01 00 00       	call   1390 <wm_xor_v2>
    11d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11d6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11d9:	be 29 9b 45 5b       	mov    $0x5b459b29,%esi
    11de:	e8 ad 01 00 00       	call   1390 <wm_xor_v2>
    11e3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11e6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11e9:	be 6b a1 ab 5b       	mov    $0x5baba16b,%esi
    11ee:	e8 7d 01 00 00       	call   1370 <wm_add_v2>
    11f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11f6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11f9:	be 03 bb 17 5d       	mov    $0x5d17bb03,%esi
    11fe:	e8 6d 01 00 00       	call   1370 <wm_add_v2>
    1203:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1206:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1209:	be 29 57 95 b1       	mov    $0xb1955729,%esi
    120e:	e8 7d 01 00 00       	call   1390 <wm_xor_v2>
    1213:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1216:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1219:	be 11 c3 95 d9       	mov    $0xd995c311,%esi
    121e:	e8 4d 01 00 00       	call   1370 <wm_add_v2>
    1223:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1226:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1229:	be b9 4d 3b c9       	mov    $0xc93b4db9,%esi
    122e:	e8 3d 01 00 00       	call   1370 <wm_add_v2>
    1233:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1236:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1239:	be eb 8d f5 15       	mov    $0x15f58deb,%esi
    123e:	e8 2d 01 00 00       	call   1370 <wm_add_v2>
    1243:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1246:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1249:	be e7 67 93 ef       	mov    $0xef9367e7,%esi
    124e:	e8 1d 01 00 00       	call   1370 <wm_add_v2>
    1253:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1256:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1259:	be f1 31 85 d9       	mov    $0xd98531f1,%esi
    125e:	e8 0d 01 00 00       	call   1370 <wm_add_v2>
    1263:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1266:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1269:	be 29 65 e3 fd       	mov    $0xfde36529,%esi
    126e:	e8 fd 00 00 00       	call   1370 <wm_add_v2>
    1273:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1276:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1279:	be 19 05 d1 91       	mov    $0x91d10519,%esi
    127e:	e8 0d 01 00 00       	call   1390 <wm_xor_v2>
    1283:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1286:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1289:	be 9f 6b 23 af       	mov    $0xaf236b9f,%esi
    128e:	e8 dd 00 00 00       	call   1370 <wm_add_v2>
    1293:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1296:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1299:	be 09 2d 2f d9       	mov    $0xd92f2d09,%esi
    129e:	e8 ed 00 00 00       	call   1390 <wm_xor_v2>
    12a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12a6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12a9:	be 6f a9 c3 c3       	mov    $0xc3c3a96f,%esi
    12ae:	e8 dd 00 00 00       	call   1390 <wm_xor_v2>
    12b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12b6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12b9:	be 03 85 93 cf       	mov    $0xcf938503,%esi
    12be:	e8 cd 00 00 00       	call   1390 <wm_xor_v2>
    12c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12c6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12c9:	be 7b 2d 27 61       	mov    $0x61272d7b,%esi
    12ce:	e8 bd 00 00 00       	call   1390 <wm_xor_v2>
    12d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12d6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12d9:	be 39 d1 2d 9b       	mov    $0x9b2dd139,%esi
    12de:	e8 8d 00 00 00       	call   1370 <wm_add_v2>
    12e3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12e6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12e9:	be 87 79 7d b7       	mov    $0xb77d7987,%esi
    12ee:	e8 7d 00 00 00       	call   1370 <wm_add_v2>
    12f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12f6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12f9:	be a9 87 5d f9       	mov    $0xf95d87a9,%esi
    12fe:	e8 6d 00 00 00       	call   1370 <wm_add_v2>
    1303:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1306:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1309:	be ff 21 f7 3d       	mov    $0x3df721ff,%esi
    130e:	e8 5d 00 00 00       	call   1370 <wm_add_v2>
    1313:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1316:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1319:	be 03 6f c9 47       	mov    $0x47c96f03,%esi
    131e:	e8 4d 00 00 00       	call   1370 <wm_add_v2>
    1323:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1326:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1329:	83 f8 ff             	cmp    $0xffffffff,%eax
    132c:	75 09                	jne    1337 <main+0x1e7>
    132e:	c7 45 fc 61 00 00 00 	movl   $0x61,-0x4(%rbp)
    1335:	eb 26                	jmp    135d <main+0x20d>
    1337:	e8 74 00 00 00       	call   13b0 <run_contract>
    133c:	48 8b 05 7d 2c 00 00 	mov    0x2c7d(%rip),%rax        # 3fc0 <stdout@GLIBC_2.2.5>
    1343:	48 8b 38             	mov    (%rax),%rdi
    1346:	e8 e5 fc ff ff       	call   1030 <ferror@plt>
    134b:	89 c2                	mov    %eax,%edx
    134d:	31 c0                	xor    %eax,%eax
    134f:	b9 02 00 00 00       	mov    $0x2,%ecx
    1354:	83 fa 00             	cmp    $0x0,%edx
    1357:	0f 45 c1             	cmovne %ecx,%eax
    135a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    135d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1360:	48 83 c4 10          	add    $0x10,%rsp
    1364:	5d                   	pop    %rbp
    1365:	c3                   	ret
    1366:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

0000000000001370 <wm_add_v2>:
    1370:	55                   	push   %rbp
    1371:	48 89 e5             	mov    %rsp,%rbp
    1374:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1377:	89 75 f8             	mov    %esi,-0x8(%rbp)
    137a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    137d:	2b 45 f8             	sub    -0x8(%rbp),%eax
    1380:	03 45 f8             	add    -0x8(%rbp),%eax
    1383:	5d                   	pop    %rbp
    1384:	c3                   	ret
    1385:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)

0000000000001390 <wm_xor_v2>:
    1390:	55                   	push   %rbp
    1391:	48 89 e5             	mov    %rsp,%rbp
    1394:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1397:	89 75 f8             	mov    %esi,-0x8(%rbp)
    139a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    139d:	8b 4d f8             	mov    -0x8(%rbp),%ecx
    13a0:	33 4d f8             	xor    -0x8(%rbp),%ecx
    13a3:	31 c8                	xor    %ecx,%eax
    13a5:	5d                   	pop    %rbp
    13a6:	c3                   	ret
    13a7:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

00000000000013b0 <run_contract>:
    13b0:	55                   	push   %rbp
    13b1:	48 89 e5             	mov    %rsp,%rbp
    13b4:	48 83 ec 10          	sub    $0x10,%rsp
    13b8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    13bf:	83 7d fc 10          	cmpl   $0x10,-0x4(%rbp)
    13c3:	73 27                	jae    13ec <run_contract+0x3c>
    13c5:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13c8:	89 c1                	mov    %eax,%ecx
    13ca:	48 8d 05 7f 29 00 00 	lea    0x297f(%rip),%rax        # 3d50 <cases>
    13d1:	48 8b 3c c8          	mov    (%rax,%rcx,8),%rdi
    13d5:	e8 96 00 00 00       	call   1470 <token_signature>
    13da:	89 c7                	mov    %eax,%edi
    13dc:	e8 1f 00 00 00       	call   1400 <emit_u32>
    13e1:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13e4:	83 c0 01             	add    $0x1,%eax
    13e7:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13ea:	eb d3                	jmp    13bf <run_contract+0xf>
    13ec:	48 83 c4 10          	add    $0x10,%rsp
    13f0:	5d                   	pop    %rbp
    13f1:	c3                   	ret
    13f2:	66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)

0000000000001400 <emit_u32>:
    1400:	55                   	push   %rbp
    1401:	48 89 e5             	mov    %rsp,%rbp
    1404:	48 83 ec 10          	sub    $0x10,%rsp
    1408:	89 7d fc             	mov    %edi,-0x4(%rbp)
    140b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    140e:	25 ff 00 00 00       	and    $0xff,%eax
    1413:	88 45 f8             	mov    %al,-0x8(%rbp)
    1416:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1419:	c1 e8 08             	shr    $0x8,%eax
    141c:	25 ff 00 00 00       	and    $0xff,%eax
    1421:	88 45 f9             	mov    %al,-0x7(%rbp)
    1424:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1427:	c1 e8 10             	shr    $0x10,%eax
    142a:	25 ff 00 00 00       	and    $0xff,%eax
    142f:	88 45 fa             	mov    %al,-0x6(%rbp)
    1432:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1435:	c1 e8 18             	shr    $0x18,%eax
    1438:	25 ff 00 00 00       	and    $0xff,%eax
    143d:	88 45 fb             	mov    %al,-0x5(%rbp)
    1440:	48 8d 7d f8          	lea    -0x8(%rbp),%rdi
    1444:	48 8b 05 75 2b 00 00 	mov    0x2b75(%rip),%rax        # 3fc0 <stdout@GLIBC_2.2.5>
    144b:	48 8b 08             	mov    (%rax),%rcx
    144e:	be 01 00 00 00       	mov    $0x1,%esi
    1453:	ba 04 00 00 00       	mov    $0x4,%edx
    1458:	e8 e3 fb ff ff       	call   1040 <fwrite@plt>
    145d:	48 83 c4 10          	add    $0x10,%rsp
    1461:	5d                   	pop    %rbp
    1462:	c3                   	ret
    1463:	66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)

0000000000001470 <token_signature>:
    1470:	55                   	push   %rbp
    1471:	48 89 e5             	mov    %rsp,%rbp
    1474:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1478:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    147f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
    1486:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    148d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
    1494:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
    149b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    14a2:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%rbp)
    14a9:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
    14b0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    14b4:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    14b8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    14bc:	80 38 00             	cmpb   $0x0,(%rax)
    14bf:	0f 84 68 01 00 00    	je     162d <token_signature+0x1bd>
    14c5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    14c9:	8a 00                	mov    (%rax),%al
    14cb:	88 45 cf             	mov    %al,-0x31(%rbp)
    14ce:	8b 45 e8             	mov    -0x18(%rbp),%eax
    14d1:	83 c0 01             	add    $0x1,%eax
    14d4:	89 45 e8             	mov    %eax,-0x18(%rbp)
    14d7:	6b 45 ec 21          	imul   $0x21,-0x14(%rbp),%eax
    14db:	0f b6 4d cf          	movzbl -0x31(%rbp),%ecx
    14df:	01 c8                	add    %ecx,%eax
    14e1:	25 ff ff 00 00       	and    $0xffff,%eax
    14e6:	89 45 ec             	mov    %eax,-0x14(%rbp)
    14e9:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
    14ed:	74 3a                	je     1529 <token_signature+0xb9>
    14ef:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
    14f3:	74 09                	je     14fe <token_signature+0x8e>
    14f5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    14fc:	eb 26                	jmp    1524 <token_signature+0xb4>
    14fe:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
    1502:	83 f8 5c             	cmp    $0x5c,%eax
    1505:	75 09                	jne    1510 <token_signature+0xa0>
    1507:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%rbp)
    150e:	eb 12                	jmp    1522 <token_signature+0xb2>
    1510:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
    1514:	83 f8 22             	cmp    $0x22,%eax
    1517:	75 07                	jne    1520 <token_signature+0xb0>
    1519:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
    1520:	eb 00                	jmp    1522 <token_signature+0xb2>
    1522:	eb 00                	jmp    1524 <token_signature+0xb4>
    1524:	e9 f3 00 00 00       	jmp    161c <token_signature+0x1ac>
    1529:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
    152d:	89 45 c8             	mov    %eax,-0x38(%rbp)
    1530:	83 c0 f7             	add    $0xfffffff7,%eax
    1533:	83 e8 02             	sub    $0x2,%eax
    1536:	0f 82 bd 00 00 00    	jb     15f9 <token_signature+0x189>
    153c:	eb 00                	jmp    153e <token_signature+0xce>
    153e:	8b 45 c8             	mov    -0x38(%rbp),%eax
    1541:	83 e8 0d             	sub    $0xd,%eax
    1544:	0f 84 af 00 00 00    	je     15f9 <token_signature+0x189>
    154a:	eb 00                	jmp    154c <token_signature+0xdc>
    154c:	8b 45 c8             	mov    -0x38(%rbp),%eax
    154f:	83 e8 20             	sub    $0x20,%eax
    1552:	0f 84 a1 00 00 00    	je     15f9 <token_signature+0x189>
    1558:	eb 00                	jmp    155a <token_signature+0xea>
    155a:	8b 45 c8             	mov    -0x38(%rbp),%eax
    155d:	83 e8 22             	sub    $0x22,%eax
    1560:	74 42                	je     15a4 <token_signature+0x134>
    1562:	eb 00                	jmp    1564 <token_signature+0xf4>
    1564:	8b 45 c8             	mov    -0x38(%rbp),%eax
    1567:	83 e8 2c             	sub    $0x2c,%eax
    156a:	0f 84 89 00 00 00    	je     15f9 <token_signature+0x189>
    1570:	eb 00                	jmp    1572 <token_signature+0x102>
    1572:	8b 45 c8             	mov    -0x38(%rbp),%eax
    1575:	83 e8 3a             	sub    $0x3a,%eax
    1578:	74 7f                	je     15f9 <token_signature+0x189>
    157a:	eb 00                	jmp    157c <token_signature+0x10c>
    157c:	8b 45 c8             	mov    -0x38(%rbp),%eax
    157f:	83 e8 5b             	sub    $0x5b,%eax
    1582:	74 39                	je     15bd <token_signature+0x14d>
    1584:	eb 00                	jmp    1586 <token_signature+0x116>
    1586:	8b 45 c8             	mov    -0x38(%rbp),%eax
    1589:	83 e8 5d             	sub    $0x5d,%eax
    158c:	74 4a                	je     15d8 <token_signature+0x168>
    158e:	eb 00                	jmp    1590 <token_signature+0x120>
    1590:	8b 45 c8             	mov    -0x38(%rbp),%eax
    1593:	83 e8 7b             	sub    $0x7b,%eax
    1596:	74 25                	je     15bd <token_signature+0x14d>
    1598:	eb 00                	jmp    159a <token_signature+0x12a>
    159a:	8b 45 c8             	mov    -0x38(%rbp),%eax
    159d:	83 e8 7d             	sub    $0x7d,%eax
    15a0:	74 36                	je     15d8 <token_signature+0x168>
    15a2:	eb 5e                	jmp    1602 <token_signature+0x192>
    15a4:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%rbp)
    15ab:	8b 45 f0             	mov    -0x10(%rbp),%eax
    15ae:	83 c0 01             	add    $0x1,%eax
    15b1:	89 45 f0             	mov    %eax,-0x10(%rbp)
    15b4:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
    15bb:	eb 5d                	jmp    161a <token_signature+0x1aa>
    15bd:	8b 45 f4             	mov    -0xc(%rbp),%eax
    15c0:	83 c0 01             	add    $0x1,%eax
    15c3:	89 45 f4             	mov    %eax,-0xc(%rbp)
    15c6:	8b 45 f0             	mov    -0x10(%rbp),%eax
    15c9:	83 c0 01             	add    $0x1,%eax
    15cc:	89 45 f0             	mov    %eax,-0x10(%rbp)
    15cf:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
    15d6:	eb 42                	jmp    161a <token_signature+0x1aa>
    15d8:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
    15dc:	75 09                	jne    15e7 <token_signature+0x177>
    15de:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    15e5:	eb 09                	jmp    15f0 <token_signature+0x180>
    15e7:	8b 45 f4             	mov    -0xc(%rbp),%eax
    15ea:	83 c0 ff             	add    $0xffffffff,%eax
    15ed:	89 45 f4             	mov    %eax,-0xc(%rbp)
    15f0:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
    15f7:	eb 21                	jmp    161a <token_signature+0x1aa>
    15f9:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
    1600:	eb 18                	jmp    161a <token_signature+0x1aa>
    1602:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
    1606:	75 10                	jne    1618 <token_signature+0x1a8>
    1608:	8b 45 f0             	mov    -0x10(%rbp),%eax
    160b:	83 c0 01             	add    $0x1,%eax
    160e:	89 45 f0             	mov    %eax,-0x10(%rbp)
    1611:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
    1618:	eb 00                	jmp    161a <token_signature+0x1aa>
    161a:	eb 00                	jmp    161c <token_signature+0x1ac>
    161c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    1620:	48 83 c0 01          	add    $0x1,%rax
    1624:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    1628:	e9 8b fe ff ff       	jmp    14b8 <token_signature+0x48>
    162d:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
    1631:	75 06                	jne    1639 <token_signature+0x1c9>
    1633:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
    1637:	74 07                	je     1640 <token_signature+0x1d0>
    1639:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    1640:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1643:	c1 e0 1f             	shl    $0x1f,%eax
    1646:	8b 4d f0             	mov    -0x10(%rbp),%ecx
    1649:	83 e1 7f             	and    $0x7f,%ecx
    164c:	c1 e1 18             	shl    $0x18,%ecx
    164f:	09 c8                	or     %ecx,%eax
    1651:	8b 4d e8             	mov    -0x18(%rbp),%ecx
    1654:	81 e1 ff 00 00 00    	and    $0xff,%ecx
    165a:	c1 e1 10             	shl    $0x10,%ecx
    165d:	09 c8                	or     %ecx,%eax
    165f:	0b 45 ec             	or     -0x14(%rbp),%eax
    1662:	5d                   	pop    %rbp
    1663:	c3                   	ret

Disassembly of section .fini:

0000000000001664 <_fini>:
    1664:	48 83 ec 08          	sub    $0x8,%rsp
    1668:	48 83 c4 08          	add    $0x8,%rsp
    166c:	c3                   	ret
