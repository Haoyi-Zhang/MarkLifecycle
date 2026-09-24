
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
    1060:	53                   	push   %rbx
    1061:	48 83 ec 10          	sub    $0x10,%rsp
    1065:	c7 44 24 0c f5 79 2b 6d 	movl   $0x6d2b79f5,0xc(%rsp)
    106d:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1071:	e8 aa 02 00 00       	call   1320 <wm_add_v2.isra.0>
    1076:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    107a:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    107e:	e8 9d 02 00 00       	call   1320 <wm_add_v2.isra.0>
    1083:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1087:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    108b:	e8 90 02 00 00       	call   1320 <wm_add_v2.isra.0>
    1090:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1094:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1098:	e8 83 02 00 00       	call   1320 <wm_add_v2.isra.0>
    109d:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10a1:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10a5:	e8 76 02 00 00       	call   1320 <wm_add_v2.isra.0>
    10aa:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10ae:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10b2:	e8 69 02 00 00       	call   1320 <wm_add_v2.isra.0>
    10b7:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10bb:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10bf:	e8 5c 02 00 00       	call   1320 <wm_add_v2.isra.0>
    10c4:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10c8:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10cc:	e8 4f 02 00 00       	call   1320 <wm_add_v2.isra.0>
    10d1:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10d5:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10d9:	e8 42 02 00 00       	call   1320 <wm_add_v2.isra.0>
    10de:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10e2:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10e6:	e8 35 02 00 00       	call   1320 <wm_add_v2.isra.0>
    10eb:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10ef:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10f3:	e8 28 02 00 00       	call   1320 <wm_add_v2.isra.0>
    10f8:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10fc:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1100:	e8 1b 02 00 00       	call   1320 <wm_add_v2.isra.0>
    1105:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1109:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    110d:	e8 0e 02 00 00       	call   1320 <wm_add_v2.isra.0>
    1112:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1116:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    111a:	e8 01 02 00 00       	call   1320 <wm_add_v2.isra.0>
    111f:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1123:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1127:	e8 f4 01 00 00       	call   1320 <wm_add_v2.isra.0>
    112c:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1130:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1134:	e8 e7 01 00 00       	call   1320 <wm_add_v2.isra.0>
    1139:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    113d:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1141:	e8 da 01 00 00       	call   1320 <wm_add_v2.isra.0>
    1146:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    114a:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    114e:	e8 cd 01 00 00       	call   1320 <wm_add_v2.isra.0>
    1153:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1157:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    115b:	e8 c0 01 00 00       	call   1320 <wm_add_v2.isra.0>
    1160:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1164:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1168:	e8 b3 01 00 00       	call   1320 <wm_add_v2.isra.0>
    116d:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1171:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1175:	e8 a6 01 00 00       	call   1320 <wm_add_v2.isra.0>
    117a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    117e:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1182:	e8 99 01 00 00       	call   1320 <wm_add_v2.isra.0>
    1187:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    118b:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    118f:	e8 8c 01 00 00       	call   1320 <wm_add_v2.isra.0>
    1194:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1198:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    119c:	e8 7f 01 00 00       	call   1320 <wm_add_v2.isra.0>
    11a1:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11a5:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11a9:	e8 72 01 00 00       	call   1320 <wm_add_v2.isra.0>
    11ae:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11b2:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11b6:	e8 65 01 00 00       	call   1320 <wm_add_v2.isra.0>
    11bb:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11bf:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11c3:	e8 58 01 00 00       	call   1320 <wm_add_v2.isra.0>
    11c8:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11cc:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11d0:	e8 4b 01 00 00       	call   1320 <wm_add_v2.isra.0>
    11d5:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11d9:	8b 54 24 0c          	mov    0xc(%rsp),%edx
    11dd:	b8 61 00 00 00       	mov    $0x61,%eax
    11e2:	83 fa ff             	cmp    $0xffffffff,%edx
    11e5:	74 3b                	je     1222 <main+0x1c2>
    11e7:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    11ec:	0f 1f 40 00          	nopl   0x0(%rax)
    11f0:	89 df                	mov    %ebx,%edi
    11f2:	48 8b 35 27 2e 00 00 	mov    0x2e27(%rip),%rsi        # 4020 <stdout@GLIBC_2.2.5>
    11f9:	83 eb 01             	sub    $0x1,%ebx
    11fc:	83 e7 01             	and    $0x1,%edi
    11ff:	e8 3c fe ff ff       	call   1040 <fputc@plt>
    1204:	81 fb ff ff fe ff    	cmp    $0xfffeffff,%ebx
    120a:	75 e4                	jne    11f0 <main+0x190>
    120c:	48 8b 3d 0d 2e 00 00 	mov    0x2e0d(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1213:	e8 18 fe ff ff       	call   1030 <ferror@plt>
    1218:	85 c0                	test   %eax,%eax
    121a:	0f 95 c0             	setne  %al
    121d:	0f b6 c0             	movzbl %al,%eax
    1220:	01 c0                	add    %eax,%eax
    1222:	48 83 c4 10          	add    $0x10,%rsp
    1226:	5b                   	pop    %rbx
    1227:	c3                   	ret
    1228:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)

0000000000001230 <_start>:
    1230:	31 ed                	xor    %ebp,%ebp
    1232:	49 89 d1             	mov    %rdx,%r9
    1235:	5e                   	pop    %rsi
    1236:	48 89 e2             	mov    %rsp,%rdx
    1239:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    123d:	50                   	push   %rax
    123e:	54                   	push   %rsp
    123f:	45 31 c0             	xor    %r8d,%r8d
    1242:	31 c9                	xor    %ecx,%ecx
    1244:	48 8d 3d 15 fe ff ff 	lea    -0x1eb(%rip),%rdi        # 1060 <main>
    124b:	ff 15 6f 2d 00 00    	call   *0x2d6f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1251:	f4                   	hlt
    1252:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    125c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001260 <deregister_tm_clones>:
    1260:	48 8d 3d b9 2d 00 00 	lea    0x2db9(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1267:	48 8d 05 b2 2d 00 00 	lea    0x2db2(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    126e:	48 39 f8             	cmp    %rdi,%rax
    1271:	74 15                	je     1288 <deregister_tm_clones+0x28>
    1273:	48 8b 05 4e 2d 00 00 	mov    0x2d4e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    127a:	48 85 c0             	test   %rax,%rax
    127d:	74 09                	je     1288 <deregister_tm_clones+0x28>
    127f:	ff e0                	jmp    *%rax
    1281:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1288:	c3                   	ret
    1289:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001290 <register_tm_clones>:
    1290:	48 8d 3d 89 2d 00 00 	lea    0x2d89(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1297:	48 8d 35 82 2d 00 00 	lea    0x2d82(%rip),%rsi        # 4020 <stdout@GLIBC_2.2.5>
    129e:	48 29 fe             	sub    %rdi,%rsi
    12a1:	48 89 f0             	mov    %rsi,%rax
    12a4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    12a8:	48 c1 f8 03          	sar    $0x3,%rax
    12ac:	48 01 c6             	add    %rax,%rsi
    12af:	48 d1 fe             	sar    $1,%rsi
    12b2:	74 14                	je     12c8 <register_tm_clones+0x38>
    12b4:	48 8b 05 1d 2d 00 00 	mov    0x2d1d(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    12bb:	48 85 c0             	test   %rax,%rax
    12be:	74 08                	je     12c8 <register_tm_clones+0x38>
    12c0:	ff e0                	jmp    *%rax
    12c2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    12c8:	c3                   	ret
    12c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000012d0 <__do_global_dtors_aux>:
    12d0:	f3 0f 1e fa          	endbr64
    12d4:	80 3d 4d 2d 00 00 00 	cmpb   $0x0,0x2d4d(%rip)        # 4028 <completed.0>
    12db:	75 2b                	jne    1308 <__do_global_dtors_aux+0x38>
    12dd:	55                   	push   %rbp
    12de:	48 83 3d fa 2c 00 00 00 	cmpq   $0x0,0x2cfa(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    12e6:	48 89 e5             	mov    %rsp,%rbp
    12e9:	74 0c                	je     12f7 <__do_global_dtors_aux+0x27>
    12eb:	48 8b 3d 26 2d 00 00 	mov    0x2d26(%rip),%rdi        # 4018 <__dso_handle>
    12f2:	e8 59 fd ff ff       	call   1050 <__cxa_finalize@plt>
    12f7:	e8 64 ff ff ff       	call   1260 <deregister_tm_clones>
    12fc:	c6 05 25 2d 00 00 01 	movb   $0x1,0x2d25(%rip)        # 4028 <completed.0>
    1303:	5d                   	pop    %rbp
    1304:	c3                   	ret
    1305:	0f 1f 00             	nopl   (%rax)
    1308:	c3                   	ret
    1309:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001310 <frame_dummy>:
    1310:	f3 0f 1e fa          	endbr64
    1314:	e9 77 ff ff ff       	jmp    1290 <register_tm_clones>
    1319:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001320 <wm_add_v2.isra.0>:
    1320:	89 f8                	mov    %edi,%eax
    1322:	c3                   	ret

Disassembly of section .fini:

0000000000001324 <_fini>:
    1324:	48 83 ec 08          	sub    $0x8,%rsp
    1328:	48 83 c4 08          	add    $0x8,%rsp
    132c:	c3                   	ret
