
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
    1160:	41 57                	push   %r15
    1162:	41 56                	push   %r14
    1164:	41 54                	push   %r12
    1166:	53                   	push   %rbx
    1167:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
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
    124a:	83 f8 ff             	cmp    $0xffffffff,%eax
    124d:	0f 84 b8 00 00 00    	je     130b <main+0x1ab>
    1253:	0f 28 05 b6 0d 00 00 	movaps 0xdb6(%rip),%xmm0        # 2010 <_IO_stdin_used+0x10>
    125a:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
    125f:	0f 28 05 ba 0d 00 00 	movaps 0xdba(%rip),%xmm0        # 2020 <_IO_stdin_used+0x20>
    1266:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
    126b:	0f 28 05 be 0d 00 00 	movaps 0xdbe(%rip),%xmm0        # 2030 <_IO_stdin_used+0x30>
    1272:	0f 29 84 24 80 00 00 00 	movaps %xmm0,0x80(%rsp)
    127a:	0f 28 05 bf 0d 00 00 	movaps 0xdbf(%rip),%xmm0        # 2040 <_IO_stdin_used+0x40>
    1281:	0f 29 84 24 90 00 00 00 	movaps %xmm0,0x90(%rsp)
    1289:	31 db                	xor    %ebx,%ebx
    128b:	4c 8d 74 24 10       	lea    0x10(%rsp),%r14
    1290:	4c 8d 7c 24 60       	lea    0x60(%rsp),%r15
    1295:	4c 8b 25 2c 2d 00 00 	mov    0x2d2c(%rip),%r12        # 3fc8 <stdout@GLIBC_2.2.5>
    129c:	0f 1f 40 00          	nopl   0x0(%rax)
    12a0:	48 83 fb 41          	cmp    $0x41,%rbx
    12a4:	74 4f                	je     12f5 <main+0x195>
    12a6:	0f 28 05 a3 0d 00 00 	movaps 0xda3(%rip),%xmm0        # 2050 <_IO_stdin_used+0x50>
    12ad:	0f 29 44 24 40       	movaps %xmm0,0x40(%rsp)
    12b2:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
    12b7:	0f 29 44 24 20       	movaps %xmm0,0x20(%rsp)
    12bc:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
    12c1:	c6 44 24 50 a5       	movb   $0xa5,0x50(%rsp)
    12c6:	4c 89 f7             	mov    %r14,%rdi
    12c9:	4c 89 fe             	mov    %r15,%rsi
    12cc:	48 89 da             	mov    %rbx,%rdx
    12cf:	e8 6c fd ff ff       	call   1040 <memcpy@plt>
    12d4:	c6 44 1c 10 00       	movb   $0x0,0x10(%rsp,%rbx,1)
    12d9:	48 ff c3             	inc    %rbx
    12dc:	49 8b 0c 24          	mov    (%r12),%rcx
    12e0:	be 01 00 00 00       	mov    $0x1,%esi
    12e5:	4c 89 f7             	mov    %r14,%rdi
    12e8:	48 89 da             	mov    %rbx,%rdx
    12eb:	e8 60 fd ff ff       	call   1050 <fwrite@plt>
    12f0:	48 39 c3             	cmp    %rax,%rbx
    12f3:	74 ab                	je     12a0 <main+0x140>
    12f5:	49 8b 3c 24          	mov    (%r12),%rdi
    12f9:	e8 32 fd ff ff       	call   1030 <ferror@plt>
    12fe:	89 c1                	mov    %eax,%ecx
    1300:	31 c0                	xor    %eax,%eax
    1302:	85 c9                	test   %ecx,%ecx
    1304:	0f 95 c0             	setne  %al
    1307:	01 c0                	add    %eax,%eax
    1309:	eb 05                	jmp    1310 <main+0x1b0>
    130b:	b8 61 00 00 00       	mov    $0x61,%eax
    1310:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
    1317:	5b                   	pop    %rbx
    1318:	41 5c                	pop    %r12
    131a:	41 5e                	pop    %r14
    131c:	41 5f                	pop    %r15
    131e:	c3                   	ret

Disassembly of section .fini:

0000000000001320 <_fini>:
    1320:	48 83 ec 08          	sub    $0x8,%rsp
    1324:	48 83 c4 08          	add    $0x8,%rsp
    1328:	c3                   	ret
