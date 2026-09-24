
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

0000000000001060 <main>:
    1060:	41 54                	push   %r12
    1062:	55                   	push   %rbp
    1063:	53                   	push   %rbx
    1064:	48 83 ec 10          	sub    $0x10,%rsp
    1068:	c7 44 24 0c f5 79 2b 6d 	movl   $0x6d2b79f5,0xc(%rsp)
    1070:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1074:	e8 17 03 00 00       	call   1390 <wm_add_v1.isra.0>
    1079:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    107d:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1081:	e8 0a 03 00 00       	call   1390 <wm_add_v1.isra.0>
    1086:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    108a:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    108e:	e8 fd 02 00 00       	call   1390 <wm_add_v1.isra.0>
    1093:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1097:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    109b:	e8 f0 02 00 00       	call   1390 <wm_add_v1.isra.0>
    10a0:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10a4:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10a8:	e8 e3 02 00 00       	call   1390 <wm_add_v1.isra.0>
    10ad:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10b1:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10b5:	e8 d6 02 00 00       	call   1390 <wm_add_v1.isra.0>
    10ba:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10be:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10c2:	e8 c9 02 00 00       	call   1390 <wm_add_v1.isra.0>
    10c7:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10cb:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10cf:	e8 bc 02 00 00       	call   1390 <wm_add_v1.isra.0>
    10d4:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10d8:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10dc:	e8 af 02 00 00       	call   1390 <wm_add_v1.isra.0>
    10e1:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10e5:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10e9:	e8 a2 02 00 00       	call   1390 <wm_add_v1.isra.0>
    10ee:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10f2:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10f6:	e8 95 02 00 00       	call   1390 <wm_add_v1.isra.0>
    10fb:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10ff:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1103:	e8 88 02 00 00       	call   1390 <wm_add_v1.isra.0>
    1108:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    110c:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1110:	e8 7b 02 00 00       	call   1390 <wm_add_v1.isra.0>
    1115:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1119:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    111d:	e8 6e 02 00 00       	call   1390 <wm_add_v1.isra.0>
    1122:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1126:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    112a:	e8 61 02 00 00       	call   1390 <wm_add_v1.isra.0>
    112f:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1133:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1137:	e8 54 02 00 00       	call   1390 <wm_add_v1.isra.0>
    113c:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1140:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1144:	e8 47 02 00 00       	call   1390 <wm_add_v1.isra.0>
    1149:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    114d:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1151:	e8 3a 02 00 00       	call   1390 <wm_add_v1.isra.0>
    1156:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    115a:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    115e:	e8 2d 02 00 00       	call   1390 <wm_add_v1.isra.0>
    1163:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1167:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    116b:	e8 20 02 00 00       	call   1390 <wm_add_v1.isra.0>
    1170:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1174:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1178:	e8 13 02 00 00       	call   1390 <wm_add_v1.isra.0>
    117d:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1181:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1185:	e8 06 02 00 00       	call   1390 <wm_add_v1.isra.0>
    118a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    118e:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1192:	e8 f9 01 00 00       	call   1390 <wm_add_v1.isra.0>
    1197:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    119b:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    119f:	e8 ec 01 00 00       	call   1390 <wm_add_v1.isra.0>
    11a4:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11a8:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11ac:	e8 df 01 00 00       	call   1390 <wm_add_v1.isra.0>
    11b1:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11b5:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11b9:	e8 d2 01 00 00       	call   1390 <wm_add_v1.isra.0>
    11be:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11c2:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11c6:	e8 c5 01 00 00       	call   1390 <wm_add_v1.isra.0>
    11cb:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11cf:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11d3:	e8 b8 01 00 00       	call   1390 <wm_add_v1.isra.0>
    11d8:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11dc:	8b 54 24 0c          	mov    0xc(%rsp),%edx
    11e0:	b8 61 00 00 00       	mov    $0x61,%eax
    11e5:	83 fa ff             	cmp    $0xffffffff,%edx
    11e8:	74 7f                	je     1269 <main+0x209>
    11ea:	31 db                	xor    %ebx,%ebx
    11ec:	bd 01 00 00 00       	mov    $0x1,%ebp
    11f1:	45 31 e4             	xor    %r12d,%r12d
    11f4:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    11ff:	90                   	nop
    1200:	4c 8b 05 19 2e 00 00 	mov    0x2e19(%rip),%r8        # 4020 <stdout@GLIBC_2.2.5>
    1207:	31 c9                	xor    %ecx,%ecx
    1209:	31 c0                	xor    %eax,%eax
    120b:	89 de                	mov    %ebx,%esi
    120d:	44 89 e2             	mov    %r12d,%edx
    1210:	d3 fe                	sar    %cl,%esi
    1212:	d3 fa                	sar    %cl,%edx
    1214:	83 e6 03             	and    $0x3,%esi
    1217:	83 e2 03             	and    $0x3,%edx
    121a:	39 d6                	cmp    %edx,%esi
    121c:	74 0a                	je     1228 <main+0x1c8>
    121e:	85 d2                	test   %edx,%edx
    1220:	75 56                	jne    1278 <main+0x218>
    1222:	89 ea                	mov    %ebp,%edx
    1224:	d3 e2                	shl    %cl,%edx
    1226:	09 d0                	or     %edx,%eax
    1228:	83 c1 02             	add    $0x2,%ecx
    122b:	83 f9 08             	cmp    $0x8,%ecx
    122e:	75 db                	jne    120b <main+0x1ab>
    1230:	0f b6 f8             	movzbl %al,%edi
    1233:	4c 89 c6             	mov    %r8,%rsi
    1236:	41 83 c4 01          	add    $0x1,%r12d
    123a:	e8 01 fe ff ff       	call   1040 <fputc@plt>
    123f:	41 81 fc 00 01 00 00 	cmp    $0x100,%r12d
    1246:	75 b8                	jne    1200 <main+0x1a0>
    1248:	83 c3 01             	add    $0x1,%ebx
    124b:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
    1251:	75 9e                	jne    11f1 <main+0x191>
    1253:	48 8b 3d c6 2d 00 00 	mov    0x2dc6(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    125a:	e8 d1 fd ff ff       	call   1030 <ferror@plt>
    125f:	85 c0                	test   %eax,%eax
    1261:	0f 95 c0             	setne  %al
    1264:	0f b6 c0             	movzbl %al,%eax
    1267:	01 c0                	add    %eax,%eax
    1269:	48 83 c4 10          	add    $0x10,%rsp
    126d:	5b                   	pop    %rbx
    126e:	5d                   	pop    %rbp
    126f:	41 5c                	pop    %r12
    1271:	c3                   	ret
    1272:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1278:	85 f6                	test   %esi,%esi
    127a:	75 14                	jne    1290 <main+0x230>
    127c:	ba 02 00 00 00       	mov    $0x2,%edx
    1281:	d3 e2                	shl    %cl,%edx
    1283:	09 d0                	or     %edx,%eax
    1285:	eb a1                	jmp    1228 <main+0x1c8>
    1287:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)
    1290:	ba 03 00 00 00       	mov    $0x3,%edx
    1295:	d3 e2                	shl    %cl,%edx
    1297:	09 d0                	or     %edx,%eax
    1299:	eb 8d                	jmp    1228 <main+0x1c8>
    129b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012a0 <_start>:
    12a0:	31 ed                	xor    %ebp,%ebp
    12a2:	49 89 d1             	mov    %rdx,%r9
    12a5:	5e                   	pop    %rsi
    12a6:	48 89 e2             	mov    %rsp,%rdx
    12a9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    12ad:	50                   	push   %rax
    12ae:	54                   	push   %rsp
    12af:	45 31 c0             	xor    %r8d,%r8d
    12b2:	31 c9                	xor    %ecx,%ecx
    12b4:	48 8d 3d a5 fd ff ff 	lea    -0x25b(%rip),%rdi        # 1060 <main>
    12bb:	ff 15 ff 2c 00 00    	call   *0x2cff(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    12c1:	f4                   	hlt
    12c2:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    12cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000012d0 <deregister_tm_clones>:
    12d0:	48 8d 3d 49 2d 00 00 	lea    0x2d49(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    12d7:	48 8d 05 42 2d 00 00 	lea    0x2d42(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    12de:	48 39 f8             	cmp    %rdi,%rax
    12e1:	74 15                	je     12f8 <deregister_tm_clones+0x28>
    12e3:	48 8b 05 de 2c 00 00 	mov    0x2cde(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    12ea:	48 85 c0             	test   %rax,%rax
    12ed:	74 09                	je     12f8 <deregister_tm_clones+0x28>
    12ef:	ff e0                	jmp    *%rax
    12f1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    12f8:	c3                   	ret
    12f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001300 <register_tm_clones>:
    1300:	48 8d 3d 19 2d 00 00 	lea    0x2d19(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1307:	48 8d 35 12 2d 00 00 	lea    0x2d12(%rip),%rsi        # 4020 <stdout@GLIBC_2.2.5>
    130e:	48 29 fe             	sub    %rdi,%rsi
    1311:	48 89 f0             	mov    %rsi,%rax
    1314:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1318:	48 c1 f8 03          	sar    $0x3,%rax
    131c:	48 01 c6             	add    %rax,%rsi
    131f:	48 d1 fe             	sar    $1,%rsi
    1322:	74 14                	je     1338 <register_tm_clones+0x38>
    1324:	48 8b 05 ad 2c 00 00 	mov    0x2cad(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    132b:	48 85 c0             	test   %rax,%rax
    132e:	74 08                	je     1338 <register_tm_clones+0x38>
    1330:	ff e0                	jmp    *%rax
    1332:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1338:	c3                   	ret
    1339:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001340 <__do_global_dtors_aux>:
    1340:	f3 0f 1e fa          	endbr64
    1344:	80 3d dd 2c 00 00 00 	cmpb   $0x0,0x2cdd(%rip)        # 4028 <completed.0>
    134b:	75 2b                	jne    1378 <__do_global_dtors_aux+0x38>
    134d:	55                   	push   %rbp
    134e:	48 83 3d 8a 2c 00 00 00 	cmpq   $0x0,0x2c8a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1356:	48 89 e5             	mov    %rsp,%rbp
    1359:	74 0c                	je     1367 <__do_global_dtors_aux+0x27>
    135b:	48 8b 3d b6 2c 00 00 	mov    0x2cb6(%rip),%rdi        # 4018 <__dso_handle>
    1362:	e8 e9 fc ff ff       	call   1050 <__cxa_finalize@plt>
    1367:	e8 64 ff ff ff       	call   12d0 <deregister_tm_clones>
    136c:	c6 05 b5 2c 00 00 01 	movb   $0x1,0x2cb5(%rip)        # 4028 <completed.0>
    1373:	5d                   	pop    %rbp
    1374:	c3                   	ret
    1375:	0f 1f 00             	nopl   (%rax)
    1378:	c3                   	ret
    1379:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001380 <frame_dummy>:
    1380:	f3 0f 1e fa          	endbr64
    1384:	e9 77 ff ff ff       	jmp    1300 <register_tm_clones>
    1389:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001390 <wm_add_v1.isra.0>:
    1390:	89 f8                	mov    %edi,%eax
    1392:	c3                   	ret

Disassembly of section .fini:

0000000000001394 <_fini>:
    1394:	48 83 ec 08          	sub    $0x8,%rsp
    1398:	48 83 c4 08          	add    $0x8,%rsp
    139c:	c3                   	ret
