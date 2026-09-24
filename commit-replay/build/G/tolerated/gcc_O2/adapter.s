
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
    1071:	e8 9a 02 00 00       	call   1310 <wm_add_v2.isra.0>
    1076:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    107a:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    107e:	e8 8d 02 00 00       	call   1310 <wm_add_v2.isra.0>
    1083:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1087:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    108b:	e8 80 02 00 00       	call   1310 <wm_add_v2.isra.0>
    1090:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1094:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1098:	e8 73 02 00 00       	call   1310 <wm_add_v2.isra.0>
    109d:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10a1:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10a5:	e8 66 02 00 00       	call   1310 <wm_add_v2.isra.0>
    10aa:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10ae:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10b2:	e8 59 02 00 00       	call   1310 <wm_add_v2.isra.0>
    10b7:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10bb:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10bf:	e8 4c 02 00 00       	call   1310 <wm_add_v2.isra.0>
    10c4:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10c8:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10cc:	e8 3f 02 00 00       	call   1310 <wm_add_v2.isra.0>
    10d1:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10d5:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10d9:	e8 32 02 00 00       	call   1310 <wm_add_v2.isra.0>
    10de:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10e2:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10e6:	e8 25 02 00 00       	call   1310 <wm_add_v2.isra.0>
    10eb:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10ef:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    10f3:	e8 18 02 00 00       	call   1310 <wm_add_v2.isra.0>
    10f8:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    10fc:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1100:	e8 0b 02 00 00       	call   1310 <wm_add_v2.isra.0>
    1105:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1109:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    110d:	e8 fe 01 00 00       	call   1310 <wm_add_v2.isra.0>
    1112:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1116:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    111a:	e8 f1 01 00 00       	call   1310 <wm_add_v2.isra.0>
    111f:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1123:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1127:	e8 e4 01 00 00       	call   1310 <wm_add_v2.isra.0>
    112c:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1130:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1134:	e8 d7 01 00 00       	call   1310 <wm_add_v2.isra.0>
    1139:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    113d:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1141:	e8 ca 01 00 00       	call   1310 <wm_add_v2.isra.0>
    1146:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    114a:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    114e:	e8 bd 01 00 00       	call   1310 <wm_add_v2.isra.0>
    1153:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1157:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    115b:	e8 b0 01 00 00       	call   1310 <wm_add_v2.isra.0>
    1160:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1164:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1168:	e8 a3 01 00 00       	call   1310 <wm_add_v2.isra.0>
    116d:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1171:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1175:	e8 96 01 00 00       	call   1310 <wm_add_v2.isra.0>
    117a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    117e:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1182:	e8 89 01 00 00       	call   1310 <wm_add_v2.isra.0>
    1187:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    118b:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    118f:	e8 7c 01 00 00       	call   1310 <wm_add_v2.isra.0>
    1194:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1198:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    119c:	e8 6f 01 00 00       	call   1310 <wm_add_v2.isra.0>
    11a1:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11a5:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11a9:	e8 62 01 00 00       	call   1310 <wm_add_v2.isra.0>
    11ae:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11b2:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    11b6:	e8 55 01 00 00       	call   1310 <wm_add_v2.isra.0>
    11bb:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11bf:	8b 54 24 0c          	mov    0xc(%rsp),%edx
    11c3:	b8 61 00 00 00       	mov    $0x61,%eax
    11c8:	83 fa ff             	cmp    $0xffffffff,%edx
    11cb:	74 45                	je     1212 <main+0x1b2>
    11cd:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    11d2:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
    11dd:	0f 1f 00             	nopl   (%rax)
    11e0:	89 df                	mov    %ebx,%edi
    11e2:	48 8b 35 37 2e 00 00 	mov    0x2e37(%rip),%rsi        # 4020 <stdout@GLIBC_2.2.5>
    11e9:	83 eb 01             	sub    $0x1,%ebx
    11ec:	83 e7 01             	and    $0x1,%edi
    11ef:	e8 4c fe ff ff       	call   1040 <fputc@plt>
    11f4:	81 fb ff ff fe ff    	cmp    $0xfffeffff,%ebx
    11fa:	75 e4                	jne    11e0 <main+0x180>
    11fc:	48 8b 3d 1d 2e 00 00 	mov    0x2e1d(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1203:	e8 28 fe ff ff       	call   1030 <ferror@plt>
    1208:	85 c0                	test   %eax,%eax
    120a:	0f 95 c0             	setne  %al
    120d:	0f b6 c0             	movzbl %al,%eax
    1210:	01 c0                	add    %eax,%eax
    1212:	48 83 c4 10          	add    $0x10,%rsp
    1216:	5b                   	pop    %rbx
    1217:	c3                   	ret
    1218:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)

0000000000001220 <_start>:
    1220:	31 ed                	xor    %ebp,%ebp
    1222:	49 89 d1             	mov    %rdx,%r9
    1225:	5e                   	pop    %rsi
    1226:	48 89 e2             	mov    %rsp,%rdx
    1229:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    122d:	50                   	push   %rax
    122e:	54                   	push   %rsp
    122f:	45 31 c0             	xor    %r8d,%r8d
    1232:	31 c9                	xor    %ecx,%ecx
    1234:	48 8d 3d 25 fe ff ff 	lea    -0x1db(%rip),%rdi        # 1060 <main>
    123b:	ff 15 7f 2d 00 00    	call   *0x2d7f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1241:	f4                   	hlt
    1242:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    124c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001250 <deregister_tm_clones>:
    1250:	48 8d 3d c9 2d 00 00 	lea    0x2dc9(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1257:	48 8d 05 c2 2d 00 00 	lea    0x2dc2(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    125e:	48 39 f8             	cmp    %rdi,%rax
    1261:	74 15                	je     1278 <deregister_tm_clones+0x28>
    1263:	48 8b 05 5e 2d 00 00 	mov    0x2d5e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    126a:	48 85 c0             	test   %rax,%rax
    126d:	74 09                	je     1278 <deregister_tm_clones+0x28>
    126f:	ff e0                	jmp    *%rax
    1271:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1278:	c3                   	ret
    1279:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001280 <register_tm_clones>:
    1280:	48 8d 3d 99 2d 00 00 	lea    0x2d99(%rip),%rdi        # 4020 <stdout@GLIBC_2.2.5>
    1287:	48 8d 35 92 2d 00 00 	lea    0x2d92(%rip),%rsi        # 4020 <stdout@GLIBC_2.2.5>
    128e:	48 29 fe             	sub    %rdi,%rsi
    1291:	48 89 f0             	mov    %rsi,%rax
    1294:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1298:	48 c1 f8 03          	sar    $0x3,%rax
    129c:	48 01 c6             	add    %rax,%rsi
    129f:	48 d1 fe             	sar    $1,%rsi
    12a2:	74 14                	je     12b8 <register_tm_clones+0x38>
    12a4:	48 8b 05 2d 2d 00 00 	mov    0x2d2d(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    12ab:	48 85 c0             	test   %rax,%rax
    12ae:	74 08                	je     12b8 <register_tm_clones+0x38>
    12b0:	ff e0                	jmp    *%rax
    12b2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    12b8:	c3                   	ret
    12b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000012c0 <__do_global_dtors_aux>:
    12c0:	f3 0f 1e fa          	endbr64
    12c4:	80 3d 5d 2d 00 00 00 	cmpb   $0x0,0x2d5d(%rip)        # 4028 <completed.0>
    12cb:	75 2b                	jne    12f8 <__do_global_dtors_aux+0x38>
    12cd:	55                   	push   %rbp
    12ce:	48 83 3d 0a 2d 00 00 00 	cmpq   $0x0,0x2d0a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    12d6:	48 89 e5             	mov    %rsp,%rbp
    12d9:	74 0c                	je     12e7 <__do_global_dtors_aux+0x27>
    12db:	48 8b 3d 36 2d 00 00 	mov    0x2d36(%rip),%rdi        # 4018 <__dso_handle>
    12e2:	e8 69 fd ff ff       	call   1050 <__cxa_finalize@plt>
    12e7:	e8 64 ff ff ff       	call   1250 <deregister_tm_clones>
    12ec:	c6 05 35 2d 00 00 01 	movb   $0x1,0x2d35(%rip)        # 4028 <completed.0>
    12f3:	5d                   	pop    %rbp
    12f4:	c3                   	ret
    12f5:	0f 1f 00             	nopl   (%rax)
    12f8:	c3                   	ret
    12f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001300 <frame_dummy>:
    1300:	f3 0f 1e fa          	endbr64
    1304:	e9 77 ff ff ff       	jmp    1280 <register_tm_clones>
    1309:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001310 <wm_add_v2.isra.0>:
    1310:	89 f8                	mov    %edi,%eax
    1312:	c3                   	ret

Disassembly of section .fini:

0000000000001314 <_fini>:
    1314:	48 83 ec 08          	sub    $0x8,%rsp
    1318:	48 83 c4 08          	add    $0x8,%rsp
    131c:	c3                   	ret
