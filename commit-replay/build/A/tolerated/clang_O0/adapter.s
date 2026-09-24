
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
    116e:	e8 dd 01 00 00       	call   1350 <wm_add_v2>
    1173:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1176:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1179:	be 7b ed f1 cd       	mov    $0xcdf1ed7b,%esi
    117e:	e8 cd 01 00 00       	call   1350 <wm_add_v2>
    1183:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1186:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1189:	be dd d1 7d 45       	mov    $0x457dd1dd,%esi
    118e:	e8 bd 01 00 00       	call   1350 <wm_add_v2>
    1193:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1196:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1199:	be ed 03 93 eb       	mov    $0xeb9303ed,%esi
    119e:	e8 cd 01 00 00       	call   1370 <wm_xor_v2>
    11a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11a6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11a9:	be d3 c9 37 59       	mov    $0x5937c9d3,%esi
    11ae:	e8 9d 01 00 00       	call   1350 <wm_add_v2>
    11b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11b6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11b9:	be b1 6f c9 8d       	mov    $0x8dc96fb1,%esi
    11be:	e8 ad 01 00 00       	call   1370 <wm_xor_v2>
    11c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11c6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11c9:	be 29 9b 45 5b       	mov    $0x5b459b29,%esi
    11ce:	e8 9d 01 00 00       	call   1370 <wm_xor_v2>
    11d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11d6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11d9:	be 6b a1 ab 5b       	mov    $0x5baba16b,%esi
    11de:	e8 6d 01 00 00       	call   1350 <wm_add_v2>
    11e3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11e6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11e9:	be 03 bb 17 5d       	mov    $0x5d17bb03,%esi
    11ee:	e8 5d 01 00 00       	call   1350 <wm_add_v2>
    11f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11f6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11f9:	be 29 57 95 b1       	mov    $0xb1955729,%esi
    11fe:	e8 6d 01 00 00       	call   1370 <wm_xor_v2>
    1203:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1206:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1209:	be 11 c3 95 d9       	mov    $0xd995c311,%esi
    120e:	e8 3d 01 00 00       	call   1350 <wm_add_v2>
    1213:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1216:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1219:	be b9 4d 3b c9       	mov    $0xc93b4db9,%esi
    121e:	e8 2d 01 00 00       	call   1350 <wm_add_v2>
    1223:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1226:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1229:	be eb 8d f5 15       	mov    $0x15f58deb,%esi
    122e:	e8 1d 01 00 00       	call   1350 <wm_add_v2>
    1233:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1236:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1239:	be e7 67 93 ef       	mov    $0xef9367e7,%esi
    123e:	e8 0d 01 00 00       	call   1350 <wm_add_v2>
    1243:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1246:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1249:	be f1 31 85 d9       	mov    $0xd98531f1,%esi
    124e:	e8 fd 00 00 00       	call   1350 <wm_add_v2>
    1253:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1256:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1259:	be 29 65 e3 fd       	mov    $0xfde36529,%esi
    125e:	e8 ed 00 00 00       	call   1350 <wm_add_v2>
    1263:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1266:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1269:	be 19 05 d1 91       	mov    $0x91d10519,%esi
    126e:	e8 fd 00 00 00       	call   1370 <wm_xor_v2>
    1273:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1276:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1279:	be 9f 6b 23 af       	mov    $0xaf236b9f,%esi
    127e:	e8 cd 00 00 00       	call   1350 <wm_add_v2>
    1283:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1286:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1289:	be 6f a9 c3 c3       	mov    $0xc3c3a96f,%esi
    128e:	e8 dd 00 00 00       	call   1370 <wm_xor_v2>
    1293:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1296:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1299:	be 03 85 93 cf       	mov    $0xcf938503,%esi
    129e:	e8 cd 00 00 00       	call   1370 <wm_xor_v2>
    12a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12a6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12a9:	be 7b 2d 27 61       	mov    $0x61272d7b,%esi
    12ae:	e8 bd 00 00 00       	call   1370 <wm_xor_v2>
    12b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12b6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12b9:	be 39 d1 2d 9b       	mov    $0x9b2dd139,%esi
    12be:	e8 8d 00 00 00       	call   1350 <wm_add_v2>
    12c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12c6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12c9:	be 87 79 7d b7       	mov    $0xb77d7987,%esi
    12ce:	e8 7d 00 00 00       	call   1350 <wm_add_v2>
    12d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12d6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12d9:	be a9 87 5d f9       	mov    $0xf95d87a9,%esi
    12de:	e8 6d 00 00 00       	call   1350 <wm_add_v2>
    12e3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12e6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12e9:	be ff 21 f7 3d       	mov    $0x3df721ff,%esi
    12ee:	e8 5d 00 00 00       	call   1350 <wm_add_v2>
    12f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12f6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12f9:	be 03 6f c9 47       	mov    $0x47c96f03,%esi
    12fe:	e8 4d 00 00 00       	call   1350 <wm_add_v2>
    1303:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1306:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1309:	83 f8 ff             	cmp    $0xffffffff,%eax
    130c:	75 09                	jne    1317 <main+0x1c7>
    130e:	c7 45 fc 61 00 00 00 	movl   $0x61,-0x4(%rbp)
    1315:	eb 26                	jmp    133d <main+0x1ed>
    1317:	e8 74 00 00 00       	call   1390 <run_contract>
    131c:	48 8b 05 9d 2c 00 00 	mov    0x2c9d(%rip),%rax        # 3fc0 <stdout@GLIBC_2.2.5>
    1323:	48 8b 38             	mov    (%rax),%rdi
    1326:	e8 05 fd ff ff       	call   1030 <ferror@plt>
    132b:	89 c2                	mov    %eax,%edx
    132d:	31 c0                	xor    %eax,%eax
    132f:	b9 02 00 00 00       	mov    $0x2,%ecx
    1334:	83 fa 00             	cmp    $0x0,%edx
    1337:	0f 45 c1             	cmovne %ecx,%eax
    133a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    133d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1340:	48 83 c4 10          	add    $0x10,%rsp
    1344:	5d                   	pop    %rbp
    1345:	c3                   	ret
    1346:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

0000000000001350 <wm_add_v2>:
    1350:	55                   	push   %rbp
    1351:	48 89 e5             	mov    %rsp,%rbp
    1354:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1357:	89 75 f8             	mov    %esi,-0x8(%rbp)
    135a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    135d:	2b 45 f8             	sub    -0x8(%rbp),%eax
    1360:	03 45 f8             	add    -0x8(%rbp),%eax
    1363:	5d                   	pop    %rbp
    1364:	c3                   	ret
    1365:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)

0000000000001370 <wm_xor_v2>:
    1370:	55                   	push   %rbp
    1371:	48 89 e5             	mov    %rsp,%rbp
    1374:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1377:	89 75 f8             	mov    %esi,-0x8(%rbp)
    137a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    137d:	8b 4d f8             	mov    -0x8(%rbp),%ecx
    1380:	33 4d f8             	xor    -0x8(%rbp),%ecx
    1383:	31 c8                	xor    %ecx,%eax
    1385:	5d                   	pop    %rbp
    1386:	c3                   	ret
    1387:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

0000000000001390 <run_contract>:
    1390:	55                   	push   %rbp
    1391:	48 89 e5             	mov    %rsp,%rbp
    1394:	48 83 ec 10          	sub    $0x10,%rsp
    1398:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    139f:	83 7d fc 10          	cmpl   $0x10,-0x4(%rbp)
    13a3:	73 27                	jae    13cc <run_contract+0x3c>
    13a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13a8:	89 c1                	mov    %eax,%ecx
    13aa:	48 8d 05 9f 29 00 00 	lea    0x299f(%rip),%rax        # 3d50 <cases>
    13b1:	48 8b 3c c8          	mov    (%rax,%rcx,8),%rdi
    13b5:	e8 96 00 00 00       	call   1450 <token_signature>
    13ba:	89 c7                	mov    %eax,%edi
    13bc:	e8 1f 00 00 00       	call   13e0 <emit_u32>
    13c1:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13c4:	83 c0 01             	add    $0x1,%eax
    13c7:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13ca:	eb d3                	jmp    139f <run_contract+0xf>
    13cc:	48 83 c4 10          	add    $0x10,%rsp
    13d0:	5d                   	pop    %rbp
    13d1:	c3                   	ret
    13d2:	66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)

00000000000013e0 <emit_u32>:
    13e0:	55                   	push   %rbp
    13e1:	48 89 e5             	mov    %rsp,%rbp
    13e4:	48 83 ec 10          	sub    $0x10,%rsp
    13e8:	89 7d fc             	mov    %edi,-0x4(%rbp)
    13eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13ee:	25 ff 00 00 00       	and    $0xff,%eax
    13f3:	88 45 f8             	mov    %al,-0x8(%rbp)
    13f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13f9:	c1 e8 08             	shr    $0x8,%eax
    13fc:	25 ff 00 00 00       	and    $0xff,%eax
    1401:	88 45 f9             	mov    %al,-0x7(%rbp)
    1404:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1407:	c1 e8 10             	shr    $0x10,%eax
    140a:	25 ff 00 00 00       	and    $0xff,%eax
    140f:	88 45 fa             	mov    %al,-0x6(%rbp)
    1412:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1415:	c1 e8 18             	shr    $0x18,%eax
    1418:	25 ff 00 00 00       	and    $0xff,%eax
    141d:	88 45 fb             	mov    %al,-0x5(%rbp)
    1420:	48 8d 7d f8          	lea    -0x8(%rbp),%rdi
    1424:	48 8b 05 95 2b 00 00 	mov    0x2b95(%rip),%rax        # 3fc0 <stdout@GLIBC_2.2.5>
    142b:	48 8b 08             	mov    (%rax),%rcx
    142e:	be 01 00 00 00       	mov    $0x1,%esi
    1433:	ba 04 00 00 00       	mov    $0x4,%edx
    1438:	e8 03 fc ff ff       	call   1040 <fwrite@plt>
    143d:	48 83 c4 10          	add    $0x10,%rsp
    1441:	5d                   	pop    %rbp
    1442:	c3                   	ret
    1443:	66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)

0000000000001450 <token_signature>:
    1450:	55                   	push   %rbp
    1451:	48 89 e5             	mov    %rsp,%rbp
    1454:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1458:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    145f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
    1466:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    146d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
    1474:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
    147b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    1482:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%rbp)
    1489:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
    1490:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1494:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    1498:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    149c:	80 38 00             	cmpb   $0x0,(%rax)
    149f:	0f 84 68 01 00 00    	je     160d <token_signature+0x1bd>
    14a5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    14a9:	8a 00                	mov    (%rax),%al
    14ab:	88 45 cf             	mov    %al,-0x31(%rbp)
    14ae:	8b 45 e8             	mov    -0x18(%rbp),%eax
    14b1:	83 c0 01             	add    $0x1,%eax
    14b4:	89 45 e8             	mov    %eax,-0x18(%rbp)
    14b7:	6b 45 ec 21          	imul   $0x21,-0x14(%rbp),%eax
    14bb:	0f b6 4d cf          	movzbl -0x31(%rbp),%ecx
    14bf:	01 c8                	add    %ecx,%eax
    14c1:	25 ff ff 00 00       	and    $0xffff,%eax
    14c6:	89 45 ec             	mov    %eax,-0x14(%rbp)
    14c9:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
    14cd:	74 3a                	je     1509 <token_signature+0xb9>
    14cf:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
    14d3:	74 09                	je     14de <token_signature+0x8e>
    14d5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    14dc:	eb 26                	jmp    1504 <token_signature+0xb4>
    14de:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
    14e2:	83 f8 5c             	cmp    $0x5c,%eax
    14e5:	75 09                	jne    14f0 <token_signature+0xa0>
    14e7:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%rbp)
    14ee:	eb 12                	jmp    1502 <token_signature+0xb2>
    14f0:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
    14f4:	83 f8 22             	cmp    $0x22,%eax
    14f7:	75 07                	jne    1500 <token_signature+0xb0>
    14f9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
    1500:	eb 00                	jmp    1502 <token_signature+0xb2>
    1502:	eb 00                	jmp    1504 <token_signature+0xb4>
    1504:	e9 f3 00 00 00       	jmp    15fc <token_signature+0x1ac>
    1509:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
    150d:	89 45 c8             	mov    %eax,-0x38(%rbp)
    1510:	83 c0 f7             	add    $0xfffffff7,%eax
    1513:	83 e8 02             	sub    $0x2,%eax
    1516:	0f 82 bd 00 00 00    	jb     15d9 <token_signature+0x189>
    151c:	eb 00                	jmp    151e <token_signature+0xce>
    151e:	8b 45 c8             	mov    -0x38(%rbp),%eax
    1521:	83 e8 0d             	sub    $0xd,%eax
    1524:	0f 84 af 00 00 00    	je     15d9 <token_signature+0x189>
    152a:	eb 00                	jmp    152c <token_signature+0xdc>
    152c:	8b 45 c8             	mov    -0x38(%rbp),%eax
    152f:	83 e8 20             	sub    $0x20,%eax
    1532:	0f 84 a1 00 00 00    	je     15d9 <token_signature+0x189>
    1538:	eb 00                	jmp    153a <token_signature+0xea>
    153a:	8b 45 c8             	mov    -0x38(%rbp),%eax
    153d:	83 e8 22             	sub    $0x22,%eax
    1540:	74 42                	je     1584 <token_signature+0x134>
    1542:	eb 00                	jmp    1544 <token_signature+0xf4>
    1544:	8b 45 c8             	mov    -0x38(%rbp),%eax
    1547:	83 e8 2c             	sub    $0x2c,%eax
    154a:	0f 84 89 00 00 00    	je     15d9 <token_signature+0x189>
    1550:	eb 00                	jmp    1552 <token_signature+0x102>
    1552:	8b 45 c8             	mov    -0x38(%rbp),%eax
    1555:	83 e8 3a             	sub    $0x3a,%eax
    1558:	74 7f                	je     15d9 <token_signature+0x189>
    155a:	eb 00                	jmp    155c <token_signature+0x10c>
    155c:	8b 45 c8             	mov    -0x38(%rbp),%eax
    155f:	83 e8 5b             	sub    $0x5b,%eax
    1562:	74 39                	je     159d <token_signature+0x14d>
    1564:	eb 00                	jmp    1566 <token_signature+0x116>
    1566:	8b 45 c8             	mov    -0x38(%rbp),%eax
    1569:	83 e8 5d             	sub    $0x5d,%eax
    156c:	74 4a                	je     15b8 <token_signature+0x168>
    156e:	eb 00                	jmp    1570 <token_signature+0x120>
    1570:	8b 45 c8             	mov    -0x38(%rbp),%eax
    1573:	83 e8 7b             	sub    $0x7b,%eax
    1576:	74 25                	je     159d <token_signature+0x14d>
    1578:	eb 00                	jmp    157a <token_signature+0x12a>
    157a:	8b 45 c8             	mov    -0x38(%rbp),%eax
    157d:	83 e8 7d             	sub    $0x7d,%eax
    1580:	74 36                	je     15b8 <token_signature+0x168>
    1582:	eb 5e                	jmp    15e2 <token_signature+0x192>
    1584:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%rbp)
    158b:	8b 45 f0             	mov    -0x10(%rbp),%eax
    158e:	83 c0 01             	add    $0x1,%eax
    1591:	89 45 f0             	mov    %eax,-0x10(%rbp)
    1594:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
    159b:	eb 5d                	jmp    15fa <token_signature+0x1aa>
    159d:	8b 45 f4             	mov    -0xc(%rbp),%eax
    15a0:	83 c0 01             	add    $0x1,%eax
    15a3:	89 45 f4             	mov    %eax,-0xc(%rbp)
    15a6:	8b 45 f0             	mov    -0x10(%rbp),%eax
    15a9:	83 c0 01             	add    $0x1,%eax
    15ac:	89 45 f0             	mov    %eax,-0x10(%rbp)
    15af:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
    15b6:	eb 42                	jmp    15fa <token_signature+0x1aa>
    15b8:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
    15bc:	75 09                	jne    15c7 <token_signature+0x177>
    15be:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    15c5:	eb 09                	jmp    15d0 <token_signature+0x180>
    15c7:	8b 45 f4             	mov    -0xc(%rbp),%eax
    15ca:	83 c0 ff             	add    $0xffffffff,%eax
    15cd:	89 45 f4             	mov    %eax,-0xc(%rbp)
    15d0:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
    15d7:	eb 21                	jmp    15fa <token_signature+0x1aa>
    15d9:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
    15e0:	eb 18                	jmp    15fa <token_signature+0x1aa>
    15e2:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
    15e6:	75 10                	jne    15f8 <token_signature+0x1a8>
    15e8:	8b 45 f0             	mov    -0x10(%rbp),%eax
    15eb:	83 c0 01             	add    $0x1,%eax
    15ee:	89 45 f0             	mov    %eax,-0x10(%rbp)
    15f1:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
    15f8:	eb 00                	jmp    15fa <token_signature+0x1aa>
    15fa:	eb 00                	jmp    15fc <token_signature+0x1ac>
    15fc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    1600:	48 83 c0 01          	add    $0x1,%rax
    1604:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    1608:	e9 8b fe ff ff       	jmp    1498 <token_signature+0x48>
    160d:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
    1611:	75 06                	jne    1619 <token_signature+0x1c9>
    1613:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
    1617:	74 07                	je     1620 <token_signature+0x1d0>
    1619:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    1620:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1623:	c1 e0 1f             	shl    $0x1f,%eax
    1626:	8b 4d f0             	mov    -0x10(%rbp),%ecx
    1629:	83 e1 7f             	and    $0x7f,%ecx
    162c:	c1 e1 18             	shl    $0x18,%ecx
    162f:	09 c8                	or     %ecx,%eax
    1631:	8b 4d e8             	mov    -0x18(%rbp),%ecx
    1634:	81 e1 ff 00 00 00    	and    $0xff,%ecx
    163a:	c1 e1 10             	shl    $0x10,%ecx
    163d:	09 c8                	or     %ecx,%eax
    163f:	0b 45 ec             	or     -0x14(%rbp),%eax
    1642:	5d                   	pop    %rbp
    1643:	c3                   	ret

Disassembly of section .fini:

0000000000001644 <_fini>:
    1644:	48 83 ec 08          	sub    $0x8,%rsp
    1648:	48 83 c4 08          	add    $0x8,%rsp
    164c:	c3                   	ret
