//+build !noasm !appengine
// AUTO-GENERATED BY C2GOASM -- DO NOT EDIT

TEXT ·_sum_float64_avx_intrinsics(SB), $0-24

	MOVQ buf+0(FP), DI
	MOVQ len+8(FP), SI
	MOVQ res+16(FP), DX

	LONG $0x03c6f640         // test    sil, 3
	JNE  LBB0_9
	WORD $0x8548; BYTE $0xf6 // test    rsi, rsi
	JE   LBB0_2
	LONG $0xff468d4c         // lea    r8, [rsi - 1]
	WORD $0x8944; BYTE $0xc1 // mov    ecx, r8d
	WORD $0xe9c1; BYTE $0x02 // shr    ecx, 2
	WORD $0xc1ff             // inc    ecx
	LONG $0x07e18348         // and    rcx, 7
	JE   LBB0_4
	WORD $0xf748; BYTE $0xd9 // neg    rcx
	LONG $0xc057fdc5         // vxorpd    ymm0, ymm0, ymm0
	WORD $0xc031             // xor    eax, eax

LBB0_6:
	LONG $0x0458fdc5; BYTE $0xc7 // vaddpd    ymm0, ymm0, yword [rdi + 8*rax]
	LONG $0x04c08348             // add    rax, 4
	WORD $0xff48; BYTE $0xc1     // inc    rcx
	JNE  LBB0_6
	JMP  LBB0_7

LBB0_2:
	LONG $0xc057fdc5 // vxorpd    ymm0, ymm0, ymm0
	JMP  LBB0_8

LBB0_4:
	WORD $0xc031     // xor    eax, eax
	LONG $0xc057fdc5 // vxorpd    ymm0, ymm0, ymm0

LBB0_7:
	LONG $0x1cf88349 // cmp    r8, 28
	JB   LBB0_8

LBB0_10:
	LONG $0x0458fdc5; BYTE $0xc7         // vaddpd    ymm0, ymm0, yword [rdi + 8*rax]
	LONG $0x4458fdc5; WORD $0x20c7       // vaddpd    ymm0, ymm0, yword [rdi + 8*rax + 32]
	LONG $0x4458fdc5; WORD $0x40c7       // vaddpd    ymm0, ymm0, yword [rdi + 8*rax + 64]
	LONG $0x4458fdc5; WORD $0x60c7       // vaddpd    ymm0, ymm0, yword [rdi + 8*rax + 96]
	QUAD $0x000080c78458fdc5; BYTE $0x00 // vaddpd    ymm0, ymm0, yword [rdi + 8*rax + 128]
	QUAD $0x0000a0c78458fdc5; BYTE $0x00 // vaddpd    ymm0, ymm0, yword [rdi + 8*rax + 160]
	QUAD $0x0000c0c78458fdc5; BYTE $0x00 // vaddpd    ymm0, ymm0, yword [rdi + 8*rax + 192]
	QUAD $0x0000e0c78458fdc5; BYTE $0x00 // vaddpd    ymm0, ymm0, yword [rdi + 8*rax + 224]
	LONG $0x20c08348                     // add    rax, 32
	WORD $0x3948; BYTE $0xf0             // cmp    rax, rsi
	JB   LBB0_10

LBB0_8:
	LONG $0xc07cfdc5               // vhaddpd    ymm0, ymm0, ymm0
	LONG $0x197de3c4; WORD $0x01c1 // vextractf128    xmm1, ymm0, 1
	LONG $0xc158fbc5               // vaddsd    xmm0, xmm0, xmm1
	LONG $0x0211fbc5               // vmovsd    qword [rdx], xmm0

LBB0_9:
	VZEROUPPER
	RET

TEXT ·_sum_float64_avx2(SB), $0-24

	MOVQ buf+0(FP), DI
	MOVQ len+8(FP), SI
	MOVQ res+16(FP), DX

	WORD $0xf685                               // test    esi, esi
	JLE  LBB1_1
	WORD $0xf089                               // mov    eax, esi
	LONG $0xc057f9c5                           // vxorpd    xmm0, xmm0, xmm0
	WORD $0xfe83; BYTE $0x1f                   // cmp    esi, 31
	JBE  LBB1_3
	WORD $0xe683; BYTE $0x1f                   // and    esi, 31
	WORD $0x8949; BYTE $0xc0                   // mov    r8, rax
	WORD $0x2949; BYTE $0xf0                   // sub    r8, rsi
	JE   LBB1_3
	LONG $0xc08f8d48; WORD $0x0000; BYTE $0x00 // lea    rcx, [rdi + 192]
	LONG $0xc057fdc5                           // vxorpd    ymm0, ymm0, ymm0
	WORD $0x894d; BYTE $0xc1                   // mov    r9, r8
	LONG $0xc957f5c5                           // vxorpd    ymm1, ymm1, ymm1
	LONG $0xdb57e5c5                           // vxorpd    ymm3, ymm3, ymm3
	LONG $0xe457ddc5                           // vxorpd    ymm4, ymm4, ymm4
	LONG $0xd257edc5                           // vxorpd    ymm2, ymm2, ymm2
	LONG $0xff57c5c5                           // vxorpd    ymm7, ymm7, ymm7
	LONG $0xed57d5c5                           // vxorpd    ymm5, ymm5, ymm5
	LONG $0xf657cdc5                           // vxorpd    ymm6, ymm6, ymm6

LBB1_8:
	QUAD $0xffffff408158fdc5                   // vaddpd    ymm0, ymm0, yword [rcx - 192]
	QUAD $0xffffff608958f5c5                   // vaddpd    ymm1, ymm1, yword [rcx - 160]
	LONG $0x5958e5c5; BYTE $0x80               // vaddpd    ymm3, ymm3, yword [rcx - 128]
	LONG $0x6158ddc5; BYTE $0xa0               // vaddpd    ymm4, ymm4, yword [rcx - 96]
	LONG $0x5158edc5; BYTE $0xc0               // vaddpd    ymm2, ymm2, yword [rcx - 64]
	LONG $0x7958c5c5; BYTE $0xe0               // vaddpd    ymm7, ymm7, yword [rcx - 32]
	LONG $0x2958d5c5                           // vaddpd    ymm5, ymm5, yword [rcx]
	LONG $0x7158cdc5; BYTE $0x20               // vaddpd    ymm6, ymm6, yword [rcx + 32]
	LONG $0x00c18148; WORD $0x0001; BYTE $0x00 // add    rcx, 256
	LONG $0xe0c18349                           // add    r9, -32
	JNE  LBB1_8
	LONG $0xc058e5c5                           // vaddpd    ymm0, ymm3, ymm0
	LONG $0xc958ddc5                           // vaddpd    ymm1, ymm4, ymm1
	LONG $0xc958c5c5                           // vaddpd    ymm1, ymm7, ymm1
	LONG $0xc058edc5                           // vaddpd    ymm0, ymm2, ymm0
	LONG $0xc058d5c5                           // vaddpd    ymm0, ymm5, ymm0
	LONG $0xc958cdc5                           // vaddpd    ymm1, ymm6, ymm1
	LONG $0xc158fdc5                           // vaddpd    ymm0, ymm0, ymm1
	LONG $0x197de3c4; WORD $0x01c1             // vextractf128    xmm1, ymm0, 1
	LONG $0xc158fdc5                           // vaddpd    ymm0, ymm0, ymm1
	LONG $0xc07cfdc5                           // vhaddpd    ymm0, ymm0, ymm0
	WORD $0xf685                               // test    esi, esi
	JNE  LBB1_4
	JMP  LBB1_10

LBB1_3:
	WORD $0x3145; BYTE $0xc0 // xor    r8d, r8d

LBB1_4:
	LONG $0xc70c8d4a         // lea    rcx, [rdi + 8*r8]
	WORD $0x294c; BYTE $0xc0 // sub    rax, r8

LBB1_5:
	LONG $0x0158fbc5         // vaddsd    xmm0, xmm0, qword [rcx]
	LONG $0x08c18348         // add    rcx, 8
	WORD $0xff48; BYTE $0xc8 // dec    rax
	JNE  LBB1_5
	JMP  LBB1_10

LBB1_1:
	LONG $0xc057f9c5 // vxorpd    xmm0, xmm0, xmm0

LBB1_10:
	LONG $0x0211fbc5 // vmovsd    qword [rdx], xmm0
	VZEROUPPER
	RET
