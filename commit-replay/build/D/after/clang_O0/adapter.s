
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
    1094:	48 8d 3d d5 00 00 00 	lea    0xd5(%rip),%rdi        # 1170 <main>
    109b:	ff 15 17 2f 00 00    	call   *0x2f17(%rip)        # 3fb8 <__libc_start_main@GLIBC_2.34>
    10a1:	f4                   	hlt
    10a2:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    10ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000010b0 <deregister_tm_clones>:
    10b0:	48 8d 3d 79 2f 00 00 	lea    0x2f79(%rip),%rdi        # 4030 <__TMC_END__>
    10b7:	48 8d 05 72 2f 00 00 	lea    0x2f72(%rip),%rax        # 4030 <__TMC_END__>
    10be:	48 39 f8             	cmp    %rdi,%rax
    10c1:	74 15                	je     10d8 <deregister_tm_clones+0x28>
    10c3:	48 8b 05 f6 2e 00 00 	mov    0x2ef6(%rip),%rax        # 3fc0 <_ITM_deregisterTMCloneTable@Base>
    10ca:	48 85 c0             	test   %rax,%rax
    10cd:	74 09                	je     10d8 <deregister_tm_clones+0x28>
    10cf:	ff e0                	jmp    *%rax
    10d1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10d8:	c3                   	ret
    10d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010e0 <register_tm_clones>:
    10e0:	48 8d 3d 49 2f 00 00 	lea    0x2f49(%rip),%rdi        # 4030 <__TMC_END__>
    10e7:	48 8d 35 42 2f 00 00 	lea    0x2f42(%rip),%rsi        # 4030 <__TMC_END__>
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
    1124:	80 3d 05 2f 00 00 00 	cmpb   $0x0,0x2f05(%rip)        # 4030 <__TMC_END__>
    112b:	75 2b                	jne    1158 <__do_global_dtors_aux+0x38>
    112d:	55                   	push   %rbp
    112e:	48 83 3d aa 2e 00 00 00 	cmpq   $0x0,0x2eaa(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1136:	48 89 e5             	mov    %rsp,%rbp
    1139:	74 0c                	je     1147 <__do_global_dtors_aux+0x27>
    113b:	48 8b 3d e6 2e 00 00 	mov    0x2ee6(%rip),%rdi        # 4028 <__dso_handle>
    1142:	e8 29 ff ff ff       	call   1070 <__cxa_finalize@plt>
    1147:	e8 64 ff ff ff       	call   10b0 <deregister_tm_clones>
    114c:	c6 05 dd 2e 00 00 01 	movb   $0x1,0x2edd(%rip)        # 4030 <__TMC_END__>
    1153:	5d                   	pop    %rbp
    1154:	c3                   	ret
    1155:	0f 1f 00             	nopl   (%rax)
    1158:	c3                   	ret
    1159:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001160 <frame_dummy>:
    1160:	f3 0f 1e fa          	endbr64
    1164:	e9 77 ff ff ff       	jmp    10e0 <register_tm_clones>
    1169:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001170 <main>:
    1170:	55                   	push   %rbp
    1171:	48 89 e5             	mov    %rsp,%rbp
    1174:	48 83 ec 10          	sub    $0x10,%rsp
    1178:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    117f:	c7 45 f8 f5 79 2b 6d 	movl   $0x6d2b79f5,-0x8(%rbp)
    1186:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1189:	be a3 25 c1 bf       	mov    $0xbfc125a3,%esi
    118e:	e8 fd 01 00 00       	call   1390 <wm_add_v2>
    1193:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1196:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1199:	be ad 9b b9 b1       	mov    $0xb1b99bad,%esi
    119e:	e8 ed 01 00 00       	call   1390 <wm_add_v2>
    11a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11a6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11a9:	be df 57 2f 53       	mov    $0x532f57df,%esi
    11ae:	e8 dd 01 00 00       	call   1390 <wm_add_v2>
    11b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11b6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11b9:	be b9 5f 0f 37       	mov    $0x370f5fb9,%esi
    11be:	e8 cd 01 00 00       	call   1390 <wm_add_v2>
    11c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11c6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11c9:	be c5 37 a1 e1       	mov    $0xe1a137c5,%esi
    11ce:	e8 bd 01 00 00       	call   1390 <wm_add_v2>
    11d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11d6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11d9:	be 4d 8b bd c1       	mov    $0xc1bd8b4d,%esi
    11de:	e8 cd 01 00 00       	call   13b0 <wm_xor_v2>
    11e3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11e6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11e9:	be 11 05 bb 27       	mov    $0x27bb0511,%esi
    11ee:	e8 bd 01 00 00       	call   13b0 <wm_xor_v2>
    11f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11f6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11f9:	be 0f 95 8d a7       	mov    $0xa78d950f,%esi
    11fe:	e8 8d 01 00 00       	call   1390 <wm_add_v2>
    1203:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1206:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1209:	be 25 dd b3 73       	mov    $0x73b3dd25,%esi
    120e:	e8 9d 01 00 00       	call   13b0 <wm_xor_v2>
    1213:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1216:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1219:	be 9d c7 bf f3       	mov    $0xf3bfc79d,%esi
    121e:	e8 8d 01 00 00       	call   13b0 <wm_xor_v2>
    1223:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1226:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1229:	be 63 63 e3 93       	mov    $0x93e36363,%esi
    122e:	e8 5d 01 00 00       	call   1390 <wm_add_v2>
    1233:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1236:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1239:	be a1 d5 8d fd       	mov    $0xfd8dd5a1,%esi
    123e:	e8 4d 01 00 00       	call   1390 <wm_add_v2>
    1243:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1246:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1249:	be eb 67 3b c9       	mov    $0xc93b67eb,%esi
    124e:	e8 3d 01 00 00       	call   1390 <wm_add_v2>
    1253:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1256:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1259:	be 99 b3 fd c7       	mov    $0xc7fdb399,%esi
    125e:	e8 4d 01 00 00       	call   13b0 <wm_xor_v2>
    1263:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1266:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1269:	be d1 fd d1 19       	mov    $0x19d1fdd1,%esi
    126e:	e8 3d 01 00 00       	call   13b0 <wm_xor_v2>
    1273:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1276:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1279:	be 8b c3 5d b1       	mov    $0xb15dc38b,%esi
    127e:	e8 2d 01 00 00       	call   13b0 <wm_xor_v2>
    1283:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1286:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1289:	be 9b 81 e7 61       	mov    $0x61e7819b,%esi
    128e:	e8 fd 00 00 00       	call   1390 <wm_add_v2>
    1293:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1296:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1299:	be b7 8f 39 21       	mov    $0x21398fb7,%esi
    129e:	e8 ed 00 00 00       	call   1390 <wm_add_v2>
    12a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12a6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12a9:	be 7b 83 3d c7       	mov    $0xc73d837b,%esi
    12ae:	e8 dd 00 00 00       	call   1390 <wm_add_v2>
    12b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12b6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12b9:	be eb 15 cb e7       	mov    $0xe7cb15eb,%esi
    12be:	e8 ed 00 00 00       	call   13b0 <wm_xor_v2>
    12c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12c6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12c9:	be b9 e9 fd cd       	mov    $0xcdfde9b9,%esi
    12ce:	e8 bd 00 00 00       	call   1390 <wm_add_v2>
    12d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12d6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12d9:	be 31 d5 01 3b       	mov    $0x3b01d531,%esi
    12de:	e8 ad 00 00 00       	call   1390 <wm_add_v2>
    12e3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12e6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12e9:	be d3 bb 7d 99       	mov    $0x997dbbd3,%esi
    12ee:	e8 9d 00 00 00       	call   1390 <wm_add_v2>
    12f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12f6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12f9:	be 35 af fb eb       	mov    $0xebfbaf35,%esi
    12fe:	e8 8d 00 00 00       	call   1390 <wm_add_v2>
    1303:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1306:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1309:	be b1 b7 85 03       	mov    $0x385b7b1,%esi
    130e:	e8 7d 00 00 00       	call   1390 <wm_add_v2>
    1313:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1316:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1319:	be 07 85 57 ad       	mov    $0xad578507,%esi
    131e:	e8 8d 00 00 00       	call   13b0 <wm_xor_v2>
    1323:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1326:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1329:	be 23 1d ad d7       	mov    $0xd7ad1d23,%esi
    132e:	e8 5d 00 00 00       	call   1390 <wm_add_v2>
    1333:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1336:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1339:	be 79 33 c1 ad       	mov    $0xadc13379,%esi
    133e:	e8 6d 00 00 00       	call   13b0 <wm_xor_v2>
    1343:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1346:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1349:	83 f8 ff             	cmp    $0xffffffff,%eax
    134c:	75 09                	jne    1357 <main+0x1e7>
    134e:	c7 45 fc 61 00 00 00 	movl   $0x61,-0x4(%rbp)
    1355:	eb 26                	jmp    137d <main+0x20d>
    1357:	e8 74 00 00 00       	call   13d0 <run_contract>
    135c:	48 8b 05 65 2c 00 00 	mov    0x2c65(%rip),%rax        # 3fc8 <stdout@GLIBC_2.2.5>
    1363:	48 8b 38             	mov    (%rax),%rdi
    1366:	e8 c5 fc ff ff       	call   1030 <ferror@plt>
    136b:	89 c2                	mov    %eax,%edx
    136d:	31 c0                	xor    %eax,%eax
    136f:	b9 02 00 00 00       	mov    $0x2,%ecx
    1374:	83 fa 00             	cmp    $0x0,%edx
    1377:	0f 45 c1             	cmovne %ecx,%eax
    137a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    137d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1380:	48 83 c4 10          	add    $0x10,%rsp
    1384:	5d                   	pop    %rbp
    1385:	c3                   	ret
    1386:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

0000000000001390 <wm_add_v2>:
    1390:	55                   	push   %rbp
    1391:	48 89 e5             	mov    %rsp,%rbp
    1394:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1397:	89 75 f8             	mov    %esi,-0x8(%rbp)
    139a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    139d:	2b 45 f8             	sub    -0x8(%rbp),%eax
    13a0:	03 45 f8             	add    -0x8(%rbp),%eax
    13a3:	5d                   	pop    %rbp
    13a4:	c3                   	ret
    13a5:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)

00000000000013b0 <wm_xor_v2>:
    13b0:	55                   	push   %rbp
    13b1:	48 89 e5             	mov    %rsp,%rbp
    13b4:	89 7d fc             	mov    %edi,-0x4(%rbp)
    13b7:	89 75 f8             	mov    %esi,-0x8(%rbp)
    13ba:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13bd:	8b 4d f8             	mov    -0x8(%rbp),%ecx
    13c0:	33 4d f8             	xor    -0x8(%rbp),%ecx
    13c3:	31 c8                	xor    %ecx,%eax
    13c5:	5d                   	pop    %rbp
    13c6:	c3                   	ret
    13c7:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

00000000000013d0 <run_contract>:
    13d0:	55                   	push   %rbp
    13d1:	48 89 e5             	mov    %rsp,%rbp
    13d4:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
    13db:	48 c7 85 68 ff ff ff 00 00 00 00 	movq   $0x0,-0x98(%rbp)
    13e6:	48 83 bd 68 ff ff ff 40 	cmpq   $0x40,-0x98(%rbp)
    13ee:	73 33                	jae    1423 <run_contract+0x53>
    13f0:	48 6b 85 68 ff ff ff 25 	imul   $0x25,-0x98(%rbp),%rax
    13f8:	48 83 c0 0b          	add    $0xb,%rax
    13fc:	48 25 ff 00 00 00    	and    $0xff,%rax
    1402:	88 c1                	mov    %al,%cl
    1404:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
    140b:	88 4c 05 c0          	mov    %cl,-0x40(%rbp,%rax,1)
    140f:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
    1416:	48 83 c0 01          	add    $0x1,%rax
    141a:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
    1421:	eb c3                	jmp    13e6 <run_contract+0x16>
    1423:	48 c7 85 60 ff ff ff 00 00 00 00 	movq   $0x0,-0xa0(%rbp)
    142e:	48 83 bd 60 ff ff ff 40 	cmpq   $0x40,-0xa0(%rbp)
    1436:	0f 87 8d 00 00 00    	ja     14c9 <run_contract+0xf9>
    143c:	48 8d bd 70 ff ff ff 	lea    -0x90(%rbp),%rdi
    1443:	be a5 00 00 00       	mov    $0xa5,%esi
    1448:	ba 41 00 00 00       	mov    $0x41,%edx
    144d:	e8 ee fb ff ff       	call   1040 <memset@plt>
    1452:	48 8d bd 70 ff ff ff 	lea    -0x90(%rbp),%rdi
    1459:	48 8d 75 c0          	lea    -0x40(%rbp),%rsi
    145d:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
    1464:	e8 e7 fb ff ff       	call   1050 <memcpy@plt>
    1469:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
    1470:	c6 84 05 70 ff ff ff 00 	movb   $0x0,-0x90(%rbp,%rax,1)
    1478:	48 8d bd 70 ff ff ff 	lea    -0x90(%rbp),%rdi
    147f:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
    1486:	48 83 c2 01          	add    $0x1,%rdx
    148a:	48 8b 05 37 2b 00 00 	mov    0x2b37(%rip),%rax        # 3fc8 <stdout@GLIBC_2.2.5>
    1491:	48 8b 08             	mov    (%rax),%rcx
    1494:	be 01 00 00 00       	mov    $0x1,%esi
    1499:	e8 c2 fb ff ff       	call   1060 <fwrite@plt>
    149e:	48 8b 8d 60 ff ff ff 	mov    -0xa0(%rbp),%rcx
    14a5:	48 83 c1 01          	add    $0x1,%rcx
    14a9:	48 39 c8             	cmp    %rcx,%rax
    14ac:	74 02                	je     14b0 <run_contract+0xe0>
    14ae:	eb 19                	jmp    14c9 <run_contract+0xf9>
    14b0:	eb 00                	jmp    14b2 <run_contract+0xe2>
    14b2:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
    14b9:	48 83 c0 01          	add    $0x1,%rax
    14bd:	48 89 85 60 ff ff ff 	mov    %rax,-0xa0(%rbp)
    14c4:	e9 65 ff ff ff       	jmp    142e <run_contract+0x5e>
    14c9:	48 81 c4 a0 00 00 00 	add    $0xa0,%rsp
    14d0:	5d                   	pop    %rbp
    14d1:	c3                   	ret

Disassembly of section .fini:

00000000000014d4 <_fini>:
    14d4:	48 83 ec 08          	sub    $0x8,%rsp
    14d8:	48 83 c4 08          	add    $0x8,%rsp
    14dc:	c3                   	ret
