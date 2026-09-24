
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
    1074:	e8 f7 02 00 00       	call   1370 <wm_add_v2.isra.0>
    1079:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    107d:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1081:	e8 ea 02 00 00       	call   1370 <wm_add_v2.isra.0>
    1086:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    108a:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    108e:	e8 dd 02 00 00       	call   1370 <wm_add_v2.isra.0>
    1093:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1097:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    109b:	e8 d0 02 00 00       	call   1370 <wm_add_v2.isra.0>
    10a0:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10a4:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10a8:	e8 c3 02 00 00       	call   1370 <wm_add_v2.isra.0>
    10ad:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10b1:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10b5:	e8 b6 02 00 00       	call   1370 <wm_add_v2.isra.0>
    10ba:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10be:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10c2:	e8 a9 02 00 00       	call   1370 <wm_add_v2.isra.0>
    10c7:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10cb:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10cf:	e8 9c 02 00 00       	call   1370 <wm_add_v2.isra.0>
    10d4:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10d8:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10dc:	e8 8f 02 00 00       	call   1370 <wm_add_v2.isra.0>
    10e1:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10e5:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10e9:	e8 82 02 00 00       	call   1370 <wm_add_v2.isra.0>
    10ee:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10f2:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10f6:	e8 75 02 00 00       	call   1370 <wm_add_v2.isra.0>
    10fb:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10ff:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1103:	e8 68 02 00 00       	call   1370 <wm_add_v2.isra.0>
    1108:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    110c:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1110:	e8 5b 02 00 00       	call   1370 <wm_add_v2.isra.0>
    1115:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1119:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    111d:	e8 4e 02 00 00       	call   1370 <wm_add_v2.isra.0>
    1122:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1126:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    112a:	e8 41 02 00 00       	call   1370 <wm_add_v2.isra.0>
    112f:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1133:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1137:	e8 34 02 00 00       	call   1370 <wm_add_v2.isra.0>
    113c:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1140:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1144:	e8 27 02 00 00       	call   1370 <wm_add_v2.isra.0>
    1149:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    114d:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1151:	e8 1a 02 00 00       	call   1370 <wm_add_v2.isra.0>
    1156:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    115a:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    115e:	e8 0d 02 00 00       	call   1370 <wm_add_v2.isra.0>
    1163:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1167:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    116b:	e8 00 02 00 00       	call   1370 <wm_add_v2.isra.0>
    1170:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1174:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1178:	e8 f3 01 00 00       	call   1370 <wm_add_v2.isra.0>
    117d:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1181:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1185:	e8 e6 01 00 00       	call   1370 <wm_add_v2.isra.0>
    118a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    118e:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1192:	e8 d9 01 00 00       	call   1370 <wm_add_v2.isra.0>
    1197:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    119b:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    119f:	e8 cc 01 00 00       	call   1370 <wm_add_v2.isra.0>
    11a4:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11a8:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11ac:	e8 bf 01 00 00       	call   1370 <wm_add_v2.isra.0>
    11b1:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11b5:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11b9:	e8 b2 01 00 00       	call   1370 <wm_add_v2.isra.0>
    11be:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11c2:	8b 54 24 0c          	mov    0xc(%rsp),%edx
    11c6:	b8 61 00 00 00       	mov    $0x61,%eax
    11cb:	83 fa ff             	cmp    $0xffffffff,%edx
    11ce:	74 79                	je     1249 <main+0x1e9>
    11d0:	31 db                	xor    %ebx,%ebx
    11d2:	bd 01 00 00 00       	mov    $0x1,%ebp
    11d7:	45 31 e4             	xor    %r12d,%r12d
    11da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    11e0:	4c 8b 05 39 2e 00 00 	mov    0x2e39(%rip),%r8        # 4020 <stdout@GLIBC_2.2.5>
    11e7:	31 c9                	xor    %ecx,%ecx
    11e9:	31 c0                	xor    %eax,%eax
    11eb:	89 de                	mov    %ebx,%esi
    11ed:	44 89 e2             	mov    %r12d,%edx
    11f0:	d3 fe                	sar    %cl,%esi
    11f2:	d3 fa                	sar    %cl,%edx
    11f4:	83 e6 03             	and    $0x3,%esi
    11f7:	83 e2 03             	and    $0x3,%edx
    11fa:	39 d6                	cmp    %edx,%esi
    11fc:	74 0a                	je     1208 <main+0x1a8>
    11fe:	85 d2                	test   %edx,%edx
    1200:	75 56                	jne    1258 <main+0x1f8>
    1202:	89 ea                	mov    %ebp,%edx
    1204:	d3 e2                	shl    %cl,%edx
    1206:	09 d0                	or     %edx,%eax
    1208:	83 c1 02             	add    $0x2,%ecx
    120b:	83 f9 08             	cmp    $0x8,%ecx
    120e:	75 db                	jne    11eb <main+0x18b>
    1210:	0f b6 f8             	movzbl %al,%edi
    1213:	4c 89 c6             	mov    %r8,%rsi
    1216:	41 83 c4 01          	add    $0x1,%r12d
    121a:	e8 21 fe ff ff       	call   1040 <fputc@plt>
    121f:	41 81 fc 00 01 00 00 	cmp    $0x100,%r12d
    1226:	75 b8                	jne    11e0 <main+0x180>
    1228:	83 c3 01             	add    $0x1,%ebx
    122b:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
    1231:	75 a4                	jne    11d7 <main+0x177>
    1233:	48 8b 3d e6 2d 00 00 	mov    0x2de6(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    123a:	e8 f1 fd ff ff       	call   1030 <ferror@plt>
    123f:	85 c0                	test   %eax,%eax
    1241:	0f 95 c0             	setne  %al
    1244:	0f b6 c0             	movzbl %al,%eax
    1247:	01 c0                	add    %eax,%eax
    1249:	48 83 c4 10          	add    $0x10,%rsp
    124d:	5b                   	pop    %rbx
    124e:	5d                   	pop    %rbp
    124f:	41 5c                	pop    %r12
    1251:	c3                   	ret
    1252:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1258:	85 f6                	test   %esi,%esi
    125a:	75 14                	jne    1270 <main+0x210>
    125c:	ba 02 00 00 00       	mov    $0x2,%edx
    1261:	d3 e2                	shl    %cl,%edx
    1263:	09 d0                	or     %edx,%eax
    1265:	eb a1                	jmp    1208 <main+0x1a8>
    1267:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)
    1270:	ba 03 00 00 00       	mov    $0x3,%edx
    1275:	d3 e2                	shl    %cl,%edx
    1277:	09 d0                	or     %edx,%eax
    1279:	eb 8d                	jmp    1208 <main+0x1a8>
    127b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001280 <_start>:
    1280:	31 ed                	xor    %ebp,%ebp
    1282:	49 89 d1             	mov    %rdx,%r9
    1285:	5e                   	pop    %rsi
    1286:	48 89 e2             	mov    %rsp,%rdx
    1289:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    128d:	50                   	push   %rax
    128e:	54                   	push   %rsp
    128f:	45 31 c0             	xor    %r8d,%r8d
    1292:	31 c9                	xor    %ecx,%ecx
    1294:	48 8d 3d c5 fd ff ff 	lea    -0x23b(%rip),%rdi        # 1060 <main>
    129b:	ff 15 1f 2d 00 00    	call   *0x2d1f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    12a1:	f4                   	hlt
    12a2:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    12ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000012b0 <deregister_tm_clones>:
    12b0:	48 8d 3d 69 2d 00 00 	lea    0x2d69(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    12b7:	48 8d 05 62 2d 00 00 	lea    0x2d62(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    12be:	48 39 f8             	cmp    %rdi,%rax
    12c1:	74 15                	je     12d8 <deregister_tm_clones+0x28>
    12c3:	48 8b 05 fe 2c 00 00 	mov    0x2cfe(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    12ca:	48 85 c0             	test   %rax,%rax
    12cd:	74 09                	je     12d8 <deregister_tm_clones+0x28>
    12cf:	ff e0                	jmp    *%rax
    12d1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    12d8:	c3                   	ret
    12d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000012e0 <register_tm_clones>:
    12e0:	48 8d 3d 39 2d 00 00 	lea    0x2d39(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    12e7:	48 8d 35 32 2d 00 00 	lea    0x2d32(%rip),%rsi        # 4020 <stdout@GLIBC_2.2.5>
    12ee:	48 29 fe             	sub    %rdi,%rsi
    12f1:	48 89 f0             	mov    %rsi,%rax
    12f4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    12f8:	48 c1 f8 03          	sar    $0x3,%rax
    12fc:	48 01 c6             	add    %rax,%rsi
    12ff:	48 d1 fe             	sar    $1,%rsi
    1302:	74 14                	je     1318 <register_tm_clones+0x38>
    1304:	48 8b 05 cd 2c 00 00 	mov    0x2ccd(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    130b:	48 85 c0             	test   %rax,%rax
    130e:	74 08                	je     1318 <register_tm_clones+0x38>
    1310:	ff e0                	jmp    *%rax
    1312:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1318:	c3                   	ret
    1319:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001320 <__do_global_dtors_aux>:
    1320:	f3 0f 1e fa          	endbr64
    1324:	80 3d fd 2c 00 00 00 	cmpb   $0x0,0x2cfd(%rip)        # 4028 <completed.0>
    132b:	75 2b                	jne    1358 <__do_global_dtors_aux+0x38>
    132d:	55                   	push   %rbp
    132e:	48 83 3d aa 2c 00 00 00 	cmpq   $0x0,0x2caa(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1336:	48 89 e5             	mov    %rsp,%rbp
    1339:	74 0c                	je     1347 <__do_global_dtors_aux+0x27>
    133b:	48 8b 3d d6 2c 00 00 	mov    0x2cd6(%rip),%rdi        # 4018 <__dso_handle>
    1342:	e8 09 fd ff ff       	call   1050 <__cxa_finalize@plt>
    1347:	e8 64 ff ff ff       	call   12b0 <deregister_tm_clones>
    134c:	c6 05 d5 2c 00 00 01 	movb   $0x1,0x2cd5(%rip)        # 4028 <completed.0>
    1353:	5d                   	pop    %rbp
    1354:	c3                   	ret
    1355:	0f 1f 00             	nopl   (%rax)
    1358:	c3                   	ret
    1359:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001360 <frame_dummy>:
    1360:	f3 0f 1e fa          	endbr64
    1364:	e9 77 ff ff ff       	jmp    12e0 <register_tm_clones>
    1369:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001370 <wm_add_v2.isra.0>:
    1370:	89 f8                	mov    %edi,%eax
    1372:	c3                   	ret

Disassembly of section .fini:

0000000000001374 <_fini>:
    1374:	48 83 ec 08          	sub    $0x8,%rsp
    1378:	48 83 c4 08          	add    $0x8,%rsp
    137c:	c3                   	ret
