
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
    1169:	be d7 13 45 f7       	mov    $0xf74513d7,%esi
    116e:	e8 dd 01 00 00       	call   1350 <wm_add_v2>
    1173:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1176:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1179:	be fd f1 83 6f       	mov    $0x6f83f1fd,%esi
    117e:	e8 cd 01 00 00       	call   1350 <wm_add_v2>
    1183:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1186:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1189:	be 0d f3 53 5f       	mov    $0x5f53f30d,%esi
    118e:	e8 dd 01 00 00       	call   1370 <wm_xor_v2>
    1193:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1196:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1199:	be 7f ef 49 87       	mov    $0x8749ef7f,%esi
    119e:	e8 cd 01 00 00       	call   1370 <wm_xor_v2>
    11a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11a6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11a9:	be 79 a9 19 61       	mov    $0x6119a979,%esi
    11ae:	e8 bd 01 00 00       	call   1370 <wm_xor_v2>
    11b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11b6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11b9:	be 89 59 89 7b       	mov    $0x7b895989,%esi
    11be:	e8 ad 01 00 00       	call   1370 <wm_xor_v2>
    11c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11c6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11c9:	be 49 d1 85 ef       	mov    $0xef85d149,%esi
    11ce:	e8 7d 01 00 00       	call   1350 <wm_add_v2>
    11d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11d6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11d9:	be a9 c9 bb 3b       	mov    $0x3bbbc9a9,%esi
    11de:	e8 6d 01 00 00       	call   1350 <wm_add_v2>
    11e3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11e6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11e9:	be 6f 11 6f ef       	mov    $0xef6f116f,%esi
    11ee:	e8 7d 01 00 00       	call   1370 <wm_xor_v2>
    11f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11f6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11f9:	be cf c5 a1 9f       	mov    $0x9fa1c5cf,%esi
    11fe:	e8 6d 01 00 00       	call   1370 <wm_xor_v2>
    1203:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1206:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1209:	be af fb 69 5f       	mov    $0x5f69fbaf,%esi
    120e:	e8 5d 01 00 00       	call   1370 <wm_xor_v2>
    1213:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1216:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1219:	be 93 e7 6d bf       	mov    $0xbf6de793,%esi
    121e:	e8 4d 01 00 00       	call   1370 <wm_xor_v2>
    1223:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1226:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1229:	be a9 c7 bd 69       	mov    $0x69bdc7a9,%esi
    122e:	e8 3d 01 00 00       	call   1370 <wm_xor_v2>
    1233:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1236:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1239:	be 75 b7 33 59       	mov    $0x5933b775,%esi
    123e:	e8 0d 01 00 00       	call   1350 <wm_add_v2>
    1243:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1246:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1249:	be 43 f5 d7 65       	mov    $0x65d7f543,%esi
    124e:	e8 fd 00 00 00       	call   1350 <wm_add_v2>
    1253:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1256:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1259:	be ad f9 25 65       	mov    $0x6525f9ad,%esi
    125e:	e8 ed 00 00 00       	call   1350 <wm_add_v2>
    1263:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1266:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1269:	be 69 ef 2b 2d       	mov    $0x2d2bef69,%esi
    126e:	e8 fd 00 00 00       	call   1370 <wm_xor_v2>
    1273:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1276:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1279:	be dd e9 cf 27       	mov    $0x27cfe9dd,%esi
    127e:	e8 cd 00 00 00       	call   1350 <wm_add_v2>
    1283:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1286:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1289:	be fd 53 c5 77       	mov    $0x77c553fd,%esi
    128e:	e8 bd 00 00 00       	call   1350 <wm_add_v2>
    1293:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1296:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1299:	be ed ab 63 b9       	mov    $0xb963abed,%esi
    129e:	e8 ad 00 00 00       	call   1350 <wm_add_v2>
    12a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12a6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12a9:	be a1 27 b5 77       	mov    $0x77b527a1,%esi
    12ae:	e8 bd 00 00 00       	call   1370 <wm_xor_v2>
    12b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12b6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12b9:	be fb 11 ad 47       	mov    $0x47ad11fb,%esi
    12be:	e8 ad 00 00 00       	call   1370 <wm_xor_v2>
    12c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12c6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12c9:	be 85 db 81 09       	mov    $0x981db85,%esi
    12ce:	e8 9d 00 00 00       	call   1370 <wm_xor_v2>
    12d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12d6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12d9:	be 8f 5d 75 7d       	mov    $0x7d755d8f,%esi
    12de:	e8 8d 00 00 00       	call   1370 <wm_xor_v2>
    12e3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12e6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12e9:	be 87 6f c1 cd       	mov    $0xcdc16f87,%esi
    12ee:	e8 5d 00 00 00       	call   1350 <wm_add_v2>
    12f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12f6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12f9:	be 59 09 23 d5       	mov    $0xd5230959,%esi
    12fe:	e8 4d 00 00 00       	call   1350 <wm_add_v2>
    1303:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1306:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1309:	83 f8 ff             	cmp    $0xffffffff,%eax
    130c:	75 09                	jne    1317 <main+0x1c7>
    130e:	c7 45 fc 61 00 00 00 	movl   $0x61,-0x4(%rbp)
    1315:	eb 26                	jmp    133d <main+0x1ed>
    1317:	e8 74 00 00 00       	call   1390 <run_contract>
    131c:	48 8b 05 a5 2c 00 00 	mov    0x2ca5(%rip),%rax        # 3fc8 <stdout@GLIBC_2.2.5>
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
    139f:	81 7d fc 00 00 01 00 	cmpl   $0x10000,-0x4(%rbp)
    13a6:	73 2d                	jae    13d5 <run_contract+0x45>
    13a8:	8b 4d fc             	mov    -0x4(%rbp),%ecx
    13ab:	83 e1 01             	and    $0x1,%ecx
    13ae:	31 ff                	xor    %edi,%edi
    13b0:	b8 01 00 00 00       	mov    $0x1,%eax
    13b5:	83 f9 00             	cmp    $0x0,%ecx
    13b8:	0f 44 f8             	cmove  %eax,%edi
    13bb:	48 8b 05 06 2c 00 00 	mov    0x2c06(%rip),%rax        # 3fc8 <stdout@GLIBC_2.2.5>
    13c2:	48 8b 30             	mov    (%rax),%rsi
    13c5:	e8 76 fc ff ff       	call   1040 <fputc@plt>
    13ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13cd:	83 c0 01             	add    $0x1,%eax
    13d0:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13d3:	eb ca                	jmp    139f <run_contract+0xf>
    13d5:	48 83 c4 10          	add    $0x10,%rsp
    13d9:	5d                   	pop    %rbp
    13da:	c3                   	ret

Disassembly of section .fini:

00000000000013dc <_fini>:
    13dc:	48 83 ec 08          	sub    $0x8,%rsp
    13e0:	48 83 c4 08          	add    $0x8,%rsp
    13e4:	c3                   	ret
