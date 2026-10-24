	.file	"kernels.cpp"
	.intel_syntax noprefix
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "C:/Users/ReddA/Desktop/Advanced Comp Sys/SIMD" "kernels.cpp"
	.section	.text$_Z10dot_strictIfET_PKS0_S2_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z10dot_strictIfET_PKS0_S2_y
	.def	_Z10dot_strictIfET_PKS0_S2_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z10dot_strictIfET_PKS0_S2_y
_Z10dot_strictIfET_PKS0_S2_y:
.LVL0:
.LFB28:
	.file 1 "kernels.cpp"
	.loc 1 14 12 view -0
	.cfi_startproc
	.loc 1 14 12 is_stmt 0 view .LVU1
	.seh_endprologue
.LVL1:
.LBB2:
	.loc 1 16 26 is_stmt 1 discriminator 1 view .LVU2
	test	r8, r8
	je	.L4
	.loc 1 16 17 is_stmt 0 view .LVU3
	xor	eax, eax
.LBE2:
	.loc 1 15 7 view .LVU4
	pxor	xmm1, xmm1
.LVL2:
	.p2align 4,,10
	.p2align 3
.L3:
.LBB3:
	.loc 1 16 46 discriminator 3 view .LVU5
	movss	xmm0, DWORD PTR [rcx+rax*4]
	mulss	xmm0, DWORD PTR [rdx+rax*4]
	.loc 1 16 5 discriminator 3 view .LVU6
	add	rax, 1
.LVL3:
	.loc 1 16 38 discriminator 3 view .LVU7
	addss	xmm1, xmm0
.LVL4:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU8
	.loc 1 16 26 discriminator 1 view .LVU9
	cmp	r8, rax
	jne	.L3
.LBE3:
	.loc 1 18 1 is_stmt 0 view .LVU10
	movaps	xmm0, xmm1
	ret
.LVL5:
	.p2align 4,,10
	.p2align 3
.L4:
	.loc 1 15 7 view .LVU11
	pxor	xmm1, xmm1
	.loc 1 18 1 view .LVU12
	movaps	xmm0, xmm1
	ret
	.cfi_endproc
.LFE28:
	.seh_endproc
	.section	.text$_Z12dot_multiaccIfET_PKS0_S2_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z12dot_multiaccIfET_PKS0_S2_y
	.def	_Z12dot_multiaccIfET_PKS0_S2_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12dot_multiaccIfET_PKS0_S2_y
_Z12dot_multiaccIfET_PKS0_S2_y:
.LVL6:
.LFB29:
	.loc 1 26 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 26 12 is_stmt 0 view .LVU14
	sub	rsp, 88
	.seh_stackalloc	88
	.cfi_def_cfa_offset 96
	movups	XMMWORD PTR 32[rsp], xmm6
	.seh_savexmm	xmm6, 32
	movups	XMMWORD PTR 48[rsp], xmm7
	.seh_savexmm	xmm7, 48
	movups	XMMWORD PTR 64[rsp], xmm8
	.seh_savexmm	xmm8, 64
	.cfi_offset 23, -64
	.cfi_offset 24, -48
	.cfi_offset 25, -32
	.seh_endprologue
.LVL7:
	.loc 1 28 7 view .LVU15
	pxor	xmm0, xmm0
	.loc 1 26 12 view .LVU16
	mov	r9, rcx
	mov	r10, rdx
	.loc 1 28 7 view .LVU17
	movups	XMMWORD PTR [rsp], xmm0
	movups	XMMWORD PTR 16[rsp], xmm0
.LVL8:
.LBB4:
	.loc 1 30 18 is_stmt 1 discriminator 1 view .LVU18
	cmp	r8, 7
	jbe	.L16
	mov	rax, rcx
	lea	rcx, -8[r8]
.LVL9:
	.loc 1 30 18 is_stmt 0 discriminator 1 view .LVU19
	pxor	xmm2, xmm2
	movaps	xmm3, xmm2
	movaps	xmm4, xmm2
	movaps	xmm5, xmm2
	mov	r11, rcx
	movaps	xmm6, xmm2
	shr	r11, 3
	movaps	xmm7, xmm2
	movaps	xmm8, xmm2
	sal	r11, 5
	movaps	xmm1, xmm2
	lea	r11, 32[r9+r11]
.LVL10:
	.p2align 4,,10
	.p2align 3
.L11:
.LBB5:
	.loc 1 31 30 is_stmt 1 discriminator 1 view .LVU20
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU21
	movss	xmm0, DWORD PTR [rax]
	mulss	xmm0, DWORD PTR [rdx]
.LBE5:
	.loc 1 30 18 discriminator 1 view .LVU22
	add	rax, 32
	add	rdx, 32
.LBB6:
	.loc 1 31 47 discriminator 3 view .LVU23
	addss	xmm1, xmm0
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU24
.LVL11:
	.loc 1 31 30 discriminator 1 view .LVU25
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU26
	movss	xmm0, DWORD PTR -28[rax]
	mulss	xmm0, DWORD PTR -28[rdx]
	.loc 1 31 47 discriminator 3 view .LVU27
	addss	xmm8, xmm0
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU28
.LVL12:
	.loc 1 31 30 discriminator 1 view .LVU29
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU30
	movss	xmm0, DWORD PTR -24[rax]
	mulss	xmm0, DWORD PTR -24[rdx]
	.loc 1 31 47 discriminator 3 view .LVU31
	addss	xmm7, xmm0
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU32
.LVL13:
	.loc 1 31 30 discriminator 1 view .LVU33
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU34
	movss	xmm0, DWORD PTR -20[rax]
	mulss	xmm0, DWORD PTR -20[rdx]
	.loc 1 31 47 discriminator 3 view .LVU35
	addss	xmm6, xmm0
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU36
.LVL14:
	.loc 1 31 30 discriminator 1 view .LVU37
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU38
	movss	xmm0, DWORD PTR -16[rax]
	mulss	xmm0, DWORD PTR -16[rdx]
	.loc 1 31 47 discriminator 3 view .LVU39
	addss	xmm5, xmm0
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU40
.LVL15:
	.loc 1 31 30 discriminator 1 view .LVU41
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU42
	movss	xmm0, DWORD PTR -12[rax]
	mulss	xmm0, DWORD PTR -12[rdx]
	.loc 1 31 47 discriminator 3 view .LVU43
	addss	xmm4, xmm0
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU44
.LVL16:
	.loc 1 31 30 discriminator 1 view .LVU45
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU46
	movss	xmm0, DWORD PTR -8[rax]
	mulss	xmm0, DWORD PTR -8[rdx]
	.loc 1 31 47 discriminator 3 view .LVU47
	addss	xmm3, xmm0
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU48
.LVL17:
	.loc 1 31 30 discriminator 1 view .LVU49
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU50
	movss	xmm0, DWORD PTR -4[rax]
	mulss	xmm0, DWORD PTR -4[rdx]
	.loc 1 31 47 discriminator 3 view .LVU51
	addss	xmm2, xmm0
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU52
.LVL18:
	.loc 1 31 30 discriminator 1 view .LVU53
.LBE6:
	.loc 1 30 18 discriminator 1 view .LVU54
	cmp	r11, rax
	jne	.L11
	and	rcx, -8
	movss	DWORD PTR 4[rsp], xmm8
	lea	rax, 8[rcx]
	movss	DWORD PTR 8[rsp], xmm7
	movss	DWORD PTR 12[rsp], xmm6
	movss	DWORD PTR 16[rsp], xmm5
	movss	DWORD PTR 20[rsp], xmm4
	movss	DWORD PTR 24[rsp], xmm3
	movss	DWORD PTR 28[rsp], xmm2
.LVL19:
.L12:
	.loc 1 30 18 is_stmt 0 discriminator 1 view .LVU55
.LBE4:
.LBB7:
	.loc 1 34 26 is_stmt 1 discriminator 1 view .LVU56
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU57
	pxor	xmm0, xmm0
	addss	xmm0, xmm1
.LVL20:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU58
	.loc 1 34 26 discriminator 1 view .LVU59
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU60
	addss	xmm0, DWORD PTR 4[rsp]
.LVL21:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU61
	.loc 1 34 26 discriminator 1 view .LVU62
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU63
	addss	xmm0, DWORD PTR 8[rsp]
.LVL22:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU64
	.loc 1 34 26 discriminator 1 view .LVU65
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU66
	addss	xmm0, DWORD PTR 12[rsp]
.LVL23:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU67
	.loc 1 34 26 discriminator 1 view .LVU68
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU69
	addss	xmm0, DWORD PTR 16[rsp]
.LVL24:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU70
	.loc 1 34 26 discriminator 1 view .LVU71
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU72
	addss	xmm0, DWORD PTR 20[rsp]
.LVL25:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU73
	.loc 1 34 26 discriminator 1 view .LVU74
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU75
	addss	xmm0, DWORD PTR 24[rsp]
.LVL26:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU76
	.loc 1 34 26 discriminator 1 view .LVU77
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU78
	addss	xmm0, DWORD PTR 28[rsp]
.LVL27:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU79
	.loc 1 34 26 discriminator 1 view .LVU80
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU81
.LBE7:
	.loc 1 35 14 is_stmt 1 discriminator 1 view .LVU82
	cmp	rax, r8
	jnb	.L7
	.p2align 4,,10
	.p2align 3
.L9:
	.loc 1 35 34 is_stmt 0 discriminator 2 view .LVU83
	movss	xmm1, DWORD PTR [r9+rax*4]
	mulss	xmm1, DWORD PTR [r10+rax*4]
	.loc 1 35 5 discriminator 2 view .LVU84
	add	rax, 1
.LVL28:
	.loc 1 35 26 discriminator 2 view .LVU85
	addss	xmm0, xmm1
.LVL29:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU86
	.loc 1 35 14 discriminator 1 view .LVU87
	cmp	r8, rax
	jne	.L9
.L7:
	.loc 1 37 1 is_stmt 0 view .LVU88
	movups	xmm6, XMMWORD PTR 32[rsp]
	movups	xmm7, XMMWORD PTR 48[rsp]
	movups	xmm8, XMMWORD PTR 64[rsp]
	add	rsp, 88
	.cfi_remember_state
	.cfi_restore 25
	.cfi_restore 24
	.cfi_restore 23
	.cfi_def_cfa_offset 8
	ret
.LVL30:
.L16:
	.cfi_restore_state
.LBB8:
	.loc 1 30 18 discriminator 1 view .LVU89
	pxor	xmm1, xmm1
.LBE8:
	.loc 1 29 12 view .LVU90
	xor	eax, eax
	jmp	.L12
	.cfi_endproc
.LFE29:
	.seh_endproc
	.section	.text$_Z8dot_simdIfET_PKS0_S2_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z8dot_simdIfET_PKS0_S2_y
	.def	_Z8dot_simdIfET_PKS0_S2_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8dot_simdIfET_PKS0_S2_y
_Z8dot_simdIfET_PKS0_S2_y:
.LVL31:
.LFB30:
	.loc 1 45 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 45 12 is_stmt 0 view .LVU92
	.seh_endprologue
.LVL32:
.LBB9:
	.loc 1 48 26 is_stmt 1 discriminator 1 view .LVU93
	test	r8, r8
	je	.L20
	.loc 1 48 17 is_stmt 0 view .LVU94
	xor	eax, eax
.LBE9:
	.loc 1 46 7 view .LVU95
	pxor	xmm1, xmm1
.LVL33:
	.p2align 4,,10
	.p2align 3
.L19:
.LBB10:
	.loc 1 48 46 discriminator 3 view .LVU96
	movss	xmm0, DWORD PTR [rcx+rax*4]
	mulss	xmm0, DWORD PTR [rdx+rax*4]
	.loc 1 48 5 discriminator 3 view .LVU97
	add	rax, 1
.LVL34:
	.loc 1 48 38 discriminator 3 view .LVU98
	addss	xmm1, xmm0
.LVL35:
	.loc 1 48 5 is_stmt 1 discriminator 3 view .LVU99
	.loc 1 48 26 discriminator 1 view .LVU100
	cmp	r8, rax
	jne	.L19
.LBE10:
	.loc 1 50 1 is_stmt 0 view .LVU101
	movaps	xmm0, xmm1
	ret
.LVL36:
	.p2align 4,,10
	.p2align 3
.L20:
	.loc 1 46 7 view .LVU102
	pxor	xmm1, xmm1
	.loc 1 50 1 view .LVU103
	movaps	xmm0, xmm1
	ret
	.cfi_endproc
.LFE30:
	.seh_endproc
	.section	.text$_Z12dot_simd_accIfET_PKS0_S2_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z12dot_simd_accIfET_PKS0_S2_y
	.def	_Z12dot_simd_accIfET_PKS0_S2_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12dot_simd_accIfET_PKS0_S2_y
_Z12dot_simd_accIfET_PKS0_S2_y:
.LVL37:
.LFB31:
	.loc 1 58 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 58 12 is_stmt 0 view .LVU105
	push	rdi
	.seh_pushreg	rdi
	.cfi_def_cfa_offset 16
	.cfi_offset 5, -16
	add	rsp, -128
	.seh_stackalloc	128
	.cfi_def_cfa_offset 144
	.seh_endprologue
.LVL38:
	.loc 1 60 7 view .LVU106
	xor	eax, eax
	.loc 1 58 12 view .LVU107
	mov	r10, rdx
	.loc 1 60 7 view .LVU108
	mov	rdx, rsp
.LVL39:
	.loc 1 58 12 view .LVU109
	mov	r9, rcx
	.loc 1 60 7 view .LVU110
	mov	ecx, 16
.LVL40:
	.loc 1 60 7 view .LVU111
	mov	rdi, rdx
	rep stosq
.LVL41:
.LBB11:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU112
	cmp	r8, 31
	jbe	.L31
	mov	ecx, 128
	mov	r11d, 32
	pxor	xmm1, xmm1
.LVL42:
	.p2align 4,,10
	.p2align 3
.L24:
.LBB12:
	.loc 1 64 30 discriminator 1 view .LVU113
	lea	rax, -128[rcx]
	jmp	.L26
.LVL43:
	.p2align 4,,10
	.p2align 3
.L25:
	.loc 1 64 43 is_stmt 0 discriminator 3 view .LVU114
	movss	xmm1, DWORD PTR [rdx+rax]
.L26:
	.loc 1 64 59 discriminator 3 view .LVU115
	movss	xmm0, DWORD PTR [r9+rax]
	mulss	xmm0, DWORD PTR [r10+rax]
	.loc 1 64 47 discriminator 3 view .LVU116
	addss	xmm0, xmm1
	movss	DWORD PTR [rdx+rax], xmm0
	.loc 1 64 9 is_stmt 1 discriminator 3 view .LVU117
	.loc 1 64 30 discriminator 1 view .LVU118
	add	rax, 4
	cmp	rcx, rax
	jne	.L25
.LVL44:
	.loc 1 64 30 is_stmt 0 discriminator 1 view .LVU119
.LBE12:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU120
	lea	rax, 32[r11]
.LBE11:
.LBB13:
	.loc 1 67 44 is_stmt 0 discriminator 3 view .LVU121
	movss	xmm1, DWORD PTR [rsp]
.LBE13:
.LBB14:
	.loc 1 62 18 discriminator 1 view .LVU122
	add	rdx, -128
	sub	rcx, -128
	cmp	r8, rax
	jb	.L23
	mov	r11, rax
.LVL45:
	.loc 1 62 18 discriminator 1 view .LVU123
	jmp	.L24
.LVL46:
.L31:
	.loc 1 62 18 discriminator 1 view .LVU124
	pxor	xmm1, xmm1
.LBE14:
	.loc 1 61 12 view .LVU125
	xor	r11d, r11d
.LVL47:
.L23:
.LBB15:
	.loc 1 67 26 is_stmt 1 discriminator 1 view .LVU126
	lea	rax, 4[rsp]
	lea	rdx, 128[rsp]
.LBE15:
	.loc 1 66 7 is_stmt 0 view .LVU127
	pxor	xmm0, xmm0
	jmp	.L28
.LVL48:
	.p2align 4,,10
	.p2align 3
.L33:
.LBB16:
	.loc 1 67 44 discriminator 3 view .LVU128
	movss	xmm1, DWORD PTR [rax]
	add	rax, 4
.LVL49:
.L28:
	.loc 1 67 38 discriminator 3 view .LVU129
	addss	xmm0, xmm1
.LVL50:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU130
	.loc 1 67 26 discriminator 1 view .LVU131
	cmp	rdx, rax
	jne	.L33
.LVL51:
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU132
.LBE16:
	.loc 1 68 14 is_stmt 1 discriminator 1 view .LVU133
	cmp	r11, r8
	jnb	.L22
	.p2align 4,,10
	.p2align 3
.L30:
	.loc 1 68 34 is_stmt 0 discriminator 2 view .LVU134
	movss	xmm1, DWORD PTR [r9+r11*4]
	mulss	xmm1, DWORD PTR [r10+r11*4]
	.loc 1 68 5 discriminator 2 view .LVU135
	add	r11, 1
.LVL52:
	.loc 1 68 26 discriminator 2 view .LVU136
	addss	xmm0, xmm1
.LVL53:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU137
	.loc 1 68 14 discriminator 1 view .LVU138
	cmp	r8, r11
	jne	.L30
.L22:
	.loc 1 70 1 is_stmt 0 view .LVU139
	sub	rsp, -128
	.cfi_def_cfa_offset 16
	pop	rdi
	.cfi_restore 5
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE31:
	.seh_endproc
	.section	.text$_Z5saxpyIfEvT_PKS0_PS0_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z5saxpyIfEvT_PKS0_PS0_y
	.def	_Z5saxpyIfEvT_PKS0_PS0_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z5saxpyIfEvT_PKS0_PS0_y
_Z5saxpyIfEvT_PKS0_PS0_y:
.LVL54:
.LFB32:
	.loc 1 76 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 76 15 is_stmt 0 view .LVU141
	.seh_endprologue
.LVL55:
.LBB17:
	.loc 1 77 26 is_stmt 1 discriminator 1 view .LVU142
	test	r9, r9
	je	.L34
	.loc 1 77 17 is_stmt 0 view .LVU143
	xor	eax, eax
.LVL56:
	.p2align 4,,10
	.p2align 3
.L36:
	.loc 1 77 45 discriminator 3 view .LVU144
	movss	xmm1, DWORD PTR [rdx+rax*4]
	mulss	xmm1, xmm0
	.loc 1 77 52 discriminator 3 view .LVU145
	addss	xmm1, DWORD PTR [r8+rax*4]
	.loc 1 77 41 discriminator 3 view .LVU146
	movss	DWORD PTR [r8+rax*4], xmm1
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU147
	add	rax, 1
.LVL57:
	.loc 1 77 26 discriminator 1 view .LVU148
	cmp	r9, rax
	jne	.L36
.LVL58:
.L34:
	.loc 1 77 26 is_stmt 0 discriminator 1 view .LVU149
.LBE17:
	.loc 1 78 1 view .LVU150
	ret
	.cfi_endproc
.LFE32:
	.seh_endproc
	.section	.text$_Z12saxpy_strideIfEvT_PKS0_PS0_yy,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z12saxpy_strideIfEvT_PKS0_PS0_yy
	.def	_Z12saxpy_strideIfEvT_PKS0_PS0_yy;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12saxpy_strideIfEvT_PKS0_PS0_yy
_Z12saxpy_strideIfEvT_PKS0_PS0_yy:
.LVL59:
.LFB33:
	.loc 1 81 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 81 15 is_stmt 0 view .LVU152
	.seh_endprologue
.LVL60:
.LBB18:
	.loc 1 82 26 is_stmt 1 discriminator 1 view .LVU153
	test	r9, r9
	je	.L41
	.loc 1 82 17 is_stmt 0 view .LVU154
	xor	eax, eax
	cmp	QWORD PTR 40[rsp], 1
	jne	.L54
.LVL61:
	.p2align 4,,10
	.p2align 3
.L43:
	.loc 1 82 49 discriminator 3 view .LVU155
	movss	xmm1, DWORD PTR [rdx+rax*4]
	mulss	xmm1, xmm0
	.loc 1 82 60 discriminator 3 view .LVU156
	addss	xmm1, DWORD PTR [r8+rax*4]
	.loc 1 82 45 discriminator 3 view .LVU157
	movss	DWORD PTR [r8+rax*4], xmm1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU158
	add	rax, 1
.LVL62:
	.loc 1 82 26 discriminator 1 view .LVU159
	cmp	r9, rax
	jne	.L43
.LVL63:
.L41:
	.loc 1 82 26 is_stmt 0 discriminator 1 view .LVU160
.LBE18:
	.loc 1 83 1 view .LVU161
	ret
.LVL64:
	.p2align 4,,10
	.p2align 3
.L54:
	.loc 1 83 1 view .LVU162
	mov	rax, QWORD PTR 40[rsp]
.LBB19:
	.loc 1 82 17 view .LVU163
	xor	ecx, ecx
	lea	r10, 0[0+rax*4]
	.loc 1 82 26 discriminator 1 view .LVU164
	xor	eax, eax
.LVL65:
	.p2align 4,,10
	.p2align 3
.L44:
	.loc 1 82 49 discriminator 3 view .LVU165
	movss	xmm1, DWORD PTR [rdx+rax]
	.loc 1 82 5 discriminator 3 view .LVU166
	add	rcx, 1
.LVL66:
	.loc 1 82 49 discriminator 3 view .LVU167
	mulss	xmm1, xmm0
	.loc 1 82 60 discriminator 3 view .LVU168
	addss	xmm1, DWORD PTR [r8+rax]
	.loc 1 82 45 discriminator 3 view .LVU169
	movss	DWORD PTR [r8+rax], xmm1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU170
.LVL67:
	.loc 1 82 26 discriminator 1 view .LVU171
	add	rax, r10
	cmp	r9, rcx
	jne	.L44
.LBE19:
	.loc 1 83 1 is_stmt 0 view .LVU172
	ret
	.cfi_endproc
.LFE33:
	.seh_endproc
	.section	.text$_Z12saxpy_gatherIfEvT_PKS0_PS0_PKiy,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z12saxpy_gatherIfEvT_PKS0_PS0_PKiy
	.def	_Z12saxpy_gatherIfEvT_PKS0_PS0_PKiy;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12saxpy_gatherIfEvT_PKS0_PS0_PKiy
_Z12saxpy_gatherIfEvT_PKS0_PS0_PKiy:
.LVL68:
.LFB34:
	.loc 1 86 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 86 15 is_stmt 0 view .LVU174
	.seh_endprologue
.LVL69:
.LBB20:
	.loc 1 88 26 is_stmt 1 discriminator 1 view .LVU175
.LBE20:
	.loc 1 86 15 is_stmt 0 view .LVU176
	mov	r10, QWORD PTR 40[rsp]
.LBB21:
	.loc 1 88 26 discriminator 1 view .LVU177
	test	r10, r10
	je	.L55
	.loc 1 88 17 view .LVU178
	xor	eax, eax
.LVL70:
	.p2align 4,,10
	.p2align 3
.L57:
	.loc 1 88 54 discriminator 3 view .LVU179
	movsx	rcx, DWORD PTR [r9+rax*4]
	.loc 1 88 45 discriminator 3 view .LVU180
	movss	xmm1, DWORD PTR [rdx+rcx*4]
	mulss	xmm1, xmm0
	.loc 1 88 57 discriminator 3 view .LVU181
	addss	xmm1, DWORD PTR [r8+rax*4]
	.loc 1 88 41 discriminator 3 view .LVU182
	movss	DWORD PTR [r8+rax*4], xmm1
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU183
	add	rax, 1
.LVL71:
	.loc 1 88 26 discriminator 1 view .LVU184
	cmp	r10, rax
	jne	.L57
.LVL72:
.L55:
	.loc 1 88 26 is_stmt 0 discriminator 1 view .LVU185
.LBE21:
	.loc 1 89 1 view .LVU186
	ret
	.cfi_endproc
.LFE34:
	.seh_endproc
	.section	.text$_Z4vmulIfEvPKT_S2_PS0_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z4vmulIfEvPKT_S2_PS0_y
	.def	_Z4vmulIfEvPKT_S2_PS0_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z4vmulIfEvPKT_S2_PS0_y
_Z4vmulIfEvPKT_S2_PS0_y:
.LVL73:
.LFB35:
	.loc 1 95 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 95 15 is_stmt 0 view .LVU188
	.seh_endprologue
.LVL74:
.LBB22:
	.loc 1 96 26 is_stmt 1 discriminator 1 view .LVU189
	test	r9, r9
	je	.L62
	.loc 1 96 17 is_stmt 0 view .LVU190
	xor	eax, eax
.LVL75:
	.p2align 4,,10
	.p2align 3
.L64:
	.loc 1 96 48 discriminator 3 view .LVU191
	movss	xmm0, DWORD PTR [rcx+rax*4]
	mulss	xmm0, DWORD PTR [rdx+rax*4]
	.loc 1 96 41 discriminator 3 view .LVU192
	movss	DWORD PTR [r8+rax*4], xmm0
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU193
	add	rax, 1
.LVL76:
	.loc 1 96 26 discriminator 1 view .LVU194
	cmp	r9, rax
	jne	.L64
.LVL77:
.L62:
	.loc 1 96 26 is_stmt 0 discriminator 1 view .LVU195
.LBE22:
	.loc 1 97 1 view .LVU196
	ret
	.cfi_endproc
.LFE35:
	.seh_endproc
	.section	.text$_Z7dot_refIfEePKT_S2_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z7dot_refIfEePKT_S2_y
	.def	_Z7dot_refIfEePKT_S2_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z7dot_refIfEePKT_S2_y
_Z7dot_refIfEePKT_S2_y:
.LVL78:
.LFB36:
	.loc 1 147 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 147 13 is_stmt 0 view .LVU198
	.seh_endprologue
	.loc 1 148 17 view .LVU199
	fldz
	.loc 1 147 13 view .LVU200
	mov	rax, rcx
	.loc 1 148 17 view .LVU201
	fstp	TBYTE PTR [rcx]
	fld	TBYTE PTR [rcx]
.LVL79:
.LBB23:
	.loc 1 149 26 is_stmt 1 discriminator 1 view .LVU202
	test	r9, r9
	je	.L76
	.loc 1 149 17 is_stmt 0 view .LVU203
	xor	r10d, r10d
.LVL80:
	.p2align 4,,10
	.p2align 3
.L71:
	.loc 1 149 61 discriminator 3 view .LVU204
	fld	DWORD PTR [r8+r10*4]
	.loc 1 149 59 discriminator 3 view .LVU205
	fmul	DWORD PTR [rdx+r10*4]
	.loc 1 149 5 discriminator 3 view .LVU206
	add	r10, 1
.LVL81:
	.loc 1 149 38 discriminator 3 view .LVU207
	faddp	st(1), st
	.loc 1 149 5 is_stmt 1 discriminator 3 view .LVU208
.LVL82:
	.loc 1 149 26 discriminator 1 view .LVU209
	cmp	r9, r10
	jne	.L71
	fstp	TBYTE PTR [rax]
.LBE23:
	.loc 1 150 12 is_stmt 0 view .LVU210
	jmp	.L69
.LVL83:
	.p2align 4,,10
	.p2align 3
.L76:
	.loc 1 150 12 view .LVU211
	fstp	st(0)
.LVL84:
.L69:
	.loc 1 151 1 view .LVU212
	ret
	.cfi_endproc
.LFE36:
	.seh_endproc
	.section	.text$_Z14saxpy_ref_elemIfEeT_S0_S0_,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z14saxpy_ref_elemIfEeT_S0_S0_
	.def	_Z14saxpy_ref_elemIfEeT_S0_S0_;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z14saxpy_ref_elemIfEeT_S0_S0_
_Z14saxpy_ref_elemIfEeT_S0_S0_:
.LVL85:
.LFB37:
	.loc 1 154 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 154 13 is_stmt 0 view .LVU214
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
	.loc 1 154 13 view .LVU215
	movss	DWORD PTR 4[rsp], xmm1
	.loc 1 154 67 view .LVU216
	fld	DWORD PTR 4[rsp]
	.loc 1 154 13 view .LVU217
	mov	rax, rcx
	movss	DWORD PTR 8[rsp], xmm2
	.loc 1 154 67 view .LVU218
	fmul	DWORD PTR 8[rsp]
	.loc 1 154 13 view .LVU219
	movss	DWORD PTR 12[rsp], xmm3
	.loc 1 154 84 view .LVU220
	fadd	DWORD PTR 12[rsp]
	.loc 1 154 99 view .LVU221
	fstp	TBYTE PTR [rcx]
	.loc 1 154 102 view .LVU222
	add	rsp, 24
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE37:
	.seh_endproc
	.section	.text$_Z13vmul_ref_elemIfEeT_S0_,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z13vmul_ref_elemIfEeT_S0_
	.def	_Z13vmul_ref_elemIfEeT_S0_;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z13vmul_ref_elemIfEeT_S0_
_Z13vmul_ref_elemIfEeT_S0_:
.LVL86:
.LFB38:
	.loc 1 157 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 157 13 is_stmt 0 view .LVU224
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
	.loc 1 157 13 view .LVU225
	movss	DWORD PTR 8[rsp], xmm1
	.loc 1 157 61 view .LVU226
	fld	DWORD PTR 8[rsp]
	.loc 1 157 13 view .LVU227
	mov	rax, rcx
	movss	DWORD PTR 12[rsp], xmm2
	.loc 1 157 61 view .LVU228
	fmul	DWORD PTR 12[rsp]
	.loc 1 157 76 view .LVU229
	fstp	TBYTE PTR [rcx]
	.loc 1 157 79 view .LVU230
	add	rsp, 24
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE38:
	.seh_endproc
	.section	.text$_Z10dot_strictIdET_PKS0_S2_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z10dot_strictIdET_PKS0_S2_y
	.def	_Z10dot_strictIdET_PKS0_S2_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z10dot_strictIdET_PKS0_S2_y
_Z10dot_strictIdET_PKS0_S2_y:
.LVL87:
.LFB39:
	.loc 1 14 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 14 12 is_stmt 0 view .LVU232
	.seh_endprologue
.LVL88:
.LBB24:
	.loc 1 16 26 is_stmt 1 discriminator 1 view .LVU233
	test	r8, r8
	je	.L82
	.loc 1 16 17 is_stmt 0 view .LVU234
	xor	eax, eax
.LBE24:
	.loc 1 15 7 view .LVU235
	pxor	xmm1, xmm1
.LVL89:
	.p2align 4,,10
	.p2align 3
.L81:
.LBB25:
	.loc 1 16 46 discriminator 3 view .LVU236
	movsd	xmm0, QWORD PTR [rcx+rax*8]
	mulsd	xmm0, QWORD PTR [rdx+rax*8]
	.loc 1 16 5 discriminator 3 view .LVU237
	add	rax, 1
.LVL90:
	.loc 1 16 38 discriminator 3 view .LVU238
	addsd	xmm1, xmm0
.LVL91:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU239
	.loc 1 16 26 discriminator 1 view .LVU240
	cmp	r8, rax
	jne	.L81
.LBE25:
	.loc 1 18 1 is_stmt 0 view .LVU241
	movapd	xmm0, xmm1
	ret
.LVL92:
	.p2align 4,,10
	.p2align 3
.L82:
	.loc 1 15 7 view .LVU242
	pxor	xmm1, xmm1
	.loc 1 18 1 view .LVU243
	movapd	xmm0, xmm1
	ret
	.cfi_endproc
.LFE39:
	.seh_endproc
	.section	.text$_Z12dot_multiaccIdET_PKS0_S2_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z12dot_multiaccIdET_PKS0_S2_y
	.def	_Z12dot_multiaccIdET_PKS0_S2_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12dot_multiaccIdET_PKS0_S2_y
_Z12dot_multiaccIdET_PKS0_S2_y:
.LVL93:
.LFB40:
	.loc 1 26 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 26 12 is_stmt 0 view .LVU245
	sub	rsp, 120
	.seh_stackalloc	120
	.cfi_def_cfa_offset 128
	movups	XMMWORD PTR 64[rsp], xmm6
	.seh_savexmm	xmm6, 64
	movups	XMMWORD PTR 80[rsp], xmm7
	.seh_savexmm	xmm7, 80
	movups	XMMWORD PTR 96[rsp], xmm8
	.seh_savexmm	xmm8, 96
	.cfi_offset 23, -64
	.cfi_offset 24, -48
	.cfi_offset 25, -32
	.seh_endprologue
.LVL94:
	.loc 1 28 7 view .LVU246
	pxor	xmm0, xmm0
	.loc 1 26 12 view .LVU247
	mov	r9, rcx
	mov	r10, rdx
	.loc 1 28 7 view .LVU248
	movups	XMMWORD PTR [rsp], xmm0
	movups	XMMWORD PTR 16[rsp], xmm0
	movups	XMMWORD PTR 32[rsp], xmm0
	movups	XMMWORD PTR 48[rsp], xmm0
.LVL95:
.LBB26:
	.loc 1 30 18 is_stmt 1 discriminator 1 view .LVU249
	cmp	r8, 7
	jbe	.L93
	mov	rax, rcx
	lea	rcx, -8[r8]
.LVL96:
	.loc 1 30 18 is_stmt 0 discriminator 1 view .LVU250
	pxor	xmm2, xmm2
	movapd	xmm3, xmm2
	movapd	xmm4, xmm2
	movapd	xmm5, xmm2
	mov	r11, rcx
	movapd	xmm6, xmm2
	shr	r11, 3
	movapd	xmm7, xmm2
	movapd	xmm1, xmm2
	sal	r11, 6
	movapd	xmm8, xmm2
	lea	r11, 64[r9+r11]
.LVL97:
	.p2align 4,,10
	.p2align 3
.L88:
.LBB27:
	.loc 1 31 30 is_stmt 1 discriminator 1 view .LVU251
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU252
	movsd	xmm0, QWORD PTR [rax]
	mulsd	xmm0, QWORD PTR [rdx]
.LBE27:
	.loc 1 30 18 discriminator 1 view .LVU253
	add	rax, 64
	add	rdx, 64
.LBB28:
	.loc 1 31 47 discriminator 3 view .LVU254
	addsd	xmm1, xmm0
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU255
.LVL98:
	.loc 1 31 30 discriminator 1 view .LVU256
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU257
	movsd	xmm0, QWORD PTR -56[rax]
	mulsd	xmm0, QWORD PTR -56[rdx]
	.loc 1 31 47 discriminator 3 view .LVU258
	addsd	xmm8, xmm0
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU259
.LVL99:
	.loc 1 31 30 discriminator 1 view .LVU260
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU261
	movsd	xmm0, QWORD PTR -48[rax]
	mulsd	xmm0, QWORD PTR -48[rdx]
	.loc 1 31 47 discriminator 3 view .LVU262
	addsd	xmm7, xmm0
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU263
.LVL100:
	.loc 1 31 30 discriminator 1 view .LVU264
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU265
	movsd	xmm0, QWORD PTR -40[rax]
	mulsd	xmm0, QWORD PTR -40[rdx]
	.loc 1 31 47 discriminator 3 view .LVU266
	addsd	xmm6, xmm0
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU267
.LVL101:
	.loc 1 31 30 discriminator 1 view .LVU268
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU269
	movsd	xmm0, QWORD PTR -32[rax]
	mulsd	xmm0, QWORD PTR -32[rdx]
	.loc 1 31 47 discriminator 3 view .LVU270
	addsd	xmm5, xmm0
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU271
.LVL102:
	.loc 1 31 30 discriminator 1 view .LVU272
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU273
	movsd	xmm0, QWORD PTR -24[rax]
	mulsd	xmm0, QWORD PTR -24[rdx]
	.loc 1 31 47 discriminator 3 view .LVU274
	addsd	xmm4, xmm0
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU275
.LVL103:
	.loc 1 31 30 discriminator 1 view .LVU276
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU277
	movsd	xmm0, QWORD PTR -16[rax]
	mulsd	xmm0, QWORD PTR -16[rdx]
	.loc 1 31 47 discriminator 3 view .LVU278
	addsd	xmm3, xmm0
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU279
.LVL104:
	.loc 1 31 30 discriminator 1 view .LVU280
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU281
	movsd	xmm0, QWORD PTR -8[rax]
	mulsd	xmm0, QWORD PTR -8[rdx]
	.loc 1 31 47 discriminator 3 view .LVU282
	addsd	xmm2, xmm0
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU283
.LVL105:
	.loc 1 31 30 discriminator 1 view .LVU284
.LBE28:
	.loc 1 30 18 discriminator 1 view .LVU285
	cmp	r11, rax
	jne	.L88
	and	rcx, -8
	movsd	QWORD PTR 8[rsp], xmm8
	lea	rax, 8[rcx]
	movsd	QWORD PTR 16[rsp], xmm7
	movsd	QWORD PTR 24[rsp], xmm6
	movsd	QWORD PTR 32[rsp], xmm5
	movsd	QWORD PTR 40[rsp], xmm4
	movsd	QWORD PTR 48[rsp], xmm3
	movsd	QWORD PTR 56[rsp], xmm2
.LVL106:
.L89:
	.loc 1 30 18 is_stmt 0 discriminator 1 view .LVU286
.LBE26:
.LBB29:
	.loc 1 34 26 is_stmt 1 discriminator 1 view .LVU287
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU288
	pxor	xmm0, xmm0
	addsd	xmm0, xmm1
.LVL107:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU289
	.loc 1 34 26 discriminator 1 view .LVU290
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU291
	addsd	xmm0, QWORD PTR 8[rsp]
.LVL108:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU292
	.loc 1 34 26 discriminator 1 view .LVU293
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU294
	addsd	xmm0, QWORD PTR 16[rsp]
.LVL109:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU295
	.loc 1 34 26 discriminator 1 view .LVU296
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU297
	addsd	xmm0, QWORD PTR 24[rsp]
.LVL110:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU298
	.loc 1 34 26 discriminator 1 view .LVU299
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU300
	addsd	xmm0, QWORD PTR 32[rsp]
.LVL111:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU301
	.loc 1 34 26 discriminator 1 view .LVU302
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU303
	addsd	xmm0, QWORD PTR 40[rsp]
.LVL112:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU304
	.loc 1 34 26 discriminator 1 view .LVU305
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU306
	addsd	xmm0, QWORD PTR 48[rsp]
.LVL113:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU307
	.loc 1 34 26 discriminator 1 view .LVU308
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU309
	addsd	xmm0, QWORD PTR 56[rsp]
.LVL114:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU310
	.loc 1 34 26 discriminator 1 view .LVU311
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU312
.LBE29:
	.loc 1 35 14 is_stmt 1 discriminator 1 view .LVU313
	cmp	rax, r8
	jnb	.L84
	.p2align 4,,10
	.p2align 3
.L86:
	.loc 1 35 34 is_stmt 0 discriminator 2 view .LVU314
	movsd	xmm1, QWORD PTR [r9+rax*8]
	mulsd	xmm1, QWORD PTR [r10+rax*8]
	.loc 1 35 5 discriminator 2 view .LVU315
	add	rax, 1
.LVL115:
	.loc 1 35 26 discriminator 2 view .LVU316
	addsd	xmm0, xmm1
.LVL116:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU317
	.loc 1 35 14 discriminator 1 view .LVU318
	cmp	r8, rax
	jne	.L86
.L84:
	.loc 1 37 1 is_stmt 0 view .LVU319
	movups	xmm6, XMMWORD PTR 64[rsp]
	movups	xmm7, XMMWORD PTR 80[rsp]
	movups	xmm8, XMMWORD PTR 96[rsp]
	add	rsp, 120
	.cfi_remember_state
	.cfi_restore 25
	.cfi_restore 24
	.cfi_restore 23
	.cfi_def_cfa_offset 8
	ret
.LVL117:
.L93:
	.cfi_restore_state
.LBB30:
	.loc 1 30 18 discriminator 1 view .LVU320
	pxor	xmm1, xmm1
.LBE30:
	.loc 1 29 12 view .LVU321
	xor	eax, eax
	jmp	.L89
	.cfi_endproc
.LFE40:
	.seh_endproc
	.section	.text$_Z8dot_simdIdET_PKS0_S2_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z8dot_simdIdET_PKS0_S2_y
	.def	_Z8dot_simdIdET_PKS0_S2_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8dot_simdIdET_PKS0_S2_y
_Z8dot_simdIdET_PKS0_S2_y:
.LVL118:
.LFB41:
	.loc 1 45 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 45 12 is_stmt 0 view .LVU323
	.seh_endprologue
.LVL119:
.LBB31:
	.loc 1 48 26 is_stmt 1 discriminator 1 view .LVU324
	test	r8, r8
	je	.L97
	.loc 1 48 17 is_stmt 0 view .LVU325
	xor	eax, eax
.LBE31:
	.loc 1 46 7 view .LVU326
	pxor	xmm1, xmm1
.LVL120:
	.p2align 4,,10
	.p2align 3
.L96:
.LBB32:
	.loc 1 48 46 discriminator 3 view .LVU327
	movsd	xmm0, QWORD PTR [rcx+rax*8]
	mulsd	xmm0, QWORD PTR [rdx+rax*8]
	.loc 1 48 5 discriminator 3 view .LVU328
	add	rax, 1
.LVL121:
	.loc 1 48 38 discriminator 3 view .LVU329
	addsd	xmm1, xmm0
.LVL122:
	.loc 1 48 5 is_stmt 1 discriminator 3 view .LVU330
	.loc 1 48 26 discriminator 1 view .LVU331
	cmp	r8, rax
	jne	.L96
.LBE32:
	.loc 1 50 1 is_stmt 0 view .LVU332
	movapd	xmm0, xmm1
	ret
.LVL123:
	.p2align 4,,10
	.p2align 3
.L97:
	.loc 1 46 7 view .LVU333
	pxor	xmm1, xmm1
	.loc 1 50 1 view .LVU334
	movapd	xmm0, xmm1
	ret
	.cfi_endproc
.LFE41:
	.seh_endproc
	.section	.text$_Z12dot_simd_accIdET_PKS0_S2_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z12dot_simd_accIdET_PKS0_S2_y
	.def	_Z12dot_simd_accIdET_PKS0_S2_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12dot_simd_accIdET_PKS0_S2_y
_Z12dot_simd_accIdET_PKS0_S2_y:
.LVL124:
.LFB42:
	.loc 1 58 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 58 12 is_stmt 0 view .LVU336
	push	rdi
	.seh_pushreg	rdi
	.cfi_def_cfa_offset 16
	.cfi_offset 5, -16
	sub	rsp, 256
	.seh_stackalloc	256
	.cfi_def_cfa_offset 272
	.seh_endprologue
.LVL125:
	.loc 1 60 7 view .LVU337
	xor	eax, eax
	.loc 1 58 12 view .LVU338
	mov	r10, rdx
	.loc 1 60 7 view .LVU339
	mov	rdx, rsp
.LVL126:
	.loc 1 58 12 view .LVU340
	mov	r9, rcx
	.loc 1 60 7 view .LVU341
	mov	ecx, 32
.LVL127:
	.loc 1 60 7 view .LVU342
	mov	rdi, rdx
	rep stosq
.LVL128:
.LBB33:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU343
	cmp	r8, 31
	jbe	.L108
	mov	ecx, 256
	mov	r11d, 32
	pxor	xmm1, xmm1
.LVL129:
	.p2align 4,,10
	.p2align 3
.L101:
.LBB34:
	.loc 1 64 30 discriminator 1 view .LVU344
	lea	rax, -256[rcx]
	jmp	.L103
.LVL130:
	.p2align 4,,10
	.p2align 3
.L102:
	.loc 1 64 43 is_stmt 0 discriminator 3 view .LVU345
	movsd	xmm1, QWORD PTR [rdx+rax]
.L103:
	.loc 1 64 59 discriminator 3 view .LVU346
	movsd	xmm0, QWORD PTR [r9+rax]
	mulsd	xmm0, QWORD PTR [r10+rax]
	.loc 1 64 47 discriminator 3 view .LVU347
	addsd	xmm0, xmm1
	movsd	QWORD PTR [rdx+rax], xmm0
	.loc 1 64 9 is_stmt 1 discriminator 3 view .LVU348
	.loc 1 64 30 discriminator 1 view .LVU349
	add	rax, 8
	cmp	rcx, rax
	jne	.L102
.LVL131:
	.loc 1 64 30 is_stmt 0 discriminator 1 view .LVU350
.LBE34:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU351
	lea	rax, 32[r11]
.LBE33:
.LBB35:
	.loc 1 67 44 is_stmt 0 discriminator 3 view .LVU352
	movsd	xmm1, QWORD PTR [rsp]
.LBE35:
.LBB36:
	.loc 1 62 18 discriminator 1 view .LVU353
	sub	rdx, 256
	add	rcx, 256
	cmp	r8, rax
	jb	.L100
	mov	r11, rax
.LVL132:
	.loc 1 62 18 discriminator 1 view .LVU354
	jmp	.L101
.LVL133:
.L108:
	.loc 1 62 18 discriminator 1 view .LVU355
	pxor	xmm1, xmm1
.LBE36:
	.loc 1 61 12 view .LVU356
	xor	r11d, r11d
.LVL134:
.L100:
.LBB37:
	.loc 1 67 26 is_stmt 1 discriminator 1 view .LVU357
	lea	rax, 8[rsp]
	lea	rdx, 256[rsp]
.LBE37:
	.loc 1 66 7 is_stmt 0 view .LVU358
	pxor	xmm0, xmm0
	jmp	.L105
.LVL135:
	.p2align 4,,10
	.p2align 3
.L110:
.LBB38:
	.loc 1 67 44 discriminator 3 view .LVU359
	movsd	xmm1, QWORD PTR [rax]
	add	rax, 8
.LVL136:
.L105:
	.loc 1 67 38 discriminator 3 view .LVU360
	addsd	xmm0, xmm1
.LVL137:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU361
	.loc 1 67 26 discriminator 1 view .LVU362
	cmp	rdx, rax
	jne	.L110
.LVL138:
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU363
.LBE38:
	.loc 1 68 14 is_stmt 1 discriminator 1 view .LVU364
	cmp	r11, r8
	jnb	.L99
	.p2align 4,,10
	.p2align 3
.L107:
	.loc 1 68 34 is_stmt 0 discriminator 2 view .LVU365
	movsd	xmm1, QWORD PTR [r9+r11*8]
	mulsd	xmm1, QWORD PTR [r10+r11*8]
	.loc 1 68 5 discriminator 2 view .LVU366
	add	r11, 1
.LVL139:
	.loc 1 68 26 discriminator 2 view .LVU367
	addsd	xmm0, xmm1
.LVL140:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU368
	.loc 1 68 14 discriminator 1 view .LVU369
	cmp	r8, r11
	jne	.L107
.L99:
	.loc 1 70 1 is_stmt 0 view .LVU370
	add	rsp, 256
	.cfi_def_cfa_offset 16
	pop	rdi
	.cfi_restore 5
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE42:
	.seh_endproc
	.section	.text$_Z5saxpyIdEvT_PKS0_PS0_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z5saxpyIdEvT_PKS0_PS0_y
	.def	_Z5saxpyIdEvT_PKS0_PS0_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z5saxpyIdEvT_PKS0_PS0_y
_Z5saxpyIdEvT_PKS0_PS0_y:
.LVL141:
.LFB43:
	.loc 1 76 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 76 15 is_stmt 0 view .LVU372
	.seh_endprologue
.LVL142:
.LBB39:
	.loc 1 77 26 is_stmt 1 discriminator 1 view .LVU373
	test	r9, r9
	je	.L111
	.loc 1 77 17 is_stmt 0 view .LVU374
	xor	eax, eax
.LVL143:
	.p2align 4,,10
	.p2align 3
.L113:
	.loc 1 77 45 discriminator 3 view .LVU375
	movsd	xmm1, QWORD PTR [rdx+rax*8]
	mulsd	xmm1, xmm0
	.loc 1 77 52 discriminator 3 view .LVU376
	addsd	xmm1, QWORD PTR [r8+rax*8]
	.loc 1 77 41 discriminator 3 view .LVU377
	movsd	QWORD PTR [r8+rax*8], xmm1
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU378
	add	rax, 1
.LVL144:
	.loc 1 77 26 discriminator 1 view .LVU379
	cmp	r9, rax
	jne	.L113
.LVL145:
.L111:
	.loc 1 77 26 is_stmt 0 discriminator 1 view .LVU380
.LBE39:
	.loc 1 78 1 view .LVU381
	ret
	.cfi_endproc
.LFE43:
	.seh_endproc
	.section	.text$_Z12saxpy_strideIdEvT_PKS0_PS0_yy,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z12saxpy_strideIdEvT_PKS0_PS0_yy
	.def	_Z12saxpy_strideIdEvT_PKS0_PS0_yy;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12saxpy_strideIdEvT_PKS0_PS0_yy
_Z12saxpy_strideIdEvT_PKS0_PS0_yy:
.LVL146:
.LFB44:
	.loc 1 81 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 81 15 is_stmt 0 view .LVU383
	.seh_endprologue
.LVL147:
.LBB40:
	.loc 1 82 26 is_stmt 1 discriminator 1 view .LVU384
	test	r9, r9
	je	.L118
	.loc 1 82 17 is_stmt 0 view .LVU385
	xor	eax, eax
	cmp	QWORD PTR 40[rsp], 1
	jne	.L131
.LVL148:
	.p2align 4,,10
	.p2align 3
.L120:
	.loc 1 82 49 discriminator 3 view .LVU386
	movsd	xmm1, QWORD PTR [rdx+rax*8]
	mulsd	xmm1, xmm0
	.loc 1 82 60 discriminator 3 view .LVU387
	addsd	xmm1, QWORD PTR [r8+rax*8]
	.loc 1 82 45 discriminator 3 view .LVU388
	movsd	QWORD PTR [r8+rax*8], xmm1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU389
	add	rax, 1
.LVL149:
	.loc 1 82 26 discriminator 1 view .LVU390
	cmp	r9, rax
	jne	.L120
.LVL150:
.L118:
	.loc 1 82 26 is_stmt 0 discriminator 1 view .LVU391
.LBE40:
	.loc 1 83 1 view .LVU392
	ret
.LVL151:
	.p2align 4,,10
	.p2align 3
.L131:
	.loc 1 83 1 view .LVU393
	mov	rax, QWORD PTR 40[rsp]
.LBB41:
	.loc 1 82 17 view .LVU394
	xor	ecx, ecx
	lea	r10, 0[0+rax*8]
	.loc 1 82 26 discriminator 1 view .LVU395
	xor	eax, eax
.LVL152:
	.p2align 4,,10
	.p2align 3
.L121:
	.loc 1 82 49 discriminator 3 view .LVU396
	movsd	xmm1, QWORD PTR [rdx+rax]
	.loc 1 82 5 discriminator 3 view .LVU397
	add	rcx, 1
.LVL153:
	.loc 1 82 49 discriminator 3 view .LVU398
	mulsd	xmm1, xmm0
	.loc 1 82 60 discriminator 3 view .LVU399
	addsd	xmm1, QWORD PTR [r8+rax]
	.loc 1 82 45 discriminator 3 view .LVU400
	movsd	QWORD PTR [r8+rax], xmm1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU401
.LVL154:
	.loc 1 82 26 discriminator 1 view .LVU402
	add	rax, r10
	cmp	r9, rcx
	jne	.L121
.LBE41:
	.loc 1 83 1 is_stmt 0 view .LVU403
	ret
	.cfi_endproc
.LFE44:
	.seh_endproc
	.section	.text$_Z12saxpy_gatherIdEvT_PKS0_PS0_PKiy,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z12saxpy_gatherIdEvT_PKS0_PS0_PKiy
	.def	_Z12saxpy_gatherIdEvT_PKS0_PS0_PKiy;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12saxpy_gatherIdEvT_PKS0_PS0_PKiy
_Z12saxpy_gatherIdEvT_PKS0_PS0_PKiy:
.LVL155:
.LFB45:
	.loc 1 86 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 86 15 is_stmt 0 view .LVU405
	.seh_endprologue
.LVL156:
.LBB42:
	.loc 1 88 26 is_stmt 1 discriminator 1 view .LVU406
.LBE42:
	.loc 1 86 15 is_stmt 0 view .LVU407
	mov	r10, QWORD PTR 40[rsp]
.LBB43:
	.loc 1 88 26 discriminator 1 view .LVU408
	test	r10, r10
	je	.L132
	.loc 1 88 17 view .LVU409
	xor	eax, eax
.LVL157:
	.p2align 4,,10
	.p2align 3
.L134:
	.loc 1 88 54 discriminator 3 view .LVU410
	movsx	rcx, DWORD PTR [r9+rax*4]
	.loc 1 88 45 discriminator 3 view .LVU411
	movsd	xmm1, QWORD PTR [rdx+rcx*8]
	mulsd	xmm1, xmm0
	.loc 1 88 57 discriminator 3 view .LVU412
	addsd	xmm1, QWORD PTR [r8+rax*8]
	.loc 1 88 41 discriminator 3 view .LVU413
	movsd	QWORD PTR [r8+rax*8], xmm1
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU414
	add	rax, 1
.LVL158:
	.loc 1 88 26 discriminator 1 view .LVU415
	cmp	r10, rax
	jne	.L134
.LVL159:
.L132:
	.loc 1 88 26 is_stmt 0 discriminator 1 view .LVU416
.LBE43:
	.loc 1 89 1 view .LVU417
	ret
	.cfi_endproc
.LFE45:
	.seh_endproc
	.section	.text$_Z4vmulIdEvPKT_S2_PS0_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z4vmulIdEvPKT_S2_PS0_y
	.def	_Z4vmulIdEvPKT_S2_PS0_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z4vmulIdEvPKT_S2_PS0_y
_Z4vmulIdEvPKT_S2_PS0_y:
.LVL160:
.LFB46:
	.loc 1 95 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 95 15 is_stmt 0 view .LVU419
	.seh_endprologue
.LVL161:
.LBB44:
	.loc 1 96 26 is_stmt 1 discriminator 1 view .LVU420
	test	r9, r9
	je	.L139
	.loc 1 96 17 is_stmt 0 view .LVU421
	xor	eax, eax
.LVL162:
	.p2align 4,,10
	.p2align 3
.L141:
	.loc 1 96 48 discriminator 3 view .LVU422
	movsd	xmm0, QWORD PTR [rcx+rax*8]
	mulsd	xmm0, QWORD PTR [rdx+rax*8]
	.loc 1 96 41 discriminator 3 view .LVU423
	movsd	QWORD PTR [r8+rax*8], xmm0
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU424
	add	rax, 1
.LVL163:
	.loc 1 96 26 discriminator 1 view .LVU425
	cmp	r9, rax
	jne	.L141
.LVL164:
.L139:
	.loc 1 96 26 is_stmt 0 discriminator 1 view .LVU426
.LBE44:
	.loc 1 97 1 view .LVU427
	ret
	.cfi_endproc
.LFE46:
	.seh_endproc
	.section	.text$_Z7dot_refIdEePKT_S2_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z7dot_refIdEePKT_S2_y
	.def	_Z7dot_refIdEePKT_S2_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z7dot_refIdEePKT_S2_y
_Z7dot_refIdEePKT_S2_y:
.LVL165:
.LFB47:
	.loc 1 147 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 147 13 is_stmt 0 view .LVU429
	.seh_endprologue
	.loc 1 148 17 view .LVU430
	fldz
	.loc 1 147 13 view .LVU431
	mov	rax, rcx
	.loc 1 148 17 view .LVU432
	fstp	TBYTE PTR [rcx]
	fld	TBYTE PTR [rcx]
.LVL166:
.LBB45:
	.loc 1 149 26 is_stmt 1 discriminator 1 view .LVU433
	test	r9, r9
	je	.L153
	.loc 1 149 17 is_stmt 0 view .LVU434
	xor	r10d, r10d
.LVL167:
	.p2align 4,,10
	.p2align 3
.L148:
	.loc 1 149 61 discriminator 3 view .LVU435
	fld	QWORD PTR [r8+r10*8]
	.loc 1 149 59 discriminator 3 view .LVU436
	fmul	QWORD PTR [rdx+r10*8]
	.loc 1 149 5 discriminator 3 view .LVU437
	add	r10, 1
.LVL168:
	.loc 1 149 38 discriminator 3 view .LVU438
	faddp	st(1), st
	.loc 1 149 5 is_stmt 1 discriminator 3 view .LVU439
.LVL169:
	.loc 1 149 26 discriminator 1 view .LVU440
	cmp	r9, r10
	jne	.L148
	fstp	TBYTE PTR [rax]
.LBE45:
	.loc 1 150 12 is_stmt 0 view .LVU441
	jmp	.L146
.LVL170:
	.p2align 4,,10
	.p2align 3
.L153:
	.loc 1 150 12 view .LVU442
	fstp	st(0)
.LVL171:
.L146:
	.loc 1 151 1 view .LVU443
	ret
	.cfi_endproc
.LFE47:
	.seh_endproc
	.section	.text$_Z14saxpy_ref_elemIdEeT_S0_S0_,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z14saxpy_ref_elemIdEeT_S0_S0_
	.def	_Z14saxpy_ref_elemIdEeT_S0_S0_;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z14saxpy_ref_elemIdEeT_S0_S0_
_Z14saxpy_ref_elemIdEeT_S0_S0_:
.LVL172:
.LFB48:
	.loc 1 154 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 154 13 is_stmt 0 view .LVU445
	sub	rsp, 40
	.seh_stackalloc	40
	.cfi_def_cfa_offset 48
	.seh_endprologue
	.loc 1 154 13 view .LVU446
	movsd	QWORD PTR 8[rsp], xmm1
	.loc 1 154 67 view .LVU447
	fld	QWORD PTR 8[rsp]
	.loc 1 154 13 view .LVU448
	mov	rax, rcx
	movsd	QWORD PTR 16[rsp], xmm2
	.loc 1 154 67 view .LVU449
	fmul	QWORD PTR 16[rsp]
	.loc 1 154 13 view .LVU450
	movsd	QWORD PTR 24[rsp], xmm3
	.loc 1 154 84 view .LVU451
	fadd	QWORD PTR 24[rsp]
	.loc 1 154 99 view .LVU452
	fstp	TBYTE PTR [rcx]
	.loc 1 154 102 view .LVU453
	add	rsp, 40
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE48:
	.seh_endproc
	.section	.text$_Z13vmul_ref_elemIdEeT_S0_,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z13vmul_ref_elemIdEeT_S0_
	.def	_Z13vmul_ref_elemIdEeT_S0_;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z13vmul_ref_elemIdEeT_S0_
_Z13vmul_ref_elemIdEeT_S0_:
.LVL173:
.LFB49:
	.loc 1 157 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 157 13 is_stmt 0 view .LVU455
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
	.loc 1 157 13 view .LVU456
	movsd	QWORD PTR [rsp], xmm1
	.loc 1 157 61 view .LVU457
	fld	QWORD PTR [rsp]
	.loc 1 157 13 view .LVU458
	mov	rax, rcx
	movsd	QWORD PTR 8[rsp], xmm2
	.loc 1 157 61 view .LVU459
	fmul	QWORD PTR 8[rsp]
	.loc 1 157 76 view .LVU460
	fstp	TBYTE PTR [rcx]
	.loc 1 157 79 view .LVU461
	add	rsp, 24
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE49:
	.seh_endproc
	.section	.text$_Z10dot_strictIiET_PKS0_S2_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z10dot_strictIiET_PKS0_S2_y
	.def	_Z10dot_strictIiET_PKS0_S2_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z10dot_strictIiET_PKS0_S2_y
_Z10dot_strictIiET_PKS0_S2_y:
.LVL174:
.LFB50:
	.loc 1 14 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 14 12 is_stmt 0 view .LVU463
	.seh_endprologue
.LVL175:
.LBB46:
	.loc 1 16 26 is_stmt 1 discriminator 1 view .LVU464
	test	r8, r8
	je	.L159
	.loc 1 16 17 is_stmt 0 view .LVU465
	xor	eax, eax
.LBE46:
	.loc 1 15 7 view .LVU466
	xor	r10d, r10d
.LVL176:
	.p2align 4,,10
	.p2align 3
.L158:
.LBB47:
	.loc 1 16 46 discriminator 3 view .LVU467
	mov	r9d, DWORD PTR [rcx+rax*4]
	imul	r9d, DWORD PTR [rdx+rax*4]
	.loc 1 16 5 discriminator 3 view .LVU468
	add	rax, 1
.LVL177:
	.loc 1 16 38 discriminator 3 view .LVU469
	add	r10d, r9d
.LVL178:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU470
	.loc 1 16 26 discriminator 1 view .LVU471
	cmp	r8, rax
	jne	.L158
.LBE47:
	.loc 1 18 1 is_stmt 0 view .LVU472
	mov	eax, r10d
.LVL179:
	.loc 1 18 1 view .LVU473
	ret
.LVL180:
	.p2align 4,,10
	.p2align 3
.L159:
	.loc 1 15 7 view .LVU474
	xor	r10d, r10d
	.loc 1 18 1 view .LVU475
	mov	eax, r10d
	ret
	.cfi_endproc
.LFE50:
	.seh_endproc
	.section	.text$_Z12dot_multiaccIiET_PKS0_S2_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z12dot_multiaccIiET_PKS0_S2_y
	.def	_Z12dot_multiaccIiET_PKS0_S2_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12dot_multiaccIiET_PKS0_S2_y
_Z12dot_multiaccIiET_PKS0_S2_y:
.LVL181:
.LFB51:
	.loc 1 26 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 26 12 is_stmt 0 view .LVU477
	push	r15
	.seh_pushreg	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.seh_pushreg	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.seh_pushreg	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.seh_pushreg	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.seh_pushreg	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rdi
	.seh_pushreg	rdi
	.cfi_def_cfa_offset 56
	.cfi_offset 5, -56
	push	rsi
	.seh_pushreg	rsi
	.cfi_def_cfa_offset 64
	.cfi_offset 4, -64
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 72
	.cfi_offset 3, -72
	sub	rsp, 56
	.seh_stackalloc	56
	.cfi_def_cfa_offset 128
	.seh_endprologue
.LVL182:
	.loc 1 28 7 view .LVU478
	pxor	xmm0, xmm0
	.loc 1 26 12 view .LVU479
	mov	r13, rcx
	mov	r14, rdx
	mov	r12, r8
	.loc 1 28 7 view .LVU480
	movups	XMMWORD PTR 16[rsp], xmm0
	movups	XMMWORD PTR 32[rsp], xmm0
.LVL183:
.LBB48:
	.loc 1 30 18 is_stmt 1 discriminator 1 view .LVU481
	cmp	r8, 7
	jbe	.L171
	lea	r9, -8[r8]
	mov	rax, rcx
	xor	r10d, r10d
	xor	r11d, r11d
	mov	rcx, r9
.LVL184:
	.loc 1 30 18 is_stmt 0 discriminator 1 view .LVU482
	mov	QWORD PTR 8[rsp], r9
	xor	r8d, r8d
.LVL185:
	.loc 1 30 18 discriminator 1 view .LVU483
	xor	ebx, ebx
	shr	rcx, 3
	xor	esi, esi
	xor	edi, edi
	xor	ebp, ebp
	sal	rcx, 5
	lea	r15, 32[r13+rcx]
	xor	ecx, ecx
.LVL186:
	.p2align 4,,10
	.p2align 3
.L165:
.LBB49:
	.loc 1 31 30 is_stmt 1 discriminator 1 view .LVU484
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU485
	mov	r9d, DWORD PTR [rax]
	imul	r9d, DWORD PTR [rdx]
.LBE49:
	.loc 1 30 18 discriminator 1 view .LVU486
	add	rax, 32
	add	rdx, 32
.LBB50:
	.loc 1 31 47 discriminator 3 view .LVU487
	add	ecx, r9d
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU488
.LVL187:
	.loc 1 31 30 discriminator 1 view .LVU489
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU490
	mov	r9d, DWORD PTR -28[rax]
	imul	r9d, DWORD PTR -28[rdx]
	.loc 1 31 47 discriminator 3 view .LVU491
	add	ebp, r9d
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU492
.LVL188:
	.loc 1 31 30 discriminator 1 view .LVU493
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU494
	mov	r9d, DWORD PTR -24[rax]
	imul	r9d, DWORD PTR -24[rdx]
	.loc 1 31 47 discriminator 3 view .LVU495
	add	edi, r9d
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU496
.LVL189:
	.loc 1 31 30 discriminator 1 view .LVU497
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU498
	mov	r9d, DWORD PTR -20[rax]
	imul	r9d, DWORD PTR -20[rdx]
	.loc 1 31 47 discriminator 3 view .LVU499
	add	esi, r9d
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU500
.LVL190:
	.loc 1 31 30 discriminator 1 view .LVU501
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU502
	mov	r9d, DWORD PTR -16[rax]
	imul	r9d, DWORD PTR -16[rdx]
	.loc 1 31 47 discriminator 3 view .LVU503
	add	ebx, r9d
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU504
.LVL191:
	.loc 1 31 30 discriminator 1 view .LVU505
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU506
	mov	r9d, DWORD PTR -12[rax]
	imul	r9d, DWORD PTR -12[rdx]
	.loc 1 31 47 discriminator 3 view .LVU507
	add	r8d, r9d
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU508
.LVL192:
	.loc 1 31 30 discriminator 1 view .LVU509
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU510
	mov	r9d, DWORD PTR -8[rax]
	imul	r9d, DWORD PTR -8[rdx]
	.loc 1 31 47 discriminator 3 view .LVU511
	add	r11d, r9d
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU512
.LVL193:
	.loc 1 31 30 discriminator 1 view .LVU513
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU514
	mov	r9d, DWORD PTR -4[rax]
	imul	r9d, DWORD PTR -4[rdx]
	.loc 1 31 47 discriminator 3 view .LVU515
	add	r10d, r9d
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU516
.LVL194:
	.loc 1 31 30 discriminator 1 view .LVU517
.LBE50:
	.loc 1 30 18 discriminator 1 view .LVU518
	cmp	r15, rax
	jne	.L165
	mov	r9, QWORD PTR 8[rsp]
	mov	DWORD PTR 20[rsp], ebp
	mov	DWORD PTR 24[rsp], edi
	mov	DWORD PTR 28[rsp], esi
	and	r9, -8
	mov	DWORD PTR 32[rsp], ebx
	lea	rdx, 8[r9]
	mov	DWORD PTR 36[rsp], r8d
	mov	DWORD PTR 40[rsp], r11d
	mov	DWORD PTR 44[rsp], r10d
.LVL195:
.L166:
	.loc 1 30 18 is_stmt 0 discriminator 1 view .LVU519
.LBE48:
.LBB51:
	.loc 1 34 26 is_stmt 1 discriminator 1 view .LVU520
	.loc 1 34 5 discriminator 3 view .LVU521
	.loc 1 34 26 discriminator 1 view .LVU522
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU523
	add	ecx, DWORD PTR 20[rsp]
.LVL196:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU524
	.loc 1 34 26 discriminator 1 view .LVU525
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU526
	add	ecx, DWORD PTR 24[rsp]
.LVL197:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU527
	.loc 1 34 26 discriminator 1 view .LVU528
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU529
	add	ecx, DWORD PTR 28[rsp]
.LVL198:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU530
	.loc 1 34 26 discriminator 1 view .LVU531
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU532
	add	ecx, DWORD PTR 32[rsp]
.LVL199:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU533
	.loc 1 34 26 discriminator 1 view .LVU534
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU535
	add	ecx, DWORD PTR 36[rsp]
.LVL200:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU536
	.loc 1 34 26 discriminator 1 view .LVU537
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU538
	add	ecx, DWORD PTR 40[rsp]
.LVL201:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU539
	.loc 1 34 26 discriminator 1 view .LVU540
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU541
	add	ecx, DWORD PTR 44[rsp]
.LVL202:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU542
	.loc 1 34 26 discriminator 1 view .LVU543
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU544
.LBE51:
	.loc 1 35 14 is_stmt 1 discriminator 1 view .LVU545
	cmp	rdx, r12
	jnb	.L161
	.p2align 4,,10
	.p2align 3
.L163:
	.loc 1 35 34 is_stmt 0 discriminator 2 view .LVU546
	mov	eax, DWORD PTR 0[r13+rdx*4]
	imul	eax, DWORD PTR [r14+rdx*4]
	.loc 1 35 5 discriminator 2 view .LVU547
	add	rdx, 1
.LVL203:
	.loc 1 35 26 discriminator 2 view .LVU548
	add	ecx, eax
.LVL204:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU549
	.loc 1 35 14 discriminator 1 view .LVU550
	cmp	r12, rdx
	jne	.L163
.L161:
	.loc 1 37 1 is_stmt 0 view .LVU551
	mov	eax, ecx
	add	rsp, 56
	.cfi_remember_state
	.cfi_def_cfa_offset 72
	pop	rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 64
	pop	rsi
	.cfi_restore 4
	.cfi_def_cfa_offset 56
	pop	rdi
	.cfi_restore 5
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_restore 12
	.cfi_def_cfa_offset 32
.LVL205:
	.loc 1 37 1 view .LVU552
	pop	r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
.LVL206:
	.loc 1 37 1 view .LVU553
	pop	r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
.LVL207:
	.loc 1 37 1 view .LVU554
	pop	r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
	ret
.LVL208:
.L171:
	.cfi_restore_state
.LBB52:
	.loc 1 30 18 discriminator 1 view .LVU555
	xor	ecx, ecx
.LVL209:
	.loc 1 30 18 discriminator 1 view .LVU556
.LBE52:
	.loc 1 29 12 view .LVU557
	xor	edx, edx
.LVL210:
	.loc 1 29 12 view .LVU558
	jmp	.L166
	.cfi_endproc
.LFE51:
	.seh_endproc
	.section	.text$_Z8dot_simdIiET_PKS0_S2_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z8dot_simdIiET_PKS0_S2_y
	.def	_Z8dot_simdIiET_PKS0_S2_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8dot_simdIiET_PKS0_S2_y
_Z8dot_simdIiET_PKS0_S2_y:
.LVL211:
.LFB52:
	.loc 1 45 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 45 12 is_stmt 0 view .LVU560
	.seh_endprologue
.LVL212:
.LBB53:
	.loc 1 48 26 is_stmt 1 discriminator 1 view .LVU561
	test	r8, r8
	je	.L175
	.loc 1 48 17 is_stmt 0 view .LVU562
	xor	eax, eax
.LBE53:
	.loc 1 46 7 view .LVU563
	xor	r10d, r10d
.LVL213:
	.p2align 4,,10
	.p2align 3
.L174:
.LBB54:
	.loc 1 48 46 discriminator 3 view .LVU564
	mov	r9d, DWORD PTR [rcx+rax*4]
	imul	r9d, DWORD PTR [rdx+rax*4]
	.loc 1 48 5 discriminator 3 view .LVU565
	add	rax, 1
.LVL214:
	.loc 1 48 38 discriminator 3 view .LVU566
	add	r10d, r9d
.LVL215:
	.loc 1 48 5 is_stmt 1 discriminator 3 view .LVU567
	.loc 1 48 26 discriminator 1 view .LVU568
	cmp	r8, rax
	jne	.L174
.LBE54:
	.loc 1 50 1 is_stmt 0 view .LVU569
	mov	eax, r10d
.LVL216:
	.loc 1 50 1 view .LVU570
	ret
.LVL217:
	.p2align 4,,10
	.p2align 3
.L175:
	.loc 1 46 7 view .LVU571
	xor	r10d, r10d
	.loc 1 50 1 view .LVU572
	mov	eax, r10d
	ret
	.cfi_endproc
.LFE52:
	.seh_endproc
	.section	.text$_Z12dot_simd_accIiET_PKS0_S2_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z12dot_simd_accIiET_PKS0_S2_y
	.def	_Z12dot_simd_accIiET_PKS0_S2_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12dot_simd_accIiET_PKS0_S2_y
_Z12dot_simd_accIiET_PKS0_S2_y:
.LVL218:
.LFB53:
	.loc 1 58 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 58 12 is_stmt 0 view .LVU574
	push	rdi
	.seh_pushreg	rdi
	.cfi_def_cfa_offset 16
	.cfi_offset 5, -16
	push	rsi
	.seh_pushreg	rsi
	.cfi_def_cfa_offset 24
	.cfi_offset 4, -24
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	add	rsp, -128
	.seh_stackalloc	128
	.cfi_def_cfa_offset 160
	.seh_endprologue
.LVL219:
	.loc 1 60 7 view .LVU575
	xor	eax, eax
	mov	r9, rsp
	.loc 1 58 12 view .LVU576
	mov	r11, rcx
	.loc 1 60 7 view .LVU577
	mov	ecx, 16
.LVL220:
	.loc 1 58 12 view .LVU578
	mov	rbx, rdx
	.loc 1 60 7 view .LVU579
	mov	rdi, r9
	rep stosq
.LVL221:
.LBB55:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU580
	cmp	r8, 31
	jbe	.L186
	mov	r10d, 128
	mov	esi, 32
.LVL222:
	.p2align 4,,10
	.p2align 3
.L179:
.LBB56:
	.loc 1 64 30 discriminator 1 view .LVU581
	lea	rax, -128[r10]
	jmp	.L181
.LVL223:
	.p2align 4,,10
	.p2align 3
.L180:
	.loc 1 64 43 is_stmt 0 discriminator 3 view .LVU582
	mov	ecx, DWORD PTR [r9+rax]
.L181:
	.loc 1 64 59 discriminator 3 view .LVU583
	mov	edx, DWORD PTR [r11+rax]
	imul	edx, DWORD PTR [rbx+rax]
	.loc 1 64 47 discriminator 3 view .LVU584
	add	edx, ecx
	mov	DWORD PTR [r9+rax], edx
	.loc 1 64 9 is_stmt 1 discriminator 3 view .LVU585
	.loc 1 64 30 discriminator 1 view .LVU586
	add	rax, 4
	cmp	r10, rax
	jne	.L180
.LVL224:
	.loc 1 64 30 is_stmt 0 discriminator 1 view .LVU587
.LBE56:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU588
	lea	rax, 32[rsi]
.LBE55:
.LBB57:
	.loc 1 67 44 is_stmt 0 discriminator 3 view .LVU589
	mov	ecx, DWORD PTR [rsp]
.LBE57:
.LBB58:
	.loc 1 62 18 discriminator 1 view .LVU590
	add	r9, -128
	sub	r10, -128
	cmp	r8, rax
	jb	.L178
	mov	rsi, rax
.LVL225:
	.loc 1 62 18 discriminator 1 view .LVU591
	jmp	.L179
.LVL226:
.L186:
	.loc 1 62 18 discriminator 1 view .LVU592
	xor	ecx, ecx
.LBE58:
	.loc 1 61 12 view .LVU593
	xor	esi, esi
.LVL227:
.L178:
.LBB59:
	.loc 1 67 26 is_stmt 1 discriminator 1 view .LVU594
	lea	rax, 4[rsp]
	lea	r9, 128[rsp]
.LBE59:
	.loc 1 66 7 is_stmt 0 view .LVU595
	xor	edx, edx
	jmp	.L183
.LVL228:
	.p2align 4,,10
	.p2align 3
.L188:
.LBB60:
	.loc 1 67 44 discriminator 3 view .LVU596
	mov	ecx, DWORD PTR [rax]
	add	rax, 4
.LVL229:
.L183:
	.loc 1 67 38 discriminator 3 view .LVU597
	add	edx, ecx
.LVL230:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU598
	.loc 1 67 26 discriminator 1 view .LVU599
	cmp	r9, rax
	jne	.L188
.LVL231:
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU600
.LBE60:
	.loc 1 68 14 is_stmt 1 discriminator 1 view .LVU601
	cmp	rsi, r8
	jnb	.L177
	.p2align 4,,10
	.p2align 3
.L185:
	.loc 1 68 34 is_stmt 0 discriminator 2 view .LVU602
	mov	eax, DWORD PTR [r11+rsi*4]
	imul	eax, DWORD PTR [rbx+rsi*4]
	.loc 1 68 5 discriminator 2 view .LVU603
	add	rsi, 1
.LVL232:
	.loc 1 68 26 discriminator 2 view .LVU604
	add	edx, eax
.LVL233:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU605
	.loc 1 68 14 discriminator 1 view .LVU606
	cmp	r8, rsi
	jne	.L185
.L177:
	.loc 1 70 1 is_stmt 0 view .LVU607
	mov	eax, edx
	sub	rsp, -128
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 24
.LVL234:
	.loc 1 70 1 view .LVU608
	pop	rsi
	.cfi_restore 4
	.cfi_def_cfa_offset 16
.LVL235:
	.loc 1 70 1 view .LVU609
	pop	rdi
	.cfi_restore 5
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE53:
	.seh_endproc
	.section	.text$_Z5saxpyIiEvT_PKS0_PS0_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z5saxpyIiEvT_PKS0_PS0_y
	.def	_Z5saxpyIiEvT_PKS0_PS0_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z5saxpyIiEvT_PKS0_PS0_y
_Z5saxpyIiEvT_PKS0_PS0_y:
.LVL236:
.LFB54:
	.loc 1 76 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 76 15 is_stmt 0 view .LVU611
	.seh_endprologue
.LVL237:
.LBB61:
	.loc 1 77 26 is_stmt 1 discriminator 1 view .LVU612
	test	r9, r9
	je	.L189
	.loc 1 77 17 is_stmt 0 view .LVU613
	xor	eax, eax
.LVL238:
	.p2align 4,,10
	.p2align 3
.L191:
	.loc 1 77 45 discriminator 3 view .LVU614
	mov	r10d, DWORD PTR [rdx+rax*4]
	imul	r10d, ecx
	.loc 1 77 52 discriminator 3 view .LVU615
	add	DWORD PTR [r8+rax*4], r10d
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU616
	add	rax, 1
.LVL239:
	.loc 1 77 26 discriminator 1 view .LVU617
	cmp	r9, rax
	jne	.L191
.LVL240:
.L189:
	.loc 1 77 26 is_stmt 0 discriminator 1 view .LVU618
.LBE61:
	.loc 1 78 1 view .LVU619
	ret
	.cfi_endproc
.LFE54:
	.seh_endproc
	.section	.text$_Z12saxpy_strideIiEvT_PKS0_PS0_yy,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z12saxpy_strideIiEvT_PKS0_PS0_yy
	.def	_Z12saxpy_strideIiEvT_PKS0_PS0_yy;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12saxpy_strideIiEvT_PKS0_PS0_yy
_Z12saxpy_strideIiEvT_PKS0_PS0_yy:
.LVL241:
.LFB55:
	.loc 1 81 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 81 15 is_stmt 0 view .LVU621
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.seh_endprologue
.LVL242:
.LBB62:
	.loc 1 82 26 is_stmt 1 discriminator 1 view .LVU622
.LBE62:
	.loc 1 81 15 is_stmt 0 view .LVU623
	mov	r10d, ecx
.LBB63:
	.loc 1 82 26 discriminator 1 view .LVU624
	test	r9, r9
	je	.L196
	.loc 1 82 17 view .LVU625
	xor	eax, eax
	cmp	QWORD PTR 48[rsp], 1
	jne	.L209
.LVL243:
	.p2align 4,,10
	.p2align 3
.L198:
	.loc 1 82 49 discriminator 3 view .LVU626
	mov	ecx, DWORD PTR [rdx+rax*4]
	imul	ecx, r10d
	.loc 1 82 60 discriminator 3 view .LVU627
	add	DWORD PTR [r8+rax*4], ecx
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU628
	add	rax, 1
.LVL244:
	.loc 1 82 26 discriminator 1 view .LVU629
	cmp	r9, rax
	jne	.L198
.LVL245:
.L196:
	.loc 1 82 26 is_stmt 0 discriminator 1 view .LVU630
.LBE63:
	.loc 1 83 1 view .LVU631
	pop	rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
.LVL246:
	.p2align 4,,10
	.p2align 3
.L209:
	.cfi_restore_state
	.loc 1 83 1 view .LVU632
	mov	rax, QWORD PTR 48[rsp]
.LBB64:
	.loc 1 82 17 view .LVU633
	xor	ecx, ecx
.LVL247:
	.loc 1 82 17 view .LVU634
	lea	r11, 0[0+rax*4]
	.loc 1 82 26 discriminator 1 view .LVU635
	xor	eax, eax
.LVL248:
	.p2align 4,,10
	.p2align 3
.L199:
	.loc 1 82 49 discriminator 3 view .LVU636
	mov	ebx, DWORD PTR [rdx+rax]
	.loc 1 82 5 discriminator 3 view .LVU637
	add	rcx, 1
.LVL249:
	.loc 1 82 49 discriminator 3 view .LVU638
	imul	ebx, r10d
	.loc 1 82 60 discriminator 3 view .LVU639
	add	DWORD PTR [r8+rax], ebx
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU640
.LVL250:
	.loc 1 82 26 discriminator 1 view .LVU641
	add	rax, r11
	cmp	r9, rcx
	jne	.L199
.LBE64:
	.loc 1 83 1 is_stmt 0 view .LVU642
	pop	rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE55:
	.seh_endproc
	.section	.text$_Z12saxpy_gatherIiEvT_PKS0_PS0_PKiy,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z12saxpy_gatherIiEvT_PKS0_PS0_PKiy
	.def	_Z12saxpy_gatherIiEvT_PKS0_PS0_PKiy;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12saxpy_gatherIiEvT_PKS0_PS0_PKiy
_Z12saxpy_gatherIiEvT_PKS0_PS0_PKiy:
.LVL251:
.LFB56:
	.loc 1 86 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 86 15 is_stmt 0 view .LVU644
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.seh_endprologue
.LVL252:
.LBB65:
	.loc 1 88 26 is_stmt 1 discriminator 1 view .LVU645
.LBE65:
	.loc 1 86 15 is_stmt 0 view .LVU646
	mov	r11, QWORD PTR 48[rsp]
.LBB66:
	.loc 1 88 26 discriminator 1 view .LVU647
	test	r11, r11
	je	.L210
	.loc 1 88 17 view .LVU648
	xor	eax, eax
.LVL253:
	.p2align 4,,10
	.p2align 3
.L212:
	.loc 1 88 54 discriminator 3 view .LVU649
	movsx	r10, DWORD PTR [r9+rax*4]
	.loc 1 88 45 discriminator 3 view .LVU650
	mov	ebx, DWORD PTR [rdx+r10*4]
	imul	ebx, ecx
	.loc 1 88 57 discriminator 3 view .LVU651
	add	DWORD PTR [r8+rax*4], ebx
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU652
	add	rax, 1
.LVL254:
	.loc 1 88 26 discriminator 1 view .LVU653
	cmp	r11, rax
	jne	.L212
.LVL255:
.L210:
	.loc 1 88 26 is_stmt 0 discriminator 1 view .LVU654
.LBE66:
	.loc 1 89 1 view .LVU655
	pop	rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE56:
	.seh_endproc
	.section	.text$_Z4vmulIiEvPKT_S2_PS0_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z4vmulIiEvPKT_S2_PS0_y
	.def	_Z4vmulIiEvPKT_S2_PS0_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z4vmulIiEvPKT_S2_PS0_y
_Z4vmulIiEvPKT_S2_PS0_y:
.LVL256:
.LFB57:
	.loc 1 95 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 95 15 is_stmt 0 view .LVU657
	.seh_endprologue
.LVL257:
.LBB67:
	.loc 1 96 26 is_stmt 1 discriminator 1 view .LVU658
	test	r9, r9
	je	.L217
	.loc 1 96 17 is_stmt 0 view .LVU659
	xor	eax, eax
.LVL258:
	.p2align 4,,10
	.p2align 3
.L219:
	.loc 1 96 48 discriminator 3 view .LVU660
	mov	r10d, DWORD PTR [rcx+rax*4]
	imul	r10d, DWORD PTR [rdx+rax*4]
	.loc 1 96 41 discriminator 3 view .LVU661
	mov	DWORD PTR [r8+rax*4], r10d
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU662
	add	rax, 1
.LVL259:
	.loc 1 96 26 discriminator 1 view .LVU663
	cmp	r9, rax
	jne	.L219
.LVL260:
.L217:
	.loc 1 96 26 is_stmt 0 discriminator 1 view .LVU664
.LBE67:
	.loc 1 97 1 view .LVU665
	ret
	.cfi_endproc
.LFE57:
	.seh_endproc
	.section	.text$_Z7dot_refIiEePKT_S2_y,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z7dot_refIiEePKT_S2_y
	.def	_Z7dot_refIiEePKT_S2_y;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z7dot_refIiEePKT_S2_y
_Z7dot_refIiEePKT_S2_y:
.LVL261:
.LFB58:
	.loc 1 147 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 147 13 is_stmt 0 view .LVU667
	.seh_endprologue
	.loc 1 148 17 view .LVU668
	fldz
	.loc 1 147 13 view .LVU669
	mov	rax, rcx
	.loc 1 148 17 view .LVU670
	fstp	TBYTE PTR [rcx]
	fld	TBYTE PTR [rcx]
.LVL262:
.LBB68:
	.loc 1 149 26 is_stmt 1 discriminator 1 view .LVU671
	test	r9, r9
	je	.L231
	.loc 1 149 17 is_stmt 0 view .LVU672
	xor	r10d, r10d
.LVL263:
	.p2align 4,,10
	.p2align 3
.L226:
	.loc 1 149 41 discriminator 3 view .LVU673
	fild	DWORD PTR [rdx+r10*4]
	.loc 1 149 61 discriminator 3 view .LVU674
	fild	DWORD PTR [r8+r10*4]
	.loc 1 149 5 discriminator 3 view .LVU675
	add	r10, 1
.LVL264:
	.loc 1 149 59 discriminator 3 view .LVU676
	fmulp	st(1), st
	.loc 1 149 38 discriminator 3 view .LVU677
	faddp	st(1), st
	.loc 1 149 5 is_stmt 1 discriminator 3 view .LVU678
.LVL265:
	.loc 1 149 26 discriminator 1 view .LVU679
	cmp	r9, r10
	jne	.L226
	fstp	TBYTE PTR [rax]
.LBE68:
	.loc 1 150 12 is_stmt 0 view .LVU680
	jmp	.L224
.LVL266:
	.p2align 4,,10
	.p2align 3
.L231:
	.loc 1 150 12 view .LVU681
	fstp	st(0)
.LVL267:
.L224:
	.loc 1 151 1 view .LVU682
	ret
	.cfi_endproc
.LFE58:
	.seh_endproc
	.section	.text$_Z14saxpy_ref_elemIiEeT_S0_S0_,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z14saxpy_ref_elemIiEeT_S0_S0_
	.def	_Z14saxpy_ref_elemIiEeT_S0_S0_;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z14saxpy_ref_elemIiEeT_S0_S0_
_Z14saxpy_ref_elemIiEeT_S0_S0_:
.LVL268:
.LFB59:
	.loc 1 154 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 154 13 is_stmt 0 view .LVU684
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
	.loc 1 154 13 view .LVU685
	mov	DWORD PTR 4[rsp], r8d
	mov	rax, rcx
	.loc 1 154 52 view .LVU686
	mov	DWORD PTR 12[rsp], edx
	fild	DWORD PTR 12[rsp]
	.loc 1 154 13 view .LVU687
	mov	DWORD PTR 8[rsp], r9d
	.loc 1 154 69 view .LVU688
	fild	DWORD PTR 4[rsp]
	.loc 1 154 67 view .LVU689
	fmulp	st(1), st
	.loc 1 154 86 view .LVU690
	fild	DWORD PTR 8[rsp]
	.loc 1 154 84 view .LVU691
	faddp	st(1), st
	.loc 1 154 99 view .LVU692
	fstp	TBYTE PTR [rcx]
	.loc 1 154 102 view .LVU693
	add	rsp, 24
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE59:
	.seh_endproc
	.section	.text$_Z13vmul_ref_elemIiEeT_S0_,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z13vmul_ref_elemIiEeT_S0_
	.def	_Z13vmul_ref_elemIiEeT_S0_;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z13vmul_ref_elemIiEeT_S0_
_Z13vmul_ref_elemIiEeT_S0_:
.LVL269:
.LFB60:
	.loc 1 157 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 157 13 is_stmt 0 view .LVU695
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
	.loc 1 157 13 view .LVU696
	mov	DWORD PTR 8[rsp], r8d
	mov	rax, rcx
	.loc 1 157 46 view .LVU697
	mov	DWORD PTR 12[rsp], edx
	fild	DWORD PTR 12[rsp]
	.loc 1 157 63 view .LVU698
	fild	DWORD PTR 8[rsp]
	.loc 1 157 61 view .LVU699
	fmulp	st(1), st
	.loc 1 157 76 view .LVU700
	fstp	TBYTE PTR [rcx]
	.loc 1 157 79 view .LVU701
	add	rsp, 24
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE60:
	.seh_endproc
	.section	.text$_Z10peak_flopsIfET_yS0_S0_Pd,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z10peak_flopsIfET_yS0_S0_Pd
	.def	_Z10peak_flopsIfET_yS0_S0_Pd;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z10peak_flopsIfET_yS0_S0_Pd
_Z10peak_flopsIfET_yS0_S0_Pd:
.LVL270:
.LFB61:
	.loc 1 115 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 115 12 is_stmt 0 view .LVU703
	sub	rsp, 184
	.seh_stackalloc	184
	.cfi_def_cfa_offset 192
	movups	XMMWORD PTR 48[rsp], xmm6
	.seh_savexmm	xmm6, 48
	movups	XMMWORD PTR 64[rsp], xmm7
	.seh_savexmm	xmm7, 64
	movups	XMMWORD PTR 80[rsp], xmm8
	.seh_savexmm	xmm8, 80
	movups	XMMWORD PTR 96[rsp], xmm9
	.seh_savexmm	xmm9, 96
	movups	XMMWORD PTR 112[rsp], xmm10
	.seh_savexmm	xmm10, 112
	movups	XMMWORD PTR 128[rsp], xmm11
	.seh_savexmm	xmm11, 128
	movups	XMMWORD PTR 144[rsp], xmm12
	.seh_savexmm	xmm12, 144
	movups	XMMWORD PTR 160[rsp], xmm13
	.seh_savexmm	xmm13, 160
	.cfi_offset 23, -144
	.cfi_offset 24, -128
	.cfi_offset 25, -112
	.cfi_offset 26, -96
	.cfi_offset 27, -80
	.cfi_offset 28, -64
	.cfi_offset 29, -48
	.cfi_offset 30, -32
	.seh_endprologue
.LVL271:
.LBB69:
	.loc 1 125 23 is_stmt 1 discriminator 1 view .LVU704
	.loc 1 125 5 discriminator 3 view .LVU705
	.loc 1 125 23 discriminator 1 view .LVU706
	.loc 1 125 5 discriminator 3 view .LVU707
	.loc 1 125 23 discriminator 1 view .LVU708
	.loc 1 125 5 discriminator 3 view .LVU709
	.loc 1 125 23 discriminator 1 view .LVU710
	.loc 1 125 5 discriminator 3 view .LVU711
	.loc 1 125 23 discriminator 1 view .LVU712
	.loc 1 125 5 discriminator 3 view .LVU713
	.loc 1 125 23 discriminator 1 view .LVU714
	.loc 1 125 5 discriminator 3 view .LVU715
	.loc 1 125 23 discriminator 1 view .LVU716
	.loc 1 125 5 discriminator 3 view .LVU717
	.loc 1 125 23 discriminator 1 view .LVU718
	.loc 1 125 5 discriminator 3 view .LVU719
	.loc 1 125 23 discriminator 1 view .LVU720
	.loc 1 125 5 discriminator 3 view .LVU721
	.loc 1 125 23 discriminator 1 view .LVU722
	.loc 1 125 5 discriminator 3 view .LVU723
	.loc 1 125 23 discriminator 1 view .LVU724
	.loc 1 125 5 discriminator 3 view .LVU725
	.loc 1 125 23 discriminator 1 view .LVU726
	.loc 1 125 23 is_stmt 0 discriminator 1 view .LVU727
.LBE69:
	.loc 1 126 13 view .LVU728
	pxor	xmm0, xmm0
	.loc 1 115 12 view .LVU729
	mov	rax, rcx
	.loc 1 126 13 view .LVU730
	addss	xmm1, xmm0
.LVL272:
	.loc 1 126 27 view .LVU731
	addss	xmm2, xmm0
.LVL273:
.LBB70:
	.loc 1 125 40 discriminator 3 view .LVU732
	movabs	rcx, 4575765309620765065
.LVL274:
	.loc 1 125 40 discriminator 3 view .LVU733
	mov	QWORD PTR 8[rsp], rcx
	movabs	rcx, 4575837366287106834
	mov	QWORD PTR 16[rsp], rcx
	movabs	rcx, 4575909422953448604
	mov	QWORD PTR 24[rsp], rcx
	movabs	rcx, 4575981479619790373
	mov	QWORD PTR 32[rsp], rcx
	movabs	rcx, 4576053540581099438
	mov	QWORD PTR 40[rsp], rcx
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU734
.LVL275:
	.loc 1 125 23 discriminator 1 view .LVU735
	.loc 1 125 23 is_stmt 0 discriminator 1 view .LVU736
.LBE70:
.LBB71:
	.loc 1 127 28 is_stmt 1 discriminator 1 view .LVU737
	test	rax, rax
	je	.L237
	movss	xmm4, DWORD PTR .LC4[rip]
	movss	xmm5, DWORD PTR .LC5[rip]
	.loc 1 127 17 is_stmt 0 view .LVU738
	xor	edx, edx
	.loc 1 127 28 discriminator 1 view .LVU739
	movss	xmm6, DWORD PTR .LC6[rip]
	movss	xmm7, DWORD PTR .LC7[rip]
	movss	xmm8, DWORD PTR .LC8[rip]
	movss	xmm9, DWORD PTR .LC9[rip]
	movss	xmm10, DWORD PTR .LC10[rip]
	movss	xmm11, DWORD PTR .LC11[rip]
	movss	xmm3, DWORD PTR .LC14[rip]
	movss	xmm0, DWORD PTR .LC15[rip]
	movss	xmm12, DWORD PTR .LC12[rip]
	movss	xmm13, DWORD PTR .LC13[rip]
.LVL276:
	.p2align 4,,10
	.p2align 3
.L236:
.LBB72:
	.loc 1 129 23 is_stmt 1 discriminator 1 view .LVU740
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU741
	mulss	xmm0, xmm1
.LBE72:
	.loc 1 127 5 discriminator 2 view .LVU742
	add	rdx, 1
.LVL277:
.LBB73:
	.loc 1 129 53 discriminator 3 view .LVU743
	mulss	xmm3, xmm1
	mulss	xmm13, xmm1
	mulss	xmm12, xmm1
	mulss	xmm11, xmm1
	mulss	xmm10, xmm1
	.loc 1 129 58 discriminator 3 view .LVU744
	addss	xmm0, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU745
.LVL278:
	.loc 1 129 23 discriminator 1 view .LVU746
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU747
	mulss	xmm9, xmm1
	.loc 1 129 58 discriminator 3 view .LVU748
	addss	xmm3, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU749
.LVL279:
	.loc 1 129 23 discriminator 1 view .LVU750
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU751
	mulss	xmm8, xmm1
	.loc 1 129 58 discriminator 3 view .LVU752
	addss	xmm13, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU753
.LVL280:
	.loc 1 129 23 discriminator 1 view .LVU754
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU755
	mulss	xmm7, xmm1
	.loc 1 129 58 discriminator 3 view .LVU756
	addss	xmm12, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU757
.LVL281:
	.loc 1 129 23 discriminator 1 view .LVU758
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU759
	mulss	xmm6, xmm1
	.loc 1 129 58 discriminator 3 view .LVU760
	addss	xmm11, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU761
.LVL282:
	.loc 1 129 23 discriminator 1 view .LVU762
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU763
	mulss	xmm5, xmm1
	.loc 1 129 58 discriminator 3 view .LVU764
	addss	xmm10, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU765
.LVL283:
	.loc 1 129 23 discriminator 1 view .LVU766
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU767
	mulss	xmm4, xmm1
	.loc 1 129 58 discriminator 3 view .LVU768
	addss	xmm9, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU769
.LVL284:
	.loc 1 129 23 discriminator 1 view .LVU770
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU771
	addss	xmm8, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU772
.LVL285:
	.loc 1 129 23 discriminator 1 view .LVU773
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU774
	addss	xmm7, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU775
.LVL286:
	.loc 1 129 23 discriminator 1 view .LVU776
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU777
	addss	xmm6, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU778
.LVL287:
	.loc 1 129 23 discriminator 1 view .LVU779
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU780
	addss	xmm5, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU781
.LVL288:
	.loc 1 129 23 discriminator 1 view .LVU782
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU783
	addss	xmm4, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU784
.LVL289:
	.loc 1 129 23 discriminator 1 view .LVU785
.LBE73:
	.loc 1 127 5 discriminator 2 view .LVU786
	.loc 1 127 28 discriminator 1 view .LVU787
	cmp	rax, rdx
	jne	.L236
	movss	DWORD PTR 8[rsp], xmm13
	movss	DWORD PTR 12[rsp], xmm12
	movss	DWORD PTR 16[rsp], xmm11
	movss	DWORD PTR 20[rsp], xmm10
	movss	DWORD PTR 24[rsp], xmm9
	movss	DWORD PTR 28[rsp], xmm8
	movss	DWORD PTR 32[rsp], xmm7
	movss	DWORD PTR 36[rsp], xmm6
	movss	DWORD PTR 40[rsp], xmm5
	movss	DWORD PTR 44[rsp], xmm4
.LVL290:
.L235:
	.loc 1 127 28 is_stmt 0 discriminator 1 view .LVU788
.LBE71:
.LBB74:
	.loc 1 132 23 is_stmt 1 discriminator 1 view .LVU789
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU790
	addss	xmm0, xmm3
.LVL291:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU791
	.loc 1 132 23 discriminator 1 view .LVU792
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU793
	addss	xmm0, DWORD PTR 8[rsp]
.LVL292:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU794
	.loc 1 132 23 discriminator 1 view .LVU795
	.loc 1 132 23 is_stmt 0 discriminator 1 view .LVU796
.LBE74:
	.loc 1 141 1 view .LVU797
	movups	xmm6, XMMWORD PTR 48[rsp]
.LBB75:
	.loc 1 132 35 discriminator 3 view .LVU798
	addss	xmm0, DWORD PTR 12[rsp]
.LVL293:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU799
	.loc 1 132 23 discriminator 1 view .LVU800
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU801
	addss	xmm0, DWORD PTR 16[rsp]
.LVL294:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU802
	.loc 1 132 23 discriminator 1 view .LVU803
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU804
	addss	xmm0, DWORD PTR 20[rsp]
.LVL295:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU805
	.loc 1 132 23 discriminator 1 view .LVU806
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU807
	addss	xmm0, DWORD PTR 24[rsp]
.LVL296:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU808
	.loc 1 132 23 discriminator 1 view .LVU809
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU810
	addss	xmm0, DWORD PTR 28[rsp]
.LVL297:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU811
	.loc 1 132 23 discriminator 1 view .LVU812
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU813
	addss	xmm0, DWORD PTR 32[rsp]
.LVL298:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU814
	.loc 1 132 23 discriminator 1 view .LVU815
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU816
	addss	xmm0, DWORD PTR 36[rsp]
.LVL299:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU817
	.loc 1 132 23 discriminator 1 view .LVU818
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU819
	addss	xmm0, DWORD PTR 40[rsp]
.LVL300:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU820
	.loc 1 132 23 discriminator 1 view .LVU821
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU822
	addss	xmm0, DWORD PTR 44[rsp]
.LVL301:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU823
	.loc 1 132 23 discriminator 1 view .LVU824
.LBE75:
	.loc 1 133 21 is_stmt 0 view .LVU825
	mov	rax, QWORD PTR .LC16[rip]
.LVL302:
	.loc 1 141 1 view .LVU826
	movups	xmm7, XMMWORD PTR 64[rsp]
	movups	xmm8, XMMWORD PTR 80[rsp]
	movups	xmm9, XMMWORD PTR 96[rsp]
	movups	xmm10, XMMWORD PTR 112[rsp]
	.loc 1 133 21 view .LVU827
	mov	QWORD PTR [r9], rax
	.loc 1 141 1 view .LVU828
	movups	xmm11, XMMWORD PTR 128[rsp]
	movups	xmm12, XMMWORD PTR 144[rsp]
	movups	xmm13, XMMWORD PTR 160[rsp]
	add	rsp, 184
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 28
	.cfi_restore 27
	.cfi_restore 26
	.cfi_restore 25
	.cfi_restore 24
	.cfi_restore 23
	.cfi_def_cfa_offset 8
	ret
.LVL303:
.L237:
	.cfi_restore_state
.LBB76:
	.loc 1 127 28 discriminator 1 view .LVU829
	movss	xmm3, DWORD PTR .LC14[rip]
	movss	xmm0, DWORD PTR .LC15[rip]
	jmp	.L235
.LBE76:
	.cfi_endproc
.LFE61:
	.seh_endproc
	.section	.text$_Z10peak_flopsIdET_yS0_S0_Pd,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z10peak_flopsIdET_yS0_S0_Pd
	.def	_Z10peak_flopsIdET_yS0_S0_Pd;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z10peak_flopsIdET_yS0_S0_Pd
_Z10peak_flopsIdET_yS0_S0_Pd:
.LVL304:
.LFB62:
	.loc 1 115 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 115 12 is_stmt 0 view .LVU831
	sub	rsp, 232
	.seh_stackalloc	232
	.cfi_def_cfa_offset 240
	movups	XMMWORD PTR 96[rsp], xmm6
	.seh_savexmm	xmm6, 96
	movups	XMMWORD PTR 112[rsp], xmm7
	.seh_savexmm	xmm7, 112
	movups	XMMWORD PTR 128[rsp], xmm8
	.seh_savexmm	xmm8, 128
	movups	XMMWORD PTR 144[rsp], xmm9
	.seh_savexmm	xmm9, 144
	movups	XMMWORD PTR 160[rsp], xmm10
	.seh_savexmm	xmm10, 160
	movups	XMMWORD PTR 176[rsp], xmm11
	.seh_savexmm	xmm11, 176
	movups	XMMWORD PTR 192[rsp], xmm12
	.seh_savexmm	xmm12, 192
	movups	XMMWORD PTR 208[rsp], xmm13
	.seh_savexmm	xmm13, 208
	.cfi_offset 23, -144
	.cfi_offset 24, -128
	.cfi_offset 25, -112
	.cfi_offset 26, -96
	.cfi_offset 27, -80
	.cfi_offset 28, -64
	.cfi_offset 29, -48
	.cfi_offset 30, -32
	.seh_endprologue
.LVL305:
.LBB77:
	.loc 1 125 23 is_stmt 1 discriminator 1 view .LVU832
	.loc 1 125 5 discriminator 3 view .LVU833
	.loc 1 125 23 discriminator 1 view .LVU834
	.loc 1 125 5 discriminator 3 view .LVU835
	.loc 1 125 23 discriminator 1 view .LVU836
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU837
	movsd	xmm7, QWORD PTR .LC26[rip]
.LBE77:
	.loc 1 126 13 view .LVU838
	pxor	xmm0, xmm0
.LBB78:
	.loc 1 125 40 discriminator 3 view .LVU839
	movsd	xmm6, QWORD PTR .LC25[rip]
	movsd	xmm5, QWORD PTR .LC24[rip]
	movsd	xmm4, QWORD PTR .LC23[rip]
	movsd	xmm13, QWORD PTR .LC22[rip]
	movsd	xmm12, QWORD PTR .LC21[rip]
	movsd	xmm11, QWORD PTR .LC20[rip]
	movsd	xmm3, QWORD PTR .LC17[rip]
	movsd	xmm10, QWORD PTR .LC19[rip]
	movsd	xmm8, QWORD PTR .LC18[rip]
.LBE78:
.LBB79:
	.loc 1 127 28 discriminator 1 view .LVU840
	movsd	xmm9, QWORD PTR .LC27[rip]
.LBE79:
	.loc 1 126 13 view .LVU841
	addsd	xmm1, xmm0
.LVL306:
	.loc 1 126 27 view .LVU842
	addsd	xmm2, xmm0
.LVL307:
	.loc 1 115 12 view .LVU843
	mov	rax, rcx
.LBB82:
	.loc 1 127 28 discriminator 1 view .LVU844
	movsd	xmm0, QWORD PTR .LC28[rip]
.LBE82:
.LBB83:
	.loc 1 125 40 discriminator 3 view .LVU845
	movsd	QWORD PTR 16[rsp], xmm7
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU846
.LVL308:
	.loc 1 125 23 discriminator 1 view .LVU847
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU848
	movsd	QWORD PTR 24[rsp], xmm6
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU849
.LVL309:
	.loc 1 125 23 discriminator 1 view .LVU850
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU851
	movsd	QWORD PTR 32[rsp], xmm5
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU852
.LVL310:
	.loc 1 125 23 discriminator 1 view .LVU853
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU854
	movsd	QWORD PTR 40[rsp], xmm4
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU855
.LVL311:
	.loc 1 125 23 discriminator 1 view .LVU856
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU857
	movsd	QWORD PTR 48[rsp], xmm13
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU858
.LVL312:
	.loc 1 125 23 discriminator 1 view .LVU859
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU860
	movsd	QWORD PTR 56[rsp], xmm12
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU861
.LVL313:
	.loc 1 125 23 discriminator 1 view .LVU862
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU863
	movsd	QWORD PTR 64[rsp], xmm11
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU864
.LVL314:
	.loc 1 125 23 discriminator 1 view .LVU865
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU866
	movsd	QWORD PTR 72[rsp], xmm10
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU867
.LVL315:
	.loc 1 125 23 discriminator 1 view .LVU868
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU869
	movsd	QWORD PTR 80[rsp], xmm8
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU870
.LVL316:
	.loc 1 125 23 discriminator 1 view .LVU871
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU872
	movsd	QWORD PTR 88[rsp], xmm3
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU873
.LVL317:
	.loc 1 125 23 discriminator 1 view .LVU874
	.loc 1 125 23 is_stmt 0 discriminator 1 view .LVU875
.LBE83:
.LBB84:
	.loc 1 127 28 is_stmt 1 discriminator 1 view .LVU876
	test	rcx, rcx
	je	.L240
	.loc 1 127 17 is_stmt 0 view .LVU877
	xor	edx, edx
.LVL318:
	.p2align 4,,10
	.p2align 3
.L241:
.LBB80:
	.loc 1 129 23 is_stmt 1 discriminator 1 view .LVU878
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU879
	mulsd	xmm0, xmm1
.LBE80:
	.loc 1 127 5 discriminator 2 view .LVU880
	add	rdx, 1
.LVL319:
.LBB81:
	.loc 1 129 53 discriminator 3 view .LVU881
	mulsd	xmm9, xmm1
	mulsd	xmm7, xmm1
	mulsd	xmm6, xmm1
	mulsd	xmm5, xmm1
	mulsd	xmm4, xmm1
	.loc 1 129 58 discriminator 3 view .LVU882
	addsd	xmm0, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU883
.LVL320:
	.loc 1 129 23 discriminator 1 view .LVU884
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU885
	mulsd	xmm13, xmm1
	.loc 1 129 58 discriminator 3 view .LVU886
	addsd	xmm9, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU887
.LVL321:
	.loc 1 129 23 discriminator 1 view .LVU888
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU889
	mulsd	xmm12, xmm1
	.loc 1 129 58 discriminator 3 view .LVU890
	addsd	xmm7, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU891
.LVL322:
	.loc 1 129 23 discriminator 1 view .LVU892
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU893
	mulsd	xmm11, xmm1
	.loc 1 129 58 discriminator 3 view .LVU894
	addsd	xmm6, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU895
.LVL323:
	.loc 1 129 23 discriminator 1 view .LVU896
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU897
	mulsd	xmm10, xmm1
	.loc 1 129 58 discriminator 3 view .LVU898
	addsd	xmm5, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU899
.LVL324:
	.loc 1 129 23 discriminator 1 view .LVU900
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU901
	mulsd	xmm8, xmm1
	.loc 1 129 58 discriminator 3 view .LVU902
	addsd	xmm4, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU903
.LVL325:
	.loc 1 129 23 discriminator 1 view .LVU904
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU905
	mulsd	xmm3, xmm1
	.loc 1 129 58 discriminator 3 view .LVU906
	addsd	xmm13, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU907
.LVL326:
	.loc 1 129 23 discriminator 1 view .LVU908
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU909
	addsd	xmm12, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU910
.LVL327:
	.loc 1 129 23 discriminator 1 view .LVU911
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU912
	addsd	xmm11, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU913
.LVL328:
	.loc 1 129 23 discriminator 1 view .LVU914
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU915
	addsd	xmm10, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU916
.LVL329:
	.loc 1 129 23 discriminator 1 view .LVU917
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU918
	addsd	xmm8, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU919
.LVL330:
	.loc 1 129 23 discriminator 1 view .LVU920
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU921
	addsd	xmm3, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU922
.LVL331:
	.loc 1 129 23 discriminator 1 view .LVU923
.LBE81:
	.loc 1 127 5 discriminator 2 view .LVU924
	.loc 1 127 28 discriminator 1 view .LVU925
	cmp	rax, rdx
	jne	.L241
	movsd	QWORD PTR 16[rsp], xmm7
	movsd	QWORD PTR 24[rsp], xmm6
	movsd	QWORD PTR 32[rsp], xmm5
	movsd	QWORD PTR 40[rsp], xmm4
	movsd	QWORD PTR 48[rsp], xmm13
	movsd	QWORD PTR 56[rsp], xmm12
	movsd	QWORD PTR 64[rsp], xmm11
	movsd	QWORD PTR 72[rsp], xmm10
	movsd	QWORD PTR 80[rsp], xmm8
	movsd	QWORD PTR 88[rsp], xmm3
.LVL332:
.L240:
	.loc 1 127 28 is_stmt 0 discriminator 1 view .LVU926
.LBE84:
.LBB85:
	.loc 1 132 23 is_stmt 1 discriminator 1 view .LVU927
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU928
	addsd	xmm0, xmm9
.LVL333:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU929
	.loc 1 132 23 discriminator 1 view .LVU930
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU931
	addsd	xmm0, QWORD PTR 16[rsp]
.LVL334:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU932
	.loc 1 132 23 discriminator 1 view .LVU933
	.loc 1 132 23 is_stmt 0 discriminator 1 view .LVU934
.LBE85:
	.loc 1 141 1 view .LVU935
	movups	xmm6, XMMWORD PTR 96[rsp]
.LBB86:
	.loc 1 132 35 discriminator 3 view .LVU936
	addsd	xmm0, QWORD PTR 24[rsp]
.LVL335:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU937
	.loc 1 132 23 discriminator 1 view .LVU938
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU939
	addsd	xmm0, QWORD PTR 32[rsp]
.LVL336:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU940
	.loc 1 132 23 discriminator 1 view .LVU941
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU942
	addsd	xmm0, QWORD PTR 40[rsp]
.LVL337:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU943
	.loc 1 132 23 discriminator 1 view .LVU944
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU945
	addsd	xmm0, QWORD PTR 48[rsp]
.LVL338:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU946
	.loc 1 132 23 discriminator 1 view .LVU947
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU948
	addsd	xmm0, QWORD PTR 56[rsp]
.LVL339:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU949
	.loc 1 132 23 discriminator 1 view .LVU950
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU951
	addsd	xmm0, QWORD PTR 64[rsp]
.LVL340:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU952
	.loc 1 132 23 discriminator 1 view .LVU953
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU954
	addsd	xmm0, QWORD PTR 72[rsp]
.LVL341:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU955
	.loc 1 132 23 discriminator 1 view .LVU956
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU957
	addsd	xmm0, QWORD PTR 80[rsp]
.LVL342:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU958
	.loc 1 132 23 discriminator 1 view .LVU959
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU960
	addsd	xmm0, QWORD PTR 88[rsp]
.LVL343:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU961
	.loc 1 132 23 discriminator 1 view .LVU962
.LBE86:
	.loc 1 133 21 is_stmt 0 view .LVU963
	mov	rax, QWORD PTR .LC16[rip]
.LVL344:
	.loc 1 141 1 view .LVU964
	movups	xmm8, XMMWORD PTR 128[rsp]
	movups	xmm7, XMMWORD PTR 112[rsp]
	movups	xmm9, XMMWORD PTR 144[rsp]
	.loc 1 133 21 view .LVU965
	mov	QWORD PTR [r9], rax
	.loc 1 141 1 view .LVU966
	movups	xmm10, XMMWORD PTR 160[rsp]
	movups	xmm11, XMMWORD PTR 176[rsp]
	movups	xmm12, XMMWORD PTR 192[rsp]
	movups	xmm13, XMMWORD PTR 208[rsp]
	add	rsp, 232
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 28
	.cfi_restore 27
	.cfi_restore 26
	.cfi_restore 25
	.cfi_restore 24
	.cfi_restore 23
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE62:
	.seh_endproc
	.section .rdata,"dr"
	.align 4
.LC4:
	.long	1065445491
	.align 4
.LC5:
	.long	1065437102
	.align 4
.LC6:
	.long	1065428713
	.align 4
.LC7:
	.long	1065420325
	.align 4
.LC8:
	.long	1065411936
	.align 4
.LC9:
	.long	1065403548
	.align 4
.LC10:
	.long	1065395159
	.align 4
.LC11:
	.long	1065386770
	.align 4
.LC12:
	.long	1065378382
	.align 4
.LC13:
	.long	1065369993
	.align 4
.LC14:
	.long	1065361605
	.align 4
.LC15:
	.long	1065353216
	.align 8
.LC16:
	.long	0
	.long	1077411840
	.align 8
.LC17:
	.long	1443109011
	.long	1072704782
	.align 8
.LC18:
	.long	-1030792151
	.long	1072703733
	.align 8
.LC19:
	.long	790273982
	.long	1072702685
	.align 8
.LC20:
	.long	-1683627180
	.long	1072701636
	.align 8
.LC21:
	.long	137438953
	.long	1072700588
	.align 8
.LC22:
	.long	1958505087
	.long	1072699539
	.align 8
.LC23:
	.long	-515396076
	.long	1072698490
	.align 8
.LC24:
	.long	1305670058
	.long	1072697442
	.align 8
.LC25:
	.long	-1168231105
	.long	1072696393
	.align 8
.LC26:
	.long	652835029
	.long	1072695345
	.align 8
.LC27:
	.long	-1821066134
	.long	1072694296
	.align 8
.LC28:
	.long	0
	.long	1072693248
	.text
.Letext0:
	.file 2 "C:/msys64/ucrt64/include/corecrt.h"
	.file 3 "C:/msys64/ucrt64/include/stddef.h"
	.file 4 "C:/msys64/ucrt64/include/c++/13.1.0/cstddef"
	.file 5 "C:/msys64/ucrt64/include/c++/13.1.0/cstdint"
	.file 6 "C:/msys64/ucrt64/include/c++/13.1.0/x86_64-w64-mingw32/bits/c++config.h"
	.file 7 "C:/msys64/ucrt64/include/stdint.h"
	.section	.debug_info,"dr"
.Ldebug_info0:
	.long	0x1e5f
	.word	0x5
	.byte	0x1
	.byte	0x8
	.secrel32	.Ldebug_abbrev0
	.uleb128 0x17
	.ascii "GNU C++17 13.1.0 -masm=intel -mtune=generic -march=nocona -g -O3 -std=c++17 -fno-tree-vectorize -fno-tree-slp-vectorize\0"
	.byte	0x21
	.secrel32	.LASF0
	.secrel32	.LASF1
	.secrel32	.LLRL117
	.quad	0
	.secrel32	.Ldebug_line0
	.uleb128 0x9
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.uleb128 0x9
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0x9
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x9
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x9
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x4
	.ascii "intptr_t\0"
	.byte	0x2
	.byte	0x3e
	.byte	0x23
	.long	0xd3
	.uleb128 0x4
	.ascii "uintptr_t\0"
	.byte	0x2
	.byte	0x4b
	.byte	0x2c
	.long	0xb9
	.uleb128 0x9
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x10
	.long	0x11d
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x18
	.byte	0x20
	.byte	0x10
	.byte	0x3
	.word	0x1a8
	.byte	0x10
	.ascii "11max_align_t\0"
	.long	0x191
	.uleb128 0x15
	.ascii "__max_align_ll\0"
	.word	0x1a9
	.byte	0xd
	.long	0xd3
	.byte	0x8
	.byte	0
	.uleb128 0x15
	.ascii "__max_align_ld\0"
	.word	0x1aa
	.byte	0xf
	.long	0x191
	.byte	0x10
	.byte	0x10
	.byte	0
	.uleb128 0x9
	.byte	0x10
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0x19
	.ascii "max_align_t\0"
	.byte	0x3
	.word	0x1ab
	.byte	0x3
	.long	0x145
	.byte	0x10
	.uleb128 0x1a
	.ascii "std\0"
	.byte	0x6
	.word	0x132
	.byte	0xb
	.long	0x2c1
	.uleb128 0x5
	.byte	0x4
	.byte	0x3a
	.byte	0xb
	.long	0x1a0
	.uleb128 0x5
	.byte	0x5
	.byte	0x33
	.byte	0xb
	.long	0x2d2
	.uleb128 0x5
	.byte	0x5
	.byte	0x34
	.byte	0xb
	.long	0x300
	.uleb128 0x5
	.byte	0x5
	.byte	0x35
	.byte	0xb
	.long	0x32e
	.uleb128 0x5
	.byte	0x5
	.byte	0x36
	.byte	0xb
	.long	0x354
	.uleb128 0x5
	.byte	0x5
	.byte	0x38
	.byte	0xb
	.long	0x427
	.uleb128 0x5
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.long	0x450
	.uleb128 0x5
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.long	0x47b
	.uleb128 0x5
	.byte	0x5
	.byte	0x3b
	.byte	0xb
	.long	0x4a6
	.uleb128 0x5
	.byte	0x5
	.byte	0x3d
	.byte	0xb
	.long	0x375
	.uleb128 0x5
	.byte	0x5
	.byte	0x3e
	.byte	0xb
	.long	0x3a0
	.uleb128 0x5
	.byte	0x5
	.byte	0x3f
	.byte	0xb
	.long	0x3cd
	.uleb128 0x5
	.byte	0x5
	.byte	0x40
	.byte	0xb
	.long	0x3fa
	.uleb128 0x5
	.byte	0x5
	.byte	0x42
	.byte	0xb
	.long	0x4d1
	.uleb128 0x5
	.byte	0x5
	.byte	0x43
	.byte	0xb
	.long	0xe4
	.uleb128 0x5
	.byte	0x5
	.byte	0x45
	.byte	0xb
	.long	0x2f0
	.uleb128 0x5
	.byte	0x5
	.byte	0x46
	.byte	0xb
	.long	0x31d
	.uleb128 0x5
	.byte	0x5
	.byte	0x47
	.byte	0xb
	.long	0x343
	.uleb128 0x5
	.byte	0x5
	.byte	0x48
	.byte	0xb
	.long	0x364
	.uleb128 0x5
	.byte	0x5
	.byte	0x4a
	.byte	0xb
	.long	0x43b
	.uleb128 0x5
	.byte	0x5
	.byte	0x4b
	.byte	0xb
	.long	0x465
	.uleb128 0x5
	.byte	0x5
	.byte	0x4c
	.byte	0xb
	.long	0x490
	.uleb128 0x5
	.byte	0x5
	.byte	0x4d
	.byte	0xb
	.long	0x4bb
	.uleb128 0x5
	.byte	0x5
	.byte	0x4f
	.byte	0xb
	.long	0x38a
	.uleb128 0x5
	.byte	0x5
	.byte	0x50
	.byte	0xb
	.long	0x3b6
	.uleb128 0x5
	.byte	0x5
	.byte	0x51
	.byte	0xb
	.long	0x3e3
	.uleb128 0x5
	.byte	0x5
	.byte	0x52
	.byte	0xb
	.long	0x410
	.uleb128 0x5
	.byte	0x5
	.byte	0x54
	.byte	0xb
	.long	0x4e2
	.uleb128 0x5
	.byte	0x5
	.byte	0x55
	.byte	0xb
	.long	0xf5
	.uleb128 0x1b
	.ascii "size_t\0"
	.byte	0x6
	.word	0x134
	.byte	0x1a
	.long	0xb9
	.uleb128 0x10
	.long	0x2ab
	.byte	0
	.uleb128 0x9
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x4
	.ascii "int8_t\0"
	.byte	0x7
	.byte	0x23
	.byte	0x15
	.long	0x2e1
	.uleb128 0x9
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x4
	.ascii "uint8_t\0"
	.byte	0x7
	.byte	0x24
	.byte	0x19
	.long	0x2c1
	.uleb128 0x4
	.ascii "int16_t\0"
	.byte	0x7
	.byte	0x25
	.byte	0x10
	.long	0x310
	.uleb128 0x9
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x4
	.ascii "uint16_t\0"
	.byte	0x7
	.byte	0x26
	.byte	0x19
	.long	0x107
	.uleb128 0x4
	.ascii "int32_t\0"
	.byte	0x7
	.byte	0x27
	.byte	0xe
	.long	0x11d
	.uleb128 0x10
	.long	0x32e
	.uleb128 0x4
	.ascii "uint32_t\0"
	.byte	0x7
	.byte	0x28
	.byte	0x14
	.long	0x135
	.uleb128 0x4
	.ascii "int64_t\0"
	.byte	0x7
	.byte	0x29
	.byte	0x26
	.long	0xd3
	.uleb128 0x4
	.ascii "uint64_t\0"
	.byte	0x7
	.byte	0x2a
	.byte	0x30
	.long	0xb9
	.uleb128 0x4
	.ascii "int_least8_t\0"
	.byte	0x7
	.byte	0x2d
	.byte	0x15
	.long	0x2e1
	.uleb128 0x4
	.ascii "uint_least8_t\0"
	.byte	0x7
	.byte	0x2e
	.byte	0x19
	.long	0x2c1
	.uleb128 0x4
	.ascii "int_least16_t\0"
	.byte	0x7
	.byte	0x2f
	.byte	0x10
	.long	0x310
	.uleb128 0x4
	.ascii "uint_least16_t\0"
	.byte	0x7
	.byte	0x30
	.byte	0x19
	.long	0x107
	.uleb128 0x4
	.ascii "int_least32_t\0"
	.byte	0x7
	.byte	0x31
	.byte	0xe
	.long	0x11d
	.uleb128 0x4
	.ascii "uint_least32_t\0"
	.byte	0x7
	.byte	0x32
	.byte	0x14
	.long	0x135
	.uleb128 0x4
	.ascii "int_least64_t\0"
	.byte	0x7
	.byte	0x33
	.byte	0x26
	.long	0xd3
	.uleb128 0x4
	.ascii "uint_least64_t\0"
	.byte	0x7
	.byte	0x34
	.byte	0x30
	.long	0xb9
	.uleb128 0x4
	.ascii "int_fast8_t\0"
	.byte	0x7
	.byte	0x3a
	.byte	0x15
	.long	0x2e1
	.uleb128 0x4
	.ascii "uint_fast8_t\0"
	.byte	0x7
	.byte	0x3b
	.byte	0x17
	.long	0x2c1
	.uleb128 0x4
	.ascii "int_fast16_t\0"
	.byte	0x7
	.byte	0x3c
	.byte	0x10
	.long	0x310
	.uleb128 0x4
	.ascii "uint_fast16_t\0"
	.byte	0x7
	.byte	0x3d
	.byte	0x19
	.long	0x107
	.uleb128 0x4
	.ascii "int_fast32_t\0"
	.byte	0x7
	.byte	0x3e
	.byte	0xe
	.long	0x11d
	.uleb128 0x4
	.ascii "uint_fast32_t\0"
	.byte	0x7
	.byte	0x3f
	.byte	0x18
	.long	0x135
	.uleb128 0x4
	.ascii "int_fast64_t\0"
	.byte	0x7
	.byte	0x40
	.byte	0x26
	.long	0xd3
	.uleb128 0x4
	.ascii "uint_fast64_t\0"
	.byte	0x7
	.byte	0x41
	.byte	0x30
	.long	0xb9
	.uleb128 0x4
	.ascii "intmax_t\0"
	.byte	0x7
	.byte	0x44
	.byte	0x26
	.long	0xd3
	.uleb128 0x4
	.ascii "uintmax_t\0"
	.byte	0x7
	.byte	0x45
	.byte	0x30
	.long	0xb9
	.uleb128 0x5
	.byte	0x1
	.byte	0x3
	.byte	0xc
	.long	0x2ab
	.uleb128 0x6
	.ascii "peak_flops<double>\0"
	.byte	0x73
	.byte	0xc
	.ascii "_Z10peak_flopsIdET_yS0_S0_Pd\0"
	.long	0x9e
	.quad	.LFB62
	.quad	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.long	0x66f
	.uleb128 0x3
	.ascii "T\0"
	.long	0x9e
	.uleb128 0x7
	.ascii "iters\0"
	.byte	0x73
	.byte	0x1e
	.long	0x2ab
	.secrel32	.LLST103
	.secrel32	.LVUS103
	.uleb128 0x7
	.ascii "m\0"
	.byte	0x73
	.byte	0x27
	.long	0x9e
	.secrel32	.LLST104
	.secrel32	.LVUS104
	.uleb128 0x7
	.ascii "c\0"
	.byte	0x73
	.byte	0x2c
	.long	0x9e
	.secrel32	.LLST105
	.secrel32	.LVUS105
	.uleb128 0x16
	.secrel32	.LASF2
	.byte	0x73
	.long	0x674
	.uleb128 0x1
	.byte	0x59
	.uleb128 0xc
	.ascii "K\0"
	.byte	0x74
	.byte	0x13
	.long	0x124
	.byte	0xc
	.uleb128 0x4
	.ascii "V\0"
	.byte	0x1
	.byte	0x76
	.byte	0xb
	.long	0x9e
	.uleb128 0x10
	.long	0x59d
	.uleb128 0xc
	.ascii "L\0"
	.byte	0x77
	.byte	0x13
	.long	0x124
	.byte	0x1
	.uleb128 0xd
	.long	0x59d
	.long	0x5c6
	.uleb128 0xe
	.long	0xb9
	.byte	0xb
	.byte	0
	.uleb128 0xf
	.ascii "acc\0"
	.byte	0x7c
	.long	0x5b6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x2
	.ascii "vm\0"
	.byte	0x7e
	.byte	0xd
	.long	0x5a7
	.secrel32	.LLST106
	.secrel32	.LVUS106
	.uleb128 0x2
	.ascii "vc\0"
	.byte	0x7e
	.byte	0x1b
	.long	0x5a7
	.secrel32	.LLST107
	.secrel32	.LVUS107
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x83
	.byte	0x7
	.long	0x59d
	.secrel32	.LLST108
	.secrel32	.LVUS108
	.uleb128 0x11
	.secrel32	.LLRL109
	.long	0x624
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x7d
	.byte	0xe
	.long	0x11d
	.secrel32	.LLST110
	.secrel32	.LVUS110
	.byte	0
	.uleb128 0x11
	.secrel32	.LLRL111
	.long	0x657
	.uleb128 0x2
	.ascii "it\0"
	.byte	0x7f
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST112
	.secrel32	.LVUS112
	.uleb128 0x8
	.secrel32	.LLRL113
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x81
	.byte	0x12
	.long	0x11d
	.secrel32	.LLST114
	.secrel32	.LVUS114
	.byte	0
	.byte	0
	.uleb128 0x8
	.secrel32	.LLRL115
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x84
	.byte	0xe
	.long	0x11d
	.secrel32	.LLST116
	.secrel32	.LVUS116
	.byte	0
	.byte	0
	.uleb128 0x10
	.long	0x9e
	.uleb128 0x12
	.long	0x9e
	.uleb128 0x13
	.long	0x674
	.uleb128 0x6
	.ascii "peak_flops<float>\0"
	.byte	0x73
	.byte	0xc
	.ascii "_Z10peak_flopsIfET_yS0_S0_Pd\0"
	.long	0xa8
	.quad	.LFB61
	.quad	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.long	0x7f0
	.uleb128 0x3
	.ascii "T\0"
	.long	0xa8
	.uleb128 0x7
	.ascii "iters\0"
	.byte	0x73
	.byte	0x1e
	.long	0x2ab
	.secrel32	.LLST89
	.secrel32	.LVUS89
	.uleb128 0x7
	.ascii "m\0"
	.byte	0x73
	.byte	0x27
	.long	0xa8
	.secrel32	.LLST90
	.secrel32	.LVUS90
	.uleb128 0x7
	.ascii "c\0"
	.byte	0x73
	.byte	0x2c
	.long	0xa8
	.secrel32	.LLST91
	.secrel32	.LVUS91
	.uleb128 0x16
	.secrel32	.LASF2
	.byte	0x73
	.long	0x674
	.uleb128 0x1
	.byte	0x59
	.uleb128 0xc
	.ascii "K\0"
	.byte	0x74
	.byte	0x13
	.long	0x124
	.byte	0xc
	.uleb128 0x4
	.ascii "V\0"
	.byte	0x1
	.byte	0x76
	.byte	0xb
	.long	0xa8
	.uleb128 0x10
	.long	0x71e
	.uleb128 0xc
	.ascii "L\0"
	.byte	0x77
	.byte	0x13
	.long	0x124
	.byte	0x1
	.uleb128 0xd
	.long	0x71e
	.long	0x747
	.uleb128 0xe
	.long	0xb9
	.byte	0xb
	.byte	0
	.uleb128 0xf
	.ascii "acc\0"
	.byte	0x7c
	.long	0x737
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x2
	.ascii "vm\0"
	.byte	0x7e
	.byte	0xd
	.long	0x728
	.secrel32	.LLST92
	.secrel32	.LVUS92
	.uleb128 0x2
	.ascii "vc\0"
	.byte	0x7e
	.byte	0x1b
	.long	0x728
	.secrel32	.LLST93
	.secrel32	.LVUS93
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x83
	.byte	0x7
	.long	0x71e
	.secrel32	.LLST94
	.secrel32	.LVUS94
	.uleb128 0x11
	.secrel32	.LLRL95
	.long	0x7a5
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x7d
	.byte	0xe
	.long	0x11d
	.secrel32	.LLST96
	.secrel32	.LVUS96
	.byte	0
	.uleb128 0x11
	.secrel32	.LLRL97
	.long	0x7d8
	.uleb128 0x2
	.ascii "it\0"
	.byte	0x7f
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST98
	.secrel32	.LVUS98
	.uleb128 0x8
	.secrel32	.LLRL99
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x81
	.byte	0x12
	.long	0x11d
	.secrel32	.LLST100
	.secrel32	.LVUS100
	.byte	0
	.byte	0
	.uleb128 0x8
	.secrel32	.LLRL101
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x84
	.byte	0xe
	.long	0x11d
	.secrel32	.LLST102
	.secrel32	.LVUS102
	.byte	0
	.byte	0
	.uleb128 0x10
	.long	0xa8
	.uleb128 0x6
	.ascii "vmul_ref_elem<int>\0"
	.byte	0x9d
	.byte	0xd
	.ascii "_Z13vmul_ref_elemIiEeT_S0_\0"
	.long	0x191
	.quad	.LFB60
	.quad	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.long	0x85e
	.uleb128 0x3
	.ascii "T\0"
	.long	0x11d
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9d
	.byte	0x1d
	.long	0x11d
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9d
	.byte	0x22
	.long	0x11d
	.uleb128 0x1
	.byte	0x58
	.byte	0
	.uleb128 0x6
	.ascii "saxpy_ref_elem<int>\0"
	.byte	0x9a
	.byte	0xd
	.ascii "_Z14saxpy_ref_elemIiEeT_S0_S0_\0"
	.long	0x191
	.quad	.LFB59
	.quad	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.long	0x8d7
	.uleb128 0x3
	.ascii "T\0"
	.long	0x11d
	.uleb128 0x1
	.ascii "a\0"
	.byte	0x9a
	.byte	0x1e
	.long	0x11d
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9a
	.byte	0x23
	.long	0x11d
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9a
	.byte	0x28
	.long	0x11d
	.uleb128 0x1
	.byte	0x59
	.byte	0
	.uleb128 0x6
	.ascii "dot_ref<int>\0"
	.byte	0x93
	.byte	0xd
	.ascii "_Z7dot_refIiEePKT_S2_y\0"
	.long	0x191
	.quad	.LFB58
	.quad	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.long	0x975
	.uleb128 0x3
	.ascii "T\0"
	.long	0x11d
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x93
	.byte	0x1e
	.long	0x975
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x93
	.byte	0x2a
	.long	0x975
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x93
	.byte	0x34
	.long	0x2ab
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x94
	.byte	0x11
	.long	0x191
	.secrel32	.LLST87
	.secrel32	.LVUS87
	.uleb128 0xa
	.quad	.LBB68
	.quad	.LBE68-.LBB68
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x95
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST88
	.secrel32	.LVUS88
	.byte	0
	.byte	0
	.uleb128 0x12
	.long	0x124
	.uleb128 0x13
	.long	0x975
	.uleb128 0xb
	.ascii "vmul<int>\0"
	.byte	0x5f
	.ascii "_Z4vmulIiEvPKT_S2_PS0_y\0"
	.quad	.LFB57
	.quad	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.long	0xa10
	.uleb128 0x3
	.ascii "T\0"
	.long	0x11d
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x5f
	.byte	0x2a
	.long	0x97a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x5f
	.byte	0x43
	.long	0x97a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "z\0"
	.byte	0x5f
	.byte	0x56
	.long	0xa15
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x5f
	.byte	0x60
	.long	0x2ab
	.uleb128 0x1
	.byte	0x59
	.uleb128 0xa
	.quad	.LBB67
	.quad	.LBE67-.LBB67
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x60
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST86
	.secrel32	.LVUS86
	.byte	0
	.byte	0
	.uleb128 0x12
	.long	0x11d
	.uleb128 0x13
	.long	0xa10
	.uleb128 0xb
	.ascii "saxpy_gather<int>\0"
	.byte	0x56
	.ascii "_Z12saxpy_gatherIiEvT_PKS0_PS0_PKiy\0"
	.quad	.LFB56
	.quad	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.long	0xac6
	.uleb128 0x3
	.ascii "T\0"
	.long	0x11d
	.uleb128 0x1
	.ascii "a\0"
	.byte	0x56
	.byte	0x1e
	.long	0x11d
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x56
	.byte	0x37
	.long	0x97a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x56
	.byte	0x4a
	.long	0xa15
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "idx\0"
	.byte	0x57
	.byte	0x3d
	.long	0xacb
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x7
	.ascii "n\0"
	.byte	0x57
	.byte	0x49
	.long	0x2ab
	.secrel32	.LLST83
	.secrel32	.LVUS83
	.uleb128 0x8
	.secrel32	.LLRL84
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x58
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST85
	.secrel32	.LVUS85
	.byte	0
	.byte	0
	.uleb128 0x12
	.long	0x33e
	.uleb128 0x13
	.long	0xac6
	.uleb128 0xb
	.ascii "saxpy_stride<int>\0"
	.byte	0x51
	.ascii "_Z12saxpy_strideIiEvT_PKS0_PS0_yy\0"
	.quad	.LFB55
	.quad	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.long	0xb79
	.uleb128 0x3
	.ascii "T\0"
	.long	0x11d
	.uleb128 0x7
	.ascii "a\0"
	.byte	0x51
	.byte	0x1e
	.long	0x11d
	.secrel32	.LLST80
	.secrel32	.LVUS80
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x51
	.byte	0x37
	.long	0x97a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x51
	.byte	0x4a
	.long	0xa15
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x51
	.byte	0x54
	.long	0x2ab
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x1
	.ascii "s\0"
	.byte	0x51
	.byte	0x5e
	.long	0x2ab
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x8
	.secrel32	.LLRL81
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x52
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST82
	.secrel32	.LVUS82
	.byte	0
	.byte	0
	.uleb128 0xb
	.ascii "saxpy<int>\0"
	.byte	0x4c
	.ascii "_Z5saxpyIiEvT_PKS0_PS0_y\0"
	.quad	.LFB54
	.quad	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.long	0xc0c
	.uleb128 0x3
	.ascii "T\0"
	.long	0x11d
	.uleb128 0x1
	.ascii "a\0"
	.byte	0x4c
	.byte	0x17
	.long	0x11d
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x4c
	.byte	0x30
	.long	0x97a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x4c
	.byte	0x43
	.long	0xa15
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x4c
	.byte	0x4d
	.long	0x2ab
	.uleb128 0x1
	.byte	0x59
	.uleb128 0xa
	.quad	.LBB61
	.quad	.LBE61-.LBB61
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x4d
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST79
	.secrel32	.LVUS79
	.byte	0
	.byte	0
	.uleb128 0x6
	.ascii "dot_simd_acc<int>\0"
	.byte	0x3a
	.byte	0xc
	.ascii "_Z12dot_simd_accIiET_PKS0_S2_y\0"
	.long	0x11d
	.quad	.LFB53
	.quad	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.long	0xd07
	.uleb128 0x3
	.ascii "T\0"
	.long	0x11d
	.uleb128 0x7
	.ascii "x\0"
	.byte	0x3a
	.byte	0x2f
	.long	0x97a
	.secrel32	.LLST72
	.secrel32	.LVUS72
	.uleb128 0x7
	.ascii "y\0"
	.byte	0x3a
	.byte	0x48
	.long	0x97a
	.secrel32	.LLST73
	.secrel32	.LVUS73
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x3a
	.byte	0x52
	.long	0x2ab
	.uleb128 0x1
	.byte	0x58
	.uleb128 0xc
	.ascii "W\0"
	.byte	0x3b
	.byte	0x16
	.long	0x2bb
	.byte	0x20
	.uleb128 0xf
	.ascii "acc\0"
	.byte	0x3c
	.long	0xd07
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x3d
	.byte	0xc
	.long	0x2ab
	.secrel32	.LLST74
	.secrel32	.LVUS74
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x42
	.byte	0x7
	.long	0x11d
	.secrel32	.LLST75
	.secrel32	.LVUS75
	.uleb128 0x14
	.quad	.LBB56
	.quad	.LBE56-.LBB56
	.long	0xcef
	.uleb128 0x2
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x2ab
	.secrel32	.LLST76
	.secrel32	.LVUS76
	.byte	0
	.uleb128 0x8
	.secrel32	.LLRL77
	.uleb128 0x2
	.ascii "j\0"
	.byte	0x43
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST78
	.secrel32	.LVUS78
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0x11d
	.long	0xd17
	.uleb128 0xe
	.long	0xb9
	.byte	0x1f
	.byte	0
	.uleb128 0x6
	.ascii "dot_simd<int>\0"
	.byte	0x2d
	.byte	0xc
	.ascii "_Z8dot_simdIiET_PKS0_S2_y\0"
	.long	0x11d
	.quad	.LFB52
	.quad	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.long	0xdad
	.uleb128 0x3
	.ascii "T\0"
	.long	0x11d
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x2d
	.byte	0x2b
	.long	0x97a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x2d
	.byte	0x44
	.long	0x97a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x2d
	.byte	0x4e
	.long	0x2ab
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0x11d
	.secrel32	.LLST69
	.secrel32	.LVUS69
	.uleb128 0x8
	.secrel32	.LLRL70
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST71
	.secrel32	.LVUS71
	.byte	0
	.byte	0
	.uleb128 0x6
	.ascii "dot_multiacc<int>\0"
	.byte	0x1a
	.byte	0xc
	.ascii "_Z12dot_multiaccIiET_PKS0_S2_y\0"
	.long	0x11d
	.quad	.LFB51
	.quad	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.long	0xeae
	.uleb128 0x3
	.ascii "T\0"
	.long	0x11d
	.uleb128 0x7
	.ascii "x\0"
	.byte	0x1a
	.byte	0x2f
	.long	0x97a
	.secrel32	.LLST61
	.secrel32	.LVUS61
	.uleb128 0x7
	.ascii "y\0"
	.byte	0x1a
	.byte	0x48
	.long	0x97a
	.secrel32	.LLST62
	.secrel32	.LVUS62
	.uleb128 0x7
	.ascii "n\0"
	.byte	0x1a
	.byte	0x52
	.long	0x2ab
	.secrel32	.LLST63
	.secrel32	.LVUS63
	.uleb128 0xc
	.ascii "K\0"
	.byte	0x1b
	.byte	0x16
	.long	0x2bb
	.byte	0x8
	.uleb128 0xf
	.ascii "acc\0"
	.byte	0x1c
	.long	0xeae
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x1d
	.byte	0xc
	.long	0x2ab
	.secrel32	.LLST64
	.secrel32	.LVUS64
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x21
	.byte	0x7
	.long	0x11d
	.secrel32	.LLST65
	.secrel32	.LVUS65
	.uleb128 0x11
	.secrel32	.LLRL66
	.long	0xe8a
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x1f
	.byte	0x15
	.long	0x2ab
	.secrel32	.LLST67
	.secrel32	.LVUS67
	.byte	0
	.uleb128 0xa
	.quad	.LBB51
	.quad	.LBE51-.LBB51
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x22
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST68
	.secrel32	.LVUS68
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0x11d
	.long	0xebe
	.uleb128 0xe
	.long	0xb9
	.byte	0x7
	.byte	0
	.uleb128 0x6
	.ascii "dot_strict<int>\0"
	.byte	0xe
	.byte	0xc
	.ascii "_Z10dot_strictIiET_PKS0_S2_y\0"
	.long	0x11d
	.quad	.LFB50
	.quad	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.long	0xf59
	.uleb128 0x3
	.ascii "T\0"
	.long	0x11d
	.uleb128 0x1
	.ascii "x\0"
	.byte	0xe
	.byte	0x2d
	.long	0x97a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0xe
	.byte	0x46
	.long	0x97a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0xe
	.byte	0x50
	.long	0x2ab
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.ascii "s\0"
	.byte	0xf
	.byte	0x7
	.long	0x11d
	.secrel32	.LLST58
	.secrel32	.LVUS58
	.uleb128 0x8
	.secrel32	.LLRL59
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x10
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST60
	.secrel32	.LVUS60
	.byte	0
	.byte	0
	.uleb128 0x6
	.ascii "vmul_ref_elem<double>\0"
	.byte	0x9d
	.byte	0xd
	.ascii "_Z13vmul_ref_elemIdEeT_S0_\0"
	.long	0x191
	.quad	.LFB49
	.quad	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.long	0xfc5
	.uleb128 0x3
	.ascii "T\0"
	.long	0x9e
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9d
	.byte	0x1d
	.long	0x9e
	.uleb128 0x1
	.byte	0x62
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9d
	.byte	0x22
	.long	0x9e
	.uleb128 0x1
	.byte	0x63
	.byte	0
	.uleb128 0x6
	.ascii "saxpy_ref_elem<double>\0"
	.byte	0x9a
	.byte	0xd
	.ascii "_Z14saxpy_ref_elemIdEeT_S0_S0_\0"
	.long	0x191
	.quad	.LFB48
	.quad	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.long	0x1041
	.uleb128 0x3
	.ascii "T\0"
	.long	0x9e
	.uleb128 0x1
	.ascii "a\0"
	.byte	0x9a
	.byte	0x1e
	.long	0x9e
	.uleb128 0x1
	.byte	0x62
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9a
	.byte	0x23
	.long	0x9e
	.uleb128 0x1
	.byte	0x63
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9a
	.byte	0x28
	.long	0x9e
	.uleb128 0x1
	.byte	0x64
	.byte	0
	.uleb128 0x6
	.ascii "dot_ref<double>\0"
	.byte	0x93
	.byte	0xd
	.ascii "_Z7dot_refIdEePKT_S2_y\0"
	.long	0x191
	.quad	.LFB47
	.quad	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.long	0x10e2
	.uleb128 0x3
	.ascii "T\0"
	.long	0x9e
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x93
	.byte	0x1e
	.long	0x10e2
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x93
	.byte	0x2a
	.long	0x10e2
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x93
	.byte	0x34
	.long	0x2ab
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x94
	.byte	0x11
	.long	0x191
	.secrel32	.LLST56
	.secrel32	.LVUS56
	.uleb128 0xa
	.quad	.LBB45
	.quad	.LBE45-.LBB45
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x95
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST57
	.secrel32	.LVUS57
	.byte	0
	.byte	0
	.uleb128 0x12
	.long	0x66f
	.uleb128 0x13
	.long	0x10e2
	.uleb128 0xb
	.ascii "vmul<double>\0"
	.byte	0x5f
	.ascii "_Z4vmulIdEvPKT_S2_PS0_y\0"
	.quad	.LFB46
	.quad	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.long	0x1180
	.uleb128 0x3
	.ascii "T\0"
	.long	0x9e
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x5f
	.byte	0x2a
	.long	0x10e7
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x5f
	.byte	0x43
	.long	0x10e7
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "z\0"
	.byte	0x5f
	.byte	0x56
	.long	0x679
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x5f
	.byte	0x60
	.long	0x2ab
	.uleb128 0x1
	.byte	0x59
	.uleb128 0xa
	.quad	.LBB44
	.quad	.LBE44-.LBB44
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x60
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST55
	.secrel32	.LVUS55
	.byte	0
	.byte	0
	.uleb128 0xb
	.ascii "saxpy_gather<double>\0"
	.byte	0x56
	.ascii "_Z12saxpy_gatherIdEvT_PKS0_PS0_PKiy\0"
	.quad	.LFB45
	.quad	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.long	0x122f
	.uleb128 0x3
	.ascii "T\0"
	.long	0x9e
	.uleb128 0x1
	.ascii "a\0"
	.byte	0x56
	.byte	0x1e
	.long	0x9e
	.uleb128 0x1
	.byte	0x61
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x56
	.byte	0x37
	.long	0x10e7
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x56
	.byte	0x4a
	.long	0x679
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "idx\0"
	.byte	0x57
	.byte	0x3d
	.long	0xacb
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x7
	.ascii "n\0"
	.byte	0x57
	.byte	0x49
	.long	0x2ab
	.secrel32	.LLST52
	.secrel32	.LVUS52
	.uleb128 0x8
	.secrel32	.LLRL53
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x58
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST54
	.secrel32	.LVUS54
	.byte	0
	.byte	0
	.uleb128 0xb
	.ascii "saxpy_stride<double>\0"
	.byte	0x51
	.ascii "_Z12saxpy_strideIdEvT_PKS0_PS0_yy\0"
	.quad	.LFB44
	.quad	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.long	0x12d5
	.uleb128 0x3
	.ascii "T\0"
	.long	0x9e
	.uleb128 0x1
	.ascii "a\0"
	.byte	0x51
	.byte	0x1e
	.long	0x9e
	.uleb128 0x1
	.byte	0x61
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x51
	.byte	0x37
	.long	0x10e7
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x51
	.byte	0x4a
	.long	0x679
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x51
	.byte	0x54
	.long	0x2ab
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x1
	.ascii "s\0"
	.byte	0x51
	.byte	0x5e
	.long	0x2ab
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x8
	.secrel32	.LLRL50
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x52
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST51
	.secrel32	.LVUS51
	.byte	0
	.byte	0
	.uleb128 0xb
	.ascii "saxpy<double>\0"
	.byte	0x4c
	.ascii "_Z5saxpyIdEvT_PKS0_PS0_y\0"
	.quad	.LFB43
	.quad	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.long	0x136b
	.uleb128 0x3
	.ascii "T\0"
	.long	0x9e
	.uleb128 0x1
	.ascii "a\0"
	.byte	0x4c
	.byte	0x17
	.long	0x9e
	.uleb128 0x1
	.byte	0x61
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x4c
	.byte	0x30
	.long	0x10e7
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x4c
	.byte	0x43
	.long	0x679
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x4c
	.byte	0x4d
	.long	0x2ab
	.uleb128 0x1
	.byte	0x59
	.uleb128 0xa
	.quad	.LBB39
	.quad	.LBE39-.LBB39
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x4d
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST49
	.secrel32	.LVUS49
	.byte	0
	.byte	0
	.uleb128 0x6
	.ascii "dot_simd_acc<double>\0"
	.byte	0x3a
	.byte	0xc
	.ascii "_Z12dot_simd_accIdET_PKS0_S2_y\0"
	.long	0x9e
	.quad	.LFB42
	.quad	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.long	0x1469
	.uleb128 0x3
	.ascii "T\0"
	.long	0x9e
	.uleb128 0x7
	.ascii "x\0"
	.byte	0x3a
	.byte	0x2f
	.long	0x10e7
	.secrel32	.LLST42
	.secrel32	.LVUS42
	.uleb128 0x7
	.ascii "y\0"
	.byte	0x3a
	.byte	0x48
	.long	0x10e7
	.secrel32	.LLST43
	.secrel32	.LVUS43
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x3a
	.byte	0x52
	.long	0x2ab
	.uleb128 0x1
	.byte	0x58
	.uleb128 0xc
	.ascii "W\0"
	.byte	0x3b
	.byte	0x16
	.long	0x2bb
	.byte	0x20
	.uleb128 0xf
	.ascii "acc\0"
	.byte	0x3c
	.long	0x1469
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x3d
	.byte	0xc
	.long	0x2ab
	.secrel32	.LLST44
	.secrel32	.LVUS44
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x42
	.byte	0x7
	.long	0x9e
	.secrel32	.LLST45
	.secrel32	.LVUS45
	.uleb128 0x14
	.quad	.LBB34
	.quad	.LBE34-.LBB34
	.long	0x1451
	.uleb128 0x2
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x2ab
	.secrel32	.LLST46
	.secrel32	.LVUS46
	.byte	0
	.uleb128 0x8
	.secrel32	.LLRL47
	.uleb128 0x2
	.ascii "j\0"
	.byte	0x43
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST48
	.secrel32	.LVUS48
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0x9e
	.long	0x1479
	.uleb128 0xe
	.long	0xb9
	.byte	0x1f
	.byte	0
	.uleb128 0x6
	.ascii "dot_simd<double>\0"
	.byte	0x2d
	.byte	0xc
	.ascii "_Z8dot_simdIdET_PKS0_S2_y\0"
	.long	0x9e
	.quad	.LFB41
	.quad	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.long	0x1512
	.uleb128 0x3
	.ascii "T\0"
	.long	0x9e
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x2d
	.byte	0x2b
	.long	0x10e7
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x2d
	.byte	0x44
	.long	0x10e7
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x2d
	.byte	0x4e
	.long	0x2ab
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0x9e
	.secrel32	.LLST39
	.secrel32	.LVUS39
	.uleb128 0x8
	.secrel32	.LLRL40
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST41
	.secrel32	.LVUS41
	.byte	0
	.byte	0
	.uleb128 0x6
	.ascii "dot_multiacc<double>\0"
	.byte	0x1a
	.byte	0xc
	.ascii "_Z12dot_multiaccIdET_PKS0_S2_y\0"
	.long	0x9e
	.quad	.LFB40
	.quad	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.long	0x1610
	.uleb128 0x3
	.ascii "T\0"
	.long	0x9e
	.uleb128 0x7
	.ascii "x\0"
	.byte	0x1a
	.byte	0x2f
	.long	0x10e7
	.secrel32	.LLST32
	.secrel32	.LVUS32
	.uleb128 0x7
	.ascii "y\0"
	.byte	0x1a
	.byte	0x48
	.long	0x10e7
	.secrel32	.LLST33
	.secrel32	.LVUS33
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x1a
	.byte	0x52
	.long	0x2ab
	.uleb128 0x1
	.byte	0x58
	.uleb128 0xc
	.ascii "K\0"
	.byte	0x1b
	.byte	0x16
	.long	0x2bb
	.byte	0x8
	.uleb128 0xf
	.ascii "acc\0"
	.byte	0x1c
	.long	0x1610
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x1d
	.byte	0xc
	.long	0x2ab
	.secrel32	.LLST34
	.secrel32	.LVUS34
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x21
	.byte	0x7
	.long	0x9e
	.secrel32	.LLST35
	.secrel32	.LVUS35
	.uleb128 0x11
	.secrel32	.LLRL36
	.long	0x15ec
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x1f
	.byte	0x15
	.long	0x2ab
	.secrel32	.LLST37
	.secrel32	.LVUS37
	.byte	0
	.uleb128 0xa
	.quad	.LBB29
	.quad	.LBE29-.LBB29
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x22
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST38
	.secrel32	.LVUS38
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0x9e
	.long	0x1620
	.uleb128 0xe
	.long	0xb9
	.byte	0x7
	.byte	0
	.uleb128 0x6
	.ascii "dot_strict<double>\0"
	.byte	0xe
	.byte	0xc
	.ascii "_Z10dot_strictIdET_PKS0_S2_y\0"
	.long	0x9e
	.quad	.LFB39
	.quad	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.long	0x16be
	.uleb128 0x3
	.ascii "T\0"
	.long	0x9e
	.uleb128 0x1
	.ascii "x\0"
	.byte	0xe
	.byte	0x2d
	.long	0x10e7
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0xe
	.byte	0x46
	.long	0x10e7
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0xe
	.byte	0x50
	.long	0x2ab
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.ascii "s\0"
	.byte	0xf
	.byte	0x7
	.long	0x9e
	.secrel32	.LLST29
	.secrel32	.LVUS29
	.uleb128 0x8
	.secrel32	.LLRL30
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x10
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST31
	.secrel32	.LVUS31
	.byte	0
	.byte	0
	.uleb128 0x6
	.ascii "vmul_ref_elem<float>\0"
	.byte	0x9d
	.byte	0xd
	.ascii "_Z13vmul_ref_elemIfEeT_S0_\0"
	.long	0x191
	.quad	.LFB38
	.quad	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.long	0x1729
	.uleb128 0x3
	.ascii "T\0"
	.long	0xa8
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9d
	.byte	0x1d
	.long	0xa8
	.uleb128 0x1
	.byte	0x62
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9d
	.byte	0x22
	.long	0xa8
	.uleb128 0x1
	.byte	0x63
	.byte	0
	.uleb128 0x6
	.ascii "saxpy_ref_elem<float>\0"
	.byte	0x9a
	.byte	0xd
	.ascii "_Z14saxpy_ref_elemIfEeT_S0_S0_\0"
	.long	0x191
	.quad	.LFB37
	.quad	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.long	0x17a4
	.uleb128 0x3
	.ascii "T\0"
	.long	0xa8
	.uleb128 0x1
	.ascii "a\0"
	.byte	0x9a
	.byte	0x1e
	.long	0xa8
	.uleb128 0x1
	.byte	0x62
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9a
	.byte	0x23
	.long	0xa8
	.uleb128 0x1
	.byte	0x63
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9a
	.byte	0x28
	.long	0xa8
	.uleb128 0x1
	.byte	0x64
	.byte	0
	.uleb128 0x6
	.ascii "dot_ref<float>\0"
	.byte	0x93
	.byte	0xd
	.ascii "_Z7dot_refIfEePKT_S2_y\0"
	.long	0x191
	.quad	.LFB36
	.quad	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.long	0x1844
	.uleb128 0x3
	.ascii "T\0"
	.long	0xa8
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x93
	.byte	0x1e
	.long	0x1844
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x93
	.byte	0x2a
	.long	0x1844
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x93
	.byte	0x34
	.long	0x2ab
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x94
	.byte	0x11
	.long	0x191
	.secrel32	.LLST27
	.secrel32	.LVUS27
	.uleb128 0xa
	.quad	.LBB23
	.quad	.LBE23-.LBB23
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x95
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST28
	.secrel32	.LVUS28
	.byte	0
	.byte	0
	.uleb128 0x12
	.long	0x7f0
	.uleb128 0x13
	.long	0x1844
	.uleb128 0xb
	.ascii "vmul<float>\0"
	.byte	0x5f
	.ascii "_Z4vmulIfEvPKT_S2_PS0_y\0"
	.quad	.LFB35
	.quad	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.long	0x18e1
	.uleb128 0x3
	.ascii "T\0"
	.long	0xa8
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x5f
	.byte	0x2a
	.long	0x1849
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x5f
	.byte	0x43
	.long	0x1849
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "z\0"
	.byte	0x5f
	.byte	0x56
	.long	0x18e6
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x5f
	.byte	0x60
	.long	0x2ab
	.uleb128 0x1
	.byte	0x59
	.uleb128 0xa
	.quad	.LBB22
	.quad	.LBE22-.LBB22
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x60
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST26
	.secrel32	.LVUS26
	.byte	0
	.byte	0
	.uleb128 0x12
	.long	0xa8
	.uleb128 0x13
	.long	0x18e1
	.uleb128 0xb
	.ascii "saxpy_gather<float>\0"
	.byte	0x56
	.ascii "_Z12saxpy_gatherIfEvT_PKS0_PS0_PKiy\0"
	.quad	.LFB34
	.quad	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.long	0x1999
	.uleb128 0x3
	.ascii "T\0"
	.long	0xa8
	.uleb128 0x1
	.ascii "a\0"
	.byte	0x56
	.byte	0x1e
	.long	0xa8
	.uleb128 0x1
	.byte	0x61
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x56
	.byte	0x37
	.long	0x1849
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x56
	.byte	0x4a
	.long	0x18e6
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "idx\0"
	.byte	0x57
	.byte	0x3d
	.long	0xacb
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x7
	.ascii "n\0"
	.byte	0x57
	.byte	0x49
	.long	0x2ab
	.secrel32	.LLST23
	.secrel32	.LVUS23
	.uleb128 0x8
	.secrel32	.LLRL24
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x58
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST25
	.secrel32	.LVUS25
	.byte	0
	.byte	0
	.uleb128 0xb
	.ascii "saxpy_stride<float>\0"
	.byte	0x51
	.ascii "_Z12saxpy_strideIfEvT_PKS0_PS0_yy\0"
	.quad	.LFB33
	.quad	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.long	0x1a3e
	.uleb128 0x3
	.ascii "T\0"
	.long	0xa8
	.uleb128 0x1
	.ascii "a\0"
	.byte	0x51
	.byte	0x1e
	.long	0xa8
	.uleb128 0x1
	.byte	0x61
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x51
	.byte	0x37
	.long	0x1849
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x51
	.byte	0x4a
	.long	0x18e6
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x51
	.byte	0x54
	.long	0x2ab
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x1
	.ascii "s\0"
	.byte	0x51
	.byte	0x5e
	.long	0x2ab
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x8
	.secrel32	.LLRL21
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x52
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST22
	.secrel32	.LVUS22
	.byte	0
	.byte	0
	.uleb128 0xb
	.ascii "saxpy<float>\0"
	.byte	0x4c
	.ascii "_Z5saxpyIfEvT_PKS0_PS0_y\0"
	.quad	.LFB32
	.quad	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.long	0x1ad3
	.uleb128 0x3
	.ascii "T\0"
	.long	0xa8
	.uleb128 0x1
	.ascii "a\0"
	.byte	0x4c
	.byte	0x17
	.long	0xa8
	.uleb128 0x1
	.byte	0x61
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x4c
	.byte	0x30
	.long	0x1849
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x4c
	.byte	0x43
	.long	0x18e6
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x4c
	.byte	0x4d
	.long	0x2ab
	.uleb128 0x1
	.byte	0x59
	.uleb128 0xa
	.quad	.LBB17
	.quad	.LBE17-.LBB17
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x4d
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST20
	.secrel32	.LVUS20
	.byte	0
	.byte	0
	.uleb128 0x6
	.ascii "dot_simd_acc<float>\0"
	.byte	0x3a
	.byte	0xc
	.ascii "_Z12dot_simd_accIfET_PKS0_S2_y\0"
	.long	0xa8
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0x1bd0
	.uleb128 0x3
	.ascii "T\0"
	.long	0xa8
	.uleb128 0x7
	.ascii "x\0"
	.byte	0x3a
	.byte	0x2f
	.long	0x1849
	.secrel32	.LLST13
	.secrel32	.LVUS13
	.uleb128 0x7
	.ascii "y\0"
	.byte	0x3a
	.byte	0x48
	.long	0x1849
	.secrel32	.LLST14
	.secrel32	.LVUS14
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x3a
	.byte	0x52
	.long	0x2ab
	.uleb128 0x1
	.byte	0x58
	.uleb128 0xc
	.ascii "W\0"
	.byte	0x3b
	.byte	0x16
	.long	0x2bb
	.byte	0x20
	.uleb128 0xf
	.ascii "acc\0"
	.byte	0x3c
	.long	0x1bd0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x3d
	.byte	0xc
	.long	0x2ab
	.secrel32	.LLST15
	.secrel32	.LVUS15
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x42
	.byte	0x7
	.long	0xa8
	.secrel32	.LLST16
	.secrel32	.LVUS16
	.uleb128 0x14
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.long	0x1bb8
	.uleb128 0x2
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x2ab
	.secrel32	.LLST17
	.secrel32	.LVUS17
	.byte	0
	.uleb128 0x8
	.secrel32	.LLRL18
	.uleb128 0x2
	.ascii "j\0"
	.byte	0x43
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST19
	.secrel32	.LVUS19
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0xa8
	.long	0x1be0
	.uleb128 0xe
	.long	0xb9
	.byte	0x1f
	.byte	0
	.uleb128 0x6
	.ascii "dot_simd<float>\0"
	.byte	0x2d
	.byte	0xc
	.ascii "_Z8dot_simdIfET_PKS0_S2_y\0"
	.long	0xa8
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.long	0x1c78
	.uleb128 0x3
	.ascii "T\0"
	.long	0xa8
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x2d
	.byte	0x2b
	.long	0x1849
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x2d
	.byte	0x44
	.long	0x1849
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x2d
	.byte	0x4e
	.long	0x2ab
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0xa8
	.secrel32	.LLST10
	.secrel32	.LVUS10
	.uleb128 0x8
	.secrel32	.LLRL11
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST12
	.secrel32	.LVUS12
	.byte	0
	.byte	0
	.uleb128 0x6
	.ascii "dot_multiacc<float>\0"
	.byte	0x1a
	.byte	0xc
	.ascii "_Z12dot_multiaccIfET_PKS0_S2_y\0"
	.long	0xa8
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0x1d75
	.uleb128 0x3
	.ascii "T\0"
	.long	0xa8
	.uleb128 0x7
	.ascii "x\0"
	.byte	0x1a
	.byte	0x2f
	.long	0x1849
	.secrel32	.LLST3
	.secrel32	.LVUS3
	.uleb128 0x7
	.ascii "y\0"
	.byte	0x1a
	.byte	0x48
	.long	0x1849
	.secrel32	.LLST4
	.secrel32	.LVUS4
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x1a
	.byte	0x52
	.long	0x2ab
	.uleb128 0x1
	.byte	0x58
	.uleb128 0xc
	.ascii "K\0"
	.byte	0x1b
	.byte	0x16
	.long	0x2bb
	.byte	0x8
	.uleb128 0xf
	.ascii "acc\0"
	.byte	0x1c
	.long	0x1d75
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x1d
	.byte	0xc
	.long	0x2ab
	.secrel32	.LLST5
	.secrel32	.LVUS5
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x21
	.byte	0x7
	.long	0xa8
	.secrel32	.LLST6
	.secrel32	.LVUS6
	.uleb128 0x11
	.secrel32	.LLRL7
	.long	0x1d51
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x1f
	.byte	0x15
	.long	0x2ab
	.secrel32	.LLST8
	.secrel32	.LVUS8
	.byte	0
	.uleb128 0xa
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x22
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST9
	.secrel32	.LVUS9
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0xa8
	.long	0x1d85
	.uleb128 0xe
	.long	0xb9
	.byte	0x7
	.byte	0
	.uleb128 0x6
	.ascii "dot_strict<float>\0"
	.byte	0xe
	.byte	0xc
	.ascii "_Z10dot_strictIfET_PKS0_S2_y\0"
	.long	0xa8
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0x1e22
	.uleb128 0x3
	.ascii "T\0"
	.long	0xa8
	.uleb128 0x1
	.ascii "x\0"
	.byte	0xe
	.byte	0x2d
	.long	0x1849
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0xe
	.byte	0x46
	.long	0x1849
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0xe
	.byte	0x50
	.long	0x2ab
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.ascii "s\0"
	.byte	0xf
	.byte	0x7
	.long	0xa8
	.secrel32	.LLST0
	.secrel32	.LVUS0
	.uleb128 0x8
	.secrel32	.LLRL1
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x10
	.byte	0x11
	.long	0x2ab
	.secrel32	.LLST2
	.secrel32	.LVUS2
	.byte	0
	.byte	0
	.uleb128 0x9
	.byte	0x1
	.byte	0x2
	.ascii "bool\0"
	.uleb128 0x9
	.byte	0x2
	.byte	0x7
	.ascii "wchar_t\0"
	.uleb128 0x9
	.byte	0x2
	.byte	0x10
	.ascii "char16_t\0"
	.uleb128 0x9
	.byte	0x4
	.byte	0x10
	.ascii "char32_t\0"
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.byte	0
	.section	.debug_abbrev,"dr"
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x2f
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0x8
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 15
	.uleb128 0x6e
	.uleb128 0x8
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x6c
	.uleb128 0x19
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 7
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x88
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 55
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x88
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0x8
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x88
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"dr"
	.long	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.word	0x5
	.byte	0x8
	.byte	0
	.long	0
.Ldebug_loc0:
.LVUS103:
	.uleb128 0
	.uleb128 .LVU926
	.uleb128 .LVU926
	.uleb128 .LVU964
	.uleb128 .LVU964
	.uleb128 0
.LLST103:
	.byte	0x6
	.quad	.LVL304
	.byte	0x4
	.uleb128 .LVL304-.LVL304
	.uleb128 .LVL332-.LVL304
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL332-.LVL304
	.uleb128 .LVL344-.LVL304
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL344-.LVL304
	.uleb128 .LFE62-.LVL304
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS104:
	.uleb128 0
	.uleb128 .LVU842
	.uleb128 .LVU842
	.uleb128 0
.LLST104:
	.byte	0x6
	.quad	.LVL304
	.byte	0x4
	.uleb128 .LVL304-.LVL304
	.uleb128 .LVL306-.LVL304
	.uleb128 0x1
	.byte	0x62
	.byte	0x4
	.uleb128 .LVL306-.LVL304
	.uleb128 .LFE62-.LVL304
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x12
	.uleb128 0x9e
	.byte	0x9f
	.byte	0
.LVUS105:
	.uleb128 0
	.uleb128 .LVU843
	.uleb128 .LVU843
	.uleb128 0
.LLST105:
	.byte	0x6
	.quad	.LVL304
	.byte	0x4
	.uleb128 .LVL304-.LVL304
	.uleb128 .LVL307-.LVL304
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL307-.LVL304
	.uleb128 .LFE62-.LVL304
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x13
	.uleb128 0x9e
	.byte	0x9f
	.byte	0
.LVUS106:
	.uleb128 .LVU875
	.uleb128 0
.LLST106:
	.byte	0x8
	.quad	.LVL317
	.uleb128 .LFE62-.LVL317
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LVUS107:
	.uleb128 .LVU875
	.uleb128 0
.LLST107:
	.byte	0x8
	.quad	.LVL317
	.uleb128 .LFE62-.LVL317
	.uleb128 0x1
	.byte	0x63
	.byte	0
.LVUS108:
	.uleb128 .LVU926
	.uleb128 .LVU928
	.uleb128 .LVU928
	.uleb128 0
.LLST108:
	.byte	0x6
	.quad	.LVL332
	.byte	0x4
	.uleb128 .LVL332-.LVL332
	.uleb128 .LVL332-.LVL332
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.byte	0x4
	.uleb128 .LVL332-.LVL332
	.uleb128 .LFE62-.LVL332
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS110:
	.uleb128 .LVU832
	.uleb128 .LVU834
	.uleb128 .LVU834
	.uleb128 .LVU836
	.uleb128 .LVU836
	.uleb128 .LVU847
	.uleb128 .LVU847
	.uleb128 .LVU850
	.uleb128 .LVU850
	.uleb128 .LVU853
	.uleb128 .LVU853
	.uleb128 .LVU856
	.uleb128 .LVU856
	.uleb128 .LVU859
	.uleb128 .LVU859
	.uleb128 .LVU862
	.uleb128 .LVU862
	.uleb128 .LVU865
	.uleb128 .LVU865
	.uleb128 .LVU868
	.uleb128 .LVU868
	.uleb128 .LVU871
	.uleb128 .LVU871
	.uleb128 .LVU874
	.uleb128 .LVU874
	.uleb128 0
.LLST110:
	.byte	0x6
	.quad	.LVL305
	.byte	0x4
	.uleb128 .LVL305-.LVL305
	.uleb128 .LVL305-.LVL305
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL305-.LVL305
	.uleb128 .LVL305-.LVL305
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL305-.LVL305
	.uleb128 .LVL308-.LVL305
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL308-.LVL305
	.uleb128 .LVL309-.LVL305
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL309-.LVL305
	.uleb128 .LVL310-.LVL305
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL310-.LVL305
	.uleb128 .LVL311-.LVL305
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL311-.LVL305
	.uleb128 .LVL312-.LVL305
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL312-.LVL305
	.uleb128 .LVL313-.LVL305
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL313-.LVL305
	.uleb128 .LVL314-.LVL305
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL314-.LVL305
	.uleb128 .LVL315-.LVL305
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL315-.LVL305
	.uleb128 .LVL316-.LVL305
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL316-.LVL305
	.uleb128 .LVL317-.LVL305
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL317-.LVL305
	.uleb128 .LFE62-.LVL305
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS112:
	.uleb128 .LVU875
	.uleb128 .LVU878
	.uleb128 .LVU878
	.uleb128 .LVU881
	.uleb128 .LVU881
	.uleb128 .LVU925
	.uleb128 .LVU925
	.uleb128 .LVU926
.LLST112:
	.byte	0x6
	.quad	.LVL317
	.byte	0x4
	.uleb128 .LVL317-.LVL317
	.uleb128 .LVL318-.LVL317
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL318-.LVL317
	.uleb128 .LVL319-.LVL317
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL319-.LVL317
	.uleb128 .LVL331-.LVL317
	.uleb128 0x3
	.byte	0x71
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL331-.LVL317
	.uleb128 .LVL332-.LVL317
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS114:
	.uleb128 .LVU878
	.uleb128 .LVU884
	.uleb128 .LVU884
	.uleb128 .LVU888
	.uleb128 .LVU888
	.uleb128 .LVU892
	.uleb128 .LVU892
	.uleb128 .LVU896
	.uleb128 .LVU896
	.uleb128 .LVU900
	.uleb128 .LVU900
	.uleb128 .LVU904
	.uleb128 .LVU904
	.uleb128 .LVU908
	.uleb128 .LVU908
	.uleb128 .LVU911
	.uleb128 .LVU911
	.uleb128 .LVU914
	.uleb128 .LVU914
	.uleb128 .LVU917
	.uleb128 .LVU917
	.uleb128 .LVU920
	.uleb128 .LVU920
	.uleb128 .LVU923
	.uleb128 .LVU923
	.uleb128 .LVU926
.LLST114:
	.byte	0x6
	.quad	.LVL318
	.byte	0x4
	.uleb128 .LVL318-.LVL318
	.uleb128 .LVL320-.LVL318
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL320-.LVL318
	.uleb128 .LVL321-.LVL318
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL321-.LVL318
	.uleb128 .LVL322-.LVL318
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL322-.LVL318
	.uleb128 .LVL323-.LVL318
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL323-.LVL318
	.uleb128 .LVL324-.LVL318
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL324-.LVL318
	.uleb128 .LVL325-.LVL318
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL325-.LVL318
	.uleb128 .LVL326-.LVL318
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL326-.LVL318
	.uleb128 .LVL327-.LVL318
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL327-.LVL318
	.uleb128 .LVL328-.LVL318
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL328-.LVL318
	.uleb128 .LVL329-.LVL318
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL329-.LVL318
	.uleb128 .LVL330-.LVL318
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL330-.LVL318
	.uleb128 .LVL331-.LVL318
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL331-.LVL318
	.uleb128 .LVL332-.LVL318
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS116:
	.uleb128 .LVU926
	.uleb128 .LVU930
	.uleb128 .LVU930
	.uleb128 .LVU933
	.uleb128 .LVU933
	.uleb128 .LVU938
	.uleb128 .LVU938
	.uleb128 .LVU941
	.uleb128 .LVU941
	.uleb128 .LVU944
	.uleb128 .LVU944
	.uleb128 .LVU947
	.uleb128 .LVU947
	.uleb128 .LVU950
	.uleb128 .LVU950
	.uleb128 .LVU953
	.uleb128 .LVU953
	.uleb128 .LVU956
	.uleb128 .LVU956
	.uleb128 .LVU959
	.uleb128 .LVU959
	.uleb128 .LVU962
	.uleb128 .LVU962
	.uleb128 0
.LLST116:
	.byte	0x6
	.quad	.LVL332
	.byte	0x4
	.uleb128 .LVL332-.LVL332
	.uleb128 .LVL333-.LVL332
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL333-.LVL332
	.uleb128 .LVL334-.LVL332
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL334-.LVL332
	.uleb128 .LVL335-.LVL332
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL335-.LVL332
	.uleb128 .LVL336-.LVL332
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL336-.LVL332
	.uleb128 .LVL337-.LVL332
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL337-.LVL332
	.uleb128 .LVL338-.LVL332
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL338-.LVL332
	.uleb128 .LVL339-.LVL332
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL339-.LVL332
	.uleb128 .LVL340-.LVL332
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL340-.LVL332
	.uleb128 .LVL341-.LVL332
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL341-.LVL332
	.uleb128 .LVL342-.LVL332
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL342-.LVL332
	.uleb128 .LVL343-.LVL332
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL343-.LVL332
	.uleb128 .LFE62-.LVL332
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS89:
	.uleb128 0
	.uleb128 .LVU733
	.uleb128 .LVU733
	.uleb128 .LVU826
	.uleb128 .LVU826
	.uleb128 .LVU829
	.uleb128 .LVU829
	.uleb128 0
.LLST89:
	.byte	0x6
	.quad	.LVL270
	.byte	0x4
	.uleb128 .LVL270-.LVL270
	.uleb128 .LVL274-.LVL270
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL274-.LVL270
	.uleb128 .LVL302-.LVL270
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL302-.LVL270
	.uleb128 .LVL303-.LVL270
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL303-.LVL270
	.uleb128 .LFE61-.LVL270
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS90:
	.uleb128 0
	.uleb128 .LVU731
	.uleb128 .LVU731
	.uleb128 0
.LLST90:
	.byte	0x6
	.quad	.LVL270
	.byte	0x4
	.uleb128 .LVL270-.LVL270
	.uleb128 .LVL272-.LVL270
	.uleb128 0x1
	.byte	0x62
	.byte	0x4
	.uleb128 .LVL272-.LVL270
	.uleb128 .LFE61-.LVL270
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x12
	.uleb128 0xa8
	.byte	0x9f
	.byte	0
.LVUS91:
	.uleb128 0
	.uleb128 .LVU732
	.uleb128 .LVU732
	.uleb128 0
.LLST91:
	.byte	0x6
	.quad	.LVL270
	.byte	0x4
	.uleb128 .LVL270-.LVL270
	.uleb128 .LVL273-.LVL270
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL273-.LVL270
	.uleb128 .LFE61-.LVL270
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x13
	.uleb128 0xa8
	.byte	0x9f
	.byte	0
.LVUS92:
	.uleb128 .LVU736
	.uleb128 0
.LLST92:
	.byte	0x8
	.quad	.LVL275
	.uleb128 .LFE61-.LVL275
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LVUS93:
	.uleb128 .LVU736
	.uleb128 0
.LLST93:
	.byte	0x8
	.quad	.LVL275
	.uleb128 .LFE61-.LVL275
	.uleb128 0x1
	.byte	0x63
	.byte	0
.LVUS94:
	.uleb128 .LVU788
	.uleb128 .LVU790
	.uleb128 .LVU790
	.uleb128 .LVU829
.LLST94:
	.byte	0x6
	.quad	.LVL290
	.byte	0x4
	.uleb128 .LVL290-.LVL290
	.uleb128 .LVL290-.LVL290
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.byte	0x4
	.uleb128 .LVL290-.LVL290
	.uleb128 .LVL303-.LVL290
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS96:
	.uleb128 .LVU704
	.uleb128 .LVU706
	.uleb128 .LVU706
	.uleb128 .LVU708
	.uleb128 .LVU708
	.uleb128 .LVU710
	.uleb128 .LVU710
	.uleb128 .LVU712
	.uleb128 .LVU712
	.uleb128 .LVU714
	.uleb128 .LVU714
	.uleb128 .LVU716
	.uleb128 .LVU716
	.uleb128 .LVU718
	.uleb128 .LVU718
	.uleb128 .LVU720
	.uleb128 .LVU720
	.uleb128 .LVU722
	.uleb128 .LVU722
	.uleb128 .LVU724
	.uleb128 .LVU724
	.uleb128 .LVU726
	.uleb128 .LVU726
	.uleb128 .LVU735
	.uleb128 .LVU735
	.uleb128 0
.LLST96:
	.byte	0x6
	.quad	.LVL271
	.byte	0x4
	.uleb128 .LVL271-.LVL271
	.uleb128 .LVL271-.LVL271
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL271-.LVL271
	.uleb128 .LVL271-.LVL271
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL271-.LVL271
	.uleb128 .LVL271-.LVL271
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL271-.LVL271
	.uleb128 .LVL271-.LVL271
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL271-.LVL271
	.uleb128 .LVL271-.LVL271
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL271-.LVL271
	.uleb128 .LVL271-.LVL271
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL271-.LVL271
	.uleb128 .LVL271-.LVL271
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL271-.LVL271
	.uleb128 .LVL271-.LVL271
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL271-.LVL271
	.uleb128 .LVL271-.LVL271
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL271-.LVL271
	.uleb128 .LVL271-.LVL271
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL271-.LVL271
	.uleb128 .LVL271-.LVL271
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL271-.LVL271
	.uleb128 .LVL275-.LVL271
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL275-.LVL271
	.uleb128 .LFE61-.LVL271
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS98:
	.uleb128 .LVU736
	.uleb128 .LVU740
	.uleb128 .LVU740
	.uleb128 .LVU743
	.uleb128 .LVU743
	.uleb128 .LVU787
	.uleb128 .LVU787
	.uleb128 .LVU788
	.uleb128 .LVU829
	.uleb128 0
.LLST98:
	.byte	0x6
	.quad	.LVL275
	.byte	0x4
	.uleb128 .LVL275-.LVL275
	.uleb128 .LVL276-.LVL275
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL276-.LVL275
	.uleb128 .LVL277-.LVL275
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL277-.LVL275
	.uleb128 .LVL289-.LVL275
	.uleb128 0x3
	.byte	0x71
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL289-.LVL275
	.uleb128 .LVL290-.LVL275
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL303-.LVL275
	.uleb128 .LFE61-.LVL275
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS100:
	.uleb128 .LVU740
	.uleb128 .LVU746
	.uleb128 .LVU746
	.uleb128 .LVU750
	.uleb128 .LVU750
	.uleb128 .LVU754
	.uleb128 .LVU754
	.uleb128 .LVU758
	.uleb128 .LVU758
	.uleb128 .LVU762
	.uleb128 .LVU762
	.uleb128 .LVU766
	.uleb128 .LVU766
	.uleb128 .LVU770
	.uleb128 .LVU770
	.uleb128 .LVU773
	.uleb128 .LVU773
	.uleb128 .LVU776
	.uleb128 .LVU776
	.uleb128 .LVU779
	.uleb128 .LVU779
	.uleb128 .LVU782
	.uleb128 .LVU782
	.uleb128 .LVU785
	.uleb128 .LVU785
	.uleb128 .LVU788
.LLST100:
	.byte	0x6
	.quad	.LVL276
	.byte	0x4
	.uleb128 .LVL276-.LVL276
	.uleb128 .LVL278-.LVL276
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL278-.LVL276
	.uleb128 .LVL279-.LVL276
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL279-.LVL276
	.uleb128 .LVL280-.LVL276
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL280-.LVL276
	.uleb128 .LVL281-.LVL276
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL281-.LVL276
	.uleb128 .LVL282-.LVL276
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL282-.LVL276
	.uleb128 .LVL283-.LVL276
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL283-.LVL276
	.uleb128 .LVL284-.LVL276
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL284-.LVL276
	.uleb128 .LVL285-.LVL276
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL285-.LVL276
	.uleb128 .LVL286-.LVL276
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL286-.LVL276
	.uleb128 .LVL287-.LVL276
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL287-.LVL276
	.uleb128 .LVL288-.LVL276
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL288-.LVL276
	.uleb128 .LVL289-.LVL276
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL289-.LVL276
	.uleb128 .LVL290-.LVL276
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS102:
	.uleb128 .LVU788
	.uleb128 .LVU792
	.uleb128 .LVU792
	.uleb128 .LVU795
	.uleb128 .LVU795
	.uleb128 .LVU800
	.uleb128 .LVU800
	.uleb128 .LVU803
	.uleb128 .LVU803
	.uleb128 .LVU806
	.uleb128 .LVU806
	.uleb128 .LVU809
	.uleb128 .LVU809
	.uleb128 .LVU812
	.uleb128 .LVU812
	.uleb128 .LVU815
	.uleb128 .LVU815
	.uleb128 .LVU818
	.uleb128 .LVU818
	.uleb128 .LVU821
	.uleb128 .LVU821
	.uleb128 .LVU824
	.uleb128 .LVU824
	.uleb128 .LVU829
.LLST102:
	.byte	0x6
	.quad	.LVL290
	.byte	0x4
	.uleb128 .LVL290-.LVL290
	.uleb128 .LVL291-.LVL290
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL291-.LVL290
	.uleb128 .LVL292-.LVL290
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL292-.LVL290
	.uleb128 .LVL293-.LVL290
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL293-.LVL290
	.uleb128 .LVL294-.LVL290
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL294-.LVL290
	.uleb128 .LVL295-.LVL290
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL295-.LVL290
	.uleb128 .LVL296-.LVL290
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL296-.LVL290
	.uleb128 .LVL297-.LVL290
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL297-.LVL290
	.uleb128 .LVL298-.LVL290
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL298-.LVL290
	.uleb128 .LVL299-.LVL290
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL299-.LVL290
	.uleb128 .LVL300-.LVL290
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL300-.LVL290
	.uleb128 .LVL301-.LVL290
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL301-.LVL290
	.uleb128 .LVL303-.LVL290
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS87:
	.uleb128 0
	.uleb128 .LVU681
	.uleb128 .LVU681
	.uleb128 0
.LLST87:
	.byte	0x6
	.quad	.LVL261
	.byte	0x4
	.uleb128 .LVL261-.LVL261
	.uleb128 .LVL266-.LVL261
	.uleb128 0x2
	.byte	0x72
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL266-.LVL261
	.uleb128 .LFE58-.LVL261
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.byte	0
.LVUS88:
	.uleb128 .LVU671
	.uleb128 .LVU673
	.uleb128 .LVU673
	.uleb128 .LVU676
	.uleb128 .LVU676
	.uleb128 .LVU679
	.uleb128 .LVU679
	.uleb128 .LVU681
	.uleb128 .LVU681
	.uleb128 .LVU682
.LLST88:
	.byte	0x6
	.quad	.LVL262
	.byte	0x4
	.uleb128 .LVL262-.LVL262
	.uleb128 .LVL263-.LVL262
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL263-.LVL262
	.uleb128 .LVL264-.LVL262
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL264-.LVL262
	.uleb128 .LVL265-.LVL262
	.uleb128 0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL265-.LVL262
	.uleb128 .LVL266-.LVL262
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL266-.LVL262
	.uleb128 .LVL267-.LVL262
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS86:
	.uleb128 .LVU658
	.uleb128 .LVU660
	.uleb128 .LVU660
	.uleb128 .LVU664
.LLST86:
	.byte	0x6
	.quad	.LVL257
	.byte	0x4
	.uleb128 .LVL257-.LVL257
	.uleb128 .LVL258-.LVL257
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL258-.LVL257
	.uleb128 .LVL260-.LVL257
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS83:
	.uleb128 0
	.uleb128 .LVU654
	.uleb128 .LVU654
	.uleb128 0
.LLST83:
	.byte	0x6
	.quad	.LVL251
	.byte	0x4
	.uleb128 .LVL251-.LVL251
	.uleb128 .LVL255-.LVL251
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.byte	0x4
	.uleb128 .LVL255-.LVL251
	.uleb128 .LFE56-.LVL251
	.uleb128 0x1
	.byte	0x5b
	.byte	0
.LVUS85:
	.uleb128 .LVU645
	.uleb128 .LVU649
	.uleb128 .LVU649
	.uleb128 .LVU654
.LLST85:
	.byte	0x6
	.quad	.LVL252
	.byte	0x4
	.uleb128 .LVL252-.LVL252
	.uleb128 .LVL253-.LVL252
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL253-.LVL252
	.uleb128 .LVL255-.LVL252
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS80:
	.uleb128 0
	.uleb128 .LVU626
	.uleb128 .LVU626
	.uleb128 .LVU632
	.uleb128 .LVU632
	.uleb128 .LVU634
	.uleb128 .LVU634
	.uleb128 0
.LLST80:
	.byte	0x6
	.quad	.LVL241
	.byte	0x4
	.uleb128 .LVL241-.LVL241
	.uleb128 .LVL243-.LVL241
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL243-.LVL241
	.uleb128 .LVL246-.LVL241
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL246-.LVL241
	.uleb128 .LVL247-.LVL241
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL247-.LVL241
	.uleb128 .LFE55-.LVL241
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LVUS82:
	.uleb128 .LVU622
	.uleb128 .LVU626
	.uleb128 .LVU626
	.uleb128 .LVU630
	.uleb128 .LVU632
	.uleb128 .LVU636
	.uleb128 .LVU636
	.uleb128 .LVU638
	.uleb128 .LVU638
	.uleb128 .LVU641
	.uleb128 .LVU641
	.uleb128 0
.LLST82:
	.byte	0x6
	.quad	.LVL242
	.byte	0x4
	.uleb128 .LVL242-.LVL242
	.uleb128 .LVL243-.LVL242
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL243-.LVL242
	.uleb128 .LVL245-.LVL242
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL246-.LVL242
	.uleb128 .LVL248-.LVL242
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL248-.LVL242
	.uleb128 .LVL249-.LVL242
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL249-.LVL242
	.uleb128 .LVL250-.LVL242
	.uleb128 0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL250-.LVL242
	.uleb128 .LFE55-.LVL242
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS79:
	.uleb128 .LVU612
	.uleb128 .LVU614
	.uleb128 .LVU614
	.uleb128 .LVU618
.LLST79:
	.byte	0x6
	.quad	.LVL237
	.byte	0x4
	.uleb128 .LVL237-.LVL237
	.uleb128 .LVL238-.LVL237
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL238-.LVL237
	.uleb128 .LVL240-.LVL237
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS72:
	.uleb128 0
	.uleb128 .LVU578
	.uleb128 .LVU578
	.uleb128 0
.LLST72:
	.byte	0x6
	.quad	.LVL218
	.byte	0x4
	.uleb128 .LVL218-.LVL218
	.uleb128 .LVL220-.LVL218
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL220-.LVL218
	.uleb128 .LFE53-.LVL218
	.uleb128 0x1
	.byte	0x5b
	.byte	0
.LVUS73:
	.uleb128 0
	.uleb128 .LVU581
	.uleb128 .LVU581
	.uleb128 .LVU592
	.uleb128 .LVU592
	.uleb128 .LVU594
	.uleb128 .LVU594
	.uleb128 .LVU608
	.uleb128 .LVU608
	.uleb128 0
.LLST73:
	.byte	0x6
	.quad	.LVL218
	.byte	0x4
	.uleb128 .LVL218-.LVL218
	.uleb128 .LVL222-.LVL218
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL222-.LVL218
	.uleb128 .LVL226-.LVL218
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL226-.LVL218
	.uleb128 .LVL227-.LVL218
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL227-.LVL218
	.uleb128 .LVL234-.LVL218
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL234-.LVL218
	.uleb128 .LFE53-.LVL218
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LVUS74:
	.uleb128 .LVU580
	.uleb128 .LVU581
	.uleb128 .LVU581
	.uleb128 .LVU587
	.uleb128 .LVU587
	.uleb128 .LVU591
	.uleb128 .LVU591
	.uleb128 .LVU592
	.uleb128 .LVU592
	.uleb128 .LVU594
	.uleb128 .LVU600
	.uleb128 .LVU604
	.uleb128 .LVU604
	.uleb128 .LVU606
	.uleb128 .LVU606
	.uleb128 .LVU609
.LLST74:
	.byte	0x6
	.quad	.LVL221
	.byte	0x4
	.uleb128 .LVL221-.LVL221
	.uleb128 .LVL222-.LVL221
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL222-.LVL221
	.uleb128 .LVL224-.LVL221
	.uleb128 0x3
	.byte	0x74
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL224-.LVL221
	.uleb128 .LVL225-.LVL221
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL225-.LVL221
	.uleb128 .LVL226-.LVL221
	.uleb128 0x3
	.byte	0x70
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL226-.LVL221
	.uleb128 .LVL227-.LVL221
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL231-.LVL221
	.uleb128 .LVL232-.LVL221
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL232-.LVL221
	.uleb128 .LVL233-.LVL221
	.uleb128 0x3
	.byte	0x74
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL233-.LVL221
	.uleb128 .LVL235-.LVL221
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LVUS75:
	.uleb128 .LVU594
	.uleb128 .LVU596
	.uleb128 .LVU596
	.uleb128 0
.LLST75:
	.byte	0x6
	.quad	.LVL227
	.byte	0x4
	.uleb128 .LVL227-.LVL227
	.uleb128 .LVL228-.LVL227
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL228-.LVL227
	.uleb128 .LFE53-.LVL227
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS76:
	.uleb128 .LVU581
	.uleb128 .LVU582
.LLST76:
	.byte	0x8
	.quad	.LVL222
	.uleb128 .LVL223-.LVL222
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS78:
	.uleb128 .LVU594
	.uleb128 .LVU596
.LLST78:
	.byte	0x8
	.quad	.LVL227
	.uleb128 .LVL228-.LVL227
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS69:
	.uleb128 .LVU561
	.uleb128 .LVU564
	.uleb128 .LVU564
	.uleb128 .LVU571
	.uleb128 .LVU571
	.uleb128 0
.LLST69:
	.byte	0x6
	.quad	.LVL212
	.byte	0x4
	.uleb128 .LVL212-.LVL212
	.uleb128 .LVL213-.LVL212
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL213-.LVL212
	.uleb128 .LVL217-.LVL212
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL217-.LVL212
	.uleb128 .LFE52-.LVL212
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS71:
	.uleb128 .LVU561
	.uleb128 .LVU564
	.uleb128 .LVU564
	.uleb128 .LVU566
	.uleb128 .LVU566
	.uleb128 .LVU568
	.uleb128 .LVU568
	.uleb128 .LVU570
	.uleb128 .LVU571
	.uleb128 0
.LLST71:
	.byte	0x6
	.quad	.LVL212
	.byte	0x4
	.uleb128 .LVL212-.LVL212
	.uleb128 .LVL213-.LVL212
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL213-.LVL212
	.uleb128 .LVL214-.LVL212
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL214-.LVL212
	.uleb128 .LVL215-.LVL212
	.uleb128 0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL215-.LVL212
	.uleb128 .LVL216-.LVL212
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL217-.LVL212
	.uleb128 .LFE52-.LVL212
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS61:
	.uleb128 0
	.uleb128 .LVU482
	.uleb128 .LVU482
	.uleb128 .LVU484
	.uleb128 .LVU484
	.uleb128 .LVU553
	.uleb128 .LVU553
	.uleb128 .LVU555
	.uleb128 .LVU555
	.uleb128 .LVU556
	.uleb128 .LVU556
	.uleb128 0
.LLST61:
	.byte	0x6
	.quad	.LVL181
	.byte	0x4
	.uleb128 .LVL181-.LVL181
	.uleb128 .LVL184-.LVL181
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL184-.LVL181
	.uleb128 .LVL186-.LVL181
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL186-.LVL181
	.uleb128 .LVL206-.LVL181
	.uleb128 0x1
	.byte	0x5d
	.byte	0x4
	.uleb128 .LVL206-.LVL181
	.uleb128 .LVL208-.LVL181
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL208-.LVL181
	.uleb128 .LVL209-.LVL181
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL209-.LVL181
	.uleb128 .LFE51-.LVL181
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LVUS62:
	.uleb128 0
	.uleb128 .LVU484
	.uleb128 .LVU484
	.uleb128 .LVU554
	.uleb128 .LVU554
	.uleb128 .LVU555
	.uleb128 .LVU555
	.uleb128 .LVU558
	.uleb128 .LVU558
	.uleb128 0
.LLST62:
	.byte	0x6
	.quad	.LVL181
	.byte	0x4
	.uleb128 .LVL181-.LVL181
	.uleb128 .LVL186-.LVL181
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL186-.LVL181
	.uleb128 .LVL207-.LVL181
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL207-.LVL181
	.uleb128 .LVL208-.LVL181
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL208-.LVL181
	.uleb128 .LVL210-.LVL181
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL210-.LVL181
	.uleb128 .LFE51-.LVL181
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LVUS63:
	.uleb128 0
	.uleb128 .LVU483
	.uleb128 .LVU483
	.uleb128 .LVU552
	.uleb128 .LVU552
	.uleb128 .LVU555
	.uleb128 .LVU555
	.uleb128 0
.LLST63:
	.byte	0x6
	.quad	.LVL181
	.byte	0x4
	.uleb128 .LVL181-.LVL181
	.uleb128 .LVL185-.LVL181
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL185-.LVL181
	.uleb128 .LVL205-.LVL181
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL205-.LVL181
	.uleb128 .LVL208-.LVL181
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL208-.LVL181
	.uleb128 .LFE51-.LVL181
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LVUS64:
	.uleb128 .LVU481
	.uleb128 .LVU484
	.uleb128 .LVU544
	.uleb128 .LVU548
	.uleb128 .LVU548
	.uleb128 .LVU550
	.uleb128 .LVU550
	.uleb128 .LVU555
	.uleb128 .LVU555
	.uleb128 0
.LLST64:
	.byte	0x6
	.quad	.LVL183
	.byte	0x4
	.uleb128 .LVL183-.LVL183
	.uleb128 .LVL186-.LVL183
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL202-.LVL183
	.uleb128 .LVL203-.LVL183
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL203-.LVL183
	.uleb128 .LVL204-.LVL183
	.uleb128 0x3
	.byte	0x71
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL204-.LVL183
	.uleb128 .LVL208-.LVL183
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL208-.LVL183
	.uleb128 .LFE51-.LVL183
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS65:
	.uleb128 .LVU519
	.uleb128 .LVU521
	.uleb128 .LVU521
	.uleb128 .LVU555
.LLST65:
	.byte	0x6
	.quad	.LVL195
	.byte	0x4
	.uleb128 .LVL195-.LVL195
	.uleb128 .LVL195-.LVL195
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL195-.LVL195
	.uleb128 .LVL208-.LVL195
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS67:
	.uleb128 .LVU484
	.uleb128 .LVU489
	.uleb128 .LVU489
	.uleb128 .LVU493
	.uleb128 .LVU493
	.uleb128 .LVU497
	.uleb128 .LVU497
	.uleb128 .LVU501
	.uleb128 .LVU501
	.uleb128 .LVU505
	.uleb128 .LVU505
	.uleb128 .LVU509
	.uleb128 .LVU509
	.uleb128 .LVU513
	.uleb128 .LVU513
	.uleb128 .LVU517
	.uleb128 .LVU517
	.uleb128 .LVU519
.LLST67:
	.byte	0x6
	.quad	.LVL186
	.byte	0x4
	.uleb128 .LVL186-.LVL186
	.uleb128 .LVL187-.LVL186
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL187-.LVL186
	.uleb128 .LVL188-.LVL186
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL188-.LVL186
	.uleb128 .LVL189-.LVL186
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL189-.LVL186
	.uleb128 .LVL190-.LVL186
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL190-.LVL186
	.uleb128 .LVL191-.LVL186
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL191-.LVL186
	.uleb128 .LVL192-.LVL186
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL192-.LVL186
	.uleb128 .LVL193-.LVL186
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL193-.LVL186
	.uleb128 .LVL194-.LVL186
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL194-.LVL186
	.uleb128 .LVL195-.LVL186
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0
.LVUS68:
	.uleb128 .LVU519
	.uleb128 .LVU522
	.uleb128 .LVU522
	.uleb128 .LVU525
	.uleb128 .LVU525
	.uleb128 .LVU528
	.uleb128 .LVU528
	.uleb128 .LVU531
	.uleb128 .LVU531
	.uleb128 .LVU534
	.uleb128 .LVU534
	.uleb128 .LVU537
	.uleb128 .LVU537
	.uleb128 .LVU540
	.uleb128 .LVU540
	.uleb128 .LVU543
	.uleb128 .LVU543
	.uleb128 .LVU555
.LLST68:
	.byte	0x6
	.quad	.LVL195
	.byte	0x4
	.uleb128 .LVL195-.LVL195
	.uleb128 .LVL195-.LVL195
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL195-.LVL195
	.uleb128 .LVL196-.LVL195
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL196-.LVL195
	.uleb128 .LVL197-.LVL195
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL197-.LVL195
	.uleb128 .LVL198-.LVL195
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL198-.LVL195
	.uleb128 .LVL199-.LVL195
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL199-.LVL195
	.uleb128 .LVL200-.LVL195
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL200-.LVL195
	.uleb128 .LVL201-.LVL195
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL201-.LVL195
	.uleb128 .LVL202-.LVL195
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL202-.LVL195
	.uleb128 .LVL208-.LVL195
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0
.LVUS58:
	.uleb128 .LVU464
	.uleb128 .LVU467
	.uleb128 .LVU467
	.uleb128 .LVU474
	.uleb128 .LVU474
	.uleb128 0
.LLST58:
	.byte	0x6
	.quad	.LVL175
	.byte	0x4
	.uleb128 .LVL175-.LVL175
	.uleb128 .LVL176-.LVL175
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL176-.LVL175
	.uleb128 .LVL180-.LVL175
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL180-.LVL175
	.uleb128 .LFE50-.LVL175
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS60:
	.uleb128 .LVU464
	.uleb128 .LVU467
	.uleb128 .LVU467
	.uleb128 .LVU469
	.uleb128 .LVU469
	.uleb128 .LVU471
	.uleb128 .LVU471
	.uleb128 .LVU473
	.uleb128 .LVU474
	.uleb128 0
.LLST60:
	.byte	0x6
	.quad	.LVL175
	.byte	0x4
	.uleb128 .LVL175-.LVL175
	.uleb128 .LVL176-.LVL175
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL176-.LVL175
	.uleb128 .LVL177-.LVL175
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL177-.LVL175
	.uleb128 .LVL178-.LVL175
	.uleb128 0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL178-.LVL175
	.uleb128 .LVL179-.LVL175
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL180-.LVL175
	.uleb128 .LFE50-.LVL175
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS56:
	.uleb128 0
	.uleb128 .LVU442
	.uleb128 .LVU442
	.uleb128 0
.LLST56:
	.byte	0x6
	.quad	.LVL165
	.byte	0x4
	.uleb128 .LVL165-.LVL165
	.uleb128 .LVL170-.LVL165
	.uleb128 0x2
	.byte	0x72
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL170-.LVL165
	.uleb128 .LFE47-.LVL165
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.byte	0
.LVUS57:
	.uleb128 .LVU433
	.uleb128 .LVU435
	.uleb128 .LVU435
	.uleb128 .LVU438
	.uleb128 .LVU438
	.uleb128 .LVU440
	.uleb128 .LVU440
	.uleb128 .LVU442
	.uleb128 .LVU442
	.uleb128 .LVU443
.LLST57:
	.byte	0x6
	.quad	.LVL166
	.byte	0x4
	.uleb128 .LVL166-.LVL166
	.uleb128 .LVL167-.LVL166
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL167-.LVL166
	.uleb128 .LVL168-.LVL166
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL168-.LVL166
	.uleb128 .LVL169-.LVL166
	.uleb128 0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL169-.LVL166
	.uleb128 .LVL170-.LVL166
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL170-.LVL166
	.uleb128 .LVL171-.LVL166
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS55:
	.uleb128 .LVU420
	.uleb128 .LVU422
	.uleb128 .LVU422
	.uleb128 .LVU426
.LLST55:
	.byte	0x6
	.quad	.LVL161
	.byte	0x4
	.uleb128 .LVL161-.LVL161
	.uleb128 .LVL162-.LVL161
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL162-.LVL161
	.uleb128 .LVL164-.LVL161
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS52:
	.uleb128 0
	.uleb128 .LVU416
	.uleb128 .LVU416
	.uleb128 0
.LLST52:
	.byte	0x6
	.quad	.LVL155
	.byte	0x4
	.uleb128 .LVL155-.LVL155
	.uleb128 .LVL159-.LVL155
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.byte	0x4
	.uleb128 .LVL159-.LVL155
	.uleb128 .LFE45-.LVL155
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LVUS54:
	.uleb128 .LVU406
	.uleb128 .LVU410
	.uleb128 .LVU410
	.uleb128 .LVU416
.LLST54:
	.byte	0x6
	.quad	.LVL156
	.byte	0x4
	.uleb128 .LVL156-.LVL156
	.uleb128 .LVL157-.LVL156
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL157-.LVL156
	.uleb128 .LVL159-.LVL156
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS51:
	.uleb128 .LVU384
	.uleb128 .LVU386
	.uleb128 .LVU386
	.uleb128 .LVU391
	.uleb128 .LVU393
	.uleb128 .LVU396
	.uleb128 .LVU396
	.uleb128 .LVU398
	.uleb128 .LVU398
	.uleb128 .LVU402
	.uleb128 .LVU402
	.uleb128 0
.LLST51:
	.byte	0x6
	.quad	.LVL147
	.byte	0x4
	.uleb128 .LVL147-.LVL147
	.uleb128 .LVL148-.LVL147
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL148-.LVL147
	.uleb128 .LVL150-.LVL147
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL151-.LVL147
	.uleb128 .LVL152-.LVL147
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL152-.LVL147
	.uleb128 .LVL153-.LVL147
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL153-.LVL147
	.uleb128 .LVL154-.LVL147
	.uleb128 0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL154-.LVL147
	.uleb128 .LFE44-.LVL147
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS49:
	.uleb128 .LVU373
	.uleb128 .LVU375
	.uleb128 .LVU375
	.uleb128 .LVU380
.LLST49:
	.byte	0x6
	.quad	.LVL142
	.byte	0x4
	.uleb128 .LVL142-.LVL142
	.uleb128 .LVL143-.LVL142
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL143-.LVL142
	.uleb128 .LVL145-.LVL142
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS42:
	.uleb128 0
	.uleb128 .LVU342
	.uleb128 .LVU342
	.uleb128 0
.LLST42:
	.byte	0x6
	.quad	.LVL124
	.byte	0x4
	.uleb128 .LVL124-.LVL124
	.uleb128 .LVL127-.LVL124
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL127-.LVL124
	.uleb128 .LFE42-.LVL124
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LVUS43:
	.uleb128 0
	.uleb128 .LVU340
	.uleb128 .LVU340
	.uleb128 0
.LLST43:
	.byte	0x6
	.quad	.LVL124
	.byte	0x4
	.uleb128 .LVL124-.LVL124
	.uleb128 .LVL126-.LVL124
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL126-.LVL124
	.uleb128 .LFE42-.LVL124
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LVUS44:
	.uleb128 .LVU343
	.uleb128 .LVU344
	.uleb128 .LVU344
	.uleb128 .LVU350
	.uleb128 .LVU350
	.uleb128 .LVU354
	.uleb128 .LVU354
	.uleb128 .LVU355
	.uleb128 .LVU355
	.uleb128 .LVU357
	.uleb128 .LVU363
	.uleb128 .LVU367
	.uleb128 .LVU367
	.uleb128 .LVU369
	.uleb128 .LVU369
	.uleb128 0
.LLST44:
	.byte	0x6
	.quad	.LVL128
	.byte	0x4
	.uleb128 .LVL128-.LVL128
	.uleb128 .LVL129-.LVL128
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL129-.LVL128
	.uleb128 .LVL131-.LVL128
	.uleb128 0x3
	.byte	0x7b
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL131-.LVL128
	.uleb128 .LVL132-.LVL128
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL132-.LVL128
	.uleb128 .LVL133-.LVL128
	.uleb128 0x3
	.byte	0x70
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL133-.LVL128
	.uleb128 .LVL134-.LVL128
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL138-.LVL128
	.uleb128 .LVL139-.LVL128
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL139-.LVL128
	.uleb128 .LVL140-.LVL128
	.uleb128 0x3
	.byte	0x7b
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL140-.LVL128
	.uleb128 .LFE42-.LVL128
	.uleb128 0x1
	.byte	0x5b
	.byte	0
.LVUS45:
	.uleb128 .LVU357
	.uleb128 .LVU359
	.uleb128 .LVU359
	.uleb128 0
.LLST45:
	.byte	0x6
	.quad	.LVL134
	.byte	0x4
	.uleb128 .LVL134-.LVL134
	.uleb128 .LVL135-.LVL134
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0x4
	.uleb128 .LVL135-.LVL134
	.uleb128 .LFE42-.LVL134
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS46:
	.uleb128 .LVU344
	.uleb128 .LVU345
.LLST46:
	.byte	0x8
	.quad	.LVL129
	.uleb128 .LVL130-.LVL129
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS48:
	.uleb128 .LVU357
	.uleb128 .LVU359
.LLST48:
	.byte	0x8
	.quad	.LVL134
	.uleb128 .LVL135-.LVL134
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS39:
	.uleb128 .LVU324
	.uleb128 .LVU327
	.uleb128 .LVU327
	.uleb128 .LVU333
	.uleb128 .LVU333
	.uleb128 0
.LLST39:
	.byte	0x6
	.quad	.LVL119
	.byte	0x4
	.uleb128 .LVL119-.LVL119
	.uleb128 .LVL120-.LVL119
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0x4
	.uleb128 .LVL120-.LVL119
	.uleb128 .LVL123-.LVL119
	.uleb128 0x1
	.byte	0x62
	.byte	0x4
	.uleb128 .LVL123-.LVL119
	.uleb128 .LFE41-.LVL119
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0
.LVUS41:
	.uleb128 .LVU324
	.uleb128 .LVU327
	.uleb128 .LVU327
	.uleb128 .LVU329
	.uleb128 .LVU329
	.uleb128 .LVU331
	.uleb128 .LVU331
	.uleb128 .LVU333
	.uleb128 .LVU333
	.uleb128 0
.LLST41:
	.byte	0x6
	.quad	.LVL119
	.byte	0x4
	.uleb128 .LVL119-.LVL119
	.uleb128 .LVL120-.LVL119
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL120-.LVL119
	.uleb128 .LVL121-.LVL119
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL121-.LVL119
	.uleb128 .LVL122-.LVL119
	.uleb128 0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL122-.LVL119
	.uleb128 .LVL123-.LVL119
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL123-.LVL119
	.uleb128 .LFE41-.LVL119
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS32:
	.uleb128 0
	.uleb128 .LVU250
	.uleb128 .LVU250
	.uleb128 .LVU251
	.uleb128 .LVU251
	.uleb128 .LVU320
	.uleb128 .LVU320
	.uleb128 0
.LLST32:
	.byte	0x6
	.quad	.LVL93
	.byte	0x4
	.uleb128 .LVL93-.LVL93
	.uleb128 .LVL96-.LVL93
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL96-.LVL93
	.uleb128 .LVL97-.LVL93
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL97-.LVL93
	.uleb128 .LVL117-.LVL93
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL117-.LVL93
	.uleb128 .LFE40-.LVL93
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS33:
	.uleb128 0
	.uleb128 .LVU251
	.uleb128 .LVU251
	.uleb128 .LVU320
	.uleb128 .LVU320
	.uleb128 0
.LLST33:
	.byte	0x6
	.quad	.LVL93
	.byte	0x4
	.uleb128 .LVL93-.LVL93
	.uleb128 .LVL97-.LVL93
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL97-.LVL93
	.uleb128 .LVL117-.LVL93
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL117-.LVL93
	.uleb128 .LFE40-.LVL93
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS34:
	.uleb128 .LVU249
	.uleb128 .LVU251
	.uleb128 .LVU312
	.uleb128 .LVU316
	.uleb128 .LVU316
	.uleb128 .LVU318
	.uleb128 .LVU318
	.uleb128 .LVU320
	.uleb128 .LVU320
	.uleb128 0
.LLST34:
	.byte	0x6
	.quad	.LVL95
	.byte	0x4
	.uleb128 .LVL95-.LVL95
	.uleb128 .LVL97-.LVL95
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL114-.LVL95
	.uleb128 .LVL115-.LVL95
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL115-.LVL95
	.uleb128 .LVL116-.LVL95
	.uleb128 0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL116-.LVL95
	.uleb128 .LVL117-.LVL95
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL117-.LVL95
	.uleb128 .LFE40-.LVL95
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS35:
	.uleb128 .LVU286
	.uleb128 .LVU289
	.uleb128 .LVU289
	.uleb128 .LVU320
.LLST35:
	.byte	0x6
	.quad	.LVL106
	.byte	0x4
	.uleb128 .LVL106-.LVL106
	.uleb128 .LVL107-.LVL106
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0x4
	.uleb128 .LVL107-.LVL106
	.uleb128 .LVL117-.LVL106
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS37:
	.uleb128 .LVU251
	.uleb128 .LVU256
	.uleb128 .LVU256
	.uleb128 .LVU260
	.uleb128 .LVU260
	.uleb128 .LVU264
	.uleb128 .LVU264
	.uleb128 .LVU268
	.uleb128 .LVU268
	.uleb128 .LVU272
	.uleb128 .LVU272
	.uleb128 .LVU276
	.uleb128 .LVU276
	.uleb128 .LVU280
	.uleb128 .LVU280
	.uleb128 .LVU284
	.uleb128 .LVU284
	.uleb128 .LVU286
.LLST37:
	.byte	0x6
	.quad	.LVL97
	.byte	0x4
	.uleb128 .LVL97-.LVL97
	.uleb128 .LVL98-.LVL97
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL98-.LVL97
	.uleb128 .LVL99-.LVL97
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL99-.LVL97
	.uleb128 .LVL100-.LVL97
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL100-.LVL97
	.uleb128 .LVL101-.LVL97
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL101-.LVL97
	.uleb128 .LVL102-.LVL97
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL102-.LVL97
	.uleb128 .LVL103-.LVL97
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL103-.LVL97
	.uleb128 .LVL104-.LVL97
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL104-.LVL97
	.uleb128 .LVL105-.LVL97
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL105-.LVL97
	.uleb128 .LVL106-.LVL97
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0
.LVUS38:
	.uleb128 .LVU286
	.uleb128 .LVU290
	.uleb128 .LVU290
	.uleb128 .LVU293
	.uleb128 .LVU293
	.uleb128 .LVU296
	.uleb128 .LVU296
	.uleb128 .LVU299
	.uleb128 .LVU299
	.uleb128 .LVU302
	.uleb128 .LVU302
	.uleb128 .LVU305
	.uleb128 .LVU305
	.uleb128 .LVU308
	.uleb128 .LVU308
	.uleb128 .LVU311
	.uleb128 .LVU311
	.uleb128 .LVU320
.LLST38:
	.byte	0x6
	.quad	.LVL106
	.byte	0x4
	.uleb128 .LVL106-.LVL106
	.uleb128 .LVL107-.LVL106
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL107-.LVL106
	.uleb128 .LVL108-.LVL106
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL108-.LVL106
	.uleb128 .LVL109-.LVL106
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL109-.LVL106
	.uleb128 .LVL110-.LVL106
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL110-.LVL106
	.uleb128 .LVL111-.LVL106
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL111-.LVL106
	.uleb128 .LVL112-.LVL106
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL112-.LVL106
	.uleb128 .LVL113-.LVL106
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL113-.LVL106
	.uleb128 .LVL114-.LVL106
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL114-.LVL106
	.uleb128 .LVL117-.LVL106
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0
.LVUS29:
	.uleb128 .LVU233
	.uleb128 .LVU236
	.uleb128 .LVU236
	.uleb128 .LVU242
	.uleb128 .LVU242
	.uleb128 0
.LLST29:
	.byte	0x6
	.quad	.LVL88
	.byte	0x4
	.uleb128 .LVL88-.LVL88
	.uleb128 .LVL89-.LVL88
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0x4
	.uleb128 .LVL89-.LVL88
	.uleb128 .LVL92-.LVL88
	.uleb128 0x1
	.byte	0x62
	.byte	0x4
	.uleb128 .LVL92-.LVL88
	.uleb128 .LFE39-.LVL88
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0
.LVUS31:
	.uleb128 .LVU233
	.uleb128 .LVU236
	.uleb128 .LVU236
	.uleb128 .LVU238
	.uleb128 .LVU238
	.uleb128 .LVU240
	.uleb128 .LVU240
	.uleb128 .LVU242
	.uleb128 .LVU242
	.uleb128 0
.LLST31:
	.byte	0x6
	.quad	.LVL88
	.byte	0x4
	.uleb128 .LVL88-.LVL88
	.uleb128 .LVL89-.LVL88
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL89-.LVL88
	.uleb128 .LVL90-.LVL88
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL90-.LVL88
	.uleb128 .LVL91-.LVL88
	.uleb128 0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL91-.LVL88
	.uleb128 .LVL92-.LVL88
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL92-.LVL88
	.uleb128 .LFE39-.LVL88
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS27:
	.uleb128 0
	.uleb128 .LVU211
	.uleb128 .LVU211
	.uleb128 0
.LLST27:
	.byte	0x6
	.quad	.LVL78
	.byte	0x4
	.uleb128 .LVL78-.LVL78
	.uleb128 .LVL83-.LVL78
	.uleb128 0x2
	.byte	0x72
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL83-.LVL78
	.uleb128 .LFE36-.LVL78
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.byte	0
.LVUS28:
	.uleb128 .LVU202
	.uleb128 .LVU204
	.uleb128 .LVU204
	.uleb128 .LVU207
	.uleb128 .LVU207
	.uleb128 .LVU209
	.uleb128 .LVU209
	.uleb128 .LVU211
	.uleb128 .LVU211
	.uleb128 .LVU212
.LLST28:
	.byte	0x6
	.quad	.LVL79
	.byte	0x4
	.uleb128 .LVL79-.LVL79
	.uleb128 .LVL80-.LVL79
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL80-.LVL79
	.uleb128 .LVL81-.LVL79
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL81-.LVL79
	.uleb128 .LVL82-.LVL79
	.uleb128 0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL82-.LVL79
	.uleb128 .LVL83-.LVL79
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL83-.LVL79
	.uleb128 .LVL84-.LVL79
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS26:
	.uleb128 .LVU189
	.uleb128 .LVU191
	.uleb128 .LVU191
	.uleb128 .LVU195
.LLST26:
	.byte	0x6
	.quad	.LVL74
	.byte	0x4
	.uleb128 .LVL74-.LVL74
	.uleb128 .LVL75-.LVL74
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL75-.LVL74
	.uleb128 .LVL77-.LVL74
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS23:
	.uleb128 0
	.uleb128 .LVU185
	.uleb128 .LVU185
	.uleb128 0
.LLST23:
	.byte	0x6
	.quad	.LVL68
	.byte	0x4
	.uleb128 .LVL68-.LVL68
	.uleb128 .LVL72-.LVL68
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.byte	0x4
	.uleb128 .LVL72-.LVL68
	.uleb128 .LFE34-.LVL68
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LVUS25:
	.uleb128 .LVU175
	.uleb128 .LVU179
	.uleb128 .LVU179
	.uleb128 .LVU185
.LLST25:
	.byte	0x6
	.quad	.LVL69
	.byte	0x4
	.uleb128 .LVL69-.LVL69
	.uleb128 .LVL70-.LVL69
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL70-.LVL69
	.uleb128 .LVL72-.LVL69
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS22:
	.uleb128 .LVU153
	.uleb128 .LVU155
	.uleb128 .LVU155
	.uleb128 .LVU160
	.uleb128 .LVU162
	.uleb128 .LVU165
	.uleb128 .LVU165
	.uleb128 .LVU167
	.uleb128 .LVU167
	.uleb128 .LVU171
	.uleb128 .LVU171
	.uleb128 0
.LLST22:
	.byte	0x6
	.quad	.LVL60
	.byte	0x4
	.uleb128 .LVL60-.LVL60
	.uleb128 .LVL61-.LVL60
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL61-.LVL60
	.uleb128 .LVL63-.LVL60
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL64-.LVL60
	.uleb128 .LVL65-.LVL60
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL65-.LVL60
	.uleb128 .LVL66-.LVL60
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL66-.LVL60
	.uleb128 .LVL67-.LVL60
	.uleb128 0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL67-.LVL60
	.uleb128 .LFE33-.LVL60
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS20:
	.uleb128 .LVU142
	.uleb128 .LVU144
	.uleb128 .LVU144
	.uleb128 .LVU149
.LLST20:
	.byte	0x6
	.quad	.LVL55
	.byte	0x4
	.uleb128 .LVL55-.LVL55
	.uleb128 .LVL56-.LVL55
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL56-.LVL55
	.uleb128 .LVL58-.LVL55
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS13:
	.uleb128 0
	.uleb128 .LVU111
	.uleb128 .LVU111
	.uleb128 0
.LLST13:
	.byte	0x6
	.quad	.LVL37
	.byte	0x4
	.uleb128 .LVL37-.LVL37
	.uleb128 .LVL40-.LVL37
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL40-.LVL37
	.uleb128 .LFE31-.LVL37
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LVUS14:
	.uleb128 0
	.uleb128 .LVU109
	.uleb128 .LVU109
	.uleb128 0
.LLST14:
	.byte	0x6
	.quad	.LVL37
	.byte	0x4
	.uleb128 .LVL37-.LVL37
	.uleb128 .LVL39-.LVL37
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL39-.LVL37
	.uleb128 .LFE31-.LVL37
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LVUS15:
	.uleb128 .LVU112
	.uleb128 .LVU113
	.uleb128 .LVU113
	.uleb128 .LVU119
	.uleb128 .LVU119
	.uleb128 .LVU123
	.uleb128 .LVU123
	.uleb128 .LVU124
	.uleb128 .LVU124
	.uleb128 .LVU126
	.uleb128 .LVU132
	.uleb128 .LVU136
	.uleb128 .LVU136
	.uleb128 .LVU138
	.uleb128 .LVU138
	.uleb128 0
.LLST15:
	.byte	0x6
	.quad	.LVL41
	.byte	0x4
	.uleb128 .LVL41-.LVL41
	.uleb128 .LVL42-.LVL41
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL42-.LVL41
	.uleb128 .LVL44-.LVL41
	.uleb128 0x3
	.byte	0x7b
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL44-.LVL41
	.uleb128 .LVL45-.LVL41
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL45-.LVL41
	.uleb128 .LVL46-.LVL41
	.uleb128 0x3
	.byte	0x70
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL46-.LVL41
	.uleb128 .LVL47-.LVL41
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL51-.LVL41
	.uleb128 .LVL52-.LVL41
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL52-.LVL41
	.uleb128 .LVL53-.LVL41
	.uleb128 0x3
	.byte	0x7b
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL53-.LVL41
	.uleb128 .LFE31-.LVL41
	.uleb128 0x1
	.byte	0x5b
	.byte	0
.LVUS16:
	.uleb128 .LVU126
	.uleb128 .LVU128
	.uleb128 .LVU128
	.uleb128 0
.LLST16:
	.byte	0x6
	.quad	.LVL47
	.byte	0x4
	.uleb128 .LVL47-.LVL47
	.uleb128 .LVL48-.LVL47
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x4
	.uleb128 .LVL48-.LVL47
	.uleb128 .LFE31-.LVL47
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS17:
	.uleb128 .LVU113
	.uleb128 .LVU114
.LLST17:
	.byte	0x8
	.quad	.LVL42
	.uleb128 .LVL43-.LVL42
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS19:
	.uleb128 .LVU126
	.uleb128 .LVU128
.LLST19:
	.byte	0x8
	.quad	.LVL47
	.uleb128 .LVL48-.LVL47
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS10:
	.uleb128 .LVU93
	.uleb128 .LVU96
	.uleb128 .LVU96
	.uleb128 .LVU102
	.uleb128 .LVU102
	.uleb128 0
.LLST10:
	.byte	0x6
	.quad	.LVL32
	.byte	0x4
	.uleb128 .LVL32-.LVL32
	.uleb128 .LVL33-.LVL32
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x4
	.uleb128 .LVL33-.LVL32
	.uleb128 .LVL36-.LVL32
	.uleb128 0x1
	.byte	0x62
	.byte	0x4
	.uleb128 .LVL36-.LVL32
	.uleb128 .LFE30-.LVL32
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0
.LVUS12:
	.uleb128 .LVU93
	.uleb128 .LVU96
	.uleb128 .LVU96
	.uleb128 .LVU98
	.uleb128 .LVU98
	.uleb128 .LVU100
	.uleb128 .LVU100
	.uleb128 .LVU102
	.uleb128 .LVU102
	.uleb128 0
.LLST12:
	.byte	0x6
	.quad	.LVL32
	.byte	0x4
	.uleb128 .LVL32-.LVL32
	.uleb128 .LVL33-.LVL32
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL33-.LVL32
	.uleb128 .LVL34-.LVL32
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL34-.LVL32
	.uleb128 .LVL35-.LVL32
	.uleb128 0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL35-.LVL32
	.uleb128 .LVL36-.LVL32
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL36-.LVL32
	.uleb128 .LFE30-.LVL32
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS3:
	.uleb128 0
	.uleb128 .LVU19
	.uleb128 .LVU19
	.uleb128 .LVU20
	.uleb128 .LVU20
	.uleb128 .LVU89
	.uleb128 .LVU89
	.uleb128 0
.LLST3:
	.byte	0x6
	.quad	.LVL6
	.byte	0x4
	.uleb128 .LVL6-.LVL6
	.uleb128 .LVL9-.LVL6
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL9-.LVL6
	.uleb128 .LVL10-.LVL6
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL10-.LVL6
	.uleb128 .LVL30-.LVL6
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL30-.LVL6
	.uleb128 .LFE29-.LVL6
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS4:
	.uleb128 0
	.uleb128 .LVU20
	.uleb128 .LVU20
	.uleb128 .LVU89
	.uleb128 .LVU89
	.uleb128 0
.LLST4:
	.byte	0x6
	.quad	.LVL6
	.byte	0x4
	.uleb128 .LVL6-.LVL6
	.uleb128 .LVL10-.LVL6
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL10-.LVL6
	.uleb128 .LVL30-.LVL6
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL30-.LVL6
	.uleb128 .LFE29-.LVL6
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS5:
	.uleb128 .LVU18
	.uleb128 .LVU20
	.uleb128 .LVU81
	.uleb128 .LVU85
	.uleb128 .LVU85
	.uleb128 .LVU87
	.uleb128 .LVU87
	.uleb128 .LVU89
	.uleb128 .LVU89
	.uleb128 0
.LLST5:
	.byte	0x6
	.quad	.LVL8
	.byte	0x4
	.uleb128 .LVL8-.LVL8
	.uleb128 .LVL10-.LVL8
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL27-.LVL8
	.uleb128 .LVL28-.LVL8
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL28-.LVL8
	.uleb128 .LVL29-.LVL8
	.uleb128 0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL29-.LVL8
	.uleb128 .LVL30-.LVL8
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL30-.LVL8
	.uleb128 .LFE29-.LVL8
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS6:
	.uleb128 .LVU55
	.uleb128 .LVU58
	.uleb128 .LVU58
	.uleb128 .LVU89
.LLST6:
	.byte	0x6
	.quad	.LVL19
	.byte	0x4
	.uleb128 .LVL19-.LVL19
	.uleb128 .LVL20-.LVL19
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x4
	.uleb128 .LVL20-.LVL19
	.uleb128 .LVL30-.LVL19
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS8:
	.uleb128 .LVU20
	.uleb128 .LVU25
	.uleb128 .LVU25
	.uleb128 .LVU29
	.uleb128 .LVU29
	.uleb128 .LVU33
	.uleb128 .LVU33
	.uleb128 .LVU37
	.uleb128 .LVU37
	.uleb128 .LVU41
	.uleb128 .LVU41
	.uleb128 .LVU45
	.uleb128 .LVU45
	.uleb128 .LVU49
	.uleb128 .LVU49
	.uleb128 .LVU53
	.uleb128 .LVU53
	.uleb128 .LVU55
.LLST8:
	.byte	0x6
	.quad	.LVL10
	.byte	0x4
	.uleb128 .LVL10-.LVL10
	.uleb128 .LVL11-.LVL10
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL11-.LVL10
	.uleb128 .LVL12-.LVL10
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL12-.LVL10
	.uleb128 .LVL13-.LVL10
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL13-.LVL10
	.uleb128 .LVL14-.LVL10
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL14-.LVL10
	.uleb128 .LVL15-.LVL10
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL15-.LVL10
	.uleb128 .LVL16-.LVL10
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL16-.LVL10
	.uleb128 .LVL17-.LVL10
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL17-.LVL10
	.uleb128 .LVL18-.LVL10
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL18-.LVL10
	.uleb128 .LVL19-.LVL10
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0
.LVUS9:
	.uleb128 .LVU55
	.uleb128 .LVU59
	.uleb128 .LVU59
	.uleb128 .LVU62
	.uleb128 .LVU62
	.uleb128 .LVU65
	.uleb128 .LVU65
	.uleb128 .LVU68
	.uleb128 .LVU68
	.uleb128 .LVU71
	.uleb128 .LVU71
	.uleb128 .LVU74
	.uleb128 .LVU74
	.uleb128 .LVU77
	.uleb128 .LVU77
	.uleb128 .LVU80
	.uleb128 .LVU80
	.uleb128 .LVU89
.LLST9:
	.byte	0x6
	.quad	.LVL19
	.byte	0x4
	.uleb128 .LVL19-.LVL19
	.uleb128 .LVL20-.LVL19
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL20-.LVL19
	.uleb128 .LVL21-.LVL19
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL21-.LVL19
	.uleb128 .LVL22-.LVL19
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL22-.LVL19
	.uleb128 .LVL23-.LVL19
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL19
	.uleb128 .LVL24-.LVL19
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL24-.LVL19
	.uleb128 .LVL25-.LVL19
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL25-.LVL19
	.uleb128 .LVL26-.LVL19
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL26-.LVL19
	.uleb128 .LVL27-.LVL19
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL27-.LVL19
	.uleb128 .LVL30-.LVL19
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0
.LVUS0:
	.uleb128 .LVU2
	.uleb128 .LVU5
	.uleb128 .LVU5
	.uleb128 .LVU11
	.uleb128 .LVU11
	.uleb128 0
.LLST0:
	.byte	0x6
	.quad	.LVL1
	.byte	0x4
	.uleb128 .LVL1-.LVL1
	.uleb128 .LVL2-.LVL1
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x4
	.uleb128 .LVL2-.LVL1
	.uleb128 .LVL5-.LVL1
	.uleb128 0x1
	.byte	0x62
	.byte	0x4
	.uleb128 .LVL5-.LVL1
	.uleb128 .LFE28-.LVL1
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0
.LVUS2:
	.uleb128 .LVU2
	.uleb128 .LVU5
	.uleb128 .LVU5
	.uleb128 .LVU7
	.uleb128 .LVU7
	.uleb128 .LVU9
	.uleb128 .LVU9
	.uleb128 .LVU11
	.uleb128 .LVU11
	.uleb128 0
.LLST2:
	.byte	0x6
	.quad	.LVL1
	.byte	0x4
	.uleb128 .LVL1-.LVL1
	.uleb128 .LVL2-.LVL1
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL2-.LVL1
	.uleb128 .LVL3-.LVL1
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL3-.LVL1
	.uleb128 .LVL4-.LVL1
	.uleb128 0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL4-.LVL1
	.uleb128 .LVL5-.LVL1
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL5-.LVL1
	.uleb128 .LFE28-.LVL1
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"dr"
	.long	0x24c
	.word	0x2
	.secrel32	.Ldebug_info0
	.byte	0x8
	.byte	0
	.word	0
	.word	0
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.quad	.LFB32
	.quad	.LFE32-.LFB32
	.quad	.LFB33
	.quad	.LFE33-.LFB33
	.quad	.LFB34
	.quad	.LFE34-.LFB34
	.quad	.LFB35
	.quad	.LFE35-.LFB35
	.quad	.LFB36
	.quad	.LFE36-.LFB36
	.quad	.LFB37
	.quad	.LFE37-.LFB37
	.quad	.LFB38
	.quad	.LFE38-.LFB38
	.quad	.LFB39
	.quad	.LFE39-.LFB39
	.quad	.LFB40
	.quad	.LFE40-.LFB40
	.quad	.LFB41
	.quad	.LFE41-.LFB41
	.quad	.LFB42
	.quad	.LFE42-.LFB42
	.quad	.LFB43
	.quad	.LFE43-.LFB43
	.quad	.LFB44
	.quad	.LFE44-.LFB44
	.quad	.LFB45
	.quad	.LFE45-.LFB45
	.quad	.LFB46
	.quad	.LFE46-.LFB46
	.quad	.LFB47
	.quad	.LFE47-.LFB47
	.quad	.LFB48
	.quad	.LFE48-.LFB48
	.quad	.LFB49
	.quad	.LFE49-.LFB49
	.quad	.LFB50
	.quad	.LFE50-.LFB50
	.quad	.LFB51
	.quad	.LFE51-.LFB51
	.quad	.LFB52
	.quad	.LFE52-.LFB52
	.quad	.LFB53
	.quad	.LFE53-.LFB53
	.quad	.LFB54
	.quad	.LFE54-.LFB54
	.quad	.LFB55
	.quad	.LFE55-.LFB55
	.quad	.LFB56
	.quad	.LFE56-.LFB56
	.quad	.LFB57
	.quad	.LFE57-.LFB57
	.quad	.LFB58
	.quad	.LFE58-.LFB58
	.quad	.LFB59
	.quad	.LFE59-.LFB59
	.quad	.LFB60
	.quad	.LFE60-.LFB60
	.quad	.LFB61
	.quad	.LFE61-.LFB61
	.quad	.LFB62
	.quad	.LFE62-.LFB62
	.quad	0
	.quad	0
	.section	.debug_rnglists,"dr"
.Ldebug_ranges0:
	.long	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.word	0x5
	.byte	0x8
	.byte	0
	.long	0
.LLRL1:
	.byte	0x5
	.quad	.LBB2
	.byte	0x4
	.uleb128 .LBB2-.LBB2
	.uleb128 .LBE2-.LBB2
	.byte	0x4
	.uleb128 .LBB3-.LBB2
	.uleb128 .LBE3-.LBB2
	.byte	0
.LLRL7:
	.byte	0x5
	.quad	.LBB5
	.byte	0x4
	.uleb128 .LBB5-.LBB5
	.uleb128 .LBE5-.LBB5
	.byte	0x4
	.uleb128 .LBB6-.LBB5
	.uleb128 .LBE6-.LBB5
	.byte	0
.LLRL11:
	.byte	0x5
	.quad	.LBB9
	.byte	0x4
	.uleb128 .LBB9-.LBB9
	.uleb128 .LBE9-.LBB9
	.byte	0x4
	.uleb128 .LBB10-.LBB9
	.uleb128 .LBE10-.LBB9
	.byte	0
.LLRL18:
	.byte	0x5
	.quad	.LBB13
	.byte	0x4
	.uleb128 .LBB13-.LBB13
	.uleb128 .LBE13-.LBB13
	.byte	0x4
	.uleb128 .LBB15-.LBB13
	.uleb128 .LBE15-.LBB13
	.byte	0x4
	.uleb128 .LBB16-.LBB13
	.uleb128 .LBE16-.LBB13
	.byte	0
.LLRL21:
	.byte	0x5
	.quad	.LBB18
	.byte	0x4
	.uleb128 .LBB18-.LBB18
	.uleb128 .LBE18-.LBB18
	.byte	0x4
	.uleb128 .LBB19-.LBB18
	.uleb128 .LBE19-.LBB18
	.byte	0
.LLRL24:
	.byte	0x5
	.quad	.LBB20
	.byte	0x4
	.uleb128 .LBB20-.LBB20
	.uleb128 .LBE20-.LBB20
	.byte	0x4
	.uleb128 .LBB21-.LBB20
	.uleb128 .LBE21-.LBB20
	.byte	0
.LLRL30:
	.byte	0x5
	.quad	.LBB24
	.byte	0x4
	.uleb128 .LBB24-.LBB24
	.uleb128 .LBE24-.LBB24
	.byte	0x4
	.uleb128 .LBB25-.LBB24
	.uleb128 .LBE25-.LBB24
	.byte	0
.LLRL36:
	.byte	0x5
	.quad	.LBB27
	.byte	0x4
	.uleb128 .LBB27-.LBB27
	.uleb128 .LBE27-.LBB27
	.byte	0x4
	.uleb128 .LBB28-.LBB27
	.uleb128 .LBE28-.LBB27
	.byte	0
.LLRL40:
	.byte	0x5
	.quad	.LBB31
	.byte	0x4
	.uleb128 .LBB31-.LBB31
	.uleb128 .LBE31-.LBB31
	.byte	0x4
	.uleb128 .LBB32-.LBB31
	.uleb128 .LBE32-.LBB31
	.byte	0
.LLRL47:
	.byte	0x5
	.quad	.LBB35
	.byte	0x4
	.uleb128 .LBB35-.LBB35
	.uleb128 .LBE35-.LBB35
	.byte	0x4
	.uleb128 .LBB37-.LBB35
	.uleb128 .LBE37-.LBB35
	.byte	0x4
	.uleb128 .LBB38-.LBB35
	.uleb128 .LBE38-.LBB35
	.byte	0
.LLRL50:
	.byte	0x5
	.quad	.LBB40
	.byte	0x4
	.uleb128 .LBB40-.LBB40
	.uleb128 .LBE40-.LBB40
	.byte	0x4
	.uleb128 .LBB41-.LBB40
	.uleb128 .LBE41-.LBB40
	.byte	0
.LLRL53:
	.byte	0x5
	.quad	.LBB42
	.byte	0x4
	.uleb128 .LBB42-.LBB42
	.uleb128 .LBE42-.LBB42
	.byte	0x4
	.uleb128 .LBB43-.LBB42
	.uleb128 .LBE43-.LBB42
	.byte	0
.LLRL59:
	.byte	0x5
	.quad	.LBB46
	.byte	0x4
	.uleb128 .LBB46-.LBB46
	.uleb128 .LBE46-.LBB46
	.byte	0x4
	.uleb128 .LBB47-.LBB46
	.uleb128 .LBE47-.LBB46
	.byte	0
.LLRL66:
	.byte	0x5
	.quad	.LBB49
	.byte	0x4
	.uleb128 .LBB49-.LBB49
	.uleb128 .LBE49-.LBB49
	.byte	0x4
	.uleb128 .LBB50-.LBB49
	.uleb128 .LBE50-.LBB49
	.byte	0
.LLRL70:
	.byte	0x5
	.quad	.LBB53
	.byte	0x4
	.uleb128 .LBB53-.LBB53
	.uleb128 .LBE53-.LBB53
	.byte	0x4
	.uleb128 .LBB54-.LBB53
	.uleb128 .LBE54-.LBB53
	.byte	0
.LLRL77:
	.byte	0x5
	.quad	.LBB57
	.byte	0x4
	.uleb128 .LBB57-.LBB57
	.uleb128 .LBE57-.LBB57
	.byte	0x4
	.uleb128 .LBB59-.LBB57
	.uleb128 .LBE59-.LBB57
	.byte	0x4
	.uleb128 .LBB60-.LBB57
	.uleb128 .LBE60-.LBB57
	.byte	0
.LLRL81:
	.byte	0x5
	.quad	.LBB62
	.byte	0x4
	.uleb128 .LBB62-.LBB62
	.uleb128 .LBE62-.LBB62
	.byte	0x4
	.uleb128 .LBB63-.LBB62
	.uleb128 .LBE63-.LBB62
	.byte	0x4
	.uleb128 .LBB64-.LBB62
	.uleb128 .LBE64-.LBB62
	.byte	0
.LLRL84:
	.byte	0x5
	.quad	.LBB65
	.byte	0x4
	.uleb128 .LBB65-.LBB65
	.uleb128 .LBE65-.LBB65
	.byte	0x4
	.uleb128 .LBB66-.LBB65
	.uleb128 .LBE66-.LBB65
	.byte	0
.LLRL95:
	.byte	0x5
	.quad	.LBB69
	.byte	0x4
	.uleb128 .LBB69-.LBB69
	.uleb128 .LBE69-.LBB69
	.byte	0x4
	.uleb128 .LBB70-.LBB69
	.uleb128 .LBE70-.LBB69
	.byte	0
.LLRL97:
	.byte	0x5
	.quad	.LBB71
	.byte	0x4
	.uleb128 .LBB71-.LBB71
	.uleb128 .LBE71-.LBB71
	.byte	0x4
	.uleb128 .LBB76-.LBB71
	.uleb128 .LBE76-.LBB71
	.byte	0
.LLRL99:
	.byte	0x5
	.quad	.LBB72
	.byte	0x4
	.uleb128 .LBB72-.LBB72
	.uleb128 .LBE72-.LBB72
	.byte	0x4
	.uleb128 .LBB73-.LBB72
	.uleb128 .LBE73-.LBB72
	.byte	0
.LLRL101:
	.byte	0x5
	.quad	.LBB74
	.byte	0x4
	.uleb128 .LBB74-.LBB74
	.uleb128 .LBE74-.LBB74
	.byte	0x4
	.uleb128 .LBB75-.LBB74
	.uleb128 .LBE75-.LBB74
	.byte	0
.LLRL109:
	.byte	0x5
	.quad	.LBB77
	.byte	0x4
	.uleb128 .LBB77-.LBB77
	.uleb128 .LBE77-.LBB77
	.byte	0x4
	.uleb128 .LBB78-.LBB77
	.uleb128 .LBE78-.LBB77
	.byte	0x4
	.uleb128 .LBB83-.LBB77
	.uleb128 .LBE83-.LBB77
	.byte	0
.LLRL111:
	.byte	0x5
	.quad	.LBB79
	.byte	0x4
	.uleb128 .LBB79-.LBB79
	.uleb128 .LBE79-.LBB79
	.byte	0x4
	.uleb128 .LBB82-.LBB79
	.uleb128 .LBE82-.LBB79
	.byte	0x4
	.uleb128 .LBB84-.LBB79
	.uleb128 .LBE84-.LBB79
	.byte	0
.LLRL113:
	.byte	0x5
	.quad	.LBB80
	.byte	0x4
	.uleb128 .LBB80-.LBB80
	.uleb128 .LBE80-.LBB80
	.byte	0x4
	.uleb128 .LBB81-.LBB80
	.uleb128 .LBE81-.LBB80
	.byte	0
.LLRL115:
	.byte	0x5
	.quad	.LBB85
	.byte	0x4
	.uleb128 .LBB85-.LBB85
	.uleb128 .LBE85-.LBB85
	.byte	0x4
	.uleb128 .LBB86-.LBB85
	.uleb128 .LBE86-.LBB85
	.byte	0
.LLRL117:
	.byte	0x7
	.quad	.LFB28
	.uleb128 .LFE28-.LFB28
	.byte	0x7
	.quad	.LFB29
	.uleb128 .LFE29-.LFB29
	.byte	0x7
	.quad	.LFB30
	.uleb128 .LFE30-.LFB30
	.byte	0x7
	.quad	.LFB31
	.uleb128 .LFE31-.LFB31
	.byte	0x7
	.quad	.LFB32
	.uleb128 .LFE32-.LFB32
	.byte	0x7
	.quad	.LFB33
	.uleb128 .LFE33-.LFB33
	.byte	0x7
	.quad	.LFB34
	.uleb128 .LFE34-.LFB34
	.byte	0x7
	.quad	.LFB35
	.uleb128 .LFE35-.LFB35
	.byte	0x7
	.quad	.LFB36
	.uleb128 .LFE36-.LFB36
	.byte	0x7
	.quad	.LFB37
	.uleb128 .LFE37-.LFB37
	.byte	0x7
	.quad	.LFB38
	.uleb128 .LFE38-.LFB38
	.byte	0x7
	.quad	.LFB39
	.uleb128 .LFE39-.LFB39
	.byte	0x7
	.quad	.LFB40
	.uleb128 .LFE40-.LFB40
	.byte	0x7
	.quad	.LFB41
	.uleb128 .LFE41-.LFB41
	.byte	0x7
	.quad	.LFB42
	.uleb128 .LFE42-.LFB42
	.byte	0x7
	.quad	.LFB43
	.uleb128 .LFE43-.LFB43
	.byte	0x7
	.quad	.LFB44
	.uleb128 .LFE44-.LFB44
	.byte	0x7
	.quad	.LFB45
	.uleb128 .LFE45-.LFB45
	.byte	0x7
	.quad	.LFB46
	.uleb128 .LFE46-.LFB46
	.byte	0x7
	.quad	.LFB47
	.uleb128 .LFE47-.LFB47
	.byte	0x7
	.quad	.LFB48
	.uleb128 .LFE48-.LFB48
	.byte	0x7
	.quad	.LFB49
	.uleb128 .LFE49-.LFB49
	.byte	0x7
	.quad	.LFB50
	.uleb128 .LFE50-.LFB50
	.byte	0x7
	.quad	.LFB51
	.uleb128 .LFE51-.LFB51
	.byte	0x7
	.quad	.LFB52
	.uleb128 .LFE52-.LFB52
	.byte	0x7
	.quad	.LFB53
	.uleb128 .LFE53-.LFB53
	.byte	0x7
	.quad	.LFB54
	.uleb128 .LFE54-.LFB54
	.byte	0x7
	.quad	.LFB55
	.uleb128 .LFE55-.LFB55
	.byte	0x7
	.quad	.LFB56
	.uleb128 .LFE56-.LFB56
	.byte	0x7
	.quad	.LFB57
	.uleb128 .LFE57-.LFB57
	.byte	0x7
	.quad	.LFB58
	.uleb128 .LFE58-.LFB58
	.byte	0x7
	.quad	.LFB59
	.uleb128 .LFE59-.LFB59
	.byte	0x7
	.quad	.LFB60
	.uleb128 .LFE60-.LFB60
	.byte	0x7
	.quad	.LFB61
	.uleb128 .LFE61-.LFB61
	.byte	0x7
	.quad	.LFB62
	.uleb128 .LFE62-.LFB62
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"dr"
.Ldebug_line0:
	.section	.debug_str,"dr"
.LASF2:
	.ascii "flops_per_iter\0"
	.section	.debug_line_str,"dr"
.LASF1:
	.ascii "C:\\Users\\ReddA\\Desktop\\Advanced Comp Sys\\SIMD\0"
.LASF0:
	.ascii "kernels.cpp\0"
	.ident	"GCC: (Rev6, Built by MSYS2 project) 13.1.0"
