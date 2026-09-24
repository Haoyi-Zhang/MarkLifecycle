
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
    1084:	48 8d 3d d5 00 00 00 	lea    0xd5(%rip),%rdi        # 1160 <main>
    108b:	ff 15 27 2f 00 00    	call   *0x2f27(%rip)        # 3fb8 <__libc_start_main@GLIBC_2.34>
    1091:	f4                   	hlt
    1092:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    109c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000010a0 <deregister_tm_clones>:
    10a0:	48 8d 3d 81 2f 00 00 	lea    0x2f81(%rip),%rdi        # 4028 <__TMC_END__>
    10a7:	48 8d 05 7a 2f 00 00 	lea    0x2f7a(%rip),%rax        # 4028 <__TMC_END__>
    10ae:	48 39 f8             	cmp    %rdi,%rax
    10b1:	74 15                	je     10c8 <deregister_tm_clones+0x28>
    10b3:	48 8b 05 06 2f 00 00 	mov    0x2f06(%rip),%rax        # 3fc0 <_ITM_deregisterTMCloneTable@Base>
    10ba:	48 85 c0             	test   %rax,%rax
    10bd:	74 09                	je     10c8 <deregister_tm_clones+0x28>
    10bf:	ff e0                	jmp    *%rax
    10c1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10c8:	c3                   	ret
    10c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010d0 <register_tm_clones>:
    10d0:	48 8d 3d 51 2f 00 00 	lea    0x2f51(%rip),%rdi        # 4028 <__TMC_END__>
    10d7:	48 8d 35 4a 2f 00 00 	lea    0x2f4a(%rip),%rsi        # 4028 <__TMC_END__>
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
    1114:	80 3d 0d 2f 00 00 00 	cmpb   $0x0,0x2f0d(%rip)        # 4028 <__TMC_END__>
    111b:	75 2b                	jne    1148 <__do_global_dtors_aux+0x38>
    111d:	55                   	push   %rbp
    111e:	48 83 3d ba 2e 00 00 00 	cmpq   $0x0,0x2eba(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1126:	48 89 e5             	mov    %rsp,%rbp
    1129:	74 0c                	je     1137 <__do_global_dtors_aux+0x27>
    112b:	48 8b 3d ee 2e 00 00 	mov    0x2eee(%rip),%rdi        # 4020 <__dso_handle>
    1132:	e8 29 ff ff ff       	call   1060 <__cxa_finalize@plt>
    1137:	e8 64 ff ff ff       	call   10a0 <deregister_tm_clones>
    113c:	c6 05 e5 2e 00 00 01 	movb   $0x1,0x2ee5(%rip)        # 4028 <__TMC_END__>
    1143:	5d                   	pop    %rbp
    1144:	c3                   	ret
    1145:	0f 1f 00             	nopl   (%rax)
    1148:	c3                   	ret
    1149:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001150 <frame_dummy>:
    1150:	f3 0f 1e fa          	endbr64
    1154:	e9 77 ff ff ff       	jmp    10d0 <register_tm_clones>
    1159:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001160 <main>:
    1160:	55                   	push   %rbp
    1161:	48 89 e5             	mov    %rsp,%rbp
    1164:	48 83 ec 10          	sub    $0x10,%rsp
    1168:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    116f:	c7 45 f8 f5 79 2b 6d 	movl   $0x6d2b79f5,-0x8(%rbp)
    1176:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1179:	be a3 25 c1 bf       	mov    $0xbfc125a3,%esi
    117e:	e8 fd 01 00 00       	call   1380 <wm_add_v1>
    1183:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1186:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1189:	be 07 85 57 ad       	mov    $0xad578507,%esi
    118e:	e8 0d 02 00 00       	call   13a0 <wm_xor_v1>
    1193:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1196:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1199:	be d3 bb 7d 99       	mov    $0x997dbbd3,%esi
    119e:	e8 dd 01 00 00       	call   1380 <wm_add_v1>
    11a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11a6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11a9:	be eb 15 cb e7       	mov    $0xe7cb15eb,%esi
    11ae:	e8 ed 01 00 00       	call   13a0 <wm_xor_v1>
    11b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11b6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11b9:	be 9b 81 e7 61       	mov    $0x61e7819b,%esi
    11be:	e8 bd 01 00 00       	call   1380 <wm_add_v1>
    11c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11c6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11c9:	be 99 b3 fd c7       	mov    $0xc7fdb399,%esi
    11ce:	e8 cd 01 00 00       	call   13a0 <wm_xor_v1>
    11d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11d6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11d9:	be 63 63 e3 93       	mov    $0x93e36363,%esi
    11de:	e8 9d 01 00 00       	call   1380 <wm_add_v1>
    11e3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11e6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11e9:	be 0f 95 8d a7       	mov    $0xa78d950f,%esi
    11ee:	e8 8d 01 00 00       	call   1380 <wm_add_v1>
    11f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11f6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11f9:	be c5 37 a1 e1       	mov    $0xe1a137c5,%esi
    11fe:	e8 7d 01 00 00       	call   1380 <wm_add_v1>
    1203:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1206:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1209:	be ad 9b b9 b1       	mov    $0xb1b99bad,%esi
    120e:	e8 6d 01 00 00       	call   1380 <wm_add_v1>
    1213:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1216:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1219:	be 23 1d ad d7       	mov    $0xd7ad1d23,%esi
    121e:	e8 5d 01 00 00       	call   1380 <wm_add_v1>
    1223:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1226:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1229:	be 35 af fb eb       	mov    $0xebfbaf35,%esi
    122e:	e8 4d 01 00 00       	call   1380 <wm_add_v1>
    1233:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1236:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1239:	be b9 e9 fd cd       	mov    $0xcdfde9b9,%esi
    123e:	e8 3d 01 00 00       	call   1380 <wm_add_v1>
    1243:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1246:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1249:	be b7 8f 39 21       	mov    $0x21398fb7,%esi
    124e:	e8 2d 01 00 00       	call   1380 <wm_add_v1>
    1253:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1256:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1259:	be d1 fd d1 19       	mov    $0x19d1fdd1,%esi
    125e:	e8 3d 01 00 00       	call   13a0 <wm_xor_v1>
    1263:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1266:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1269:	be a1 d5 8d fd       	mov    $0xfd8dd5a1,%esi
    126e:	e8 0d 01 00 00       	call   1380 <wm_add_v1>
    1273:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1276:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1279:	be 25 dd b3 73       	mov    $0x73b3dd25,%esi
    127e:	e8 1d 01 00 00       	call   13a0 <wm_xor_v1>
    1283:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1286:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1289:	be 4d 8b bd c1       	mov    $0xc1bd8b4d,%esi
    128e:	e8 0d 01 00 00       	call   13a0 <wm_xor_v1>
    1293:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1296:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1299:	be df 57 2f 53       	mov    $0x532f57df,%esi
    129e:	e8 dd 00 00 00       	call   1380 <wm_add_v1>
    12a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12a6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12a9:	be 79 33 c1 ad       	mov    $0xadc13379,%esi
    12ae:	e8 ed 00 00 00       	call   13a0 <wm_xor_v1>
    12b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12b6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12b9:	be b1 b7 85 03       	mov    $0x385b7b1,%esi
    12be:	e8 bd 00 00 00       	call   1380 <wm_add_v1>
    12c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12c6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12c9:	be 31 d5 01 3b       	mov    $0x3b01d531,%esi
    12ce:	e8 ad 00 00 00       	call   1380 <wm_add_v1>
    12d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12d6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12d9:	be 7b 83 3d c7       	mov    $0xc73d837b,%esi
    12de:	e8 9d 00 00 00       	call   1380 <wm_add_v1>
    12e3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12e6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12e9:	be 8b c3 5d b1       	mov    $0xb15dc38b,%esi
    12ee:	e8 ad 00 00 00       	call   13a0 <wm_xor_v1>
    12f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12f6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12f9:	be eb 67 3b c9       	mov    $0xc93b67eb,%esi
    12fe:	e8 7d 00 00 00       	call   1380 <wm_add_v1>
    1303:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1306:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1309:	be 9d c7 bf f3       	mov    $0xf3bfc79d,%esi
    130e:	e8 8d 00 00 00       	call   13a0 <wm_xor_v1>
    1313:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1316:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1319:	be 11 05 bb 27       	mov    $0x27bb0511,%esi
    131e:	e8 7d 00 00 00       	call   13a0 <wm_xor_v1>
    1323:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1326:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1329:	be b9 5f 0f 37       	mov    $0x370f5fb9,%esi
    132e:	e8 4d 00 00 00       	call   1380 <wm_add_v1>
    1333:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1336:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1339:	83 f8 ff             	cmp    $0xffffffff,%eax
    133c:	75 09                	jne    1347 <main+0x1e7>
    133e:	c7 45 fc 61 00 00 00 	movl   $0x61,-0x4(%rbp)
    1345:	eb 26                	jmp    136d <main+0x20d>
    1347:	e8 74 00 00 00       	call   13c0 <run_contract>
    134c:	48 8b 05 75 2c 00 00 	mov    0x2c75(%rip),%rax        # 3fc8 <stdout@GLIBC_2.2.5>
    1353:	48 8b 38             	mov    (%rax),%rdi
    1356:	e8 d5 fc ff ff       	call   1030 <ferror@plt>
    135b:	89 c2                	mov    %eax,%edx
    135d:	31 c0                	xor    %eax,%eax
    135f:	b9 02 00 00 00       	mov    $0x2,%ecx
    1364:	83 fa 00             	cmp    $0x0,%edx
    1367:	0f 45 c1             	cmovne %ecx,%eax
    136a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    136d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1370:	48 83 c4 10          	add    $0x10,%rsp
    1374:	5d                   	pop    %rbp
    1375:	c3                   	ret
    1376:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

0000000000001380 <wm_add_v1>:
    1380:	55                   	push   %rbp
    1381:	48 89 e5             	mov    %rsp,%rbp
    1384:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1387:	89 75 f8             	mov    %esi,-0x8(%rbp)
    138a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    138d:	03 45 f8             	add    -0x8(%rbp),%eax
    1390:	2b 45 f8             	sub    -0x8(%rbp),%eax
    1393:	5d                   	pop    %rbp
    1394:	c3                   	ret
    1395:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)

00000000000013a0 <wm_xor_v1>:
    13a0:	55                   	push   %rbp
    13a1:	48 89 e5             	mov    %rsp,%rbp
    13a4:	89 7d fc             	mov    %edi,-0x4(%rbp)
    13a7:	89 75 f8             	mov    %esi,-0x8(%rbp)
    13aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13ad:	33 45 f8             	xor    -0x8(%rbp),%eax
    13b0:	33 45 f8             	xor    -0x8(%rbp),%eax
    13b3:	5d                   	pop    %rbp
    13b4:	c3                   	ret
    13b5:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)

00000000000013c0 <run_contract>:
    13c0:	55                   	push   %rbp
    13c1:	48 89 e5             	mov    %rsp,%rbp
    13c4:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
    13cb:	48 c7 85 68 ff ff ff 00 00 00 00 	movq   $0x0,-0x98(%rbp)
    13d6:	48 83 bd 68 ff ff ff 40 	cmpq   $0x40,-0x98(%rbp)
    13de:	73 33                	jae    1413 <run_contract+0x53>
    13e0:	48 6b 85 68 ff ff ff 25 	imul   $0x25,-0x98(%rbp),%rax
    13e8:	48 83 c0 0b          	add    $0xb,%rax
    13ec:	48 25 ff 00 00 00    	and    $0xff,%rax
    13f2:	88 c1                	mov    %al,%cl
    13f4:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
    13fb:	88 4c 05 c0          	mov    %cl,-0x40(%rbp,%rax,1)
    13ff:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
    1406:	48 83 c0 01          	add    $0x1,%rax
    140a:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
    1411:	eb c3                	jmp    13d6 <run_contract+0x16>
    1413:	48 c7 85 60 ff ff ff 00 00 00 00 	movq   $0x0,-0xa0(%rbp)
    141e:	48 83 bd 60 ff ff ff 40 	cmpq   $0x40,-0xa0(%rbp)
    1426:	0f 87 a2 00 00 00    	ja     14ce <run_contract+0x10e>
    142c:	48 8d bd 70 ff ff ff 	lea    -0x90(%rbp),%rdi
    1433:	be a5 00 00 00       	mov    $0xa5,%esi
    1438:	ba 41 00 00 00       	mov    $0x41,%edx
    143d:	e8 fe fb ff ff       	call   1040 <memset@plt>
    1442:	48 c7 85 58 ff ff ff 00 00 00 00 	movq   $0x0,-0xa8(%rbp)
    144d:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
    1454:	48 3b 85 60 ff ff ff 	cmp    -0xa0(%rbp),%rax
    145b:	73 2d                	jae    148a <run_contract+0xca>
    145d:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
    1464:	8a 4c 05 c0          	mov    -0x40(%rbp,%rax,1),%cl
    1468:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
    146f:	88 8c 05 70 ff ff ff 	mov    %cl,-0x90(%rbp,%rax,1)
    1476:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
    147d:	48 83 c0 01          	add    $0x1,%rax
    1481:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
    1488:	eb c3                	jmp    144d <run_contract+0x8d>
    148a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
    1491:	c6 84 05 70 ff ff ff 00 	movb   $0x0,-0x90(%rbp,%rax,1)
    1499:	48 8d bd 70 ff ff ff 	lea    -0x90(%rbp),%rdi
    14a0:	48 8b b5 60 ff ff ff 	mov    -0xa0(%rbp),%rsi
    14a7:	48 83 c6 01          	add    $0x1,%rsi
    14ab:	e8 a0 00 00 00       	call   1550 <hash_bytes>
    14b0:	89 c7                	mov    %eax,%edi
    14b2:	e8 29 00 00 00       	call   14e0 <emit_u32>
    14b7:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
    14be:	48 83 c0 01          	add    $0x1,%rax
    14c2:	48 89 85 60 ff ff ff 	mov    %rax,-0xa0(%rbp)
    14c9:	e9 50 ff ff ff       	jmp    141e <run_contract+0x5e>
    14ce:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
    14d5:	5d                   	pop    %rbp
    14d6:	c3                   	ret
    14d7:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

00000000000014e0 <emit_u32>:
    14e0:	55                   	push   %rbp
    14e1:	48 89 e5             	mov    %rsp,%rbp
    14e4:	48 83 ec 10          	sub    $0x10,%rsp
    14e8:	89 7d fc             	mov    %edi,-0x4(%rbp)
    14eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14ee:	25 ff 00 00 00       	and    $0xff,%eax
    14f3:	88 45 f8             	mov    %al,-0x8(%rbp)
    14f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14f9:	c1 e8 08             	shr    $0x8,%eax
    14fc:	25 ff 00 00 00       	and    $0xff,%eax
    1501:	88 45 f9             	mov    %al,-0x7(%rbp)
    1504:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1507:	c1 e8 10             	shr    $0x10,%eax
    150a:	25 ff 00 00 00       	and    $0xff,%eax
    150f:	88 45 fa             	mov    %al,-0x6(%rbp)
    1512:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1515:	c1 e8 18             	shr    $0x18,%eax
    1518:	25 ff 00 00 00       	and    $0xff,%eax
    151d:	88 45 fb             	mov    %al,-0x5(%rbp)
    1520:	48 8d 7d f8          	lea    -0x8(%rbp),%rdi
    1524:	48 8b 05 9d 2a 00 00 	mov    0x2a9d(%rip),%rax        # 3fc8 <stdout@GLIBC_2.2.5>
    152b:	48 8b 08             	mov    (%rax),%rcx
    152e:	be 01 00 00 00       	mov    $0x1,%esi
    1533:	ba 04 00 00 00       	mov    $0x4,%edx
    1538:	e8 13 fb ff ff       	call   1050 <fwrite@plt>
    153d:	48 83 c4 10          	add    $0x10,%rsp
    1541:	5d                   	pop    %rbp
    1542:	c3                   	ret
    1543:	66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)

0000000000001550 <hash_bytes>:
    1550:	55                   	push   %rbp
    1551:	48 89 e5             	mov    %rsp,%rbp
    1554:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1558:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    155c:	c7 45 ec c5 9d 1c 81 	movl   $0x811c9dc5,-0x14(%rbp)
    1563:	48 c7 45 e0 00 00 00 00 	movq   $0x0,-0x20(%rbp)
    156b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    156f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
    1573:	73 2a                	jae    159f <hash_bytes+0x4f>
    1575:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1579:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    157d:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
    1581:	33 45 ec             	xor    -0x14(%rbp),%eax
    1584:	89 45 ec             	mov    %eax,-0x14(%rbp)
    1587:	69 45 ec 93 01 00 01 	imul   $0x1000193,-0x14(%rbp),%eax
    158e:	89 45 ec             	mov    %eax,-0x14(%rbp)
    1591:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1595:	48 83 c0 01          	add    $0x1,%rax
    1599:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    159d:	eb cc                	jmp    156b <hash_bytes+0x1b>
    159f:	8b 45 ec             	mov    -0x14(%rbp),%eax
    15a2:	5d                   	pop    %rbp
    15a3:	c3                   	ret

Disassembly of section .fini:

00000000000015a4 <_fini>:
    15a4:	48 83 ec 08          	sub    $0x8,%rsp
    15a8:	48 83 c4 08          	add    $0x8,%rsp
    15ac:	c3                   	ret
