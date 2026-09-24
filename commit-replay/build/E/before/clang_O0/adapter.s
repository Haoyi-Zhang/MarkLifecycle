
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

0000000000001040 <fwrite@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4008 <fwrite@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .plt.got:

0000000000001050 <__cxa_finalize@plt>:
    1050:	ff 25 8a 2f 00 00    	jmp    *0x2f8a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
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
    107b:	ff 15 37 2f 00 00    	call   *0x2f37(%rip)        # 3fb8 <__libc_start_main@GLIBC_2.34>
    1081:	f4                   	hlt
    1082:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    108c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001090 <deregister_tm_clones>:
    1090:	48 8d 3d 89 2f 00 00 	lea    0x2f89(%rip),%rdi        # 4020 <__TMC_END__>
    1097:	48 8d 05 82 2f 00 00 	lea    0x2f82(%rip),%rax        # 4020 <__TMC_END__>
    109e:	48 39 f8             	cmp    %rdi,%rax
    10a1:	74 15                	je     10b8 <deregister_tm_clones+0x28>
    10a3:	48 8b 05 16 2f 00 00 	mov    0x2f16(%rip),%rax        # 3fc0 <_ITM_deregisterTMCloneTable@Base>
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
    10e4:	48 8b 05 ed 2e 00 00 	mov    0x2eed(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
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
    110e:	48 83 3d ca 2e 00 00 00 	cmpq   $0x0,0x2eca(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
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
    1169:	be 69 bd 35 47       	mov    $0x4735bd69,%esi
    116e:	e8 fd 01 00 00       	call   1370 <wm_add_v1>
    1173:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1176:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1179:	be 41 35 e7 1d       	mov    $0x1de73541,%esi
    117e:	e8 ed 01 00 00       	call   1370 <wm_add_v1>
    1183:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1186:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1189:	be e3 63 a5 15       	mov    $0x15a563e3,%esi
    118e:	e8 dd 01 00 00       	call   1370 <wm_add_v1>
    1193:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1196:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1199:	be 4d 63 c3 1b       	mov    $0x1bc3634d,%esi
    119e:	e8 ed 01 00 00       	call   1390 <wm_xor_v1>
    11a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11a6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11a9:	be 79 d5 d7 17       	mov    $0x17d7d579,%esi
    11ae:	e8 dd 01 00 00       	call   1390 <wm_xor_v1>
    11b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11b6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11b9:	be 5f 35 ff ad       	mov    $0xadff355f,%esi
    11be:	e8 cd 01 00 00       	call   1390 <wm_xor_v1>
    11c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11c6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11c9:	be ed 5d b5 bb       	mov    $0xbbb55ded,%esi
    11ce:	e8 bd 01 00 00       	call   1390 <wm_xor_v1>
    11d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11d6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11d9:	be 77 8b c1 c7       	mov    $0xc7c18b77,%esi
    11de:	e8 8d 01 00 00       	call   1370 <wm_add_v1>
    11e3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11e6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11e9:	be b7 45 fb 8f       	mov    $0x8ffb45b7,%esi
    11ee:	e8 9d 01 00 00       	call   1390 <wm_xor_v1>
    11f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11f6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11f9:	be 81 f1 af c1       	mov    $0xc1aff181,%esi
    11fe:	e8 8d 01 00 00       	call   1390 <wm_xor_v1>
    1203:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1206:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1209:	be 83 fd 85 ed       	mov    $0xed85fd83,%esi
    120e:	e8 5d 01 00 00       	call   1370 <wm_add_v1>
    1213:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1216:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1219:	be 6f 9d e3 49       	mov    $0x49e39d6f,%esi
    121e:	e8 4d 01 00 00       	call   1370 <wm_add_v1>
    1223:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1226:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1229:	be f9 05 cf 71       	mov    $0x71cf05f9,%esi
    122e:	e8 5d 01 00 00       	call   1390 <wm_xor_v1>
    1233:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1236:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1239:	be 13 ab 5f 09       	mov    $0x95fab13,%esi
    123e:	e8 4d 01 00 00       	call   1390 <wm_xor_v1>
    1243:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1246:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1249:	be 49 1f bf 3d       	mov    $0x3dbf1f49,%esi
    124e:	e8 1d 01 00 00       	call   1370 <wm_add_v1>
    1253:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1256:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1259:	be 47 27 ef 71       	mov    $0x71ef2747,%esi
    125e:	e8 0d 01 00 00       	call   1370 <wm_add_v1>
    1263:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1266:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1269:	be 99 83 05 8f       	mov    $0x8f058399,%esi
    126e:	e8 fd 00 00 00       	call   1370 <wm_add_v1>
    1273:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1276:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1279:	be e1 ed ef bb       	mov    $0xbbefede1,%esi
    127e:	e8 0d 01 00 00       	call   1390 <wm_xor_v1>
    1283:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1286:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1289:	be 1b bb ef 8f       	mov    $0x8fefbb1b,%esi
    128e:	e8 fd 00 00 00       	call   1390 <wm_xor_v1>
    1293:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1296:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1299:	be c7 19 b1 69       	mov    $0x69b119c7,%esi
    129e:	e8 ed 00 00 00       	call   1390 <wm_xor_v1>
    12a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12a6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12a9:	be af fb e9 23       	mov    $0x23e9fbaf,%esi
    12ae:	e8 dd 00 00 00       	call   1390 <wm_xor_v1>
    12b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12b6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12b9:	be 6b 19 5f 9f       	mov    $0x9f5f196b,%esi
    12be:	e8 cd 00 00 00       	call   1390 <wm_xor_v1>
    12c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12c6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12c9:	be d1 45 3d c9       	mov    $0xc93d45d1,%esi
    12ce:	e8 bd 00 00 00       	call   1390 <wm_xor_v1>
    12d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12d6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12d9:	be 01 f3 8f 71       	mov    $0x718ff301,%esi
    12de:	e8 ad 00 00 00       	call   1390 <wm_xor_v1>
    12e3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12e6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12e9:	be bb 99 d9 f5       	mov    $0xf5d999bb,%esi
    12ee:	e8 9d 00 00 00       	call   1390 <wm_xor_v1>
    12f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12f6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12f9:	be cf f1 51 fb       	mov    $0xfb51f1cf,%esi
    12fe:	e8 8d 00 00 00       	call   1390 <wm_xor_v1>
    1303:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1306:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1309:	be 77 3d d3 bb       	mov    $0xbbd33d77,%esi
    130e:	e8 7d 00 00 00       	call   1390 <wm_xor_v1>
    1313:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1316:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1319:	be 4b 97 a1 75       	mov    $0x75a1974b,%esi
    131e:	e8 6d 00 00 00       	call   1390 <wm_xor_v1>
    1323:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1326:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1329:	83 f8 ff             	cmp    $0xffffffff,%eax
    132c:	75 09                	jne    1337 <main+0x1e7>
    132e:	c7 45 fc 61 00 00 00 	movl   $0x61,-0x4(%rbp)
    1335:	eb 26                	jmp    135d <main+0x20d>
    1337:	e8 74 00 00 00       	call   13b0 <run_contract>
    133c:	48 8b 05 85 2c 00 00 	mov    0x2c85(%rip),%rax        # 3fc8 <stdout@GLIBC_2.2.5>
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
    13b4:	48 81 ec 30 01 00 00 	sub    $0x130,%rsp
    13bb:	48 8b 05 4e 0c 00 00 	mov    0xc4e(%rip),%rax        # 2010 <_IO_stdin_used+0x10>
    13c2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    13c6:	48 8b 05 4b 0c 00 00 	mov    0xc4b(%rip),%rax        # 2018 <_IO_stdin_used+0x18>
    13cd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    13d1:	c7 85 ec fe ff ff 00 00 00 00 	movl   $0x0,-0x114(%rbp)
    13db:	83 bd ec fe ff ff 04 	cmpl   $0x4,-0x114(%rbp)
    13e2:	0f 83 d3 00 00 00    	jae    14bb <run_contract+0x10b>
    13e8:	c7 85 e8 fe ff ff 00 00 00 00 	movl   $0x0,-0x118(%rbp)
    13f2:	81 bd e8 fe ff ff 00 01 00 00 	cmpl   $0x100,-0x118(%rbp)
    13fc:	73 31                	jae    142f <run_contract+0x7f>
    13fe:	8b bd ec fe ff ff    	mov    -0x114(%rbp),%edi
    1404:	8b b5 e8 fe ff ff    	mov    -0x118(%rbp),%esi
    140a:	e8 c1 00 00 00       	call   14d0 <pattern_byte>
    140f:	88 c1                	mov    %al,%cl
    1411:	8b 85 e8 fe ff ff    	mov    -0x118(%rbp),%eax
    1417:	88 8c 05 f0 fe ff ff 	mov    %cl,-0x110(%rbp,%rax,1)
    141e:	8b 85 e8 fe ff ff    	mov    -0x118(%rbp),%eax
    1424:	83 c0 01             	add    $0x1,%eax
    1427:	89 85 e8 fe ff ff    	mov    %eax,-0x118(%rbp)
    142d:	eb c3                	jmp    13f2 <run_contract+0x42>
    142f:	c7 85 e4 fe ff ff 00 00 00 00 	movl   $0x0,-0x11c(%rbp)
    1439:	83 bd e4 fe ff ff 04 	cmpl   $0x4,-0x11c(%rbp)
    1440:	73 63                	jae    14a5 <run_contract+0xf5>
    1442:	48 c7 85 d8 fe ff ff 00 00 00 00 	movq   $0x0,-0x128(%rbp)
    144d:	48 81 bd d8 fe ff ff 00 01 00 00 	cmpq   $0x100,-0x128(%rbp)
    1458:	77 38                	ja     1492 <run_contract+0xe2>
    145a:	8b 85 e4 fe ff ff    	mov    -0x11c(%rbp),%eax
    1460:	8b 7c 85 f0          	mov    -0x10(%rbp,%rax,4),%edi
    1464:	48 8d b5 f0 fe ff ff 	lea    -0x110(%rbp),%rsi
    146b:	48 8b 95 d8 fe ff ff 	mov    -0x128(%rbp),%rdx
    1472:	e8 29 01 00 00       	call   15a0 <adler_legacy>
    1477:	89 c7                	mov    %eax,%edi
    1479:	e8 b2 00 00 00       	call   1530 <emit_u32>
    147e:	48 8b 85 d8 fe ff ff 	mov    -0x128(%rbp),%rax
    1485:	48 83 c0 01          	add    $0x1,%rax
    1489:	48 89 85 d8 fe ff ff 	mov    %rax,-0x128(%rbp)
    1490:	eb bb                	jmp    144d <run_contract+0x9d>
    1492:	eb 00                	jmp    1494 <run_contract+0xe4>
    1494:	8b 85 e4 fe ff ff    	mov    -0x11c(%rbp),%eax
    149a:	83 c0 01             	add    $0x1,%eax
    149d:	89 85 e4 fe ff ff    	mov    %eax,-0x11c(%rbp)
    14a3:	eb 94                	jmp    1439 <run_contract+0x89>
    14a5:	eb 00                	jmp    14a7 <run_contract+0xf7>
    14a7:	8b 85 ec fe ff ff    	mov    -0x114(%rbp),%eax
    14ad:	83 c0 01             	add    $0x1,%eax
    14b0:	89 85 ec fe ff ff    	mov    %eax,-0x114(%rbp)
    14b6:	e9 20 ff ff ff       	jmp    13db <run_contract+0x2b>
    14bb:	48 81 c4 30 01 00 00 	add    $0x130,%rsp
    14c2:	5d                   	pop    %rbp
    14c3:	c3                   	ret
    14c4:	66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 cs nopw 0x0(%rax,%rax,1)

00000000000014d0 <pattern_byte>:
    14d0:	55                   	push   %rbp
    14d1:	48 89 e5             	mov    %rsp,%rbp
    14d4:	89 7d f8             	mov    %edi,-0x8(%rbp)
    14d7:	89 75 f4             	mov    %esi,-0xc(%rbp)
    14da:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    14de:	75 08                	jne    14e8 <pattern_byte+0x18>
    14e0:	8b 45 f4             	mov    -0xc(%rbp),%eax
    14e3:	88 45 ff             	mov    %al,-0x1(%rbp)
    14e6:	eb 43                	jmp    152b <pattern_byte+0x5b>
    14e8:	83 7d f8 01          	cmpl   $0x1,-0x8(%rbp)
    14ec:	75 0d                	jne    14fb <pattern_byte+0x2b>
    14ee:	b8 ff 00 00 00       	mov    $0xff,%eax
    14f3:	2b 45 f4             	sub    -0xc(%rbp),%eax
    14f6:	88 45 ff             	mov    %al,-0x1(%rbp)
    14f9:	eb 30                	jmp    152b <pattern_byte+0x5b>
    14fb:	83 7d f8 02          	cmpl   $0x2,-0x8(%rbp)
    14ff:	75 11                	jne    1512 <pattern_byte+0x42>
    1501:	6b 45 f4 11          	imul   $0x11,-0xc(%rbp),%eax
    1505:	83 c0 1f             	add    $0x1f,%eax
    1508:	25 ff 00 00 00       	and    $0xff,%eax
    150d:	88 45 ff             	mov    %al,-0x1(%rbp)
    1510:	eb 19                	jmp    152b <pattern_byte+0x5b>
    1512:	8b 55 f4             	mov    -0xc(%rbp),%edx
    1515:	83 e2 01             	and    $0x1,%edx
    1518:	b8 55 00 00 00       	mov    $0x55,%eax
    151d:	b9 aa 00 00 00       	mov    $0xaa,%ecx
    1522:	83 fa 00             	cmp    $0x0,%edx
    1525:	0f 45 c1             	cmovne %ecx,%eax
    1528:	88 45 ff             	mov    %al,-0x1(%rbp)
    152b:	8a 45 ff             	mov    -0x1(%rbp),%al
    152e:	5d                   	pop    %rbp
    152f:	c3                   	ret

0000000000001530 <emit_u32>:
    1530:	55                   	push   %rbp
    1531:	48 89 e5             	mov    %rsp,%rbp
    1534:	48 83 ec 10          	sub    $0x10,%rsp
    1538:	89 7d fc             	mov    %edi,-0x4(%rbp)
    153b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    153e:	25 ff 00 00 00       	and    $0xff,%eax
    1543:	88 45 f8             	mov    %al,-0x8(%rbp)
    1546:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1549:	c1 e8 08             	shr    $0x8,%eax
    154c:	25 ff 00 00 00       	and    $0xff,%eax
    1551:	88 45 f9             	mov    %al,-0x7(%rbp)
    1554:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1557:	c1 e8 10             	shr    $0x10,%eax
    155a:	25 ff 00 00 00       	and    $0xff,%eax
    155f:	88 45 fa             	mov    %al,-0x6(%rbp)
    1562:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1565:	c1 e8 18             	shr    $0x18,%eax
    1568:	25 ff 00 00 00       	and    $0xff,%eax
    156d:	88 45 fb             	mov    %al,-0x5(%rbp)
    1570:	48 8d 7d f8          	lea    -0x8(%rbp),%rdi
    1574:	48 8b 05 4d 2a 00 00 	mov    0x2a4d(%rip),%rax        # 3fc8 <stdout@GLIBC_2.2.5>
    157b:	48 8b 08             	mov    (%rax),%rcx
    157e:	be 01 00 00 00       	mov    $0x1,%esi
    1583:	ba 04 00 00 00       	mov    $0x4,%edx
    1588:	e8 b3 fa ff ff       	call   1040 <fwrite@plt>
    158d:	48 83 c4 10          	add    $0x10,%rsp
    1591:	5d                   	pop    %rbp
    1592:	c3                   	ret
    1593:	66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)

00000000000015a0 <adler_legacy>:
    15a0:	55                   	push   %rbp
    15a1:	48 89 e5             	mov    %rsp,%rbp
    15a4:	89 7d fc             	mov    %edi,-0x4(%rbp)
    15a7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    15ab:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    15af:	8b 45 fc             	mov    -0x4(%rbp),%eax
    15b2:	25 ff ff 00 00       	and    $0xffff,%eax
    15b7:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    15ba:	8b 45 fc             	mov    -0x4(%rbp),%eax
    15bd:	c1 e8 10             	shr    $0x10,%eax
    15c0:	25 ff ff 00 00       	and    $0xffff,%eax
    15c5:	89 45 e0             	mov    %eax,-0x20(%rbp)
    15c8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    15cc:	48 89 c1             	mov    %rax,%rcx
    15cf:	48 83 c1 ff          	add    $0xffffffffffffffff,%rcx
    15d3:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
    15d7:	48 83 f8 00          	cmp    $0x0,%rax
    15db:	74 41                	je     161e <adler_legacy+0x7e>
    15dd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    15e1:	48 89 c1             	mov    %rax,%rcx
    15e4:	48 83 c1 01          	add    $0x1,%rcx
    15e8:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
    15ec:	0f b6 00             	movzbl (%rax),%eax
    15ef:	03 45 e4             	add    -0x1c(%rbp),%eax
    15f2:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    15f5:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    15f8:	03 45 e0             	add    -0x20(%rbp),%eax
    15fb:	89 45 e0             	mov    %eax,-0x20(%rbp)
    15fe:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    1601:	b9 f1 ff 00 00       	mov    $0xfff1,%ecx
    1606:	31 d2                	xor    %edx,%edx
    1608:	f7 f1                	div    %ecx
    160a:	89 55 e4             	mov    %edx,-0x1c(%rbp)
    160d:	8b 45 e0             	mov    -0x20(%rbp),%eax
    1610:	b9 f1 ff 00 00       	mov    $0xfff1,%ecx
    1615:	31 d2                	xor    %edx,%edx
    1617:	f7 f1                	div    %ecx
    1619:	89 55 e0             	mov    %edx,-0x20(%rbp)
    161c:	eb aa                	jmp    15c8 <adler_legacy+0x28>
    161e:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    1621:	8b 4d e0             	mov    -0x20(%rbp),%ecx
    1624:	c1 e1 10             	shl    $0x10,%ecx
    1627:	09 c8                	or     %ecx,%eax
    1629:	5d                   	pop    %rbp
    162a:	c3                   	ret

Disassembly of section .fini:

000000000000162c <_fini>:
    162c:	48 83 ec 08          	sub    $0x8,%rsp
    1630:	48 83 c4 08          	add    $0x8,%rsp
    1634:	c3                   	ret
