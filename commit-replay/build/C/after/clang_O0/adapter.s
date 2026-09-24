
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
    1169:	be a5 8b 95 77       	mov    $0x77958ba5,%esi
    116e:	e8 fd 01 00 00       	call   1370 <wm_add_v2>
    1173:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1176:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1179:	be db 77 77 0b       	mov    $0xb7777db,%esi
    117e:	e8 ed 01 00 00       	call   1370 <wm_add_v2>
    1183:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1186:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1189:	be d3 15 4f b9       	mov    $0xb94f15d3,%esi
    118e:	e8 dd 01 00 00       	call   1370 <wm_add_v2>
    1193:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1196:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1199:	be f3 dd dd 79       	mov    $0x79ddddf3,%esi
    119e:	e8 ed 01 00 00       	call   1390 <wm_xor_v2>
    11a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11a6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11a9:	be 1b b3 7f 6b       	mov    $0x6b7fb31b,%esi
    11ae:	e8 dd 01 00 00       	call   1390 <wm_xor_v2>
    11b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11b6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11b9:	be 97 d3 bd 51       	mov    $0x51bdd397,%esi
    11be:	e8 ad 01 00 00       	call   1370 <wm_add_v2>
    11c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11c6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11c9:	be 31 5f a5 11       	mov    $0x11a55f31,%esi
    11ce:	e8 bd 01 00 00       	call   1390 <wm_xor_v2>
    11d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11d6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11d9:	be fb 81 cf 13       	mov    $0x13cf81fb,%esi
    11de:	e8 8d 01 00 00       	call   1370 <wm_add_v2>
    11e3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11e6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11e9:	be e7 4d 13 81       	mov    $0x81134de7,%esi
    11ee:	e8 9d 01 00 00       	call   1390 <wm_xor_v2>
    11f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11f6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11f9:	be 27 49 0f 37       	mov    $0x370f4927,%esi
    11fe:	e8 6d 01 00 00       	call   1370 <wm_add_v2>
    1203:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1206:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1209:	be 77 55 bf b9       	mov    $0xb9bf5577,%esi
    120e:	e8 7d 01 00 00       	call   1390 <wm_xor_v2>
    1213:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1216:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1219:	be 7f 7d e9 cd       	mov    $0xcde97d7f,%esi
    121e:	e8 6d 01 00 00       	call   1390 <wm_xor_v2>
    1223:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1226:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1229:	be 1f 9f 4b f5       	mov    $0xf54b9f1f,%esi
    122e:	e8 3d 01 00 00       	call   1370 <wm_add_v2>
    1233:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1236:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1239:	be d9 5f cb 8b       	mov    $0x8bcb5fd9,%esi
    123e:	e8 4d 01 00 00       	call   1390 <wm_xor_v2>
    1243:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1246:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1249:	be 77 41 45 d3       	mov    $0xd3454177,%esi
    124e:	e8 3d 01 00 00       	call   1390 <wm_xor_v2>
    1253:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1256:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1259:	be ff 37 55 a5       	mov    $0xa55537ff,%esi
    125e:	e8 0d 01 00 00       	call   1370 <wm_add_v2>
    1263:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1266:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1269:	be 01 d7 9f 27       	mov    $0x279fd701,%esi
    126e:	e8 1d 01 00 00       	call   1390 <wm_xor_v2>
    1273:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1276:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1279:	be 61 83 3f e5       	mov    $0xe53f8361,%esi
    127e:	e8 ed 00 00 00       	call   1370 <wm_add_v2>
    1283:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1286:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1289:	be b5 4d 5d c9       	mov    $0xc95d4db5,%esi
    128e:	e8 dd 00 00 00       	call   1370 <wm_add_v2>
    1293:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1296:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1299:	be 2f e3 c9 59       	mov    $0x59c9e32f,%esi
    129e:	e8 ed 00 00 00       	call   1390 <wm_xor_v2>
    12a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12a6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12a9:	be 93 1f a3 af       	mov    $0xafa31f93,%esi
    12ae:	e8 dd 00 00 00       	call   1390 <wm_xor_v2>
    12b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12b6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12b9:	be 09 77 b9 b9       	mov    $0xb9b97709,%esi
    12be:	e8 cd 00 00 00       	call   1390 <wm_xor_v2>
    12c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12c6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12c9:	be 55 87 83 69       	mov    $0x69838755,%esi
    12ce:	e8 9d 00 00 00       	call   1370 <wm_add_v2>
    12d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12d6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12d9:	be 57 87 a9 07       	mov    $0x7a98757,%esi
    12de:	e8 8d 00 00 00       	call   1370 <wm_add_v2>
    12e3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12e6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12e9:	be d5 6f 01 15       	mov    $0x15016fd5,%esi
    12ee:	e8 7d 00 00 00       	call   1370 <wm_add_v2>
    12f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12f6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12f9:	be 53 69 3f 61       	mov    $0x613f6953,%esi
    12fe:	e8 6d 00 00 00       	call   1370 <wm_add_v2>
    1303:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1306:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1309:	be 15 6b a9 5b       	mov    $0x5ba96b15,%esi
    130e:	e8 7d 00 00 00       	call   1390 <wm_xor_v2>
    1313:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1316:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1319:	be ed e3 9b 23       	mov    $0x239be3ed,%esi
    131e:	e8 4d 00 00 00       	call   1370 <wm_add_v2>
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
    13b4:	48 83 ec 20          	sub    $0x20,%rsp
    13b8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    13bf:	83 7d fc 06          	cmpl   $0x6,-0x4(%rbp)
    13c3:	73 75                	jae    143a <run_contract+0x8a>
    13c5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    13cc:	83 7d f8 06          	cmpl   $0x6,-0x8(%rbp)
    13d0:	73 5b                	jae    142d <run_contract+0x7d>
    13d2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    13d9:	83 7d f4 02          	cmpl   $0x2,-0xc(%rbp)
    13dd:	73 41                	jae    1420 <run_contract+0x70>
    13df:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
    13e6:	83 7d f0 02          	cmpl   $0x2,-0x10(%rbp)
    13ea:	73 27                	jae    1413 <run_contract+0x63>
    13ec:	8b 7d fc             	mov    -0x4(%rbp),%edi
    13ef:	8b 75 f8             	mov    -0x8(%rbp),%esi
    13f2:	8b 55 f4             	mov    -0xc(%rbp),%edx
    13f5:	8b 4d f0             	mov    -0x10(%rbp),%ecx
    13f8:	e8 43 00 00 00       	call   1440 <normalized_record>
    13fd:	89 45 ec             	mov    %eax,-0x14(%rbp)
    1400:	8b 7d ec             	mov    -0x14(%rbp),%edi
    1403:	e8 98 00 00 00       	call   14a0 <emit_u32>
    1408:	8b 45 f0             	mov    -0x10(%rbp),%eax
    140b:	83 c0 01             	add    $0x1,%eax
    140e:	89 45 f0             	mov    %eax,-0x10(%rbp)
    1411:	eb d3                	jmp    13e6 <run_contract+0x36>
    1413:	eb 00                	jmp    1415 <run_contract+0x65>
    1415:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1418:	83 c0 01             	add    $0x1,%eax
    141b:	89 45 f4             	mov    %eax,-0xc(%rbp)
    141e:	eb b9                	jmp    13d9 <run_contract+0x29>
    1420:	eb 00                	jmp    1422 <run_contract+0x72>
    1422:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1425:	83 c0 01             	add    $0x1,%eax
    1428:	89 45 f8             	mov    %eax,-0x8(%rbp)
    142b:	eb 9f                	jmp    13cc <run_contract+0x1c>
    142d:	eb 00                	jmp    142f <run_contract+0x7f>
    142f:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1432:	83 c0 01             	add    $0x1,%eax
    1435:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1438:	eb 85                	jmp    13bf <run_contract+0xf>
    143a:	48 83 c4 20          	add    $0x20,%rsp
    143e:	5d                   	pop    %rbp
    143f:	c3                   	ret

0000000000001440 <normalized_record>:
    1440:	55                   	push   %rbp
    1441:	48 89 e5             	mov    %rsp,%rbp
    1444:	48 83 ec 20          	sub    $0x20,%rsp
    1448:	89 7d f8             	mov    %edi,-0x8(%rbp)
    144b:	89 75 f4             	mov    %esi,-0xc(%rbp)
    144e:	89 55 f0             	mov    %edx,-0x10(%rbp)
    1451:	89 4d ec             	mov    %ecx,-0x14(%rbp)
    1454:	48 8d 05 b5 00 00 00 	lea    0xb5(%rip),%rax        # 1510 <callback_record>
    145b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    145f:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
    1463:	75 08                	jne    146d <normalized_record+0x2d>
    1465:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1468:	3b 45 f4             	cmp    -0xc(%rbp),%eax
    146b:	73 09                	jae    1476 <normalized_record+0x36>
    146d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1474:	eb 12                	jmp    1488 <normalized_record+0x48>
    1476:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    147a:	8b 7d f8             	mov    -0x8(%rbp),%edi
    147d:	8b 75 f4             	mov    -0xc(%rbp),%esi
    1480:	8b 55 ec             	mov    -0x14(%rbp),%edx
    1483:	ff d0                	call   *%rax
    1485:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1488:	8b 45 fc             	mov    -0x4(%rbp),%eax
    148b:	48 83 c4 20          	add    $0x20,%rsp
    148f:	5d                   	pop    %rbp
    1490:	c3                   	ret
    1491:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)

00000000000014a0 <emit_u32>:
    14a0:	55                   	push   %rbp
    14a1:	48 89 e5             	mov    %rsp,%rbp
    14a4:	48 83 ec 10          	sub    $0x10,%rsp
    14a8:	89 7d fc             	mov    %edi,-0x4(%rbp)
    14ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14ae:	25 ff 00 00 00       	and    $0xff,%eax
    14b3:	88 45 f8             	mov    %al,-0x8(%rbp)
    14b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14b9:	c1 e8 08             	shr    $0x8,%eax
    14bc:	25 ff 00 00 00       	and    $0xff,%eax
    14c1:	88 45 f9             	mov    %al,-0x7(%rbp)
    14c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14c7:	c1 e8 10             	shr    $0x10,%eax
    14ca:	25 ff 00 00 00       	and    $0xff,%eax
    14cf:	88 45 fa             	mov    %al,-0x6(%rbp)
    14d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14d5:	c1 e8 18             	shr    $0x18,%eax
    14d8:	25 ff 00 00 00       	and    $0xff,%eax
    14dd:	88 45 fb             	mov    %al,-0x5(%rbp)
    14e0:	48 8d 7d f8          	lea    -0x8(%rbp),%rdi
    14e4:	48 8b 05 dd 2a 00 00 	mov    0x2add(%rip),%rax        # 3fc8 <stdout@GLIBC_2.2.5>
    14eb:	48 8b 08             	mov    (%rax),%rcx
    14ee:	be 01 00 00 00       	mov    $0x1,%esi
    14f3:	ba 04 00 00 00       	mov    $0x4,%edx
    14f8:	e8 43 fb ff ff       	call   1040 <fwrite@plt>
    14fd:	48 83 c4 10          	add    $0x10,%rsp
    1501:	5d                   	pop    %rbp
    1502:	c3                   	ret
    1503:	66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)

0000000000001510 <callback_record>:
    1510:	55                   	push   %rbp
    1511:	48 89 e5             	mov    %rsp,%rbp
    1514:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1517:	89 75 f8             	mov    %esi,-0x8(%rbp)
    151a:	89 55 f4             	mov    %edx,-0xc(%rbp)
    151d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1520:	83 c0 01             	add    $0x1,%eax
    1523:	8b 4d f8             	mov    -0x8(%rbp),%ecx
    1526:	83 c1 01             	add    $0x1,%ecx
    1529:	c1 e1 04             	shl    $0x4,%ecx
    152c:	09 c8                	or     %ecx,%eax
    152e:	8b 4d f4             	mov    -0xc(%rbp),%ecx
    1531:	83 c1 01             	add    $0x1,%ecx
    1534:	c1 e1 08             	shl    $0x8,%ecx
    1537:	09 c8                	or     %ecx,%eax
    1539:	0d 00 00 5a 00       	or     $0x5a0000,%eax
    153e:	5d                   	pop    %rbp
    153f:	c3                   	ret

Disassembly of section .fini:

0000000000001540 <_fini>:
    1540:	48 83 ec 08          	sub    $0x8,%rsp
    1544:	48 83 c4 08          	add    $0x8,%rsp
    1548:	c3                   	ret
