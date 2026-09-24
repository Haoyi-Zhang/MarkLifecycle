
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

0000000000001040 <fwrite@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4008 <fwrite@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .plt.got:

0000000000001050 <__cxa_finalize@plt>:
    1050:	ff 25 8a 2f 00 00    	jmp    *0x2f8a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1056:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000001060 <_start>:
    1060:	31 ed                	xor    %ebp,%ebp
    1062:	49 89 d1             	mov    %rdx,%r9
    1065:	5e                   	pop    %rsi
    1066:	48 89 e2             	mov    %rsp,%rdx
    1069:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    106d:	50                   	push   %rax
    106e:	54                   	push   %rsp
    106f:	45 31 c0             	xor    %r8d,%r8d
    1072:	31 c9                	xor    %ecx,%ecx
    1074:	48 8d 3d d5 00 00 00 	lea    0xd5(%rip),%rdi        # 1150 <main>
    107b:	ff 15 37 2f 00 00    	call   *0x2f37(%rip)        # 3fb8 <__libc_start_main@GLIBC_2.34>
    1081:	f4                   	hlt
    1082:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
    108c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001090 <deregister_tm_clones>:
    1090:	48 8d 3d 89 2f 00 00 	lea    0x2f89(%rip),%rdi        # 4020 <__TMC_END__>
    1097:	48 8d 05 82 2f 00 00 	lea    0x2f82(%rip),%rax        # 4020 <__TMC_END__>
    109e:	48 39 f8             	cmp    %rdi,%rax
    10a1:	74 15                	je     10b8 <deregister_tm_clones+0x28>
    10a3:	48 8b 05 16 2f 00 00 	mov    0x2f16(%rip),%rax        # 3fc0 <_ITM_deregisterTMCloneTable@Base>
    10aa:	48 85 c0             	test   %rax,%rax
    10ad:	74 09                	je     10b8 <deregister_tm_clones+0x28>
    10af:	ff e0                	jmp    *%rax
    10b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10b8:	c3                   	ret
    10b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010c0 <register_tm_clones>:
    10c0:	48 8d 3d 59 2f 00 00 	lea    0x2f59(%rip),%rdi        # 4020 <__TMC_END__>
    10c7:	48 8d 35 52 2f 00 00 	lea    0x2f52(%rip),%rsi        # 4020 <__TMC_END__>
    10ce:	48 29 fe             	sub    %rdi,%rsi
    10d1:	48 89 f0             	mov    %rsi,%rax
    10d4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    10d8:	48 c1 f8 03          	sar    $0x3,%rax
    10dc:	48 01 c6             	add    %rax,%rsi
    10df:	48 d1 fe             	sar    $1,%rsi
    10e2:	74 14                	je     10f8 <register_tm_clones+0x38>
    10e4:	48 8b 05 ed 2e 00 00 	mov    0x2eed(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    10eb:	48 85 c0             	test   %rax,%rax
    10ee:	74 08                	je     10f8 <register_tm_clones+0x38>
    10f0:	ff e0                	jmp    *%rax
    10f2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    10f8:	c3                   	ret
    10f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001100 <__do_global_dtors_aux>:
    1100:	f3 0f 1e fa          	endbr64
    1104:	80 3d 15 2f 00 00 00 	cmpb   $0x0,0x2f15(%rip)        # 4020 <__TMC_END__>
    110b:	75 2b                	jne    1138 <__do_global_dtors_aux+0x38>
    110d:	55                   	push   %rbp
    110e:	48 83 3d ca 2e 00 00 00 	cmpq   $0x0,0x2eca(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1116:	48 89 e5             	mov    %rsp,%rbp
    1119:	74 0c                	je     1127 <__do_global_dtors_aux+0x27>
    111b:	48 8b 3d f6 2e 00 00 	mov    0x2ef6(%rip),%rdi        # 4018 <__dso_handle>
    1122:	e8 29 ff ff ff       	call   1050 <__cxa_finalize@plt>
    1127:	e8 64 ff ff ff       	call   1090 <deregister_tm_clones>
    112c:	c6 05 ed 2e 00 00 01 	movb   $0x1,0x2eed(%rip)        # 4020 <__TMC_END__>
    1133:	5d                   	pop    %rbp
    1134:	c3                   	ret
    1135:	0f 1f 00             	nopl   (%rax)
    1138:	c3                   	ret
    1139:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001140 <frame_dummy>:
    1140:	f3 0f 1e fa          	endbr64
    1144:	e9 77 ff ff ff       	jmp    10c0 <register_tm_clones>
    1149:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001150 <main>:
    1150:	55                   	push   %rbp
    1151:	41 57                	push   %r15
    1153:	41 56                	push   %r14
    1155:	41 55                	push   %r13
    1157:	41 54                	push   %r12
    1159:	53                   	push   %rbx
    115a:	48 83 ec 18          	sub    $0x18,%rsp
    115e:	c7 44 24 0c f5 79 2b 6d 	movl   $0x6d2b79f5,0xc(%rsp)
    1166:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    116a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    116e:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1172:	89 44 24 0c          	mov    %eax,0xc(%rsp)
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
    124a:	83 f8 ff             	cmp    $0xffffffff,%eax
    124d:	0f 84 07 01 00 00    	je     135a <main+0x20a>
    1253:	31 c9                	xor    %ecx,%ecx
    1255:	b8 11 02 5a 00       	mov    $0x5a0211,%eax
    125a:	4c 8b 35 67 2d 00 00 	mov    0x2d67(%rip),%r14        # 3fc8 <stdout@GLIBC_2.2.5>
    1261:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
    1266:	45 31 e4             	xor    %r12d,%r12d
    1269:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1270:	89 44 24 14          	mov    %eax,0x14(%rsp)
    1274:	41 89 c5             	mov    %eax,%r13d
    1277:	45 31 ff             	xor    %r15d,%r15d
    127a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1280:	41 8d 85 00 ff ff ff 	lea    -0x100(%r13),%eax
    1287:	45 39 fc             	cmp    %r15d,%r12d
    128a:	0f 42 c1             	cmovb  %ecx,%eax
    128d:	88 44 24 10          	mov    %al,0x10(%rsp)
    1291:	88 64 24 11          	mov    %ah,0x11(%rsp)
    1295:	44 89 eb             	mov    %r13d,%ebx
    1298:	0f 42 d9             	cmovb  %ecx,%ebx
    129b:	c1 e8 10             	shr    $0x10,%eax
    129e:	88 44 24 12          	mov    %al,0x12(%rsp)
    12a2:	c6 44 24 13 00       	movb   $0x0,0x13(%rsp)
    12a7:	49 8b 0e             	mov    (%r14),%rcx
    12aa:	be 01 00 00 00       	mov    $0x1,%esi
    12af:	ba 04 00 00 00       	mov    $0x4,%edx
    12b4:	48 89 ef             	mov    %rbp,%rdi
    12b7:	e8 84 fd ff ff       	call   1040 <fwrite@plt>
    12bc:	88 5c 24 10          	mov    %bl,0x10(%rsp)
    12c0:	88 7c 24 11          	mov    %bh,0x11(%rsp)
    12c4:	c1 eb 10             	shr    $0x10,%ebx
    12c7:	88 5c 24 12          	mov    %bl,0x12(%rsp)
    12cb:	c6 44 24 13 00       	movb   $0x0,0x13(%rsp)
    12d0:	49 8b 0e             	mov    (%r14),%rcx
    12d3:	be 01 00 00 00       	mov    $0x1,%esi
    12d8:	ba 04 00 00 00       	mov    $0x4,%edx
    12dd:	48 89 ef             	mov    %rbp,%rdi
    12e0:	e8 5b fd ff ff       	call   1040 <fwrite@plt>
    12e5:	c7 44 24 10 00 00 00 00 	movl   $0x0,0x10(%rsp)
    12ed:	49 8b 0e             	mov    (%r14),%rcx
    12f0:	be 01 00 00 00       	mov    $0x1,%esi
    12f5:	ba 04 00 00 00       	mov    $0x4,%edx
    12fa:	48 89 ef             	mov    %rbp,%rdi
    12fd:	e8 3e fd ff ff       	call   1040 <fwrite@plt>
    1302:	c7 44 24 10 00 00 00 00 	movl   $0x0,0x10(%rsp)
    130a:	49 8b 0e             	mov    (%r14),%rcx
    130d:	be 01 00 00 00       	mov    $0x1,%esi
    1312:	ba 04 00 00 00       	mov    $0x4,%edx
    1317:	48 89 ef             	mov    %rbp,%rdi
    131a:	e8 21 fd ff ff       	call   1040 <fwrite@plt>
    131f:	31 c9                	xor    %ecx,%ecx
    1321:	41 ff c7             	inc    %r15d
    1324:	41 83 c5 10          	add    $0x10,%r13d
    1328:	41 83 ff 06          	cmp    $0x6,%r15d
    132c:	0f 85 4e ff ff ff    	jne    1280 <main+0x130>
    1332:	41 ff c4             	inc    %r12d
    1335:	8b 44 24 14          	mov    0x14(%rsp),%eax
    1339:	ff c0                	inc    %eax
    133b:	41 83 fc 06          	cmp    $0x6,%r12d
    133f:	0f 85 2b ff ff ff    	jne    1270 <main+0x120>
    1345:	49 8b 3e             	mov    (%r14),%rdi
    1348:	e8 e3 fc ff ff       	call   1030 <ferror@plt>
    134d:	89 c1                	mov    %eax,%ecx
    134f:	31 c0                	xor    %eax,%eax
    1351:	85 c9                	test   %ecx,%ecx
    1353:	0f 95 c0             	setne  %al
    1356:	01 c0                	add    %eax,%eax
    1358:	eb 05                	jmp    135f <main+0x20f>
    135a:	b8 61 00 00 00       	mov    $0x61,%eax
    135f:	48 83 c4 18          	add    $0x18,%rsp
    1363:	5b                   	pop    %rbx
    1364:	41 5c                	pop    %r12
    1366:	41 5d                	pop    %r13
    1368:	41 5e                	pop    %r14
    136a:	41 5f                	pop    %r15
    136c:	5d                   	pop    %rbp
    136d:	c3                   	ret

Disassembly of section .fini:

0000000000001370 <_fini>:
    1370:	48 83 ec 08          	sub    $0x8,%rsp
    1374:	48 83 c4 08          	add    $0x8,%rsp
    1378:	c3                   	ret
