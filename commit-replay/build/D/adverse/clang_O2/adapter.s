
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
    124d:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1251:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1255:	83 f8 ff             	cmp    $0xffffffff,%eax
    1258:	0f 84 71 01 00 00    	je     13cf <main+0x26f>
    125e:	0f 28 05 ab 0d 00 00 	movaps 0xdab(%rip),%xmm0        # 2010 <_IO_stdin_used+0x10>
    1265:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
    126a:	0f 28 05 af 0d 00 00 	movaps 0xdaf(%rip),%xmm0        # 2020 <_IO_stdin_used+0x20>
    1271:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
    1276:	0f 28 05 b3 0d 00 00 	movaps 0xdb3(%rip),%xmm0        # 2030 <_IO_stdin_used+0x30>
    127d:	0f 29 84 24 80 00 00 00 	movaps %xmm0,0x80(%rsp)
    1285:	0f 28 05 b4 0d 00 00 	movaps 0xdb4(%rip),%xmm0        # 2040 <_IO_stdin_used+0x40>
    128c:	0f 29 84 24 90 00 00 00 	movaps %xmm0,0x90(%rsp)
    1294:	41 bd 01 00 00 00    	mov    $0x1,%r13d
    129a:	31 db                	xor    %ebx,%ebx
    129c:	4c 8d 74 24 10       	lea    0x10(%rsp),%r14
    12a1:	4c 8d 7c 24 60       	lea    0x60(%rsp),%r15
    12a6:	48 8b 2d 1b 2d 00 00 	mov    0x2d1b(%rip),%rbp        # 3fc8 <stdout@GLIBC_2.2.5>
    12ad:	4c 8d 64 24 0c       	lea    0xc(%rsp),%r12
    12b2:	eb 33                	jmp    12e7 <main+0x187>
    12b4:	66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    12c0:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    12c4:	48 8b 4d 00          	mov    0x0(%rbp),%rcx
    12c8:	be 01 00 00 00       	mov    $0x1,%esi
    12cd:	ba 04 00 00 00       	mov    $0x4,%edx
    12d2:	4c 89 e7             	mov    %r12,%rdi
    12d5:	e8 76 fd ff ff       	call   1050 <fwrite@plt>
    12da:	49 ff c5             	inc    %r13
    12dd:	48 83 fb 41          	cmp    $0x41,%rbx
    12e1:	0f 84 d2 00 00 00    	je     13b9 <main+0x259>
    12e7:	0f 28 05 62 0d 00 00 	movaps 0xd62(%rip),%xmm0        # 2050 <_IO_stdin_used+0x50>
    12ee:	0f 29 44 24 40       	movaps %xmm0,0x40(%rsp)
    12f3:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
    12f8:	0f 29 44 24 20       	movaps %xmm0,0x20(%rsp)
    12fd:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
    1302:	c6 44 24 50 a5       	movb   $0xa5,0x50(%rsp)
    1307:	4c 89 f7             	mov    %r14,%rdi
    130a:	4c 89 fe             	mov    %r15,%rsi
    130d:	48 89 da             	mov    %rbx,%rdx
    1310:	e8 2b fd ff ff       	call   1040 <memcpy@plt>
    1315:	c6 44 1c 10 00       	movb   $0x0,0x10(%rsp,%rbx,1)
    131a:	48 83 fb 03          	cmp    $0x3,%rbx
    131e:	73 10                	jae    1330 <main+0x1d0>
    1320:	b8 c5 9d 1c 81       	mov    $0x811c9dc5,%eax
    1325:	31 c9                	xor    %ecx,%ecx
    1327:	eb 54                	jmp    137d <main+0x21d>
    1329:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1330:	4c 89 ea             	mov    %r13,%rdx
    1333:	48 83 e2 fc          	and    $0xfffffffffffffffc,%rdx
    1337:	b8 c5 9d 1c 81       	mov    $0x811c9dc5,%eax
    133c:	31 c9                	xor    %ecx,%ecx
    133e:	66 90                	xchg   %ax,%ax
    1340:	0f b6 74 0c 10       	movzbl 0x10(%rsp,%rcx,1),%esi
    1345:	31 c6                	xor    %eax,%esi
    1347:	69 c6 93 01 00 01    	imul   $0x1000193,%esi,%eax
    134d:	0f b6 74 0c 11       	movzbl 0x11(%rsp,%rcx,1),%esi
    1352:	31 c6                	xor    %eax,%esi
    1354:	69 c6 93 01 00 01    	imul   $0x1000193,%esi,%eax
    135a:	0f b6 74 0c 12       	movzbl 0x12(%rsp,%rcx,1),%esi
    135f:	31 c6                	xor    %eax,%esi
    1361:	69 c6 93 01 00 01    	imul   $0x1000193,%esi,%eax
    1367:	0f b6 74 0c 13       	movzbl 0x13(%rsp,%rcx,1),%esi
    136c:	31 c6                	xor    %eax,%esi
    136e:	69 c6 93 01 00 01    	imul   $0x1000193,%esi,%eax
    1374:	48 83 c1 04          	add    $0x4,%rcx
    1378:	48 39 ca             	cmp    %rcx,%rdx
    137b:	75 c3                	jne    1340 <main+0x1e0>
    137d:	48 ff c3             	inc    %rbx
    1380:	f6 c3 03             	test   $0x3,%bl
    1383:	0f 84 37 ff ff ff    	je     12c0 <main+0x160>
    1389:	44 89 ea             	mov    %r13d,%edx
    138c:	83 e2 03             	and    $0x3,%edx
    138f:	48 01 e1             	add    %rsp,%rcx
    1392:	48 83 c1 10          	add    $0x10,%rcx
    1396:	31 f6                	xor    %esi,%esi
    1398:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    13a0:	0f b6 3c 31          	movzbl (%rcx,%rsi,1),%edi
    13a4:	31 c7                	xor    %eax,%edi
    13a6:	69 c7 93 01 00 01    	imul   $0x1000193,%edi,%eax
    13ac:	48 ff c6             	inc    %rsi
    13af:	48 39 f2             	cmp    %rsi,%rdx
    13b2:	75 ec                	jne    13a0 <main+0x240>
    13b4:	e9 07 ff ff ff       	jmp    12c0 <main+0x160>
    13b9:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
    13bd:	e8 6e fc ff ff       	call   1030 <ferror@plt>
    13c2:	89 c1                	mov    %eax,%ecx
    13c4:	31 c0                	xor    %eax,%eax
    13c6:	85 c9                	test   %ecx,%ecx
    13c8:	0f 95 c0             	setne  %al
    13cb:	01 c0                	add    %eax,%eax
    13cd:	eb 05                	jmp    13d4 <main+0x274>
    13cf:	b8 61 00 00 00       	mov    $0x61,%eax
    13d4:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
    13db:	5b                   	pop    %rbx
    13dc:	41 5c                	pop    %r12
    13de:	41 5d                	pop    %r13
    13e0:	41 5e                	pop    %r14
    13e2:	41 5f                	pop    %r15
    13e4:	5d                   	pop    %rbp
    13e5:	c3                   	ret

Disassembly of section .fini:

00000000000013e8 <_fini>:
    13e8:	48 83 ec 08          	sub    $0x8,%rsp
    13ec:	48 83 c4 08          	add    $0x8,%rsp
    13f0:	c3                   	ret
