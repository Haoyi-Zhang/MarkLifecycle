
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

0000000000001040 <strlen@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4008 <strlen@GLIBC_2.2.5>
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
    1179:	be 65 ff 17 37       	mov    $0x3717ff65,%esi
    117e:	e8 dd 01 00 00       	call   1360 <wm_add_v2>
    1183:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1186:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1189:	be 9d 6b 63 87       	mov    $0x87636b9d,%esi
    118e:	e8 ed 01 00 00       	call   1380 <wm_xor_v2>
    1193:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1196:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1199:	be c9 a1 b1 67       	mov    $0x67b1a1c9,%esi
    119e:	e8 dd 01 00 00       	call   1380 <wm_xor_v2>
    11a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11a6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11a9:	be df 73 e3 2b       	mov    $0x2be373df,%esi
    11ae:	e8 ad 01 00 00       	call   1360 <wm_add_v2>
    11b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11b6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11b9:	be 4f df 3b 5b       	mov    $0x5b3bdf4f,%esi
    11be:	e8 bd 01 00 00       	call   1380 <wm_xor_v2>
    11c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11c6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11c9:	be 01 85 b3 3f       	mov    $0x3fb38501,%esi
    11ce:	e8 ad 01 00 00       	call   1380 <wm_xor_v2>
    11d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11d6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11d9:	be b7 d3 a7 0f       	mov    $0xfa7d3b7,%esi
    11de:	e8 9d 01 00 00       	call   1380 <wm_xor_v2>
    11e3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11e6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11e9:	be 29 4f 1b af       	mov    $0xaf1b4f29,%esi
    11ee:	e8 8d 01 00 00       	call   1380 <wm_xor_v2>
    11f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11f6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    11f9:	be dd 1b 11 af       	mov    $0xaf111bdd,%esi
    11fe:	e8 7d 01 00 00       	call   1380 <wm_xor_v2>
    1203:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1206:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1209:	be f7 71 15 8d       	mov    $0x8d1571f7,%esi
    120e:	e8 4d 01 00 00       	call   1360 <wm_add_v2>
    1213:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1216:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1219:	be 5d fd 37 e5       	mov    $0xe537fd5d,%esi
    121e:	e8 3d 01 00 00       	call   1360 <wm_add_v2>
    1223:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1226:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1229:	be 79 67 a1 67       	mov    $0x67a16779,%esi
    122e:	e8 2d 01 00 00       	call   1360 <wm_add_v2>
    1233:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1236:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1239:	be 4d 83 1d a9       	mov    $0xa91d834d,%esi
    123e:	e8 3d 01 00 00       	call   1380 <wm_xor_v2>
    1243:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1246:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1249:	be 39 bd 65 5d       	mov    $0x5d65bd39,%esi
    124e:	e8 2d 01 00 00       	call   1380 <wm_xor_v2>
    1253:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1256:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1259:	be dd 13 ff 5b       	mov    $0x5bff13dd,%esi
    125e:	e8 1d 01 00 00       	call   1380 <wm_xor_v2>
    1263:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1266:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1269:	be 99 13 81 33       	mov    $0x33811399,%esi
    126e:	e8 ed 00 00 00       	call   1360 <wm_add_v2>
    1273:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1276:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1279:	be af f7 ab 85       	mov    $0x85abf7af,%esi
    127e:	e8 fd 00 00 00       	call   1380 <wm_xor_v2>
    1283:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1286:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1289:	be 8b 05 89 69       	mov    $0x6989058b,%esi
    128e:	e8 cd 00 00 00       	call   1360 <wm_add_v2>
    1293:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1296:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1299:	be 01 49 41 eb       	mov    $0xeb414901,%esi
    129e:	e8 dd 00 00 00       	call   1380 <wm_xor_v2>
    12a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12a6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12a9:	be 3b 9d 8b 81       	mov    $0x818b9d3b,%esi
    12ae:	e8 ad 00 00 00       	call   1360 <wm_add_v2>
    12b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12b6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12b9:	be 25 f3 e5 61       	mov    $0x61e5f325,%esi
    12be:	e8 9d 00 00 00       	call   1360 <wm_add_v2>
    12c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12c6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12c9:	be f5 a9 1b b5       	mov    $0xb51ba9f5,%esi
    12ce:	e8 ad 00 00 00       	call   1380 <wm_xor_v2>
    12d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12d6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12d9:	be 0d dd 17 15       	mov    $0x1517dd0d,%esi
    12de:	e8 9d 00 00 00       	call   1380 <wm_xor_v2>
    12e3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12e6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12e9:	be 8f 4b c9 a3       	mov    $0xa3c94b8f,%esi
    12ee:	e8 8d 00 00 00       	call   1380 <wm_xor_v2>
    12f3:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12f6:	8b 7d f8             	mov    -0x8(%rbp),%edi
    12f9:	be b7 f9 ad 0b       	mov    $0xbadf9b7,%esi
    12fe:	e8 7d 00 00 00       	call   1380 <wm_xor_v2>
    1303:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1306:	8b 7d f8             	mov    -0x8(%rbp),%edi
    1309:	be 0b a9 db 85       	mov    $0x85dba90b,%esi
    130e:	e8 4d 00 00 00       	call   1360 <wm_add_v2>
    1313:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1316:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1319:	83 f8 ff             	cmp    $0xffffffff,%eax
    131c:	75 09                	jne    1327 <main+0x1c7>
    131e:	c7 45 fc 61 00 00 00 	movl   $0x61,-0x4(%rbp)
    1325:	eb 26                	jmp    134d <main+0x1ed>
    1327:	e8 74 00 00 00       	call   13a0 <run_contract>
    132c:	48 8b 05 95 2c 00 00 	mov    0x2c95(%rip),%rax        # 3fc8 <stdout@GLIBC_2.2.5>
    1333:	48 8b 38             	mov    (%rax),%rdi
    1336:	e8 f5 fc ff ff       	call   1030 <ferror@plt>
    133b:	89 c2                	mov    %eax,%edx
    133d:	31 c0                	xor    %eax,%eax
    133f:	b9 02 00 00 00       	mov    $0x2,%ecx
    1344:	83 fa 00             	cmp    $0x0,%edx
    1347:	0f 45 c1             	cmovne %ecx,%eax
    134a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    134d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1350:	48 83 c4 10          	add    $0x10,%rsp
    1354:	5d                   	pop    %rbp
    1355:	c3                   	ret
    1356:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

0000000000001360 <wm_add_v2>:
    1360:	55                   	push   %rbp
    1361:	48 89 e5             	mov    %rsp,%rbp
    1364:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1367:	89 75 f8             	mov    %esi,-0x8(%rbp)
    136a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    136d:	2b 45 f8             	sub    -0x8(%rbp),%eax
    1370:	03 45 f8             	add    -0x8(%rbp),%eax
    1373:	5d                   	pop    %rbp
    1374:	c3                   	ret
    1375:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)

0000000000001380 <wm_xor_v2>:
    1380:	55                   	push   %rbp
    1381:	48 89 e5             	mov    %rsp,%rbp
    1384:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1387:	89 75 f8             	mov    %esi,-0x8(%rbp)
    138a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    138d:	8b 4d f8             	mov    -0x8(%rbp),%ecx
    1390:	33 4d f8             	xor    -0x8(%rbp),%ecx
    1393:	31 c8                	xor    %ecx,%eax
    1395:	5d                   	pop    %rbp
    1396:	c3                   	ret
    1397:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

00000000000013a0 <run_contract>:
    13a0:	55                   	push   %rbp
    13a1:	48 89 e5             	mov    %rsp,%rbp
    13a4:	48 83 ec 30          	sub    $0x30,%rsp
    13a8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    13af:	81 7d fc 00 01 00 00 	cmpl   $0x100,-0x4(%rbp)
    13b6:	0f 83 9e 00 00 00    	jae    145a <run_contract+0xba>
    13bc:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    13c3:	81 7d f8 00 01 00 00 	cmpl   $0x100,-0x8(%rbp)
    13ca:	73 7e                	jae    144a <run_contract+0xaa>
    13cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13cf:	88 45 f5             	mov    %al,-0xb(%rbp)
    13d2:	8b 45 f8             	mov    -0x8(%rbp),%eax
    13d5:	88 45 f6             	mov    %al,-0xa(%rbp)
    13d8:	c6 45 f7 00          	movb   $0x0,-0x9(%rbp)
    13dc:	48 8d 7d f5          	lea    -0xb(%rbp),%rdi
    13e0:	e8 0b 01 00 00       	call   14f0 <lskip>
    13e5:	48 89 c7             	mov    %rax,%rdi
    13e8:	e8 73 00 00 00       	call   1460 <rstrip>
    13ed:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    13f1:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
    13f5:	e8 46 fc ff ff       	call   1040 <strlen@plt>
    13fa:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    13fe:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1402:	89 45 dc             	mov    %eax,-0x24(%rbp)
    1405:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
    140a:	76 10                	jbe    141c <run_contract+0x7c>
    140c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1410:	0f b6 00             	movzbl (%rax),%eax
    1413:	c1 e0 08             	shl    $0x8,%eax
    1416:	0b 45 dc             	or     -0x24(%rbp),%eax
    1419:	89 45 dc             	mov    %eax,-0x24(%rbp)
    141c:	48 83 7d e0 01       	cmpq   $0x1,-0x20(%rbp)
    1421:	76 11                	jbe    1434 <run_contract+0x94>
    1423:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1427:	0f b6 40 01          	movzbl 0x1(%rax),%eax
    142b:	c1 e0 10             	shl    $0x10,%eax
    142e:	0b 45 dc             	or     -0x24(%rbp),%eax
    1431:	89 45 dc             	mov    %eax,-0x24(%rbp)
    1434:	8b 7d dc             	mov    -0x24(%rbp),%edi
    1437:	e8 04 01 00 00       	call   1540 <emit_u32>
    143c:	8b 45 f8             	mov    -0x8(%rbp),%eax
    143f:	83 c0 01             	add    $0x1,%eax
    1442:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1445:	e9 79 ff ff ff       	jmp    13c3 <run_contract+0x23>
    144a:	eb 00                	jmp    144c <run_contract+0xac>
    144c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    144f:	83 c0 01             	add    $0x1,%eax
    1452:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1455:	e9 55 ff ff ff       	jmp    13af <run_contract+0xf>
    145a:	48 83 c4 30          	add    $0x30,%rsp
    145e:	5d                   	pop    %rbp
    145f:	c3                   	ret

0000000000001460 <rstrip>:
    1460:	55                   	push   %rbp
    1461:	48 89 e5             	mov    %rsp,%rbp
    1464:	48 83 ec 20          	sub    $0x20,%rsp
    1468:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    146c:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    1470:	e8 cb fb ff ff       	call   1040 <strlen@plt>
    1475:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    1479:	31 c0                	xor    %eax,%eax
    147b:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    1480:	88 45 ef             	mov    %al,-0x11(%rbp)
    1483:	76 39                	jbe    14be <rstrip+0x5e>
    1485:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1489:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    148d:	48 83 e9 01          	sub    $0x1,%rcx
    1491:	0f b6 0c 08          	movzbl (%rax,%rcx,1),%ecx
    1495:	b0 01                	mov    $0x1,%al
    1497:	83 f9 20             	cmp    $0x20,%ecx
    149a:	88 45 ee             	mov    %al,-0x12(%rbp)
    149d:	74 19                	je     14b8 <rstrip+0x58>
    149f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    14a3:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    14a7:	48 83 e9 01          	sub    $0x1,%rcx
    14ab:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
    14af:	83 f8 09             	cmp    $0x9,%eax
    14b2:	0f 94 c0             	sete   %al
    14b5:	88 45 ee             	mov    %al,-0x12(%rbp)
    14b8:	8a 45 ee             	mov    -0x12(%rbp),%al
    14bb:	88 45 ef             	mov    %al,-0x11(%rbp)
    14be:	8a 45 ef             	mov    -0x11(%rbp),%al
    14c1:	a8 01                	test   $0x1,%al
    14c3:	75 02                	jne    14c7 <rstrip+0x67>
    14c5:	eb 1a                	jmp    14e1 <rstrip+0x81>
    14c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    14cb:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    14cf:	48 89 ca             	mov    %rcx,%rdx
    14d2:	48 83 c2 ff          	add    $0xffffffffffffffff,%rdx
    14d6:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    14da:	c6 44 08 ff 00       	movb   $0x0,-0x1(%rax,%rcx,1)
    14df:	eb 98                	jmp    1479 <rstrip+0x19>
    14e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    14e5:	48 83 c4 20          	add    $0x20,%rsp
    14e9:	5d                   	pop    %rbp
    14ea:	c3                   	ret
    14eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000014f0 <lskip>:
    14f0:	55                   	push   %rbp
    14f1:	48 89 e5             	mov    %rsp,%rbp
    14f4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    14f8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    14fc:	0f b6 08             	movzbl (%rax),%ecx
    14ff:	b0 01                	mov    $0x1,%al
    1501:	83 f9 20             	cmp    $0x20,%ecx
    1504:	88 45 f7             	mov    %al,-0x9(%rbp)
    1507:	74 10                	je     1519 <lskip+0x29>
    1509:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    150d:	0f b6 00             	movzbl (%rax),%eax
    1510:	83 f8 09             	cmp    $0x9,%eax
    1513:	0f 94 c0             	sete   %al
    1516:	88 45 f7             	mov    %al,-0x9(%rbp)
    1519:	8a 45 f7             	mov    -0x9(%rbp),%al
    151c:	a8 01                	test   $0x1,%al
    151e:	75 02                	jne    1522 <lskip+0x32>
    1520:	eb 0e                	jmp    1530 <lskip+0x40>
    1522:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1526:	48 83 c0 01          	add    $0x1,%rax
    152a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    152e:	eb c8                	jmp    14f8 <lskip+0x8>
    1530:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1534:	5d                   	pop    %rbp
    1535:	c3                   	ret
    1536:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

0000000000001540 <emit_u32>:
    1540:	55                   	push   %rbp
    1541:	48 89 e5             	mov    %rsp,%rbp
    1544:	48 83 ec 10          	sub    $0x10,%rsp
    1548:	89 7d fc             	mov    %edi,-0x4(%rbp)
    154b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    154e:	25 ff 00 00 00       	and    $0xff,%eax
    1553:	88 45 f8             	mov    %al,-0x8(%rbp)
    1556:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1559:	c1 e8 08             	shr    $0x8,%eax
    155c:	25 ff 00 00 00       	and    $0xff,%eax
    1561:	88 45 f9             	mov    %al,-0x7(%rbp)
    1564:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1567:	c1 e8 10             	shr    $0x10,%eax
    156a:	25 ff 00 00 00       	and    $0xff,%eax
    156f:	88 45 fa             	mov    %al,-0x6(%rbp)
    1572:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1575:	c1 e8 18             	shr    $0x18,%eax
    1578:	25 ff 00 00 00       	and    $0xff,%eax
    157d:	88 45 fb             	mov    %al,-0x5(%rbp)
    1580:	48 8d 7d f8          	lea    -0x8(%rbp),%rdi
    1584:	48 8b 05 3d 2a 00 00 	mov    0x2a3d(%rip),%rax        # 3fc8 <stdout@GLIBC_2.2.5>
    158b:	48 8b 08             	mov    (%rax),%rcx
    158e:	be 01 00 00 00       	mov    $0x1,%esi
    1593:	ba 04 00 00 00       	mov    $0x4,%edx
    1598:	e8 b3 fa ff ff       	call   1050 <fwrite@plt>
    159d:	48 83 c4 10          	add    $0x10,%rsp
    15a1:	5d                   	pop    %rbp
    15a2:	c3                   	ret

Disassembly of section .fini:

00000000000015a4 <_fini>:
    15a4:	48 83 ec 08          	sub    $0x8,%rsp
    15a8:	48 83 c4 08          	add    $0x8,%rsp
    15ac:	c3                   	ret
