
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
    1094:	48 8d 3d 4e 02 00 00 	lea    0x24e(%rip),%rdi        # 12e9 <main>
    109b:	ff 15 1f 2f 00 00    	call   *0x2f1f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    10a1:	f4                   	hlt
    10a2:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    10ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000010b0 <deregister_tm_clones>:
    10b0:	48 8d 3d 79 2f 00 00 	lea    0x2f79(%rip),%rdi        # 4030 <stdout@GLIBC_2.2.5>
    10b7:	48 8d 05 72 2f 00 00 	lea    0x2f72(%rip),%rax        # 4030 <stdout@GLIBC_2.2.5>
    10be:	48 39 f8             	cmp    %rdi,%rax
    10c1:	74 15                	je     10d8 <deregister_tm_clones+0x28>
    10c3:	48 8b 05 fe 2e 00 00 	mov    0x2efe(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    10ca:	48 85 c0             	test   %rax,%rax
    10cd:	74 09                	je     10d8 <deregister_tm_clones+0x28>
    10cf:	ff e0                	jmp    *%rax
    10d1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10d8:	c3                   	ret
    10d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010e0 <register_tm_clones>:
    10e0:	48 8d 3d 49 2f 00 00 	lea    0x2f49(%rip),%rdi        # 4030 <stdout@GLIBC_2.2.5>
    10e7:	48 8d 35 42 2f 00 00 	lea    0x2f42(%rip),%rsi        # 4030 <stdout@GLIBC_2.2.5>
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
    1124:	80 3d 0d 2f 00 00 00 	cmpb   $0x0,0x2f0d(%rip)        # 4038 <completed.0>
    112b:	75 2b                	jne    1158 <__do_global_dtors_aux+0x38>
    112d:	55                   	push   %rbp
    112e:	48 83 3d aa 2e 00 00 00 	cmpq   $0x0,0x2eaa(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1136:	48 89 e5             	mov    %rsp,%rbp
    1139:	74 0c                	je     1147 <__do_global_dtors_aux+0x27>
    113b:	48 8b 3d e6 2e 00 00 	mov    0x2ee6(%rip),%rdi        # 4028 <__dso_handle>
    1142:	e8 29 ff ff ff       	call   1070 <__cxa_finalize@plt>
    1147:	e8 64 ff ff ff       	call   10b0 <deregister_tm_clones>
    114c:	c6 05 e5 2e 00 00 01 	movb   $0x1,0x2ee5(%rip)        # 4038 <completed.0>
    1153:	5d                   	pop    %rbp
    1154:	c3                   	ret
    1155:	0f 1f 00             	nopl   (%rax)
    1158:	c3                   	ret
    1159:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001160 <frame_dummy>:
    1160:	f3 0f 1e fa          	endbr64
    1164:	e9 77 ff ff ff       	jmp    10e0 <register_tm_clones>

0000000000001169 <wm_add_v2>:
    1169:	55                   	push   %rbp
    116a:	48 89 e5             	mov    %rsp,%rbp
    116d:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1170:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1173:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1176:	5d                   	pop    %rbp
    1177:	c3                   	ret

0000000000001178 <wm_xor_v2>:
    1178:	55                   	push   %rbp
    1179:	48 89 e5             	mov    %rsp,%rbp
    117c:	89 7d fc             	mov    %edi,-0x4(%rbp)
    117f:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1182:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1185:	5d                   	pop    %rbp
    1186:	c3                   	ret

0000000000001187 <emit_u32>:
    1187:	55                   	push   %rbp
    1188:	48 89 e5             	mov    %rsp,%rbp
    118b:	48 83 ec 20          	sub    $0x20,%rsp
    118f:	89 7d ec             	mov    %edi,-0x14(%rbp)
    1192:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1195:	88 45 fc             	mov    %al,-0x4(%rbp)
    1198:	8b 45 ec             	mov    -0x14(%rbp),%eax
    119b:	c1 e8 08             	shr    $0x8,%eax
    119e:	88 45 fd             	mov    %al,-0x3(%rbp)
    11a1:	8b 45 ec             	mov    -0x14(%rbp),%eax
    11a4:	c1 e8 10             	shr    $0x10,%eax
    11a7:	88 45 fe             	mov    %al,-0x2(%rbp)
    11aa:	8b 45 ec             	mov    -0x14(%rbp),%eax
    11ad:	c1 e8 18             	shr    $0x18,%eax
    11b0:	88 45 ff             	mov    %al,-0x1(%rbp)
    11b3:	48 8b 15 76 2e 00 00 	mov    0x2e76(%rip),%rdx        # 4030 <stdout@GLIBC_2.2.5>
    11ba:	48 8d 45 fc          	lea    -0x4(%rbp),%rax
    11be:	48 89 d1             	mov    %rdx,%rcx
    11c1:	ba 04 00 00 00       	mov    $0x4,%edx
    11c6:	be 01 00 00 00       	mov    $0x1,%esi
    11cb:	48 89 c7             	mov    %rax,%rdi
    11ce:	e8 8d fe ff ff       	call   1060 <fwrite@plt>
    11d3:	90                   	nop
    11d4:	c9                   	leave
    11d5:	c3                   	ret

00000000000011d6 <hash_bytes>:
    11d6:	55                   	push   %rbp
    11d7:	48 89 e5             	mov    %rsp,%rbp
    11da:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    11de:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    11e2:	c7 45 fc c5 9d 1c 81 	movl   $0x811c9dc5,-0x4(%rbp)
    11e9:	48 c7 45 f0 00 00 00 00 	movq   $0x0,-0x10(%rbp)
    11f1:	eb 25                	jmp    1218 <hash_bytes+0x42>
    11f3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    11f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    11fb:	48 01 d0             	add    %rdx,%rax
    11fe:	0f b6 00             	movzbl (%rax),%eax
    1201:	0f b6 c0             	movzbl %al,%eax
    1204:	31 45 fc             	xor    %eax,-0x4(%rbp)
    1207:	8b 45 fc             	mov    -0x4(%rbp),%eax
    120a:	69 c0 93 01 00 01    	imul   $0x1000193,%eax,%eax
    1210:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1213:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    1218:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    121c:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
    1220:	72 d1                	jb     11f3 <hash_bytes+0x1d>
    1222:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1225:	5d                   	pop    %rbp
    1226:	c3                   	ret

0000000000001227 <run_contract>:
    1227:	55                   	push   %rbp
    1228:	48 89 e5             	mov    %rsp,%rbp
    122b:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
    1232:	48 c7 45 f8 00 00 00 00 	movq   $0x0,-0x8(%rbp)
    123a:	eb 27                	jmp    1263 <run_contract+0x3c>
    123c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1240:	89 c2                	mov    %eax,%edx
    1242:	89 d0                	mov    %edx,%eax
    1244:	c1 e0 03             	shl    $0x3,%eax
    1247:	01 d0                	add    %edx,%eax
    1249:	c1 e0 02             	shl    $0x2,%eax
    124c:	01 d0                	add    %edx,%eax
    124e:	8d 50 0b             	lea    0xb(%rax),%edx
    1251:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
    1255:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1259:	48 01 c8             	add    %rcx,%rax
    125c:	88 10                	mov    %dl,(%rax)
    125e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    1263:	48 83 7d f8 3f       	cmpq   $0x3f,-0x8(%rbp)
    1268:	76 d2                	jbe    123c <run_contract+0x15>
    126a:	48 c7 45 f0 00 00 00 00 	movq   $0x0,-0x10(%rbp)
    1272:	eb 6a                	jmp    12de <run_contract+0xb7>
    1274:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    127b:	ba 41 00 00 00       	mov    $0x41,%edx
    1280:	be a5 00 00 00       	mov    $0xa5,%esi
    1285:	48 89 c7             	mov    %rax,%rdi
    1288:	e8 b3 fd ff ff       	call   1040 <memset@plt>
    128d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1291:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
    1295:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    129c:	48 89 ce             	mov    %rcx,%rsi
    129f:	48 89 c7             	mov    %rax,%rdi
    12a2:	e8 a9 fd ff ff       	call   1050 <memcpy@plt>
    12a7:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
    12ae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    12b2:	48 01 d0             	add    %rdx,%rax
    12b5:	c6 00 00             	movb   $0x0,(%rax)
    12b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    12bc:	48 8d 50 01          	lea    0x1(%rax),%rdx
    12c0:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    12c7:	48 89 d6             	mov    %rdx,%rsi
    12ca:	48 89 c7             	mov    %rax,%rdi
    12cd:	e8 04 ff ff ff       	call   11d6 <hash_bytes>
    12d2:	89 c7                	mov    %eax,%edi
    12d4:	e8 ae fe ff ff       	call   1187 <emit_u32>
    12d9:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    12de:	48 83 7d f0 40       	cmpq   $0x40,-0x10(%rbp)
    12e3:	76 8f                	jbe    1274 <run_contract+0x4d>
    12e5:	90                   	nop
    12e6:	90                   	nop
    12e7:	c9                   	leave
    12e8:	c3                   	ret

00000000000012e9 <main>:
    12e9:	55                   	push   %rbp
    12ea:	48 89 e5             	mov    %rsp,%rbp
    12ed:	48 83 ec 10          	sub    $0x10,%rsp
    12f1:	c7 45 fc f5 79 2b 6d 	movl   $0x6d2b79f5,-0x4(%rbp)
    12f8:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12fb:	be a3 25 c1 bf       	mov    $0xbfc125a3,%esi
    1300:	89 c7                	mov    %eax,%edi
    1302:	e8 62 fe ff ff       	call   1169 <wm_add_v2>
    1307:	89 45 fc             	mov    %eax,-0x4(%rbp)
    130a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    130d:	be ad 9b b9 b1       	mov    $0xb1b99bad,%esi
    1312:	89 c7                	mov    %eax,%edi
    1314:	e8 50 fe ff ff       	call   1169 <wm_add_v2>
    1319:	89 45 fc             	mov    %eax,-0x4(%rbp)
    131c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    131f:	be df 57 2f 53       	mov    $0x532f57df,%esi
    1324:	89 c7                	mov    %eax,%edi
    1326:	e8 3e fe ff ff       	call   1169 <wm_add_v2>
    132b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    132e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1331:	be b9 5f 0f 37       	mov    $0x370f5fb9,%esi
    1336:	89 c7                	mov    %eax,%edi
    1338:	e8 2c fe ff ff       	call   1169 <wm_add_v2>
    133d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1340:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1343:	be c5 37 a1 e1       	mov    $0xe1a137c5,%esi
    1348:	89 c7                	mov    %eax,%edi
    134a:	e8 1a fe ff ff       	call   1169 <wm_add_v2>
    134f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1352:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1355:	be 11 05 bb 27       	mov    $0x27bb0511,%esi
    135a:	89 c7                	mov    %eax,%edi
    135c:	e8 17 fe ff ff       	call   1178 <wm_xor_v2>
    1361:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1364:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1367:	be 0f 95 8d a7       	mov    $0xa78d950f,%esi
    136c:	89 c7                	mov    %eax,%edi
    136e:	e8 f6 fd ff ff       	call   1169 <wm_add_v2>
    1373:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1376:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1379:	be 25 dd b3 73       	mov    $0x73b3dd25,%esi
    137e:	89 c7                	mov    %eax,%edi
    1380:	e8 f3 fd ff ff       	call   1178 <wm_xor_v2>
    1385:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1388:	8b 45 fc             	mov    -0x4(%rbp),%eax
    138b:	be 9d c7 bf f3       	mov    $0xf3bfc79d,%esi
    1390:	89 c7                	mov    %eax,%edi
    1392:	e8 e1 fd ff ff       	call   1178 <wm_xor_v2>
    1397:	89 45 fc             	mov    %eax,-0x4(%rbp)
    139a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    139d:	be 63 63 e3 93       	mov    $0x93e36363,%esi
    13a2:	89 c7                	mov    %eax,%edi
    13a4:	e8 c0 fd ff ff       	call   1169 <wm_add_v2>
    13a9:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13af:	be a1 d5 8d fd       	mov    $0xfd8dd5a1,%esi
    13b4:	89 c7                	mov    %eax,%edi
    13b6:	e8 ae fd ff ff       	call   1169 <wm_add_v2>
    13bb:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13be:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13c1:	be eb 67 3b c9       	mov    $0xc93b67eb,%esi
    13c6:	89 c7                	mov    %eax,%edi
    13c8:	e8 9c fd ff ff       	call   1169 <wm_add_v2>
    13cd:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13d0:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13d3:	be 99 b3 fd c7       	mov    $0xc7fdb399,%esi
    13d8:	89 c7                	mov    %eax,%edi
    13da:	e8 99 fd ff ff       	call   1178 <wm_xor_v2>
    13df:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13e2:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13e5:	be d1 fd d1 19       	mov    $0x19d1fdd1,%esi
    13ea:	89 c7                	mov    %eax,%edi
    13ec:	e8 87 fd ff ff       	call   1178 <wm_xor_v2>
    13f1:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13f4:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13f7:	be 8b c3 5d b1       	mov    $0xb15dc38b,%esi
    13fc:	89 c7                	mov    %eax,%edi
    13fe:	e8 75 fd ff ff       	call   1178 <wm_xor_v2>
    1403:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1406:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1409:	be 9b 81 e7 61       	mov    $0x61e7819b,%esi
    140e:	89 c7                	mov    %eax,%edi
    1410:	e8 54 fd ff ff       	call   1169 <wm_add_v2>
    1415:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1418:	8b 45 fc             	mov    -0x4(%rbp),%eax
    141b:	be b7 8f 39 21       	mov    $0x21398fb7,%esi
    1420:	89 c7                	mov    %eax,%edi
    1422:	e8 42 fd ff ff       	call   1169 <wm_add_v2>
    1427:	89 45 fc             	mov    %eax,-0x4(%rbp)
    142a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    142d:	be 7b 83 3d c7       	mov    $0xc73d837b,%esi
    1432:	89 c7                	mov    %eax,%edi
    1434:	e8 30 fd ff ff       	call   1169 <wm_add_v2>
    1439:	89 45 fc             	mov    %eax,-0x4(%rbp)
    143c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    143f:	be b9 e9 fd cd       	mov    $0xcdfde9b9,%esi
    1444:	89 c7                	mov    %eax,%edi
    1446:	e8 1e fd ff ff       	call   1169 <wm_add_v2>
    144b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    144e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1451:	be 31 d5 01 3b       	mov    $0x3b01d531,%esi
    1456:	89 c7                	mov    %eax,%edi
    1458:	e8 0c fd ff ff       	call   1169 <wm_add_v2>
    145d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1460:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1463:	be d3 bb 7d 99       	mov    $0x997dbbd3,%esi
    1468:	89 c7                	mov    %eax,%edi
    146a:	e8 fa fc ff ff       	call   1169 <wm_add_v2>
    146f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1472:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1475:	be 35 af fb eb       	mov    $0xebfbaf35,%esi
    147a:	89 c7                	mov    %eax,%edi
    147c:	e8 e8 fc ff ff       	call   1169 <wm_add_v2>
    1481:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1484:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1487:	be b1 b7 85 03       	mov    $0x385b7b1,%esi
    148c:	89 c7                	mov    %eax,%edi
    148e:	e8 d6 fc ff ff       	call   1169 <wm_add_v2>
    1493:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1496:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1499:	be 07 85 57 ad       	mov    $0xad578507,%esi
    149e:	89 c7                	mov    %eax,%edi
    14a0:	e8 d3 fc ff ff       	call   1178 <wm_xor_v2>
    14a5:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14a8:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14ab:	be 23 1d ad d7       	mov    $0xd7ad1d23,%esi
    14b0:	89 c7                	mov    %eax,%edi
    14b2:	e8 b2 fc ff ff       	call   1169 <wm_add_v2>
    14b7:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14ba:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14bd:	be 79 33 c1 ad       	mov    $0xadc13379,%esi
    14c2:	89 c7                	mov    %eax,%edi
    14c4:	e8 af fc ff ff       	call   1178 <wm_xor_v2>
    14c9:	89 45 fc             	mov    %eax,-0x4(%rbp)
    14cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
    14cf:	83 f8 ff             	cmp    $0xffffffff,%eax
    14d2:	75 07                	jne    14db <main+0x1f2>
    14d4:	b8 61 00 00 00       	mov    $0x61,%eax
    14d9:	eb 24                	jmp    14ff <main+0x216>
    14db:	e8 47 fd ff ff       	call   1227 <run_contract>
    14e0:	48 8b 05 49 2b 00 00 	mov    0x2b49(%rip),%rax        # 4030 <stdout@GLIBC_2.2.5>
    14e7:	48 89 c7             	mov    %rax,%rdi
    14ea:	e8 41 fb ff ff       	call   1030 <ferror@plt>
    14ef:	85 c0                	test   %eax,%eax
    14f1:	74 07                	je     14fa <main+0x211>
    14f3:	b8 02 00 00 00       	mov    $0x2,%eax
    14f8:	eb 05                	jmp    14ff <main+0x216>
    14fa:	b8 00 00 00 00       	mov    $0x0,%eax
    14ff:	c9                   	leave
    1500:	c3                   	ret

Disassembly of section .fini:

0000000000001504 <_fini>:
    1504:	48 83 ec 08          	sub    $0x8,%rsp
    1508:	48 83 c4 08          	add    $0x8,%rsp
    150c:	c3                   	ret
