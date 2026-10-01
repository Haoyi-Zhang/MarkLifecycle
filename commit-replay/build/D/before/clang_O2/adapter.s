
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
    1171:	41 57                	push   %r15
    1173:	41 56                	push   %r14
    1175:	41 55                	push   %r13
    1177:	41 54                	push   %r12
    1179:	53                   	push   %rbx
    117a:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
    1181:	c7 44 24 0c f5 79 2b 6d 	movl   $0x6d2b79f5,0xc(%rsp)
    1189:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    118d:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1191:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1195:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1199:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    119d:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11a1:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11a5:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11a9:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11ad:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11b1:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11b5:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11b9:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11bd:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11c1:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11c5:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11c9:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11cd:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11d1:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11d5:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11d9:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11dd:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11e1:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11e5:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11e9:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11ed:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11f1:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11f5:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11f9:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11fd:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1201:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1205:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1209:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    120d:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1211:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1215:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1219:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    121d:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1221:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1225:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1229:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    122d:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1231:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1235:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1239:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    123d:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1241:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1245:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1249:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    124d:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1251:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1255:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1259:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    125d:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1261:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1265:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1269:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    126d:	83 f8 ff             	cmp    $0xffffffff,%eax
    1270:	0f 84 02 01 00 00    	je     1378 <main+0x208>
    1276:	0f 28 05 93 0d 00 00 	movaps 0xd93(%rip),%xmm0        # 2010 <_IO_stdin_used+0x10>
    127d:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
    1282:	0f 28 05 97 0d 00 00 	movaps 0xd97(%rip),%xmm0        # 2020 <_IO_stdin_used+0x20>
    1289:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
    128e:	0f 28 05 9b 0d 00 00 	movaps 0xd9b(%rip),%xmm0        # 2030 <_IO_stdin_used+0x30>
    1295:	0f 29 84 24 80 00 00 00 	movaps %xmm0,0x80(%rsp)
    129d:	0f 28 05 9c 0d 00 00 	movaps 0xd9c(%rip),%xmm0        # 2040 <_IO_stdin_used+0x40>
    12a4:	0f 29 84 24 90 00 00 00 	movaps %xmm0,0x90(%rsp)
    12ac:	0f 28 05 9d 0d 00 00 	movaps 0xd9d(%rip),%xmm0        # 2050 <_IO_stdin_used+0x50>
    12b3:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
    12b8:	0f 29 44 24 20       	movaps %xmm0,0x20(%rsp)
    12bd:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
    12c2:	0f 29 44 24 40       	movaps %xmm0,0x40(%rsp)
    12c7:	c6 44 24 50 a5       	movb   $0xa5,0x50(%rsp)
    12cc:	c6 44 24 10 00       	movb   $0x0,0x10(%rsp)
    12d1:	4c 8b 2d f0 2c 00 00 	mov    0x2cf0(%rip),%r13        # 3fc8 <stdout@GLIBC_2.2.5>
    12d8:	49 8b 4d 00          	mov    0x0(%r13),%rcx
    12dc:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    12e1:	be 01 00 00 00       	mov    $0x1,%esi
    12e6:	ba 01 00 00 00       	mov    $0x1,%edx
    12eb:	e8 70 fd ff ff       	call   1060 <fwrite@plt>
    12f0:	48 83 f8 01          	cmp    $0x1,%rax
    12f4:	75 6c                	jne    1362 <main+0x1f2>
    12f6:	bb 02 00 00 00       	mov    $0x2,%ebx
    12fb:	ba 40 00 00 00       	mov    $0x40,%edx
    1300:	4c 8d 74 24 10       	lea    0x10(%rsp),%r14
    1305:	4c 8d 7c 24 60       	lea    0x60(%rsp),%r15
    130a:	bd 40 00 00 00       	mov    $0x40,%ebp
    130f:	90                   	nop
    1310:	48 83 ed 01          	sub    $0x1,%rbp
    1314:	72 4c                	jb     1362 <main+0x1f2>
    1316:	4c 8d 63 ff          	lea    -0x1(%rbx),%r12
    131a:	48 8d 3c 1c          	lea    (%rsp,%rbx,1),%rdi
    131e:	48 83 c7 0f          	add    $0xf,%rdi
    1322:	be a5 00 00 00       	mov    $0xa5,%esi
    1327:	e8 14 fd ff ff       	call   1040 <memset@plt>
    132c:	4c 89 f7             	mov    %r14,%rdi
    132f:	4c 89 fe             	mov    %r15,%rsi
    1332:	4c 89 e2             	mov    %r12,%rdx
    1335:	e8 16 fd ff ff       	call   1050 <memcpy@plt>
    133a:	c6 44 1c 0f 00       	movb   $0x0,0xf(%rsp,%rbx,1)
    133f:	49 8b 4d 00          	mov    0x0(%r13),%rcx
    1343:	be 01 00 00 00       	mov    $0x1,%esi
    1348:	4c 89 f7             	mov    %r14,%rdi
    134b:	48 89 da             	mov    %rbx,%rdx
    134e:	e8 0d fd ff ff       	call   1060 <fwrite@plt>
    1353:	48 8d 4b 01          	lea    0x1(%rbx),%rcx
    1357:	48 89 ea             	mov    %rbp,%rdx
    135a:	48 39 c3             	cmp    %rax,%rbx
    135d:	48 89 cb             	mov    %rcx,%rbx
    1360:	74 ae                	je     1310 <main+0x1a0>
    1362:	49 8b 7d 00          	mov    0x0(%r13),%rdi
    1366:	e8 c5 fc ff ff       	call   1030 <ferror@plt>
    136b:	89 c1                	mov    %eax,%ecx
    136d:	31 c0                	xor    %eax,%eax
    136f:	85 c9                	test   %ecx,%ecx
    1371:	0f 95 c0             	setne  %al
    1374:	01 c0                	add    %eax,%eax
    1376:	eb 05                	jmp    137d <main+0x20d>
    1378:	b8 61 00 00 00       	mov    $0x61,%eax
    137d:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
    1384:	5b                   	pop    %rbx
    1385:	41 5c                	pop    %r12
    1387:	41 5d                	pop    %r13
    1389:	41 5e                	pop    %r14
    138b:	41 5f                	pop    %r15
    138d:	5d                   	pop    %rbp
    138e:	c3                   	ret

Disassembly of section .fini:

0000000000001390 <_fini>:
    1390:	48 83 ec 08          	sub    $0x8,%rsp
    1394:	48 83 c4 08          	add    $0x8,%rsp
    1398:	c3                   	ret
