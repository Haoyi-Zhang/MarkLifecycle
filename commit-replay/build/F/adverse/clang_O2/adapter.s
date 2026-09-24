
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
    125d:	0f 84 10 01 00 00    	je     1373 <main+0x213>
    1263:	31 ed                	xor    %ebp,%ebp
    1265:	4c 8d 64 24 11       	lea    0x11(%rsp),%r12
    126a:	4c 8b 3d 57 2d 00 00 	mov    0x2d57(%rip),%r15        # 3fc8 <stdout@GLIBC_2.2.5>
    1271:	48 8d 5c 24 14       	lea    0x14(%rsp),%rbx
    1276:	eb 16                	jmp    128e <main+0x12e>
    1278:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    1280:	ff c5                	inc    %ebp
    1282:	81 fd 00 01 00 00    	cmp    $0x100,%ebp
    1288:	0f 84 d0 00 00 00    	je     135e <main+0x1fe>
    128e:	45 31 ed             	xor    %r13d,%r13d
    1291:	eb 34                	jmp    12c7 <main+0x167>
    1293:	66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    12a0:	31 c9                	xor    %ecx,%ecx
    12a2:	89 4c 24 14          	mov    %ecx,0x14(%rsp)
    12a6:	49 8b 0f             	mov    (%r15),%rcx
    12a9:	be 01 00 00 00       	mov    $0x1,%esi
    12ae:	ba 04 00 00 00       	mov    $0x4,%edx
    12b3:	48 89 df             	mov    %rbx,%rdi
    12b6:	e8 95 fd ff ff       	call   1050 <fwrite@plt>
    12bb:	41 ff c5             	inc    %r13d
    12be:	41 81 fd 00 01 00 00 	cmp    $0x100,%r13d
    12c5:	74 b9                	je     1280 <main+0x120>
    12c7:	40 88 6c 24 11       	mov    %bpl,0x11(%rsp)
    12cc:	44 88 6c 24 12       	mov    %r13b,0x12(%rsp)
    12d1:	c6 44 24 13 00       	movb   $0x0,0x13(%rsp)
    12d6:	89 e8                	mov    %ebp,%eax
    12d8:	4d 89 e6             	mov    %r12,%r14
    12db:	eb 0b                	jmp    12e8 <main+0x188>
    12dd:	0f 1f 00             	nopl   (%rax)
    12e0:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
    12e5:	49 ff c6             	inc    %r14
    12e8:	3c 20                	cmp    $0x20,%al
    12ea:	74 f4                	je     12e0 <main+0x180>
    12ec:	0f b6 c0             	movzbl %al,%eax
    12ef:	83 f8 09             	cmp    $0x9,%eax
    12f2:	74 ec                	je     12e0 <main+0x180>
    12f4:	4c 89 f7             	mov    %r14,%rdi
    12f7:	e8 44 fd ff ff       	call   1040 <strlen@plt>
    12fc:	48 85 c0             	test   %rax,%rax
    12ff:	75 1a                	jne    131b <main+0x1bb>
    1301:	eb 28                	jmp    132b <main+0x1cb>
    1303:	66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1310:	41 c6 44 06 ff 00    	movb   $0x0,-0x1(%r14,%rax,1)
    1316:	48 ff c8             	dec    %rax
    1319:	74 10                	je     132b <main+0x1cb>
    131b:	41 0f b6 4c 06 ff    	movzbl -0x1(%r14,%rax,1),%ecx
    1321:	83 f9 20             	cmp    $0x20,%ecx
    1324:	74 ea                	je     1310 <main+0x1b0>
    1326:	83 f9 09             	cmp    $0x9,%ecx
    1329:	74 e5                	je     1310 <main+0x1b0>
    132b:	4c 89 f7             	mov    %r14,%rdi
    132e:	e8 0d fd ff ff       	call   1040 <strlen@plt>
    1333:	48 85 c0             	test   %rax,%rax
    1336:	0f 84 64 ff ff ff    	je     12a0 <main+0x140>
    133c:	41 0f b6 0e          	movzbl (%r14),%ecx
    1340:	c1 e1 08             	shl    $0x8,%ecx
    1343:	09 c1                	or     %eax,%ecx
    1345:	48 83 f8 01          	cmp    $0x1,%rax
    1349:	0f 84 53 ff ff ff    	je     12a2 <main+0x142>
    134f:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
    1354:	c1 e0 10             	shl    $0x10,%eax
    1357:	09 c1                	or     %eax,%ecx
    1359:	e9 44 ff ff ff       	jmp    12a2 <main+0x142>
    135e:	49 8b 3f             	mov    (%r15),%rdi
    1361:	e8 ca fc ff ff       	call   1030 <ferror@plt>
    1366:	89 c1                	mov    %eax,%ecx
    1368:	31 c0                	xor    %eax,%eax
    136a:	85 c9                	test   %ecx,%ecx
    136c:	0f 95 c0             	setne  %al
    136f:	01 c0                	add    %eax,%eax
    1371:	eb 05                	jmp    1378 <main+0x218>
    1373:	b8 61 00 00 00       	mov    $0x61,%eax
    1378:	48 83 c4 18          	add    $0x18,%rsp
    137c:	5b                   	pop    %rbx
    137d:	41 5c                	pop    %r12
    137f:	41 5d                	pop    %r13
    1381:	41 5e                	pop    %r14
    1383:	41 5f                	pop    %r15
    1385:	5d                   	pop    %rbp
    1386:	c3                   	ret

Disassembly of section .fini:

0000000000001388 <_fini>:
    1388:	48 83 ec 08          	sub    $0x8,%rsp
    138c:	48 83 c4 08          	add    $0x8,%rsp
    1390:	c3                   	ret
