
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
    116e:	e8 fd 01 00 00       	call   1370 <wm_add_v1>
    1173:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1176:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1179:	be a9 87 5d f9       	mov    $0xf95d87a9,%esi
    117e:	e8 ed 01 00 00       	call   1370 <wm_add_v1>
    1183:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1186:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1189:	be 7b 2d 27 61       	mov    $0x61272d7b,%esi
    118e:	e8 fd 01 00 00       	call   1390 <wm_xor_v1>
    1193:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1196:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1199:	be 09 2d 2f d9       	mov    $0xd92f2d09,%esi
    119e:	e8 ed 01 00 00       	call   1390 <wm_xor_v1>
    11a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11a6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11a9:	be 29 65 e3 fd       	mov    $0xfde36529,%esi
    11ae:	e8 bd 01 00 00       	call   1370 <wm_add_v1>
    11b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11b6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11b9:	be eb 8d f5 15       	mov    $0x15f58deb,%esi
    11be:	e8 ad 01 00 00       	call   1370 <wm_add_v1>
    11c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11c6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11c9:	be 29 57 95 b1       	mov    $0xb1955729,%esi
    11ce:	e8 bd 01 00 00       	call   1390 <wm_xor_v1>
    11d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11d6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11d9:	be 29 9b 45 5b       	mov    $0x5b459b29,%esi
    11de:	e8 ad 01 00 00       	call   1390 <wm_xor_v1>
    11e3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11e6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11e9:	be d3 c9 37 59       	mov    $0x5937c9d3,%esi
    11ee:	e8 7d 01 00 00       	call   1370 <wm_add_v1>
    11f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11f6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11f9:	be 7b ed f1 cd       	mov    $0xcdf1ed7b,%esi
    11fe:	e8 6d 01 00 00       	call   1370 <wm_add_v1>
    1203:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1206:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1209:	be ff 21 f7 3d       	mov    $0x3df721ff,%esi
    120e:	e8 5d 01 00 00       	call   1370 <wm_add_v1>
    1213:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1216:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1219:	be 39 d1 2d 9b       	mov    $0x9b2dd139,%esi
    121e:	e8 4d 01 00 00       	call   1370 <wm_add_v1>
    1223:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1226:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1229:	be 6f a9 c3 c3       	mov    $0xc3c3a96f,%esi
    122e:	e8 5d 01 00 00       	call   1390 <wm_xor_v1>
    1233:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1236:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1239:	be 19 05 d1 91       	mov    $0x91d10519,%esi
    123e:	e8 4d 01 00 00       	call   1390 <wm_xor_v1>
    1243:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1246:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1249:	be e7 67 93 ef       	mov    $0xef9367e7,%esi
    124e:	e8 1d 01 00 00       	call   1370 <wm_add_v1>
    1253:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1256:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1259:	be 11 c3 95 d9       	mov    $0xd995c311,%esi
    125e:	e8 0d 01 00 00       	call   1370 <wm_add_v1>
    1263:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1266:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1269:	be 6b a1 ab 5b       	mov    $0x5baba16b,%esi
    126e:	e8 fd 00 00 00       	call   1370 <wm_add_v1>
    1273:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1276:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1279:	be e3 5b e3 b9       	mov    $0xb9e35be3,%esi
    127e:	e8 ed 00 00 00       	call   1370 <wm_add_v1>
    1283:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1286:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1289:	be dd d1 7d 45       	mov    $0x457dd1dd,%esi
    128e:	e8 dd 00 00 00       	call   1370 <wm_add_v1>
    1293:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1296:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1299:	be 03 6f c9 47       	mov    $0x47c96f03,%esi
    129e:	e8 cd 00 00 00       	call   1370 <wm_add_v1>
    12a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12a6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12a9:	be 87 79 7d b7       	mov    $0xb77d7987,%esi
    12ae:	e8 bd 00 00 00       	call   1370 <wm_add_v1>
    12b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12b6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12b9:	be 03 85 93 cf       	mov    $0xcf938503,%esi
    12be:	e8 cd 00 00 00       	call   1390 <wm_xor_v1>
    12c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12c6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12c9:	be 9f 6b 23 af       	mov    $0xaf236b9f,%esi
    12ce:	e8 9d 00 00 00       	call   1370 <wm_add_v1>
    12d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12d6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12d9:	be f1 31 85 d9       	mov    $0xd98531f1,%esi
    12de:	e8 8d 00 00 00       	call   1370 <wm_add_v1>
    12e3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12e6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12e9:	be b9 4d 3b c9       	mov    $0xc93b4db9,%esi
    12ee:	e8 7d 00 00 00       	call   1370 <wm_add_v1>
    12f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12f6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12f9:	be 03 bb 17 5d       	mov    $0x5d17bb03,%esi
    12fe:	e8 6d 00 00 00       	call   1370 <wm_add_v1>
    1303:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1306:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1309:	be b1 6f c9 8d       	mov    $0x8dc96fb1,%esi
    130e:	e8 7d 00 00 00       	call   1390 <wm_xor_v1>
    1313:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1316:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1319:	be ed 03 93 eb       	mov    $0xeb9303ed,%esi
    131e:	e8 6d 00 00 00       	call   1390 <wm_xor_v1>
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

0000000000001370 <wm_add_v1>:
    1370:	55                   	push   %rbp
    1371:	48 89 e5             	mov    %rsp,%rbp
    1374:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1377:	89 75 f8             	mov    %esi,-0x8(%rbp)
    137a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    137d:	03 45 f8             	add    -0x8(%rbp),%eax
    1380:	2b 45 f8             	sub    -0x8(%rbp),%eax
    1383:	5d                   	pop    %rbp
    1384:	c3                   	ret
    1385:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)

0000000000001390 <wm_xor_v1>:
    1390:	55                   	push   %rbp
    1391:	48 89 e5             	mov    %rsp,%rbp
    1394:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1397:	89 75 f8             	mov    %esi,-0x8(%rbp)
    139a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    139d:	33 45 f8             	xor    -0x8(%rbp),%eax
    13a0:	33 45 f8             	xor    -0x8(%rbp),%eax
    13a3:	5d                   	pop    %rbp
    13a4:	c3                   	ret
    13a5:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)

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
    1474:	48 83 ec 40          	sub    $0x40,%rsp
    1478:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    147c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    1483:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
    148a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    1491:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
    1498:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
    149f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    14a6:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%rbp)
    14ad:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
    14b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    14b8:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    14bc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    14c0:	80 38 00             	cmpb   $0x0,(%rax)
    14c3:	0f 84 52 01 00 00    	je     161b <token_signature+0x1ab>
    14c9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    14cd:	48 89 c1             	mov    %rax,%rcx
    14d0:	48 83 c1 01          	add    $0x1,%rcx
    14d4:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    14d8:	8a 00                	mov    (%rax),%al
    14da:	88 45 cf             	mov    %al,-0x31(%rbp)
    14dd:	8b 45 e8             	mov    -0x18(%rbp),%eax
    14e0:	83 c0 01             	add    $0x1,%eax
    14e3:	89 45 e8             	mov    %eax,-0x18(%rbp)
    14e6:	6b 45 ec 21          	imul   $0x21,-0x14(%rbp),%eax
    14ea:	0f b6 4d cf          	movzbl -0x31(%rbp),%ecx
    14ee:	01 c8                	add    %ecx,%eax
    14f0:	25 ff ff 00 00       	and    $0xffff,%eax
    14f5:	89 45 ec             	mov    %eax,-0x14(%rbp)
    14f8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
    14fc:	74 37                	je     1535 <token_signature+0xc5>
    14fe:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
    1502:	74 09                	je     150d <token_signature+0x9d>
    1504:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    150b:	eb 26                	jmp    1533 <token_signature+0xc3>
    150d:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
    1511:	83 f8 5c             	cmp    $0x5c,%eax
    1514:	75 09                	jne    151f <token_signature+0xaf>
    1516:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%rbp)
    151d:	eb 12                	jmp    1531 <token_signature+0xc1>
    151f:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
    1523:	83 f8 22             	cmp    $0x22,%eax
    1526:	75 07                	jne    152f <token_signature+0xbf>
    1528:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
    152f:	eb 00                	jmp    1531 <token_signature+0xc1>
    1531:	eb 00                	jmp    1533 <token_signature+0xc3>
    1533:	eb 87                	jmp    14bc <token_signature+0x4c>
    1535:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
    1539:	83 f8 22             	cmp    $0x22,%eax
    153c:	75 1c                	jne    155a <token_signature+0xea>
    153e:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%rbp)
    1545:	8b 45 f0             	mov    -0x10(%rbp),%eax
    1548:	83 c0 01             	add    $0x1,%eax
    154b:	89 45 f0             	mov    %eax,-0x10(%rbp)
    154e:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
    1555:	e9 bc 00 00 00       	jmp    1616 <token_signature+0x1a6>
    155a:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
    155e:	83 f8 7b             	cmp    $0x7b,%eax
    1561:	74 09                	je     156c <token_signature+0xfc>
    1563:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
    1567:	83 f8 5b             	cmp    $0x5b,%eax
    156a:	75 1e                	jne    158a <token_signature+0x11a>
    156c:	8b 45 f4             	mov    -0xc(%rbp),%eax
    156f:	83 c0 01             	add    $0x1,%eax
    1572:	89 45 f4             	mov    %eax,-0xc(%rbp)
    1575:	8b 45 f0             	mov    -0x10(%rbp),%eax
    1578:	83 c0 01             	add    $0x1,%eax
    157b:	89 45 f0             	mov    %eax,-0x10(%rbp)
    157e:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
    1585:	e9 8a 00 00 00       	jmp    1614 <token_signature+0x1a4>
    158a:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
    158e:	83 f8 7d             	cmp    $0x7d,%eax
    1591:	74 09                	je     159c <token_signature+0x12c>
    1593:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
    1597:	83 f8 5d             	cmp    $0x5d,%eax
    159a:	75 21                	jne    15bd <token_signature+0x14d>
    159c:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
    15a0:	75 09                	jne    15ab <token_signature+0x13b>
    15a2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    15a9:	eb 09                	jmp    15b4 <token_signature+0x144>
    15ab:	8b 45 f4             	mov    -0xc(%rbp),%eax
    15ae:	83 c0 ff             	add    $0xffffffff,%eax
    15b1:	89 45 f4             	mov    %eax,-0xc(%rbp)
    15b4:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
    15bb:	eb 55                	jmp    1612 <token_signature+0x1a2>
    15bd:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
    15c1:	83 f8 20             	cmp    $0x20,%eax
    15c4:	74 29                	je     15ef <token_signature+0x17f>
    15c6:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
    15ca:	83 f8 09             	cmp    $0x9,%eax
    15cd:	74 20                	je     15ef <token_signature+0x17f>
    15cf:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
    15d3:	83 f8 0d             	cmp    $0xd,%eax
    15d6:	74 17                	je     15ef <token_signature+0x17f>
    15d8:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
    15dc:	83 f8 0a             	cmp    $0xa,%eax
    15df:	74 0e                	je     15ef <token_signature+0x17f>
    15e1:	0f be 7d cf          	movsbl -0x31(%rbp),%edi
    15e5:	e8 76 00 00 00       	call   1660 <delimiter>
    15ea:	83 f8 00             	cmp    $0x0,%eax
    15ed:	74 09                	je     15f8 <token_signature+0x188>
    15ef:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
    15f6:	eb 18                	jmp    1610 <token_signature+0x1a0>
    15f8:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
    15fc:	75 10                	jne    160e <token_signature+0x19e>
    15fe:	8b 45 f0             	mov    -0x10(%rbp),%eax
    1601:	83 c0 01             	add    $0x1,%eax
    1604:	89 45 f0             	mov    %eax,-0x10(%rbp)
    1607:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
    160e:	eb 00                	jmp    1610 <token_signature+0x1a0>
    1610:	eb 00                	jmp    1612 <token_signature+0x1a2>
    1612:	eb 00                	jmp    1614 <token_signature+0x1a4>
    1614:	eb 00                	jmp    1616 <token_signature+0x1a6>
    1616:	e9 a1 fe ff ff       	jmp    14bc <token_signature+0x4c>
    161b:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
    161f:	75 06                	jne    1627 <token_signature+0x1b7>
    1621:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
    1625:	74 07                	je     162e <token_signature+0x1be>
    1627:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    162e:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1631:	c1 e0 1f             	shl    $0x1f,%eax
    1634:	8b 4d f0             	mov    -0x10(%rbp),%ecx
    1637:	83 e1 7f             	and    $0x7f,%ecx
    163a:	c1 e1 18             	shl    $0x18,%ecx
    163d:	09 c8                	or     %ecx,%eax
    163f:	8b 4d e8             	mov    -0x18(%rbp),%ecx
    1642:	81 e1 ff 00 00 00    	and    $0xff,%ecx
    1648:	c1 e1 10             	shl    $0x10,%ecx
    164b:	09 c8                	or     %ecx,%eax
    164d:	0b 45 ec             	or     -0x14(%rbp),%eax
    1650:	48 83 c4 40          	add    $0x40,%rsp
    1654:	5d                   	pop    %rbp
    1655:	c3                   	ret
    1656:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

0000000000001660 <delimiter>:
    1660:	55                   	push   %rbp
    1661:	48 89 e5             	mov    %rsp,%rbp
    1664:	40 88 f8             	mov    %dil,%al
    1667:	88 45 ff             	mov    %al,-0x1(%rbp)
    166a:	0f be 4d ff          	movsbl -0x1(%rbp),%ecx
    166e:	b0 01                	mov    $0x1,%al
    1670:	83 f9 7b             	cmp    $0x7b,%ecx
    1673:	88 45 fe             	mov    %al,-0x2(%rbp)
    1676:	74 45                	je     16bd <delimiter+0x5d>
    1678:	0f be 4d ff          	movsbl -0x1(%rbp),%ecx
    167c:	b0 01                	mov    $0x1,%al
    167e:	83 f9 5b             	cmp    $0x5b,%ecx
    1681:	88 45 fe             	mov    %al,-0x2(%rbp)
    1684:	74 37                	je     16bd <delimiter+0x5d>
    1686:	0f be 4d ff          	movsbl -0x1(%rbp),%ecx
    168a:	b0 01                	mov    $0x1,%al
    168c:	83 f9 7d             	cmp    $0x7d,%ecx
    168f:	88 45 fe             	mov    %al,-0x2(%rbp)
    1692:	74 29                	je     16bd <delimiter+0x5d>
    1694:	0f be 4d ff          	movsbl -0x1(%rbp),%ecx
    1698:	b0 01                	mov    $0x1,%al
    169a:	83 f9 5d             	cmp    $0x5d,%ecx
    169d:	88 45 fe             	mov    %al,-0x2(%rbp)
    16a0:	74 1b                	je     16bd <delimiter+0x5d>
    16a2:	0f be 4d ff          	movsbl -0x1(%rbp),%ecx
    16a6:	b0 01                	mov    $0x1,%al
    16a8:	83 f9 3a             	cmp    $0x3a,%ecx
    16ab:	88 45 fe             	mov    %al,-0x2(%rbp)
    16ae:	74 0d                	je     16bd <delimiter+0x5d>
    16b0:	0f be 45 ff          	movsbl -0x1(%rbp),%eax
    16b4:	83 f8 2c             	cmp    $0x2c,%eax
    16b7:	0f 94 c0             	sete   %al
    16ba:	88 45 fe             	mov    %al,-0x2(%rbp)
    16bd:	8a 45 fe             	mov    -0x2(%rbp),%al
    16c0:	24 01                	and    $0x1,%al
    16c2:	0f b6 c0             	movzbl %al,%eax
    16c5:	5d                   	pop    %rbp
    16c6:	c3                   	ret

Disassembly of section .fini:

00000000000016c8 <_fini>:
    16c8:	48 83 ec 08          	sub    $0x8,%rsp
    16cc:	48 83 c4 08          	add    $0x8,%rsp
    16d0:	c3                   	ret
