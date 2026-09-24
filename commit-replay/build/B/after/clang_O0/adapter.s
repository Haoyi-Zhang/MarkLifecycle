
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
    1169:	be 7d 21 75 fb       	mov    $0xfb75217d,%esi
    116e:	e8 fd 01 00 00       	call   1370 <wm_add_v2>
    1173:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1176:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1179:	be c1 17 3d f3       	mov    $0xf33d17c1,%esi
    117e:	e8 0d 02 00 00       	call   1390 <wm_xor_v2>
    1183:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1186:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1189:	be 2d b5 4b 37       	mov    $0x374bb52d,%esi
    118e:	e8 dd 01 00 00       	call   1370 <wm_add_v2>
    1193:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1196:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1199:	be df 4b f9 6b       	mov    $0x6bf94bdf,%esi
    119e:	e8 ed 01 00 00       	call   1390 <wm_xor_v2>
    11a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11a6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11a9:	be 1f 61 ad 71       	mov    $0x71ad611f,%esi
    11ae:	e8 dd 01 00 00       	call   1390 <wm_xor_v2>
    11b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11b6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11b9:	be f7 97 cd 25       	mov    $0x25cd97f7,%esi
    11be:	e8 cd 01 00 00       	call   1390 <wm_xor_v2>
    11c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11c6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11c9:	be 97 d1 2b 43       	mov    $0x432bd197,%esi
    11ce:	e8 9d 01 00 00       	call   1370 <wm_add_v2>
    11d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11d6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11d9:	be 5b 75 d1 bb       	mov    $0xbbd1755b,%esi
    11de:	e8 8d 01 00 00       	call   1370 <wm_add_v2>
    11e3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11e6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11e9:	be a1 17 b7 2b       	mov    $0x2bb717a1,%esi
    11ee:	e8 7d 01 00 00       	call   1370 <wm_add_v2>
    11f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11f6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11f9:	be 77 ad af 17       	mov    $0x17afad77,%esi
    11fe:	e8 6d 01 00 00       	call   1370 <wm_add_v2>
    1203:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1206:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1209:	be e9 39 25 95       	mov    $0x952539e9,%esi
    120e:	e8 7d 01 00 00       	call   1390 <wm_xor_v2>
    1213:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1216:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1219:	be f1 87 f1 0f       	mov    $0xff187f1,%esi
    121e:	e8 6d 01 00 00       	call   1390 <wm_xor_v2>
    1223:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1226:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1229:	be 29 21 17 43       	mov    $0x43172129,%esi
    122e:	e8 5d 01 00 00       	call   1390 <wm_xor_v2>
    1233:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1236:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1239:	be df 15 4b b9       	mov    $0xb94b15df,%esi
    123e:	e8 2d 01 00 00       	call   1370 <wm_add_v2>
    1243:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1246:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1249:	be f3 3b f9 9d       	mov    $0x9df93bf3,%esi
    124e:	e8 1d 01 00 00       	call   1370 <wm_add_v2>
    1253:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1256:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1259:	be 47 b3 8f 49       	mov    $0x498fb347,%esi
    125e:	e8 2d 01 00 00       	call   1390 <wm_xor_v2>
    1263:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1266:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1269:	be 2f 11 e1 19       	mov    $0x19e1112f,%esi
    126e:	e8 fd 00 00 00       	call   1370 <wm_add_v2>
    1273:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1276:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1279:	be 75 79 a3 35       	mov    $0x35a37975,%esi
    127e:	e8 0d 01 00 00       	call   1390 <wm_xor_v2>
    1283:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1286:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1289:	be b5 17 3f c7       	mov    $0xc73f17b5,%esi
    128e:	e8 dd 00 00 00       	call   1370 <wm_add_v2>
    1293:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1296:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1299:	be db 97 b7 3d       	mov    $0x3db797db,%esi
    129e:	e8 ed 00 00 00       	call   1390 <wm_xor_v2>
    12a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12a6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12a9:	be cf 5b 21 41       	mov    $0x41215bcf,%esi
    12ae:	e8 dd 00 00 00       	call   1390 <wm_xor_v2>
    12b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12b6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12b9:	be 0b 6f 21 fd       	mov    $0xfd216f0b,%esi
    12be:	e8 ad 00 00 00       	call   1370 <wm_add_v2>
    12c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12c6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12c9:	be 4d 65 29 39       	mov    $0x3929654d,%esi
    12ce:	e8 bd 00 00 00       	call   1390 <wm_xor_v2>
    12d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12d6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12d9:	be eb 63 05 77       	mov    $0x770563eb,%esi
    12de:	e8 8d 00 00 00       	call   1370 <wm_add_v2>
    12e3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12e6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12e9:	be b7 c3 a9 c7       	mov    $0xc7a9c3b7,%esi
    12ee:	e8 7d 00 00 00       	call   1370 <wm_add_v2>
    12f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12f6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12f9:	be eb 3d db 0b       	mov    $0xbdb3deb,%esi
    12fe:	e8 6d 00 00 00       	call   1370 <wm_add_v2>
    1303:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1306:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1309:	be c1 ff d5 d7       	mov    $0xd7d5ffc1,%esi
    130e:	e8 5d 00 00 00       	call   1370 <wm_add_v2>
    1313:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1316:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1319:	be 21 a9 71 77       	mov    $0x7771a921,%esi
    131e:	e8 6d 00 00 00       	call   1390 <wm_xor_v2>
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
    13b4:	48 83 ec 10          	sub    $0x10,%rsp
    13b8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    13bf:	81 7d fc 00 01 00 00 	cmpl   $0x100,-0x4(%rbp)
    13c6:	73 4d                	jae    1415 <run_contract+0x65>
    13c8:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    13cf:	81 7d f8 00 01 00 00 	cmpl   $0x100,-0x8(%rbp)
    13d6:	73 30                	jae    1408 <run_contract+0x58>
    13d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13db:	88 c1                	mov    %al,%cl
    13dd:	8b 45 f8             	mov    -0x8(%rbp),%eax
    13e0:	0f b6 f9             	movzbl %cl,%edi
    13e3:	0f b6 f0             	movzbl %al,%esi
    13e6:	e8 35 00 00 00       	call   1420 <patch_code>
    13eb:	0f b6 f8             	movzbl %al,%edi
    13ee:	48 8b 05 d3 2b 00 00 	mov    0x2bd3(%rip),%rax        # 3fc8 <stdout@GLIBC_2.2.5>
    13f5:	48 8b 30             	mov    (%rax),%rsi
    13f8:	e8 43 fc ff ff       	call   1040 <fputc@plt>
    13fd:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1400:	83 c0 01             	add    $0x1,%eax
    1403:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1406:	eb c7                	jmp    13cf <run_contract+0x1f>
    1408:	eb 00                	jmp    140a <run_contract+0x5a>
    140a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    140d:	83 c0 01             	add    $0x1,%eax
    1410:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1413:	eb aa                	jmp    13bf <run_contract+0xf>
    1415:	48 83 c4 10          	add    $0x10,%rsp
    1419:	5d                   	pop    %rbp
    141a:	c3                   	ret
    141b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001420 <patch_code>:
    1420:	55                   	push   %rbp
    1421:	48 89 e5             	mov    %rsp,%rbp
    1424:	40 88 f0             	mov    %sil,%al
    1427:	40 88 f9             	mov    %dil,%cl
    142a:	88 4d ff             	mov    %cl,-0x1(%rbp)
    142d:	88 45 fe             	mov    %al,-0x2(%rbp)
    1430:	c6 45 fd 00          	movb   $0x0,-0x3(%rbp)
    1434:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    143b:	83 7d f8 04          	cmpl   $0x4,-0x8(%rbp)
    143f:	0f 84 80 00 00 00    	je     14c5 <patch_code+0xa5>
    1445:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
    1449:	8b 4d f8             	mov    -0x8(%rbp),%ecx
    144c:	d1 e1                	shl    $1,%ecx
    144e:	d3 f8                	sar    %cl,%eax
    1450:	83 e0 03             	and    $0x3,%eax
    1453:	89 45 f4             	mov    %eax,-0xc(%rbp)
    1456:	0f b6 45 fe          	movzbl -0x2(%rbp),%eax
    145a:	8b 4d f8             	mov    -0x8(%rbp),%ecx
    145d:	d1 e1                	shl    $1,%ecx
    145f:	d3 f8                	sar    %cl,%eax
    1461:	83 e0 03             	and    $0x3,%eax
    1464:	89 45 f0             	mov    %eax,-0x10(%rbp)
    1467:	8b 45 f4             	mov    -0xc(%rbp),%eax
    146a:	3b 45 f0             	cmp    -0x10(%rbp),%eax
    146d:	75 09                	jne    1478 <patch_code+0x58>
    146f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    1476:	eb 29                	jmp    14a1 <patch_code+0x81>
    1478:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
    147c:	75 09                	jne    1487 <patch_code+0x67>
    147e:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%rbp)
    1485:	eb 18                	jmp    149f <patch_code+0x7f>
    1487:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
    148b:	75 09                	jne    1496 <patch_code+0x76>
    148d:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%rbp)
    1494:	eb 07                	jmp    149d <patch_code+0x7d>
    1496:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%rbp)
    149d:	eb 00                	jmp    149f <patch_code+0x7f>
    149f:	eb 00                	jmp    14a1 <patch_code+0x81>
    14a1:	8b 45 ec             	mov    -0x14(%rbp),%eax
    14a4:	8b 4d f8             	mov    -0x8(%rbp),%ecx
    14a7:	d1 e1                	shl    $1,%ecx
    14a9:	d3 e0                	shl    %cl,%eax
    14ab:	0f b6 c8             	movzbl %al,%ecx
    14ae:	0f b6 45 fd          	movzbl -0x3(%rbp),%eax
    14b2:	09 c8                	or     %ecx,%eax
    14b4:	88 45 fd             	mov    %al,-0x3(%rbp)
    14b7:	8b 45 f8             	mov    -0x8(%rbp),%eax
    14ba:	83 c0 01             	add    $0x1,%eax
    14bd:	89 45 f8             	mov    %eax,-0x8(%rbp)
    14c0:	e9 76 ff ff ff       	jmp    143b <patch_code+0x1b>
    14c5:	8a 45 fd             	mov    -0x3(%rbp),%al
    14c8:	5d                   	pop    %rbp
    14c9:	c3                   	ret

Disassembly of section .fini:

00000000000014cc <_fini>:
    14cc:	48 83 ec 08          	sub    $0x8,%rsp
    14d0:	48 83 c4 08          	add    $0x8,%rsp
    14d4:	c3                   	ret
