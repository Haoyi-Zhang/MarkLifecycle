
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

0000000000001040 <memcpy@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4008 <memcpy@GLIBC_2.14>
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
    1161:	41 57                	push   %r15
    1163:	41 56                	push   %r14
    1165:	41 55                	push   %r13
    1167:	41 54                	push   %r12
    1169:	53                   	push   %rbx
    116a:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
    1171:	c7 44 24 08 f5 79 2b 6d 	movl   $0x6d2b79f5,0x8(%rsp)
    1179:	8b 44 24 08          	mov    0x8(%rsp),%eax
    117d:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1181:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1185:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1189:	8b 44 24 08          	mov    0x8(%rsp),%eax
    118d:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1191:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1195:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1199:	8b 44 24 08          	mov    0x8(%rsp),%eax
    119d:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11a1:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11a5:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11a9:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11ad:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11b1:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11b5:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11b9:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11bd:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11c1:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11c5:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11c9:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11cd:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11d1:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11d5:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11d9:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11dd:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11e1:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11e5:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11e9:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11ed:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11f1:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11f5:	89 44 24 08          	mov    %eax,0x8(%rsp)
    11f9:	8b 44 24 08          	mov    0x8(%rsp),%eax
    11fd:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1201:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1205:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1209:	8b 44 24 08          	mov    0x8(%rsp),%eax
    120d:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1211:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1215:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1219:	8b 44 24 08          	mov    0x8(%rsp),%eax
    121d:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1221:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1225:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1229:	8b 44 24 08          	mov    0x8(%rsp),%eax
    122d:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1231:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1235:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1239:	8b 44 24 08          	mov    0x8(%rsp),%eax
    123d:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1241:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1245:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1249:	8b 44 24 08          	mov    0x8(%rsp),%eax
    124d:	83 f8 ff             	cmp    $0xffffffff,%eax
    1250:	0f 84 69 01 00 00    	je     13bf <main+0x25f>
    1256:	0f 28 05 b3 0d 00 00 	movaps 0xdb3(%rip),%xmm0        # 2010 <_IO_stdin_used+0x10>
    125d:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
    1262:	0f 28 05 b7 0d 00 00 	movaps 0xdb7(%rip),%xmm0        # 2020 <_IO_stdin_used+0x20>
    1269:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
    126e:	0f 28 05 bb 0d 00 00 	movaps 0xdbb(%rip),%xmm0        # 2030 <_IO_stdin_used+0x30>
    1275:	0f 29 84 24 80 00 00 00 	movaps %xmm0,0x80(%rsp)
    127d:	0f 28 05 bc 0d 00 00 	movaps 0xdbc(%rip),%xmm0        # 2040 <_IO_stdin_used+0x40>
    1284:	0f 29 84 24 90 00 00 00 	movaps %xmm0,0x90(%rsp)
    128c:	41 bd 01 00 00 00    	mov    $0x1,%r13d
    1292:	31 db                	xor    %ebx,%ebx
    1294:	4c 8d 74 24 10       	lea    0x10(%rsp),%r14
    1299:	4c 8d 7c 24 60       	lea    0x60(%rsp),%r15
    129e:	48 8b 2d 23 2d 00 00 	mov    0x2d23(%rip),%rbp        # 3fc8 <stdout@GLIBC_2.2.5>
    12a5:	4c 8d 64 24 0c       	lea    0xc(%rsp),%r12
    12aa:	eb 2b                	jmp    12d7 <main+0x177>
    12ac:	0f 1f 40 00          	nopl   0x0(%rax)
    12b0:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    12b4:	48 8b 4d 00          	mov    0x0(%rbp),%rcx
    12b8:	be 01 00 00 00       	mov    $0x1,%esi
    12bd:	ba 04 00 00 00       	mov    $0x4,%edx
    12c2:	4c 89 e7             	mov    %r12,%rdi
    12c5:	e8 86 fd ff ff       	call   1050 <fwrite@plt>
    12ca:	49 ff c5             	inc    %r13
    12cd:	48 83 fb 41          	cmp    $0x41,%rbx
    12d1:	0f 84 d2 00 00 00    	je     13a9 <main+0x249>
    12d7:	0f 28 05 72 0d 00 00 	movaps 0xd72(%rip),%xmm0        # 2050 <_IO_stdin_used+0x50>
    12de:	0f 29 44 24 40       	movaps %xmm0,0x40(%rsp)
    12e3:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
    12e8:	0f 29 44 24 20       	movaps %xmm0,0x20(%rsp)
    12ed:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
    12f2:	c6 44 24 50 a5       	movb   $0xa5,0x50(%rsp)
    12f7:	4c 89 f7             	mov    %r14,%rdi
    12fa:	4c 89 fe             	mov    %r15,%rsi
    12fd:	48 89 da             	mov    %rbx,%rdx
    1300:	e8 3b fd ff ff       	call   1040 <memcpy@plt>
    1305:	c6 44 1c 10 00       	movb   $0x0,0x10(%rsp,%rbx,1)
    130a:	48 83 fb 03          	cmp    $0x3,%rbx
    130e:	73 10                	jae    1320 <main+0x1c0>
    1310:	b8 c5 9d 1c 81       	mov    $0x811c9dc5,%eax
    1315:	31 c9                	xor    %ecx,%ecx
    1317:	eb 54                	jmp    136d <main+0x20d>
    1319:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1320:	4c 89 ea             	mov    %r13,%rdx
    1323:	48 83 e2 fc          	and    $0xfffffffffffffffc,%rdx
    1327:	b8 c5 9d 1c 81       	mov    $0x811c9dc5,%eax
    132c:	31 c9                	xor    %ecx,%ecx
    132e:	66 90                	xchg   %ax,%ax
    1330:	0f b6 74 0c 10       	movzbl 0x10(%rsp,%rcx,1),%esi
    1335:	31 c6                	xor    %eax,%esi
    1337:	69 c6 93 01 00 01    	imul   $0x1000193,%esi,%eax
    133d:	0f b6 74 0c 11       	movzbl 0x11(%rsp,%rcx,1),%esi
    1342:	31 c6                	xor    %eax,%esi
    1344:	69 c6 93 01 00 01    	imul   $0x1000193,%esi,%eax
    134a:	0f b6 74 0c 12       	movzbl 0x12(%rsp,%rcx,1),%esi
    134f:	31 c6                	xor    %eax,%esi
    1351:	69 c6 93 01 00 01    	imul   $0x1000193,%esi,%eax
    1357:	0f b6 74 0c 13       	movzbl 0x13(%rsp,%rcx,1),%esi
    135c:	31 c6                	xor    %eax,%esi
    135e:	69 c6 93 01 00 01    	imul   $0x1000193,%esi,%eax
    1364:	48 83 c1 04          	add    $0x4,%rcx
    1368:	48 39 ca             	cmp    %rcx,%rdx
    136b:	75 c3                	jne    1330 <main+0x1d0>
    136d:	48 ff c3             	inc    %rbx
    1370:	f6 c3 03             	test   $0x3,%bl
    1373:	0f 84 37 ff ff ff    	je     12b0 <main+0x150>
    1379:	44 89 ea             	mov    %r13d,%edx
    137c:	83 e2 03             	and    $0x3,%edx
    137f:	48 01 e1             	add    %rsp,%rcx
    1382:	48 83 c1 10          	add    $0x10,%rcx
    1386:	31 f6                	xor    %esi,%esi
    1388:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    1390:	0f b6 3c 31          	movzbl (%rcx,%rsi,1),%edi
    1394:	31 c7                	xor    %eax,%edi
    1396:	69 c7 93 01 00 01    	imul   $0x1000193,%edi,%eax
    139c:	48 ff c6             	inc    %rsi
    139f:	48 39 f2             	cmp    %rsi,%rdx
    13a2:	75 ec                	jne    1390 <main+0x230>
    13a4:	e9 07 ff ff ff       	jmp    12b0 <main+0x150>
    13a9:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
    13ad:	e8 7e fc ff ff       	call   1030 <ferror@plt>
    13b2:	89 c1                	mov    %eax,%ecx
    13b4:	31 c0                	xor    %eax,%eax
    13b6:	85 c9                	test   %ecx,%ecx
    13b8:	0f 95 c0             	setne  %al
    13bb:	01 c0                	add    %eax,%eax
    13bd:	eb 05                	jmp    13c4 <main+0x264>
    13bf:	b8 61 00 00 00       	mov    $0x61,%eax
    13c4:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
    13cb:	5b                   	pop    %rbx
    13cc:	41 5c                	pop    %r12
    13ce:	41 5d                	pop    %r13
    13d0:	41 5e                	pop    %r14
    13d2:	41 5f                	pop    %r15
    13d4:	5d                   	pop    %rbp
    13d5:	c3                   	ret

Disassembly of section .fini:

00000000000013d8 <_fini>:
    13d8:	48 83 ec 08          	sub    $0x8,%rsp
    13dc:	48 83 c4 08          	add    $0x8,%rsp
    13e0:	c3                   	ret
