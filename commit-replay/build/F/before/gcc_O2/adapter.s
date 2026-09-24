
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

0000000000001080 <main>:
    1080:	41 57                	push   %r15
    1082:	41 56                	push   %r14
    1084:	41 55                	push   %r13
    1086:	41 54                	push   %r12
    1088:	55                   	push   %rbp
    1089:	53                   	push   %rbx
    108a:	48 83 ec 28          	sub    $0x28,%rsp
    108e:	c7 44 24 18 f5 79 2b 6d 	movl   $0x6d2b79f5,0x18(%rsp)
    1096:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    109a:	e8 31 04 00 00       	call   14d0 <wm_add_v1.isra.0>
    109f:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10a3:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10a7:	e8 24 04 00 00       	call   14d0 <wm_add_v1.isra.0>
    10ac:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10b0:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10b4:	e8 17 04 00 00       	call   14d0 <wm_add_v1.isra.0>
    10b9:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10bd:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10c1:	e8 0a 04 00 00       	call   14d0 <wm_add_v1.isra.0>
    10c6:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10ca:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10ce:	e8 fd 03 00 00       	call   14d0 <wm_add_v1.isra.0>
    10d3:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10d7:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10db:	e8 f0 03 00 00       	call   14d0 <wm_add_v1.isra.0>
    10e0:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10e4:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10e8:	e8 e3 03 00 00       	call   14d0 <wm_add_v1.isra.0>
    10ed:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10f1:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    10f5:	e8 d6 03 00 00       	call   14d0 <wm_add_v1.isra.0>
    10fa:	89 44 24 18          	mov    %eax,0x18(%rsp)
    10fe:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1102:	e8 c9 03 00 00       	call   14d0 <wm_add_v1.isra.0>
    1107:	89 44 24 18          	mov    %eax,0x18(%rsp)
    110b:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    110f:	e8 bc 03 00 00       	call   14d0 <wm_add_v1.isra.0>
    1114:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1118:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    111c:	e8 af 03 00 00       	call   14d0 <wm_add_v1.isra.0>
    1121:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1125:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1129:	e8 a2 03 00 00       	call   14d0 <wm_add_v1.isra.0>
    112e:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1132:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1136:	e8 95 03 00 00       	call   14d0 <wm_add_v1.isra.0>
    113b:	89 44 24 18          	mov    %eax,0x18(%rsp)
    113f:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1143:	e8 88 03 00 00       	call   14d0 <wm_add_v1.isra.0>
    1148:	89 44 24 18          	mov    %eax,0x18(%rsp)
    114c:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1150:	e8 7b 03 00 00       	call   14d0 <wm_add_v1.isra.0>
    1155:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1159:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    115d:	e8 6e 03 00 00       	call   14d0 <wm_add_v1.isra.0>
    1162:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1166:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    116a:	e8 61 03 00 00       	call   14d0 <wm_add_v1.isra.0>
    116f:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1173:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1177:	e8 54 03 00 00       	call   14d0 <wm_add_v1.isra.0>
    117c:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1180:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1184:	e8 47 03 00 00       	call   14d0 <wm_add_v1.isra.0>
    1189:	89 44 24 18          	mov    %eax,0x18(%rsp)
    118d:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    1191:	e8 3a 03 00 00       	call   14d0 <wm_add_v1.isra.0>
    1196:	89 44 24 18          	mov    %eax,0x18(%rsp)
    119a:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    119e:	e8 2d 03 00 00       	call   14d0 <wm_add_v1.isra.0>
    11a3:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11a7:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11ab:	e8 20 03 00 00       	call   14d0 <wm_add_v1.isra.0>
    11b0:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11b4:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11b8:	e8 13 03 00 00       	call   14d0 <wm_add_v1.isra.0>
    11bd:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11c1:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11c5:	e8 06 03 00 00       	call   14d0 <wm_add_v1.isra.0>
    11ca:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11ce:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11d2:	e8 f9 02 00 00       	call   14d0 <wm_add_v1.isra.0>
    11d7:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11db:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11df:	e8 ec 02 00 00       	call   14d0 <wm_add_v1.isra.0>
    11e4:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11e8:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11ec:	e8 df 02 00 00       	call   14d0 <wm_add_v1.isra.0>
    11f1:	89 44 24 18          	mov    %eax,0x18(%rsp)
    11f5:	8b 7c 24 18          	mov    0x18(%rsp),%edi
    11f9:	e8 d2 02 00 00       	call   14d0 <wm_add_v1.isra.0>
    11fe:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1202:	8b 54 24 18          	mov    0x18(%rsp),%edx
    1206:	b8 61 00 00 00       	mov    $0x61,%eax
    120b:	83 fa ff             	cmp    $0xffffffff,%edx
    120e:	0f 84 52 01 00 00    	je     1366 <main+0x2e6>
    1214:	48 8d 44 24 1c       	lea    0x1c(%rsp),%rax
    1219:	45 31 f6             	xor    %r14d,%r14d
    121c:	48 8d 5c 24 14       	lea    0x14(%rsp),%rbx
    1221:	48 89 04 24          	mov    %rax,(%rsp)
    1225:	41 83 fe 20          	cmp    $0x20,%r14d
    1229:	45 89 f5             	mov    %r14d,%r13d
    122c:	41 0f 94 c4          	sete   %r12b
    1230:	41 83 fe 09          	cmp    $0x9,%r14d
    1234:	0f 94 c0             	sete   %al
    1237:	31 ed                	xor    %ebp,%ebp
    1239:	41 09 c4             	or     %eax,%r12d
    123c:	0f 1f 40 00          	nopl   0x0(%rax)
    1240:	48 89 df             	mov    %rbx,%rdi
    1243:	44 88 6c 24 14       	mov    %r13b,0x14(%rsp)
    1248:	40 88 6c 24 15       	mov    %bpl,0x15(%rsp)
    124d:	c6 44 24 16 00       	movb   $0x0,0x16(%rsp)
    1252:	e8 e9 fd ff ff       	call   1040 <strlen@plt>
    1257:	48 85 c0             	test   %rax,%rax
    125a:	75 2c                	jne    1288 <main+0x208>
    125c:	e9 42 01 00 00       	jmp    13a3 <main+0x323>
    1261:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    126c:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1277:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)
    1280:	c6 01 00             	movb   $0x0,(%rcx)
    1283:	48 85 c0             	test   %rax,%rax
    1286:	74 15                	je     129d <main+0x21d>
    1288:	48 83 e8 01          	sub    $0x1,%rax
    128c:	48 8d 0c 03          	lea    (%rbx,%rax,1),%rcx
    1290:	0f b6 11             	movzbl (%rcx),%edx
    1293:	80 fa 20             	cmp    $0x20,%dl
    1296:	74 e8                	je     1280 <main+0x200>
    1298:	80 fa 09             	cmp    $0x9,%dl
    129b:	74 e3                	je     1280 <main+0x200>
    129d:	44 0f b6 7c 24 14    	movzbl 0x14(%rsp),%r15d
    12a3:	41 80 ff 20          	cmp    $0x20,%r15b
    12a7:	74 0a                	je     12b3 <main+0x233>
    12a9:	41 80 ff 09          	cmp    $0x9,%r15b
    12ad:	0f 85 05 01 00 00    	jne    13b8 <main+0x338>
    12b3:	48 89 d9             	mov    %rbx,%rcx
    12b6:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    12c0:	44 0f b6 79 01       	movzbl 0x1(%rcx),%r15d
    12c5:	48 83 c1 01          	add    $0x1,%rcx
    12c9:	41 80 ff 20          	cmp    $0x20,%r15b
    12cd:	74 f1                	je     12c0 <main+0x240>
    12cf:	41 80 ff 09          	cmp    $0x9,%r15b
    12d3:	74 eb                	je     12c0 <main+0x240>
    12d5:	48 89 cf             	mov    %rcx,%rdi
    12d8:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    12dd:	e8 5e fd ff ff       	call   1040 <strlen@plt>
    12e2:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    12e7:	48 85 c0             	test   %rax,%rax
    12ea:	0f 85 88 00 00 00    	jne    1378 <main+0x2f8>
    12f0:	31 c0                	xor    %eax,%eax
    12f2:	31 f6                	xor    %esi,%esi
    12f4:	31 ff                	xor    %edi,%edi
    12f6:	31 c9                	xor    %ecx,%ecx
    12f8:	0f b6 c0             	movzbl %al,%eax
    12fb:	40 0f b6 f6          	movzbl %sil,%esi
    12ff:	40 0f b6 ff          	movzbl %dil,%edi
    1303:	ba 04 00 00 00       	mov    $0x4,%edx
    1308:	c1 e0 08             	shl    $0x8,%eax
    130b:	83 c5 01             	add    $0x1,%ebp
    130e:	09 f0                	or     %esi,%eax
    1310:	be 01 00 00 00       	mov    $0x1,%esi
    1315:	c1 e0 08             	shl    $0x8,%eax
    1318:	09 f8                	or     %edi,%eax
    131a:	48 8b 3c 24          	mov    (%rsp),%rdi
    131e:	c1 e0 08             	shl    $0x8,%eax
    1321:	09 c8                	or     %ecx,%eax
    1323:	48 8b 0d fe 2c 00 00 	mov    0x2cfe(%rip),%rcx        # 4028 <stdout@GLIBC_2.2.5>
    132a:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
    132e:	e8 1d fd ff ff       	call   1050 <fwrite@plt>
    1333:	81 fd 00 01 00 00    	cmp    $0x100,%ebp
    1339:	0f 85 01 ff ff ff    	jne    1240 <main+0x1c0>
    133f:	41 83 c6 01          	add    $0x1,%r14d
    1343:	41 81 fe 00 01 00 00 	cmp    $0x100,%r14d
    134a:	0f 85 d5 fe ff ff    	jne    1225 <main+0x1a5>
    1350:	48 8b 3d d1 2c 00 00 	mov    0x2cd1(%rip),%rdi        # 4028 <stdout@GLIBC_2.2.5>
    1357:	e8 d4 fc ff ff       	call   1030 <ferror@plt>
    135c:	85 c0                	test   %eax,%eax
    135e:	0f 95 c0             	setne  %al
    1361:	0f b6 c0             	movzbl %al,%eax
    1364:	01 c0                	add    %eax,%eax
    1366:	48 83 c4 28          	add    $0x28,%rsp
    136a:	5b                   	pop    %rbx
    136b:	5d                   	pop    %rbp
    136c:	41 5c                	pop    %r12
    136e:	41 5d                	pop    %r13
    1370:	41 5e                	pop    %r14
    1372:	41 5f                	pop    %r15
    1374:	c3                   	ret
    1375:	0f 1f 00             	nopl   (%rax)
    1378:	41 0f b6 d7          	movzbl %r15b,%edx
    137c:	c1 e2 08             	shl    $0x8,%edx
    137f:	09 c2                	or     %eax,%edx
    1381:	48 83 f8 01          	cmp    $0x1,%rax
    1385:	74 39                	je     13c0 <main+0x340>
    1387:	0f b6 41 01          	movzbl 0x1(%rcx),%eax
    138b:	c1 e0 10             	shl    $0x10,%eax
    138e:	09 d0                	or     %edx,%eax
    1390:	89 c6                	mov    %eax,%esi
    1392:	0f b6 c8             	movzbl %al,%ecx
    1395:	0f b6 fc             	movzbl %ah,%edi
    1398:	c1 e8 18             	shr    $0x18,%eax
    139b:	c1 ee 10             	shr    $0x10,%esi
    139e:	e9 55 ff ff ff       	jmp    12f8 <main+0x278>
    13a3:	45 84 e4             	test   %r12b,%r12b
    13a6:	0f 85 07 ff ff ff    	jne    12b3 <main+0x233>
    13ac:	e9 3f ff ff ff       	jmp    12f0 <main+0x270>
    13b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    13b8:	48 89 d9             	mov    %rbx,%rcx
    13bb:	e9 15 ff ff ff       	jmp    12d5 <main+0x255>
    13c0:	89 d6                	mov    %edx,%esi
    13c2:	0f b6 ca             	movzbl %dl,%ecx
    13c5:	0f b6 fe             	movzbl %dh,%edi
    13c8:	c1 ea 18             	shr    $0x18,%edx
    13cb:	c1 ee 10             	shr    $0x10,%esi
    13ce:	89 d0                	mov    %edx,%eax
    13d0:	e9 23 ff ff ff       	jmp    12f8 <main+0x278>
    13d5:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    13df:	90                   	nop

00000000000013e0 <_start>:
    13e0:	31 ed                	xor    %ebp,%ebp
    13e2:	49 89 d1             	mov    %rdx,%r9
    13e5:	5e                   	pop    %rsi
    13e6:	48 89 e2             	mov    %rsp,%rdx
    13e9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    13ed:	50                   	push   %rax
    13ee:	54                   	push   %rsp
    13ef:	45 31 c0             	xor    %r8d,%r8d
    13f2:	31 c9                	xor    %ecx,%ecx
    13f4:	48 8d 3d 85 fc ff ff 	lea    -0x37b(%rip),%rdi        # 1080 <main>
    13fb:	ff 15 bf 2b 00 00    	call   *0x2bbf(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1401:	f4                   	hlt
    1402:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    140c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001410 <deregister_tm_clones>:
    1410:	48 8d 3d 11 2c 00 00 	lea    0x2c11(%rip),%rdi        # 4028 <stdout@GLIBC_2.2.5>
    1417:	48 8d 05 0a 2c 00 00 	lea    0x2c0a(%rip),%rax        # 4028 <stdout@GLIBC_2.2.5>
    141e:	48 39 f8             	cmp    %rdi,%rax
    1421:	74 15                	je     1438 <deregister_tm_clones+0x28>
    1423:	48 8b 05 9e 2b 00 00 	mov    0x2b9e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    142a:	48 85 c0             	test   %rax,%rax
    142d:	74 09                	je     1438 <deregister_tm_clones+0x28>
    142f:	ff e0                	jmp    *%rax
    1431:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1438:	c3                   	ret
    1439:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001440 <register_tm_clones>:
    1440:	48 8d 3d e1 2b 00 00 	lea    0x2be1(%rip),%rdi        # 4028 <stdout@GLIBC_2.2.5>
    1447:	48 8d 35 da 2b 00 00 	lea    0x2bda(%rip),%rsi        # 4028 <stdout@GLIBC_2.2.5>
    144e:	48 29 fe             	sub    %rdi,%rsi
    1451:	48 89 f0             	mov    %rsi,%rax
    1454:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1458:	48 c1 f8 03          	sar    $0x3,%rax
    145c:	48 01 c6             	add    %rax,%rsi
    145f:	48 d1 fe             	sar    $1,%rsi
    1462:	74 14                	je     1478 <register_tm_clones+0x38>
    1464:	48 8b 05 6d 2b 00 00 	mov    0x2b6d(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    146b:	48 85 c0             	test   %rax,%rax
    146e:	74 08                	je     1478 <register_tm_clones+0x38>
    1470:	ff e0                	jmp    *%rax
    1472:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1478:	c3                   	ret
    1479:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001480 <__do_global_dtors_aux>:
    1480:	f3 0f 1e fa          	endbr64
    1484:	80 3d a5 2b 00 00 00 	cmpb   $0x0,0x2ba5(%rip)        # 4030 <completed.0>
    148b:	75 2b                	jne    14b8 <__do_global_dtors_aux+0x38>
    148d:	55                   	push   %rbp
    148e:	48 83 3d 4a 2b 00 00 00 	cmpq   $0x0,0x2b4a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1496:	48 89 e5             	mov    %rsp,%rbp
    1499:	74 0c                	je     14a7 <__do_global_dtors_aux+0x27>
    149b:	48 8b 3d 7e 2b 00 00 	mov    0x2b7e(%rip),%rdi        # 4020 <__dso_handle>
    14a2:	e8 b9 fb ff ff       	call   1060 <__cxa_finalize@plt>
    14a7:	e8 64 ff ff ff       	call   1410 <deregister_tm_clones>
    14ac:	c6 05 7d 2b 00 00 01 	movb   $0x1,0x2b7d(%rip)        # 4030 <completed.0>
    14b3:	5d                   	pop    %rbp
    14b4:	c3                   	ret
    14b5:	0f 1f 00             	nopl   (%rax)
    14b8:	c3                   	ret
    14b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000014c0 <frame_dummy>:
    14c0:	f3 0f 1e fa          	endbr64
    14c4:	e9 77 ff ff ff       	jmp    1440 <register_tm_clones>
    14c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000014d0 <wm_add_v1.isra.0>:
    14d0:	89 f8                	mov    %edi,%eax
    14d2:	c3                   	ret

Disassembly of section .fini:

00000000000014d4 <_fini>:
    14d4:	48 83 ec 08          	sub    $0x8,%rsp
    14d8:	48 83 c4 08          	add    $0x8,%rsp
    14dc:	c3                   	ret
