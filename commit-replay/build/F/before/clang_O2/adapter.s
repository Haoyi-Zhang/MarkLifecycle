
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
    1161:	41 57                	push   %r15
    1163:	41 56                	push   %r14
    1165:	41 55                	push   %r13
    1167:	41 54                	push   %r12
    1169:	53                   	push   %rbx
    116a:	48 83 ec 18          	sub    $0x18,%rsp
    116e:	c7 44 24 0c f5 79 2b 6d 	movl   $0x6d2b79f5,0xc(%rsp)
    1176:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    117a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    117e:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1182:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1186:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    118a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    118e:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1192:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1196:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    119a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    119e:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11a2:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11a6:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11aa:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11ae:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11b2:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11b6:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11ba:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11be:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11c2:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11c6:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11ca:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11ce:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11d2:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11d6:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11da:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11de:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11e2:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11e6:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11ea:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11ee:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11f2:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11f6:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    11fa:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    11fe:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1202:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1206:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    120a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    120e:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1212:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1216:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    121a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    121e:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1222:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1226:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    122a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    122e:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1232:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1236:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    123a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    123e:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1242:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1246:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    124a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    124e:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1252:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1256:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    125a:	83 f8 ff             	cmp    $0xffffffff,%eax
    125d:	0f 84 0e 01 00 00    	je     1371 <main+0x211>
    1263:	31 ed                	xor    %ebp,%ebp
    1265:	48 8d 5c 24 11       	lea    0x11(%rsp),%rbx
    126a:	4c 8d 74 24 14       	lea    0x14(%rsp),%r14
    126f:	eb 1d                	jmp    128e <main+0x12e>
    1271:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1280:	ff c5                	inc    %ebp
    1282:	81 fd 00 01 00 00    	cmp    $0x100,%ebp
    1288:	0f 84 c7 00 00 00    	je     1355 <main+0x1f5>
    128e:	45 31 ed             	xor    %r13d,%r13d
    1291:	eb 3d                	jmp    12d0 <main+0x170>
    1293:	66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    12a0:	45 31 e4             	xor    %r12d,%r12d
    12a3:	44 89 64 24 14       	mov    %r12d,0x14(%rsp)
    12a8:	48 8b 05 19 2d 00 00 	mov    0x2d19(%rip),%rax        # 3fc8 <stdout@GLIBC_2.2.5>
    12af:	48 8b 08             	mov    (%rax),%rcx
    12b2:	be 01 00 00 00       	mov    $0x1,%esi
    12b7:	ba 04 00 00 00       	mov    $0x4,%edx
    12bc:	4c 89 f7             	mov    %r14,%rdi
    12bf:	e8 8c fd ff ff       	call   1050 <fwrite@plt>
    12c4:	41 ff c5             	inc    %r13d
    12c7:	41 81 fd 00 01 00 00 	cmp    $0x100,%r13d
    12ce:	74 b0                	je     1280 <main+0x120>
    12d0:	40 88 6c 24 11       	mov    %bpl,0x11(%rsp)
    12d5:	44 88 6c 24 12       	mov    %r13b,0x12(%rsp)
    12da:	c6 44 24 13 00       	movb   $0x0,0x13(%rsp)
    12df:	48 89 df             	mov    %rbx,%rdi
    12e2:	e8 59 fd ff ff       	call   1040 <strlen@plt>
    12e7:	48 85 c0             	test   %rax,%rax
    12ea:	75 0e                	jne    12fa <main+0x19a>
    12ec:	eb 1b                	jmp    1309 <main+0x1a9>
    12ee:	66 90                	xchg   %ax,%ax
    12f0:	c6 44 04 10 00       	movb   $0x0,0x10(%rsp,%rax,1)
    12f5:	48 ff c8             	dec    %rax
    12f8:	74 0f                	je     1309 <main+0x1a9>
    12fa:	0f b6 4c 04 10       	movzbl 0x10(%rsp,%rax,1),%ecx
    12ff:	83 f9 20             	cmp    $0x20,%ecx
    1302:	74 ec                	je     12f0 <main+0x190>
    1304:	83 f9 09             	cmp    $0x9,%ecx
    1307:	74 e7                	je     12f0 <main+0x190>
    1309:	49 89 df             	mov    %rbx,%r15
    130c:	eb 05                	jmp    1313 <main+0x1b3>
    130e:	66 90                	xchg   %ax,%ax
    1310:	49 ff c7             	inc    %r15
    1313:	45 0f b6 27          	movzbl (%r15),%r12d
    1317:	41 83 fc 20          	cmp    $0x20,%r12d
    131b:	74 f3                	je     1310 <main+0x1b0>
    131d:	41 83 fc 09          	cmp    $0x9,%r12d
    1321:	74 ed                	je     1310 <main+0x1b0>
    1323:	4c 89 ff             	mov    %r15,%rdi
    1326:	e8 15 fd ff ff       	call   1040 <strlen@plt>
    132b:	48 85 c0             	test   %rax,%rax
    132e:	0f 84 6c ff ff ff    	je     12a0 <main+0x140>
    1334:	41 c1 e4 08          	shl    $0x8,%r12d
    1338:	41 09 c4             	or     %eax,%r12d
    133b:	48 83 f8 01          	cmp    $0x1,%rax
    133f:	0f 84 5e ff ff ff    	je     12a3 <main+0x143>
    1345:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
    134a:	c1 e0 10             	shl    $0x10,%eax
    134d:	41 09 c4             	or     %eax,%r12d
    1350:	e9 4e ff ff ff       	jmp    12a3 <main+0x143>
    1355:	48 8b 05 6c 2c 00 00 	mov    0x2c6c(%rip),%rax        # 3fc8 <stdout@GLIBC_2.2.5>
    135c:	48 8b 38             	mov    (%rax),%rdi
    135f:	e8 cc fc ff ff       	call   1030 <ferror@plt>
    1364:	89 c1                	mov    %eax,%ecx
    1366:	31 c0                	xor    %eax,%eax
    1368:	85 c9                	test   %ecx,%ecx
    136a:	0f 95 c0             	setne  %al
    136d:	01 c0                	add    %eax,%eax
    136f:	eb 05                	jmp    1376 <main+0x216>
    1371:	b8 61 00 00 00       	mov    $0x61,%eax
    1376:	48 83 c4 18          	add    $0x18,%rsp
    137a:	5b                   	pop    %rbx
    137b:	41 5c                	pop    %r12
    137d:	41 5d                	pop    %r13
    137f:	41 5e                	pop    %r14
    1381:	41 5f                	pop    %r15
    1383:	5d                   	pop    %rbp
    1384:	c3                   	ret

Disassembly of section .fini:

0000000000001388 <_fini>:
    1388:	48 83 ec 08          	sub    $0x8,%rsp
    138c:	48 83 c4 08          	add    $0x8,%rsp
    1390:	c3                   	ret
