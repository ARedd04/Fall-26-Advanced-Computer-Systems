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
	je	.L7
	lea	rax, -1[r8]
	cmp	rax, 2
	jbe	.L8
	mov	r9, r8
	xor	eax, eax
.LBE2:
	.loc 1 15 7 is_stmt 0 view .LVU3
	pxor	xmm0, xmm0
	shr	r9, 2
	sal	r9, 4
.LVL2:
	.p2align 4,,10
	.p2align 3
.L4:
.LBB3:
	.loc 1 16 46 discriminator 3 view .LVU4
	movups	xmm1, XMMWORD PTR [rcx+rax]
	movups	xmm3, XMMWORD PTR [rdx+rax]
	add	rax, 16
	mulps	xmm1, xmm3
	addss	xmm0, xmm1
.LVL3:
	.loc 1 16 46 discriminator 3 view .LVU5
	movaps	xmm2, xmm1
	shufps	xmm2, xmm1, 85
	addss	xmm0, xmm2
	movaps	xmm2, xmm1
	unpckhps	xmm2, xmm1
	.loc 1 16 38 discriminator 3 view .LVU6
	shufps	xmm1, xmm1, 255
	addss	xmm0, xmm2
	addss	xmm0, xmm1
.LVL4:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU7
	.loc 1 16 26 discriminator 1 view .LVU8
	cmp	rax, r9
	jne	.L4
	test	r8b, 3
	je	.L1
	mov	rax, r8
	and	rax, -4
.LVL5:
.L3:
	.loc 1 16 46 is_stmt 0 discriminator 3 view .LVU9
	movss	xmm1, DWORD PTR [rcx+rax*4]
	mulss	xmm1, DWORD PTR [rdx+rax*4]
	.loc 1 16 5 discriminator 3 view .LVU10
	lea	r10, 1[rax]
	.loc 1 16 42 discriminator 3 view .LVU11
	lea	r9, 0[0+rax*4]
	.loc 1 16 38 discriminator 3 view .LVU12
	addss	xmm0, xmm1
.LVL6:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU13
	.loc 1 16 26 discriminator 1 view .LVU14
	cmp	r10, r8
	jnb	.L1
	.loc 1 16 46 is_stmt 0 discriminator 3 view .LVU15
	movss	xmm1, DWORD PTR 4[rcx+r9]
	mulss	xmm1, DWORD PTR 4[rdx+r9]
	.loc 1 16 5 discriminator 3 view .LVU16
	add	rax, 2
	.loc 1 16 38 discriminator 3 view .LVU17
	addss	xmm0, xmm1
.LVL7:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU18
	.loc 1 16 26 discriminator 1 view .LVU19
	cmp	rax, r8
	jnb	.L1
	.loc 1 16 46 is_stmt 0 discriminator 3 view .LVU20
	movss	xmm1, DWORD PTR 8[rdx+r9]
	mulss	xmm1, DWORD PTR 8[rcx+r9]
	.loc 1 16 38 discriminator 3 view .LVU21
	addss	xmm0, xmm1
.LVL8:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU22
	.loc 1 16 26 discriminator 1 view .LVU23
.L1:
	.loc 1 16 26 is_stmt 0 discriminator 1 view .LVU24
.LBE3:
	.loc 1 18 1 view .LVU25
	ret
.LVL9:
	.p2align 4,,10
	.p2align 3
.L7:
	.loc 1 15 7 view .LVU26
	pxor	xmm0, xmm0
	.loc 1 18 1 view .LVU27
	ret
.L8:
.LBB4:
	.loc 1 16 17 view .LVU28
	xor	eax, eax
.LBE4:
	.loc 1 15 7 view .LVU29
	pxor	xmm0, xmm0
	jmp	.L3
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
.LVL10:
.LFB29:
	.loc 1 26 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 26 12 is_stmt 0 view .LVU31
	push	rsi
	.seh_pushreg	rsi
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 40
	.seh_stackalloc	40
	.cfi_def_cfa_offset 64
	.seh_endprologue
.LVL11:
	.loc 1 28 7 view .LVU32
	pxor	xmm0, xmm0
	.loc 1 26 12 view .LVU33
	mov	r9, rdx
	.loc 1 28 7 view .LVU34
	movups	XMMWORD PTR [rsp], xmm0
	movups	XMMWORD PTR 16[rsp], xmm0
.LVL12:
.LBB5:
	.loc 1 30 18 is_stmt 1 discriminator 1 view .LVU35
	cmp	r8, 7
	jbe	.L28
	lea	r11, -8[r8]
	pxor	xmm1, xmm1
	xor	eax, eax
	xor	edx, edx
.LVL13:
	.loc 1 30 18 is_stmt 0 discriminator 1 view .LVU36
	mov	r10, r11
	movaps	xmm2, xmm1
	shr	r10, 3
	add	r10, 1
.LVL14:
	.p2align 4,,10
	.p2align 3
.L18:
.LBB6:
	.loc 1 31 30 is_stmt 1 discriminator 1 view .LVU37
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU38
	movups	xmm0, XMMWORD PTR [r9+rax]
	movups	xmm3, XMMWORD PTR [rcx+rax]
	add	rdx, 1
	movups	xmm4, XMMWORD PTR 16[rcx+rax]
	mulps	xmm0, xmm3
	.loc 1 31 47 discriminator 3 view .LVU39
	addps	xmm2, xmm0
	.loc 1 31 59 discriminator 3 view .LVU40
	movups	xmm0, XMMWORD PTR 16[r9+rax]
	add	rax, 32
	mulps	xmm0, xmm4
	.loc 1 31 47 discriminator 3 view .LVU41
	addps	xmm1, xmm0
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU42
.LVL15:
	.loc 1 31 30 discriminator 1 view .LVU43
	.loc 1 31 9 discriminator 3 view .LVU44
	.loc 1 31 30 discriminator 1 view .LVU45
	.loc 1 31 9 discriminator 3 view .LVU46
	.loc 1 31 30 discriminator 1 view .LVU47
	.loc 1 31 9 discriminator 3 view .LVU48
	.loc 1 31 30 discriminator 1 view .LVU49
	.loc 1 31 9 discriminator 3 view .LVU50
	.loc 1 31 30 discriminator 1 view .LVU51
	.loc 1 31 9 discriminator 3 view .LVU52
	.loc 1 31 30 discriminator 1 view .LVU53
	.loc 1 31 9 discriminator 3 view .LVU54
	.loc 1 31 30 discriminator 1 view .LVU55
	.loc 1 31 9 discriminator 3 view .LVU56
	.loc 1 31 30 discriminator 1 view .LVU57
.LBE6:
	.loc 1 30 18 discriminator 1 view .LVU58
	cmp	rdx, r10
	jb	.L18
	and	r11, -8
	movups	XMMWORD PTR [rsp], xmm2
	lea	rdx, 8[r11]
	movups	XMMWORD PTR 16[rsp], xmm1
.LVL16:
.L19:
	.loc 1 30 18 is_stmt 0 discriminator 1 view .LVU59
.LBE5:
.LBB7:
	.loc 1 34 26 is_stmt 1 discriminator 1 view .LVU60
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU61
	pxor	xmm0, xmm0
	addss	xmm0, DWORD PTR [rsp]
	addss	xmm0, DWORD PTR 4[rsp]
	.loc 1 34 38 discriminator 3 view .LVU62
	addss	xmm0, DWORD PTR 8[rsp]
	addss	xmm0, DWORD PTR 12[rsp]
.LVL17:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU63
	.loc 1 34 26 discriminator 1 view .LVU64
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU65
	addss	xmm0, DWORD PTR 16[rsp]
.LVL18:
	.loc 1 34 26 discriminator 1 view .LVU66
	addss	xmm0, DWORD PTR 20[rsp]
	.loc 1 34 38 discriminator 3 view .LVU67
	addss	xmm0, DWORD PTR 24[rsp]
	addss	xmm0, DWORD PTR 28[rsp]
.LVL19:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU68
	.loc 1 34 26 discriminator 1 view .LVU69
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU70
.LBE7:
	.loc 1 35 14 is_stmt 1 discriminator 1 view .LVU71
	cmp	rdx, r8
	jnb	.L14
	mov	rsi, r8
	sub	rsi, rdx
	lea	rax, -1[rsi]
	cmp	rax, 2
	jbe	.L20
	mov	r11, rsi
	lea	r10, 0[0+rdx*4]
	xor	eax, eax
	shr	r11, 2
	lea	rbx, [rcx+r10]
	add	r10, r9
	sal	r11, 4
.LVL20:
	.p2align 4,,10
	.p2align 3
.L21:
	.loc 1 35 34 is_stmt 0 discriminator 2 view .LVU72
	movups	xmm1, XMMWORD PTR [r10+rax]
	movups	xmm5, XMMWORD PTR [rbx+rax]
	add	rax, 16
	mulps	xmm1, xmm5
	addss	xmm0, xmm1
.LVL21:
	.loc 1 35 34 discriminator 2 view .LVU73
	movaps	xmm2, xmm1
	shufps	xmm2, xmm1, 85
	addss	xmm2, xmm0
	movaps	xmm0, xmm1
	unpckhps	xmm0, xmm1
	.loc 1 35 26 discriminator 2 view .LVU74
	shufps	xmm1, xmm1, 255
	addss	xmm0, xmm2
	addss	xmm0, xmm1
.LVL22:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU75
	.loc 1 35 14 discriminator 1 view .LVU76
	cmp	r11, rax
	jne	.L21
	test	sil, 3
	je	.L14
	and	rsi, -4
	add	rdx, rsi
.L20:
.LVL23:
	.loc 1 35 34 is_stmt 0 discriminator 2 view .LVU77
	movss	xmm1, DWORD PTR [r9+rdx*4]
	mulss	xmm1, DWORD PTR [rcx+rdx*4]
	.loc 1 35 5 discriminator 2 view .LVU78
	lea	r10, 1[rdx]
	.loc 1 35 30 discriminator 2 view .LVU79
	lea	rax, 0[0+rdx*4]
	.loc 1 35 26 discriminator 2 view .LVU80
	addss	xmm0, xmm1
.LVL24:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU81
	.loc 1 35 14 discriminator 1 view .LVU82
	cmp	r10, r8
	jnb	.L14
	.loc 1 35 34 is_stmt 0 discriminator 2 view .LVU83
	movss	xmm1, DWORD PTR 4[rcx+rax]
	mulss	xmm1, DWORD PTR 4[r9+rax]
	.loc 1 35 5 discriminator 2 view .LVU84
	add	rdx, 2
	.loc 1 35 26 discriminator 2 view .LVU85
	addss	xmm0, xmm1
.LVL25:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU86
	.loc 1 35 14 discriminator 1 view .LVU87
	cmp	rdx, r8
	jnb	.L14
	.loc 1 35 34 is_stmt 0 discriminator 2 view .LVU88
	movss	xmm1, DWORD PTR 8[r9+rax]
	mulss	xmm1, DWORD PTR 8[rcx+rax]
	.loc 1 35 26 discriminator 2 view .LVU89
	addss	xmm0, xmm1
.LVL26:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU90
	.loc 1 35 14 discriminator 1 view .LVU91
.L14:
	.loc 1 37 1 is_stmt 0 view .LVU92
	add	rsp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	pop	rsi
	.cfi_restore 4
	.cfi_def_cfa_offset 8
	ret
.LVL27:
.L28:
	.cfi_restore_state
	.loc 1 29 12 view .LVU93
	xor	edx, edx
.LVL28:
	.loc 1 29 12 view .LVU94
	jmp	.L19
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
.LVL29:
.LFB30:
	.loc 1 45 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 45 12 is_stmt 0 view .LVU96
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
.LVL30:
.LBB8:
.LBB9:
	.loc 1 47 9 view .LVU97
	pxor	xmm0, xmm0
	movups	XMMWORD PTR [rsp], xmm0
.LVL31:
	.loc 1 47 9 view .LVU98
	test	r8, r8
	je	.L30
	cmp	r8, 3
	jbe	.L35
	mov	r9, r8
	xor	eax, eax
	pxor	xmm1, xmm1
	shr	r9, 2
	sal	r9, 4
.LVL32:
	.p2align 4,,10
	.p2align 3
.L32:
	.loc 1 48 46 view .LVU99
	movups	xmm0, XMMWORD PTR [rcx+rax]
	movups	xmm2, XMMWORD PTR [rdx+rax]
	add	rax, 16
	mulps	xmm0, xmm2
	.loc 1 48 38 view .LVU100
	addps	xmm1, xmm0
	cmp	r9, rax
	jne	.L32
	mov	rax, r8
	movups	XMMWORD PTR [rsp], xmm1
	and	rax, -4
	test	r8b, 3
	je	.L30
.L31:
.LVL33:
	.loc 1 48 46 view .LVU101
	movss	xmm0, DWORD PTR [rcx+rax*4]
	mulss	xmm0, DWORD PTR [rdx+rax*4]
	lea	r10, 1[rax]
	.loc 1 48 42 view .LVU102
	lea	r9, 0[0+rax*4]
	.loc 1 48 38 view .LVU103
	addss	xmm0, DWORD PTR [rsp]
	movss	DWORD PTR [rsp], xmm0
	.loc 1 48 38 view .LVU104
	cmp	r10, r8
	jnb	.L30
	.loc 1 48 46 view .LVU105
	movss	xmm1, DWORD PTR 4[rcx+r9]
	mulss	xmm1, DWORD PTR 4[rdx+r9]
	add	rax, 2
	.loc 1 48 38 view .LVU106
	addss	xmm0, xmm1
	movss	DWORD PTR [rsp], xmm0
	.loc 1 48 38 view .LVU107
	cmp	rax, r8
	jnb	.L30
	.loc 1 48 46 view .LVU108
	movss	xmm1, DWORD PTR 8[rcx+r9]
	mulss	xmm1, DWORD PTR 8[rdx+r9]
	.loc 1 48 38 view .LVU109
	addss	xmm1, xmm0
	movss	DWORD PTR [rsp], xmm1
.LVL34:
.L30:
	.loc 1 48 38 view .LVU110
	pxor	xmm0, xmm0
	addss	xmm0, DWORD PTR [rsp]
	addss	xmm0, DWORD PTR 4[rsp]
.LVL35:
	.loc 1 47 9 view .LVU111
	addss	xmm0, DWORD PTR 8[rsp]
	addss	xmm0, DWORD PTR 12[rsp]
.LBE9:
.LBE8:
	.loc 1 50 1 view .LVU112
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL36:
.L35:
	.cfi_restore_state
.LBB11:
.LBB10:
	.loc 1 47 9 view .LVU113
	xor	eax, eax
	jmp	.L31
.LBE10:
.LBE11:
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
	.loc 1 58 12 is_stmt 0 view .LVU115
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
	sub	rsp, 192
	.seh_stackalloc	192
	.cfi_def_cfa_offset 224
	movups	XMMWORD PTR 128[rsp], xmm6
	.seh_savexmm	xmm6, 128
	movups	XMMWORD PTR 144[rsp], xmm7
	.seh_savexmm	xmm7, 144
	movups	XMMWORD PTR 160[rsp], xmm8
	.seh_savexmm	xmm8, 160
	movups	XMMWORD PTR 176[rsp], xmm9
	.seh_savexmm	xmm9, 176
	.cfi_offset 23, -96
	.cfi_offset 24, -80
	.cfi_offset 25, -64
	.cfi_offset 26, -48
	.seh_endprologue
.LVL38:
	.loc 1 60 7 view .LVU116
	xor	eax, eax
	.loc 1 58 12 view .LVU117
	mov	r9, rcx
	.loc 1 60 7 view .LVU118
	mov	rdi, rsp
	mov	ecx, 16
.LVL39:
	.loc 1 60 7 view .LVU119
	rep stosq
.LVL40:
.LBB12:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU120
	cmp	r8, 31
	jbe	.L53
	pxor	xmm7, xmm7
	mov	r10, r9
	mov	rcx, rdx
	mov	r11d, 32
	movaps	xmm5, xmm7
	movaps	xmm4, xmm7
	movaps	xmm2, xmm7
	movaps	xmm1, xmm7
	movaps	xmm8, xmm7
	movaps	xmm6, xmm7
	movaps	xmm3, xmm7
.LVL41:
	.p2align 4,,10
	.p2align 3
.L46:
.LBB13:
.LBB14:
	.loc 1 64 59 is_stmt 0 view .LVU121
	movups	xmm9, XMMWORD PTR [rcx]
	movups	xmm0, XMMWORD PTR [r10]
	mov	rax, r11
.LBE14:
.LBE13:
	.loc 1 62 18 discriminator 1 view .LVU122
	lea	r11, 32[r11]
.LVL42:
	.loc 1 62 18 discriminator 1 view .LVU123
	sub	r10, -128
	sub	rcx, -128
.LBB16:
.LBB15:
	.loc 1 64 59 view .LVU124
	mulps	xmm0, xmm9
	movups	xmm9, XMMWORD PTR -112[rcx]
	.loc 1 64 47 view .LVU125
	addps	xmm3, xmm0
	.loc 1 64 59 view .LVU126
	movups	xmm0, XMMWORD PTR -112[r10]
	mulps	xmm0, xmm9
	movups	xmm9, XMMWORD PTR -96[rcx]
	.loc 1 64 47 view .LVU127
	addps	xmm6, xmm0
	.loc 1 64 59 view .LVU128
	movups	xmm0, XMMWORD PTR -96[r10]
	mulps	xmm0, xmm9
	movups	xmm9, XMMWORD PTR -80[rcx]
	.loc 1 64 47 view .LVU129
	addps	xmm8, xmm0
	.loc 1 64 59 view .LVU130
	movups	xmm0, XMMWORD PTR -80[r10]
	mulps	xmm0, xmm9
	movups	xmm9, XMMWORD PTR -64[rcx]
	.loc 1 64 47 view .LVU131
	addps	xmm1, xmm0
	.loc 1 64 59 view .LVU132
	movups	xmm0, XMMWORD PTR -64[r10]
	mulps	xmm0, xmm9
	movups	xmm9, XMMWORD PTR -48[rcx]
	.loc 1 64 47 view .LVU133
	addps	xmm2, xmm0
	.loc 1 64 59 view .LVU134
	movups	xmm0, XMMWORD PTR -48[r10]
	mulps	xmm0, xmm9
	movups	xmm9, XMMWORD PTR -32[rcx]
	.loc 1 64 47 view .LVU135
	addps	xmm4, xmm0
	.loc 1 64 59 view .LVU136
	movups	xmm0, XMMWORD PTR -32[r10]
	mulps	xmm0, xmm9
	movups	xmm9, XMMWORD PTR -16[rcx]
	.loc 1 64 47 view .LVU137
	addps	xmm5, xmm0
	.loc 1 64 59 view .LVU138
	movups	xmm0, XMMWORD PTR -16[r10]
	mulps	xmm0, xmm9
	.loc 1 64 47 view .LVU139
	addps	xmm7, xmm0
.LVL43:
	.loc 1 64 47 view .LVU140
.LBE15:
.LBE16:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU141
	cmp	r8, r11
	jnb	.L46
	movups	XMMWORD PTR [rsp], xmm3
	movups	XMMWORD PTR 16[rsp], xmm6
	movups	XMMWORD PTR 32[rsp], xmm8
	movups	XMMWORD PTR 48[rsp], xmm1
	movups	XMMWORD PTR 64[rsp], xmm2
	movups	XMMWORD PTR 80[rsp], xmm4
	movups	XMMWORD PTR 96[rsp], xmm5
	movups	XMMWORD PTR 112[rsp], xmm7
.L45:
.LVL44:
	.loc 1 62 18 is_stmt 0 discriminator 1 view .LVU142
.LBE12:
.LBB17:
	.loc 1 67 26 is_stmt 1 discriminator 1 view .LVU143
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU144
	pxor	xmm0, xmm0
	addss	xmm0, DWORD PTR [rsp]
	addss	xmm0, DWORD PTR 4[rsp]
	.loc 1 67 38 discriminator 3 view .LVU145
	addss	xmm0, DWORD PTR 8[rsp]
	addss	xmm0, DWORD PTR 12[rsp]
.LVL45:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU146
	.loc 1 67 26 discriminator 1 view .LVU147
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU148
	addss	xmm0, DWORD PTR 16[rsp]
.LVL46:
	.loc 1 67 26 discriminator 1 view .LVU149
	addss	xmm0, DWORD PTR 20[rsp]
	.loc 1 67 38 discriminator 3 view .LVU150
	addss	xmm0, DWORD PTR 24[rsp]
	addss	xmm0, DWORD PTR 28[rsp]
.LVL47:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU151
	.loc 1 67 26 discriminator 1 view .LVU152
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU153
	addss	xmm0, DWORD PTR 32[rsp]
.LVL48:
	.loc 1 67 26 discriminator 1 view .LVU154
	addss	xmm0, DWORD PTR 36[rsp]
	.loc 1 67 38 discriminator 3 view .LVU155
	addss	xmm0, DWORD PTR 40[rsp]
	addss	xmm0, DWORD PTR 44[rsp]
.LVL49:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU156
	.loc 1 67 26 discriminator 1 view .LVU157
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU158
	addss	xmm0, DWORD PTR 48[rsp]
.LVL50:
	.loc 1 67 26 discriminator 1 view .LVU159
	addss	xmm0, DWORD PTR 52[rsp]
	.loc 1 67 38 discriminator 3 view .LVU160
	addss	xmm0, DWORD PTR 56[rsp]
	addss	xmm0, DWORD PTR 60[rsp]
.LVL51:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU161
	.loc 1 67 26 discriminator 1 view .LVU162
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU163
	addss	xmm0, DWORD PTR 64[rsp]
.LVL52:
	.loc 1 67 26 discriminator 1 view .LVU164
	addss	xmm0, DWORD PTR 68[rsp]
	.loc 1 67 38 discriminator 3 view .LVU165
	addss	xmm0, DWORD PTR 72[rsp]
	addss	xmm0, DWORD PTR 76[rsp]
.LVL53:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU166
	.loc 1 67 26 discriminator 1 view .LVU167
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU168
	addss	xmm0, DWORD PTR 80[rsp]
.LVL54:
	.loc 1 67 26 discriminator 1 view .LVU169
	addss	xmm0, DWORD PTR 84[rsp]
	.loc 1 67 38 discriminator 3 view .LVU170
	addss	xmm0, DWORD PTR 88[rsp]
	addss	xmm0, DWORD PTR 92[rsp]
.LVL55:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU171
	.loc 1 67 26 discriminator 1 view .LVU172
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU173
	addss	xmm0, DWORD PTR 96[rsp]
.LVL56:
	.loc 1 67 26 discriminator 1 view .LVU174
	addss	xmm0, DWORD PTR 100[rsp]
	.loc 1 67 38 discriminator 3 view .LVU175
	addss	xmm0, DWORD PTR 104[rsp]
	addss	xmm0, DWORD PTR 108[rsp]
.LVL57:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU176
	.loc 1 67 26 discriminator 1 view .LVU177
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU178
	addss	xmm0, DWORD PTR 112[rsp]
.LVL58:
	.loc 1 67 26 discriminator 1 view .LVU179
	addss	xmm0, DWORD PTR 116[rsp]
	.loc 1 67 38 discriminator 3 view .LVU180
	addss	xmm0, DWORD PTR 120[rsp]
	addss	xmm0, DWORD PTR 124[rsp]
.LVL59:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU181
	.loc 1 67 26 discriminator 1 view .LVU182
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU183
.LBE17:
	.loc 1 68 14 is_stmt 1 discriminator 1 view .LVU184
	cmp	rax, r8
	jnb	.L44
	mov	rsi, r8
	sub	rsi, rax
	lea	rcx, -1[rsi]
	cmp	rcx, 2
	jbe	.L49
	mov	r11, rsi
	lea	r10, 0[0+rax*4]
	xor	ecx, ecx
	shr	r11, 2
	lea	rbx, [r9+r10]
	add	r10, rdx
	sal	r11, 4
.LVL60:
	.p2align 4,,10
	.p2align 3
.L50:
	.loc 1 68 34 is_stmt 0 discriminator 2 view .LVU185
	movups	xmm1, XMMWORD PTR [r10+rcx]
	movups	xmm3, XMMWORD PTR [rbx+rcx]
	add	rcx, 16
	mulps	xmm1, xmm3
	addss	xmm0, xmm1
.LVL61:
	.loc 1 68 34 discriminator 2 view .LVU186
	movaps	xmm2, xmm1
	shufps	xmm2, xmm1, 85
	addss	xmm2, xmm0
	movaps	xmm0, xmm1
	unpckhps	xmm0, xmm1
	.loc 1 68 26 discriminator 2 view .LVU187
	shufps	xmm1, xmm1, 255
	addss	xmm0, xmm2
	addss	xmm0, xmm1
.LVL62:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU188
	.loc 1 68 14 discriminator 1 view .LVU189
	cmp	r11, rcx
	jne	.L50
	test	sil, 3
	je	.L44
	and	rsi, -4
	add	rax, rsi
.L49:
.LVL63:
	.loc 1 68 34 is_stmt 0 discriminator 2 view .LVU190
	movss	xmm1, DWORD PTR [rdx+rax*4]
	mulss	xmm1, DWORD PTR [r9+rax*4]
	.loc 1 68 5 discriminator 2 view .LVU191
	lea	r10, 1[rax]
	.loc 1 68 30 discriminator 2 view .LVU192
	lea	rcx, 0[0+rax*4]
	.loc 1 68 26 discriminator 2 view .LVU193
	addss	xmm0, xmm1
.LVL64:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU194
	.loc 1 68 14 discriminator 1 view .LVU195
	cmp	r10, r8
	jnb	.L44
	.loc 1 68 34 is_stmt 0 discriminator 2 view .LVU196
	movss	xmm1, DWORD PTR 4[r9+rcx]
	mulss	xmm1, DWORD PTR 4[rdx+rcx]
	.loc 1 68 5 discriminator 2 view .LVU197
	add	rax, 2
	.loc 1 68 26 discriminator 2 view .LVU198
	addss	xmm0, xmm1
.LVL65:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU199
	.loc 1 68 14 discriminator 1 view .LVU200
	cmp	rax, r8
	jnb	.L44
	.loc 1 68 34 is_stmt 0 discriminator 2 view .LVU201
	movss	xmm1, DWORD PTR 8[rdx+rcx]
	mulss	xmm1, DWORD PTR 8[r9+rcx]
	.loc 1 68 26 discriminator 2 view .LVU202
	addss	xmm0, xmm1
.LVL66:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU203
	.loc 1 68 14 discriminator 1 view .LVU204
.L44:
	.loc 1 70 1 is_stmt 0 view .LVU205
	movups	xmm6, XMMWORD PTR 128[rsp]
	movups	xmm7, XMMWORD PTR 144[rsp]
	movups	xmm8, XMMWORD PTR 160[rsp]
	movups	xmm9, XMMWORD PTR 176[rsp]
	add	rsp, 192
	.cfi_remember_state
	.cfi_restore 26
	.cfi_restore 25
	.cfi_restore 24
	.cfi_restore 23
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 24
	pop	rsi
	.cfi_restore 4
	.cfi_def_cfa_offset 16
	pop	rdi
	.cfi_restore 5
	.cfi_def_cfa_offset 8
	ret
.LVL67:
.L53:
	.cfi_restore_state
	.loc 1 61 12 view .LVU206
	xor	eax, eax
	jmp	.L45
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
.LVL68:
.LFB32:
	.loc 1 76 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 76 15 is_stmt 0 view .LVU208
	.seh_endprologue
.LVL69:
.LBB18:
	.loc 1 77 26 is_stmt 1 discriminator 1 view .LVU209
	test	r9, r9
	je	.L60
	lea	rax, -1[r9]
	cmp	rax, 2
	jbe	.L67
	mov	rcx, r9
	movaps	xmm2, xmm0
	xor	eax, eax
	shr	rcx, 2
	shufps	xmm2, xmm2, 0
	sal	rcx, 4
.LVL70:
	.p2align 4,,10
	.p2align 3
.L63:
	.loc 1 77 45 is_stmt 0 discriminator 3 view .LVU210
	movups	xmm1, XMMWORD PTR [rdx+rax]
	.loc 1 77 52 discriminator 3 view .LVU211
	movups	xmm3, XMMWORD PTR [r8+rax]
	.loc 1 77 45 discriminator 3 view .LVU212
	mulps	xmm1, xmm2
	.loc 1 77 52 discriminator 3 view .LVU213
	addps	xmm1, xmm3
	.loc 1 77 41 discriminator 3 view .LVU214
	movups	XMMWORD PTR [r8+rax], xmm1
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU215
	.loc 1 77 26 discriminator 1 view .LVU216
	add	rax, 16
	cmp	rax, rcx
	jne	.L63
	test	r9b, 3
	je	.L60
	mov	rax, r9
	and	rax, -4
.L62:
	.loc 1 77 26 is_stmt 0 discriminator 1 view .LVU217
	sub	r9, rax
.LVL71:
	.loc 1 77 26 discriminator 1 view .LVU218
	cmp	r9, 1
	je	.L65
	.loc 1 77 45 discriminator 3 view .LVU219
	movsldup	xmm2, xmm0
	.loc 1 77 48 discriminator 3 view .LVU220
	movq	xmm1, QWORD PTR [rdx+rax*4]
	lea	rcx, [r8+rax*4]
	.loc 1 77 45 discriminator 3 view .LVU221
	mulps	xmm1, xmm2
	.loc 1 77 55 discriminator 3 view .LVU222
	movq	xmm2, QWORD PTR [rcx]
	.loc 1 77 52 discriminator 3 view .LVU223
	addps	xmm1, xmm2
	.loc 1 77 41 discriminator 3 view .LVU224
	movlps	QWORD PTR [rcx], xmm1
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU225
	.loc 1 77 26 discriminator 1 view .LVU226
	test	r9b, 1
	je	.L60
	and	r9, -2
	add	rax, r9
.L65:
.LVL72:
	.loc 1 77 55 is_stmt 0 discriminator 3 view .LVU227
	lea	rcx, [r8+rax*4]
	.loc 1 77 45 discriminator 3 view .LVU228
	mulss	xmm0, DWORD PTR [rdx+rax*4]
.LVL73:
	.loc 1 77 52 discriminator 3 view .LVU229
	addss	xmm0, DWORD PTR [rcx]
	.loc 1 77 41 discriminator 3 view .LVU230
	movss	DWORD PTR [rcx], xmm0
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU231
	.loc 1 77 26 discriminator 1 view .LVU232
.LVL74:
.L60:
	.loc 1 77 26 is_stmt 0 discriminator 1 view .LVU233
.LBE18:
	.loc 1 78 1 view .LVU234
	ret
.LVL75:
.L67:
.LBB19:
	.loc 1 77 17 view .LVU235
	xor	eax, eax
	jmp	.L62
.LBE19:
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
.LVL76:
.LFB33:
	.loc 1 81 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 81 15 is_stmt 0 view .LVU237
	.seh_endprologue
.LVL77:
.LBB20:
	.loc 1 82 26 is_stmt 1 discriminator 1 view .LVU238
	test	r9, r9
	je	.L81
	cmp	QWORD PTR 40[rsp], 1
	jne	.L106
	lea	rax, -1[r9]
	cmp	rax, 2
	jbe	.L91
	mov	rcx, r9
	movaps	xmm2, xmm0
	xor	eax, eax
	shr	rcx, 2
	shufps	xmm2, xmm2, 0
	sal	rcx, 4
.LVL78:
	.p2align 4,,10
	.p2align 3
.L87:
	.loc 1 82 49 is_stmt 0 discriminator 3 view .LVU239
	movups	xmm1, XMMWORD PTR [rdx+rax]
	.loc 1 82 60 discriminator 3 view .LVU240
	movups	xmm3, XMMWORD PTR [r8+rax]
	.loc 1 82 49 discriminator 3 view .LVU241
	mulps	xmm1, xmm2
	.loc 1 82 60 discriminator 3 view .LVU242
	addps	xmm1, xmm3
	.loc 1 82 45 discriminator 3 view .LVU243
	movups	XMMWORD PTR [r8+rax], xmm1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU244
	.loc 1 82 26 discriminator 1 view .LVU245
	add	rax, 16
	cmp	rax, rcx
	jne	.L87
	mov	rax, r9
	and	rax, -4
	test	r9b, 3
	je	.L81
.L86:
	.loc 1 82 26 is_stmt 0 discriminator 1 view .LVU246
	sub	r9, rax
.LVL79:
	.loc 1 82 26 discriminator 1 view .LVU247
	cmp	r9, 1
	je	.L89
	.loc 1 82 49 discriminator 3 view .LVU248
	movsldup	xmm2, xmm0
	.loc 1 82 52 discriminator 3 view .LVU249
	movq	xmm1, QWORD PTR [rdx+rax*4]
	lea	rcx, [r8+rax*4]
	.loc 1 82 49 discriminator 3 view .LVU250
	mulps	xmm1, xmm2
	.loc 1 82 63 discriminator 3 view .LVU251
	movq	xmm2, QWORD PTR [rcx]
	.loc 1 82 60 discriminator 3 view .LVU252
	addps	xmm1, xmm2
	.loc 1 82 45 discriminator 3 view .LVU253
	movlps	QWORD PTR [rcx], xmm1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU254
	.loc 1 82 26 discriminator 1 view .LVU255
	test	r9b, 1
	je	.L81
	and	r9, -2
	add	rax, r9
.L89:
.LVL80:
	.loc 1 82 63 is_stmt 0 discriminator 3 view .LVU256
	lea	rcx, [r8+rax*4]
	.loc 1 82 49 discriminator 3 view .LVU257
	mulss	xmm0, DWORD PTR [rdx+rax*4]
.LVL81:
	.loc 1 82 60 discriminator 3 view .LVU258
	addss	xmm0, DWORD PTR [rcx]
	.loc 1 82 45 discriminator 3 view .LVU259
	movss	DWORD PTR [rcx], xmm0
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU260
	.loc 1 82 26 discriminator 1 view .LVU261
.LVL82:
.L81:
	.loc 1 82 26 is_stmt 0 discriminator 1 view .LVU262
.LBE20:
	.loc 1 83 1 view .LVU263
	ret
.LVL83:
	.p2align 4,,10
	.p2align 3
.L106:
	.loc 1 83 1 view .LVU264
	mov	rax, QWORD PTR 40[rsp]
.LBB21:
	.loc 1 82 17 view .LVU265
	xor	ecx, ecx
	lea	r10, 0[0+rax*4]
	.loc 1 82 26 discriminator 1 view .LVU266
	xor	eax, eax
.LVL84:
	.p2align 4,,10
	.p2align 3
.L84:
	.loc 1 82 49 discriminator 3 view .LVU267
	movss	xmm1, DWORD PTR [rdx+rax]
	.loc 1 82 5 discriminator 3 view .LVU268
	add	rcx, 1
.LVL85:
	.loc 1 82 49 discriminator 3 view .LVU269
	mulss	xmm1, xmm0
	.loc 1 82 60 discriminator 3 view .LVU270
	addss	xmm1, DWORD PTR [r8+rax]
	.loc 1 82 45 discriminator 3 view .LVU271
	movss	DWORD PTR [r8+rax], xmm1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU272
.LVL86:
	.loc 1 82 26 discriminator 1 view .LVU273
	add	rax, r10
	cmp	r9, rcx
	jne	.L84
.LBE21:
	.loc 1 83 1 is_stmt 0 view .LVU274
	ret
.LVL87:
.L91:
.LBB22:
	.loc 1 82 17 view .LVU275
	xor	eax, eax
	jmp	.L86
.LBE22:
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
.LVL88:
.LFB34:
	.loc 1 86 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 86 15 is_stmt 0 view .LVU277
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
	.seh_endprologue
.LVL89:
.LBB23:
	.loc 1 88 26 is_stmt 1 discriminator 1 view .LVU278
.LBE23:
	.loc 1 86 15 is_stmt 0 view .LVU279
	mov	r10, QWORD PTR 64[rsp]
.LBB24:
	.loc 1 88 26 discriminator 1 view .LVU280
	test	r10, r10
	je	.L107
	lea	rax, -1[r10]
	cmp	rax, 2
	jbe	.L114
	mov	rdi, r10
	movaps	xmm4, xmm0
	xor	eax, eax
	shr	rdi, 2
	shufps	xmm4, xmm4, 0
	sal	rdi, 4
.LVL90:
	.p2align 4,,10
	.p2align 3
.L110:
	.loc 1 88 26 discriminator 1 view .LVU281
	lea	rcx, [r9+rax]
	.loc 1 88 57 discriminator 3 view .LVU282
	movups	xmm5, XMMWORD PTR [r8+rax]
	.loc 1 88 48 discriminator 3 view .LVU283
	movsx	r11, DWORD PTR [rcx]
	movsx	rbx, DWORD PTR 4[rcx]
	movsx	rsi, DWORD PTR 8[rcx]
	movsx	rcx, DWORD PTR 12[rcx]
	movss	xmm3, DWORD PTR [rdx+rbx*4]
	movss	xmm1, DWORD PTR [rdx+rcx*4]
	movss	xmm2, DWORD PTR [rdx+rsi*4]
	unpcklps	xmm2, xmm1
	movss	xmm1, DWORD PTR [rdx+r11*4]
	unpcklps	xmm1, xmm3
	movlhps	xmm1, xmm2
	.loc 1 88 45 discriminator 3 view .LVU284
	mulps	xmm1, xmm4
	.loc 1 88 57 discriminator 3 view .LVU285
	addps	xmm1, xmm5
	.loc 1 88 41 discriminator 3 view .LVU286
	movups	XMMWORD PTR [r8+rax], xmm1
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU287
	.loc 1 88 26 discriminator 1 view .LVU288
	add	rax, 16
	cmp	rax, rdi
	jne	.L110
	test	r10b, 3
	je	.L107
	mov	rcx, r10
	and	rcx, -4
.LVL91:
.L109:
	.loc 1 88 26 is_stmt 0 discriminator 1 view .LVU289
	sub	r10, rcx
.LVL92:
	.loc 1 88 26 discriminator 1 view .LVU290
	cmp	r10, 1
	je	.L112
	lea	rax, 0[0+rcx*4]
	lea	r11, [r9+rax]
	add	rax, r8
	.loc 1 88 48 discriminator 3 view .LVU291
	movsx	rbx, DWORD PTR [r11]
	movsx	r11, DWORD PTR 4[r11]
	movss	xmm1, DWORD PTR [rdx+rbx*4]
	movss	xmm2, DWORD PTR [rdx+r11*4]
	unpcklps	xmm1, xmm2
	.loc 1 88 45 discriminator 3 view .LVU292
	movsldup	xmm2, xmm0
	mulps	xmm1, xmm2
	.loc 1 88 60 discriminator 3 view .LVU293
	movq	xmm2, QWORD PTR [rax]
	.loc 1 88 57 discriminator 3 view .LVU294
	addps	xmm1, xmm2
	.loc 1 88 41 discriminator 3 view .LVU295
	movlps	QWORD PTR [rax], xmm1
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU296
	.loc 1 88 26 discriminator 1 view .LVU297
	test	r10b, 1
	je	.L107
	and	r10, -2
	add	rcx, r10
.L112:
.LVL93:
	.loc 1 88 60 is_stmt 0 discriminator 3 view .LVU298
	lea	rax, [r8+rcx*4]
	.loc 1 88 54 discriminator 3 view .LVU299
	movsx	rcx, DWORD PTR [r9+rcx*4]
	.loc 1 88 45 discriminator 3 view .LVU300
	mulss	xmm0, DWORD PTR [rdx+rcx*4]
.LVL94:
	.loc 1 88 57 discriminator 3 view .LVU301
	addss	xmm0, DWORD PTR [rax]
	.loc 1 88 41 discriminator 3 view .LVU302
	movss	DWORD PTR [rax], xmm0
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU303
	.loc 1 88 26 discriminator 1 view .LVU304
.LVL95:
.L107:
	.loc 1 88 26 is_stmt 0 discriminator 1 view .LVU305
.LBE24:
	.loc 1 89 1 view .LVU306
	pop	rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 24
	pop	rsi
	.cfi_restore 4
	.cfi_def_cfa_offset 16
	pop	rdi
	.cfi_restore 5
	.cfi_def_cfa_offset 8
	ret
.LVL96:
.L114:
	.cfi_restore_state
.LBB25:
	.loc 1 88 17 view .LVU307
	xor	ecx, ecx
	jmp	.L109
.LBE25:
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
.LVL97:
.LFB35:
	.loc 1 95 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 95 15 is_stmt 0 view .LVU309
	.seh_endprologue
.LVL98:
.LBB26:
	.loc 1 96 26 is_stmt 1 discriminator 1 view .LVU310
	test	r9, r9
	je	.L128
	lea	rax, -1[r9]
	cmp	rax, 2
	jbe	.L135
	mov	r10, r9
	xor	eax, eax
	shr	r10, 2
	sal	r10, 4
.LVL99:
	.p2align 4,,10
	.p2align 3
.L131:
	.loc 1 96 48 is_stmt 0 discriminator 3 view .LVU311
	movups	xmm0, XMMWORD PTR [rcx+rax]
	movups	xmm2, XMMWORD PTR [rdx+rax]
	mulps	xmm0, xmm2
	.loc 1 96 41 discriminator 3 view .LVU312
	movups	XMMWORD PTR [r8+rax], xmm0
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU313
	.loc 1 96 26 discriminator 1 view .LVU314
	add	rax, 16
	cmp	rax, r10
	jne	.L131
	test	r9b, 3
	je	.L128
	mov	rax, r9
	and	rax, -4
.L130:
	.loc 1 96 26 is_stmt 0 discriminator 1 view .LVU315
	sub	r9, rax
.LVL100:
	.loc 1 96 26 discriminator 1 view .LVU316
	cmp	r9, 1
	je	.L133
	.loc 1 96 44 discriminator 3 view .LVU317
	movq	xmm0, QWORD PTR [rcx+rax*4]
	.loc 1 96 51 discriminator 3 view .LVU318
	movq	xmm1, QWORD PTR [rdx+rax*4]
	.loc 1 96 48 discriminator 3 view .LVU319
	mulps	xmm0, xmm1
	.loc 1 96 41 discriminator 3 view .LVU320
	movlps	QWORD PTR [r8+rax*4], xmm0
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU321
	.loc 1 96 26 discriminator 1 view .LVU322
	test	r9b, 1
	je	.L128
	and	r9, -2
	add	rax, r9
.L133:
.LVL101:
	.loc 1 96 48 is_stmt 0 discriminator 3 view .LVU323
	movss	xmm0, DWORD PTR [rcx+rax*4]
	mulss	xmm0, DWORD PTR [rdx+rax*4]
	.loc 1 96 41 discriminator 3 view .LVU324
	movss	DWORD PTR [r8+rax*4], xmm0
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU325
	.loc 1 96 26 discriminator 1 view .LVU326
.LVL102:
.L128:
	.loc 1 96 26 is_stmt 0 discriminator 1 view .LVU327
.LBE26:
	.loc 1 97 1 view .LVU328
	ret
.LVL103:
.L135:
.LBB27:
	.loc 1 96 17 view .LVU329
	xor	eax, eax
	jmp	.L130
.LBE27:
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
.LVL104:
.LFB36:
	.loc 1 147 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 147 13 is_stmt 0 view .LVU331
	.seh_endprologue
	.loc 1 148 17 view .LVU332
	fldz
	.loc 1 147 13 view .LVU333
	mov	rax, rcx
	.loc 1 148 17 view .LVU334
	fstp	TBYTE PTR [rcx]
	fld	TBYTE PTR [rcx]
.LVL105:
.LBB28:
	.loc 1 149 26 is_stmt 1 discriminator 1 view .LVU335
	test	r9, r9
	je	.L156
	.loc 1 149 17 is_stmt 0 view .LVU336
	xor	r10d, r10d
.LVL106:
	.p2align 4,,10
	.p2align 3
.L151:
	.loc 1 149 61 discriminator 3 view .LVU337
	fld	DWORD PTR [r8+r10*4]
	.loc 1 149 59 discriminator 3 view .LVU338
	fmul	DWORD PTR [rdx+r10*4]
	.loc 1 149 5 discriminator 3 view .LVU339
	add	r10, 1
.LVL107:
	.loc 1 149 38 discriminator 3 view .LVU340
	faddp	st(1), st
	.loc 1 149 5 is_stmt 1 discriminator 3 view .LVU341
.LVL108:
	.loc 1 149 26 discriminator 1 view .LVU342
	cmp	r9, r10
	jne	.L151
	fstp	TBYTE PTR [rax]
.LBE28:
	.loc 1 150 12 is_stmt 0 view .LVU343
	jmp	.L149
.LVL109:
	.p2align 4,,10
	.p2align 3
.L156:
	.loc 1 150 12 view .LVU344
	fstp	st(0)
.LVL110:
.L149:
	.loc 1 151 1 view .LVU345
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
.LVL111:
.LFB37:
	.loc 1 154 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 154 13 is_stmt 0 view .LVU347
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
	.loc 1 154 13 view .LVU348
	movss	DWORD PTR 4[rsp], xmm1
	.loc 1 154 67 view .LVU349
	fld	DWORD PTR 4[rsp]
	.loc 1 154 13 view .LVU350
	mov	rax, rcx
	movss	DWORD PTR 8[rsp], xmm2
	.loc 1 154 67 view .LVU351
	fmul	DWORD PTR 8[rsp]
	.loc 1 154 13 view .LVU352
	movss	DWORD PTR 12[rsp], xmm3
	.loc 1 154 84 view .LVU353
	fadd	DWORD PTR 12[rsp]
	.loc 1 154 99 view .LVU354
	fstp	TBYTE PTR [rcx]
	.loc 1 154 102 view .LVU355
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
.LVL112:
.LFB38:
	.loc 1 157 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 157 13 is_stmt 0 view .LVU357
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
	.loc 1 157 13 view .LVU358
	movss	DWORD PTR 8[rsp], xmm1
	.loc 1 157 61 view .LVU359
	fld	DWORD PTR 8[rsp]
	.loc 1 157 13 view .LVU360
	mov	rax, rcx
	movss	DWORD PTR 12[rsp], xmm2
	.loc 1 157 61 view .LVU361
	fmul	DWORD PTR 12[rsp]
	.loc 1 157 76 view .LVU362
	fstp	TBYTE PTR [rcx]
	.loc 1 157 79 view .LVU363
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
.LVL113:
.LFB39:
	.loc 1 14 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 14 12 is_stmt 0 view .LVU365
	.seh_endprologue
.LVL114:
.LBB29:
	.loc 1 16 26 is_stmt 1 discriminator 1 view .LVU366
	test	r8, r8
	je	.L165
	cmp	r8, 1
	je	.L166
	mov	r9, r8
	xor	eax, eax
.LBE29:
	.loc 1 15 7 is_stmt 0 view .LVU367
	pxor	xmm0, xmm0
	shr	r9
	sal	r9, 4
.LVL115:
	.p2align 4,,10
	.p2align 3
.L162:
.LBB30:
	.loc 1 16 46 discriminator 3 view .LVU368
	movupd	xmm1, XMMWORD PTR [rcx+rax]
	movupd	xmm3, XMMWORD PTR [rdx+rax]
	add	rax, 16
	mulpd	xmm1, xmm3
	addsd	xmm0, xmm1
.LVL116:
	.loc 1 16 38 discriminator 3 view .LVU369
	unpckhpd	xmm1, xmm1
	addsd	xmm0, xmm1
.LVL117:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU370
	.loc 1 16 26 discriminator 1 view .LVU371
	cmp	rax, r9
	jne	.L162
	test	r8b, 1
	je	.L159
	and	r8, -2
.LVL118:
.L161:
	.loc 1 16 46 is_stmt 0 discriminator 3 view .LVU372
	movsd	xmm1, QWORD PTR [rdx+r8*8]
	mulsd	xmm1, QWORD PTR [rcx+r8*8]
	.loc 1 16 38 discriminator 3 view .LVU373
	addsd	xmm0, xmm1
.LVL119:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU374
	.loc 1 16 26 discriminator 1 view .LVU375
.L159:
	.loc 1 16 26 is_stmt 0 discriminator 1 view .LVU376
.LBE30:
	.loc 1 18 1 view .LVU377
	ret
.LVL120:
	.p2align 4,,10
	.p2align 3
.L165:
	.loc 1 15 7 view .LVU378
	pxor	xmm0, xmm0
	.loc 1 18 1 view .LVU379
	ret
.L166:
.LBB31:
	.loc 1 16 17 view .LVU380
	xor	r8d, r8d
.LVL121:
	.loc 1 16 17 view .LVU381
.LBE31:
	.loc 1 15 7 view .LVU382
	pxor	xmm0, xmm0
	jmp	.L161
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
.LVL122:
.LFB40:
	.loc 1 26 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 26 12 is_stmt 0 view .LVU384
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	sub	rsp, 64
	.seh_stackalloc	64
	.cfi_def_cfa_offset 80
	.seh_endprologue
.LVL123:
	.loc 1 28 7 view .LVU385
	pxor	xmm0, xmm0
	.loc 1 26 12 view .LVU386
	mov	r9, rcx
	mov	r10, rdx
	.loc 1 28 7 view .LVU387
	movups	XMMWORD PTR [rsp], xmm0
	movups	XMMWORD PTR 16[rsp], xmm0
	movups	XMMWORD PTR 32[rsp], xmm0
	movups	XMMWORD PTR 48[rsp], xmm0
.LVL124:
.LBB32:
	.loc 1 30 18 is_stmt 1 discriminator 1 view .LVU388
	cmp	r8, 7
	jbe	.L188
	lea	rbx, -8[r8]
	pxor	xmm1, xmm1
	mov	rax, rcx
	xor	ecx, ecx
.LVL125:
	.loc 1 30 18 is_stmt 0 discriminator 1 view .LVU389
	movapd	xmm2, xmm1
	movapd	xmm3, xmm1
	movapd	xmm4, xmm1
	mov	r11, rbx
	shr	r11, 3
	add	r11, 1
.LVL126:
	.p2align 4,,10
	.p2align 3
.L175:
.LBB33:
	.loc 1 31 30 is_stmt 1 discriminator 1 view .LVU390
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU391
	movupd	xmm5, XMMWORD PTR [rax]
	movupd	xmm0, XMMWORD PTR [rdx]
	add	rcx, 1
	add	rdx, 64
	add	rax, 64
	mulpd	xmm0, xmm5
	movupd	xmm5, XMMWORD PTR -48[rax]
	.loc 1 31 47 discriminator 3 view .LVU392
	addpd	xmm4, xmm0
	.loc 1 31 59 discriminator 3 view .LVU393
	movupd	xmm0, XMMWORD PTR -48[rdx]
	mulpd	xmm0, xmm5
	movupd	xmm5, XMMWORD PTR -32[rax]
	.loc 1 31 47 discriminator 3 view .LVU394
	addpd	xmm3, xmm0
	.loc 1 31 59 discriminator 3 view .LVU395
	movupd	xmm0, XMMWORD PTR -32[rdx]
	mulpd	xmm0, xmm5
	movupd	xmm5, XMMWORD PTR -16[rax]
	.loc 1 31 47 discriminator 3 view .LVU396
	addpd	xmm2, xmm0
	.loc 1 31 59 discriminator 3 view .LVU397
	movupd	xmm0, XMMWORD PTR -16[rdx]
	mulpd	xmm0, xmm5
	.loc 1 31 47 discriminator 3 view .LVU398
	addpd	xmm1, xmm0
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU399
.LVL127:
	.loc 1 31 30 discriminator 1 view .LVU400
	.loc 1 31 9 discriminator 3 view .LVU401
	.loc 1 31 30 discriminator 1 view .LVU402
	.loc 1 31 9 discriminator 3 view .LVU403
	.loc 1 31 30 discriminator 1 view .LVU404
	.loc 1 31 9 discriminator 3 view .LVU405
	.loc 1 31 30 discriminator 1 view .LVU406
	.loc 1 31 9 discriminator 3 view .LVU407
	.loc 1 31 30 discriminator 1 view .LVU408
	.loc 1 31 9 discriminator 3 view .LVU409
	.loc 1 31 30 discriminator 1 view .LVU410
	.loc 1 31 9 discriminator 3 view .LVU411
	.loc 1 31 30 discriminator 1 view .LVU412
	.loc 1 31 9 discriminator 3 view .LVU413
	.loc 1 31 30 discriminator 1 view .LVU414
.LBE33:
	.loc 1 30 18 discriminator 1 view .LVU415
	cmp	rcx, r11
	jb	.L175
	and	rbx, -8
	movups	XMMWORD PTR [rsp], xmm4
	lea	rdx, 8[rbx]
	movups	XMMWORD PTR 16[rsp], xmm3
	movups	XMMWORD PTR 32[rsp], xmm2
	movups	XMMWORD PTR 48[rsp], xmm1
.LVL128:
.L176:
	.loc 1 30 18 is_stmt 0 discriminator 1 view .LVU416
.LBE32:
.LBB34:
	.loc 1 34 26 is_stmt 1 discriminator 1 view .LVU417
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU418
	pxor	xmm0, xmm0
	addsd	xmm0, QWORD PTR [rsp]
	addsd	xmm0, QWORD PTR 8[rsp]
.LVL129:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU419
	.loc 1 34 26 discriminator 1 view .LVU420
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU421
	addsd	xmm0, QWORD PTR 16[rsp]
.LVL130:
	.loc 1 34 38 discriminator 3 view .LVU422
	addsd	xmm0, QWORD PTR 24[rsp]
.LVL131:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU423
	.loc 1 34 26 discriminator 1 view .LVU424
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU425
	addsd	xmm0, QWORD PTR 32[rsp]
.LVL132:
	.loc 1 34 38 discriminator 3 view .LVU426
	addsd	xmm0, QWORD PTR 40[rsp]
.LVL133:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU427
	.loc 1 34 26 discriminator 1 view .LVU428
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU429
	addsd	xmm0, QWORD PTR 48[rsp]
.LVL134:
	.loc 1 34 38 discriminator 3 view .LVU430
	addsd	xmm0, QWORD PTR 56[rsp]
.LVL135:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU431
	.loc 1 34 26 discriminator 1 view .LVU432
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU433
.LBE34:
	.loc 1 35 14 is_stmt 1 discriminator 1 view .LVU434
	cmp	rdx, r8
	jnb	.L171
	sub	r8, rdx
.LVL136:
	.loc 1 35 14 is_stmt 0 discriminator 1 view .LVU435
	cmp	r8, 1
	je	.L177
	mov	r11, r8
	lea	rcx, 0[0+rdx*8]
	xor	eax, eax
	shr	r11
	lea	rbx, [r9+rcx]
	add	rcx, r10
	sal	r11, 4
.LVL137:
	.p2align 4,,10
	.p2align 3
.L178:
	.loc 1 35 34 discriminator 2 view .LVU436
	movupd	xmm1, XMMWORD PTR [rcx+rax]
	movupd	xmm3, XMMWORD PTR [rbx+rax]
	add	rax, 16
	mulpd	xmm1, xmm3
	addsd	xmm0, xmm1
.LVL138:
	.loc 1 35 26 discriminator 2 view .LVU437
	unpckhpd	xmm1, xmm1
	addsd	xmm0, xmm1
.LVL139:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU438
	.loc 1 35 14 discriminator 1 view .LVU439
	cmp	r11, rax
	jne	.L178
	test	r8b, 1
	je	.L171
	and	r8, -2
	add	rdx, r8
.L177:
.LVL140:
	.loc 1 35 34 is_stmt 0 discriminator 2 view .LVU440
	movsd	xmm1, QWORD PTR [r10+rdx*8]
	mulsd	xmm1, QWORD PTR [r9+rdx*8]
	.loc 1 35 26 discriminator 2 view .LVU441
	addsd	xmm0, xmm1
.LVL141:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU442
	.loc 1 35 14 discriminator 1 view .LVU443
.L171:
	.loc 1 37 1 is_stmt 0 view .LVU444
	add	rsp, 64
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
.LVL142:
.L188:
	.cfi_restore_state
	.loc 1 29 12 view .LVU445
	xor	edx, edx
.LVL143:
	.loc 1 29 12 view .LVU446
	jmp	.L176
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
.LVL144:
.LFB41:
	.loc 1 45 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 45 12 is_stmt 0 view .LVU448
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
.LVL145:
.LBB35:
.LBB36:
	.loc 1 47 9 view .LVU449
	pxor	xmm0, xmm0
	movups	XMMWORD PTR [rsp], xmm0
.LVL146:
	.loc 1 47 9 view .LVU450
	test	r8, r8
	je	.L204
	cmp	r8, 1
	je	.L195
	mov	r9, r8
	xor	eax, eax
	pxor	xmm1, xmm1
	shr	r9
	sal	r9, 4
.LVL147:
	.p2align 4,,10
	.p2align 3
.L192:
	.loc 1 48 46 view .LVU451
	movupd	xmm0, XMMWORD PTR [rcx+rax]
	movupd	xmm2, XMMWORD PTR [rdx+rax]
	add	rax, 16
	mulpd	xmm0, xmm2
	.loc 1 48 38 view .LVU452
	addpd	xmm1, xmm0
	cmp	r9, rax
	jne	.L192
	movups	XMMWORD PTR [rsp], xmm1
	test	r8b, 1
	je	.L204
	and	r8, -2
.LVL148:
.L191:
	.loc 1 48 46 view .LVU453
	movsd	xmm0, QWORD PTR [rcx+r8*8]
	mulsd	xmm0, QWORD PTR [rdx+r8*8]
	.loc 1 48 38 view .LVU454
	addsd	xmm0, QWORD PTR [rsp]
.LVL149:
.L190:
	.loc 1 47 9 view .LVU455
	pxor	xmm1, xmm1
	addsd	xmm0, xmm1
.LVL150:
	.loc 1 47 9 view .LVU456
	addsd	xmm0, QWORD PTR 8[rsp]
.LBE36:
.LBE35:
	.loc 1 50 1 view .LVU457
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL151:
	.p2align 4,,10
	.p2align 3
.L204:
	.cfi_restore_state
	.loc 1 50 1 view .LVU458
	movsd	xmm0, QWORD PTR [rsp]
	jmp	.L190
.LVL152:
.L195:
.LBB38:
.LBB37:
	.loc 1 47 9 view .LVU459
	xor	r8d, r8d
.LVL153:
	.loc 1 47 9 view .LVU460
	jmp	.L191
.LBE37:
.LBE38:
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
.LVL154:
.LFB42:
	.loc 1 58 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 58 12 is_stmt 0 view .LVU462
	push	rdi
	.seh_pushreg	rdi
	.cfi_def_cfa_offset 16
	.cfi_offset 5, -16
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 456
	.seh_stackalloc	456
	.cfi_def_cfa_offset 480
	movups	XMMWORD PTR 288[rsp], xmm6
	.seh_savexmm	xmm6, 288
	movups	XMMWORD PTR 304[rsp], xmm7
	.seh_savexmm	xmm7, 304
	movups	XMMWORD PTR 320[rsp], xmm8
	.seh_savexmm	xmm8, 320
	movups	XMMWORD PTR 336[rsp], xmm9
	.seh_savexmm	xmm9, 336
	movups	XMMWORD PTR 352[rsp], xmm10
	.seh_savexmm	xmm10, 352
	movups	XMMWORD PTR 368[rsp], xmm11
	.seh_savexmm	xmm11, 368
	movups	XMMWORD PTR 384[rsp], xmm12
	.seh_savexmm	xmm12, 384
	movups	XMMWORD PTR 400[rsp], xmm13
	.seh_savexmm	xmm13, 400
	movups	XMMWORD PTR 416[rsp], xmm14
	.seh_savexmm	xmm14, 416
	movups	XMMWORD PTR 432[rsp], xmm15
	.seh_savexmm	xmm15, 432
	.cfi_offset 23, -192
	.cfi_offset 24, -176
	.cfi_offset 25, -160
	.cfi_offset 26, -144
	.cfi_offset 27, -128
	.cfi_offset 28, -112
	.cfi_offset 29, -96
	.cfi_offset 30, -80
	.cfi_offset 31, -64
	.cfi_offset 32, -48
	.seh_endprologue
.LVL155:
	.loc 1 60 7 view .LVU463
	xor	eax, eax
	.loc 1 58 12 view .LVU464
	mov	r9, rcx
	.loc 1 60 7 view .LVU465
	lea	rdi, 32[rsp]
	mov	ecx, 32
.LVL156:
	.loc 1 58 12 view .LVU466
	mov	r10, rdx
	.loc 1 60 7 view .LVU467
	rep stosq
.LVL157:
.LBB39:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU468
	cmp	r8, 31
	jbe	.L214
	pxor	xmm11, xmm11
	mov	rdx, r9
.LVL158:
	.loc 1 62 18 is_stmt 0 discriminator 1 view .LVU469
	mov	rax, r10
	mov	r11d, 32
	movapd	xmm15, xmm11
	movapd	xmm14, xmm11
	movapd	xmm13, xmm11
	movups	XMMWORD PTR [rsp], xmm11
	movapd	xmm12, xmm11
	movapd	xmm10, xmm11
	movapd	xmm8, xmm11
	movups	XMMWORD PTR 16[rsp], xmm11
	movapd	xmm6, xmm11
	movapd	xmm4, xmm11
	movapd	xmm5, xmm11
	movapd	xmm9, xmm11
	movapd	xmm7, xmm11
	movapd	xmm3, xmm11
	movapd	xmm2, xmm11
.LVL159:
	.p2align 4,,10
	.p2align 3
.L207:
.LBB40:
.LBB41:
	.loc 1 64 59 view .LVU470
	movupd	xmm1, XMMWORD PTR [rax]
	movupd	xmm0, XMMWORD PTR [rdx]
	mov	rcx, r11
.LBE41:
.LBE40:
	.loc 1 62 18 discriminator 1 view .LVU471
	lea	r11, 32[r11]
.LVL160:
	.loc 1 62 18 discriminator 1 view .LVU472
	add	rdx, 256
	add	rax, 256
.LBB43:
.LBB42:
	.loc 1 64 59 view .LVU473
	mulpd	xmm0, xmm1
	movupd	xmm1, XMMWORD PTR -240[rax]
	.loc 1 64 47 view .LVU474
	addpd	xmm2, xmm0
	.loc 1 64 59 view .LVU475
	movupd	xmm0, XMMWORD PTR -240[rdx]
	mulpd	xmm0, xmm1
	movupd	xmm1, XMMWORD PTR -224[rax]
	.loc 1 64 47 view .LVU476
	addpd	xmm3, xmm0
	.loc 1 64 59 view .LVU477
	movupd	xmm0, XMMWORD PTR -224[rdx]
	mulpd	xmm0, xmm1
	movupd	xmm1, XMMWORD PTR -208[rax]
	.loc 1 64 47 view .LVU478
	addpd	xmm5, xmm0
	.loc 1 64 59 view .LVU479
	movupd	xmm0, XMMWORD PTR -208[rdx]
	mulpd	xmm0, xmm1
	movupd	xmm1, XMMWORD PTR -192[rax]
	.loc 1 64 47 view .LVU480
	addpd	xmm7, xmm0
	.loc 1 64 59 view .LVU481
	movupd	xmm0, XMMWORD PTR -192[rdx]
	mulpd	xmm0, xmm1
	movupd	xmm1, XMMWORD PTR -176[rax]
	.loc 1 64 47 view .LVU482
	addpd	xmm9, xmm0
	.loc 1 64 59 view .LVU483
	movupd	xmm0, XMMWORD PTR -176[rdx]
	mulpd	xmm0, xmm1
	movupd	xmm1, XMMWORD PTR -160[rax]
	.loc 1 64 47 view .LVU484
	addpd	xmm0, XMMWORD PTR [rsp]
	movups	XMMWORD PTR [rsp], xmm0
	.loc 1 64 59 view .LVU485
	movupd	xmm0, XMMWORD PTR -160[rdx]
	mulpd	xmm0, xmm1
	movupd	xmm1, XMMWORD PTR -144[rax]
	.loc 1 64 47 view .LVU486
	addpd	xmm0, XMMWORD PTR 16[rsp]
	movups	XMMWORD PTR 16[rsp], xmm0
	.loc 1 64 59 view .LVU487
	movupd	xmm0, XMMWORD PTR -144[rdx]
	mulpd	xmm0, xmm1
	movupd	xmm1, XMMWORD PTR -128[rax]
	.loc 1 64 47 view .LVU488
	addpd	xmm4, xmm0
	.loc 1 64 59 view .LVU489
	movupd	xmm0, XMMWORD PTR -128[rdx]
	mulpd	xmm0, xmm1
	movupd	xmm1, XMMWORD PTR -112[rax]
	.loc 1 64 47 view .LVU490
	addpd	xmm6, xmm0
	.loc 1 64 59 view .LVU491
	movupd	xmm0, XMMWORD PTR -112[rdx]
	mulpd	xmm0, xmm1
	movupd	xmm1, XMMWORD PTR -96[rax]
	.loc 1 64 47 view .LVU492
	addpd	xmm8, xmm0
	.loc 1 64 59 view .LVU493
	movupd	xmm0, XMMWORD PTR -96[rdx]
	mulpd	xmm0, xmm1
	movupd	xmm1, XMMWORD PTR -80[rax]
	.loc 1 64 47 view .LVU494
	addpd	xmm10, xmm0
	.loc 1 64 59 view .LVU495
	movupd	xmm0, XMMWORD PTR -80[rdx]
	mulpd	xmm0, xmm1
	movupd	xmm1, XMMWORD PTR -64[rax]
	.loc 1 64 47 view .LVU496
	addpd	xmm12, xmm0
	.loc 1 64 59 view .LVU497
	movupd	xmm0, XMMWORD PTR -64[rdx]
	mulpd	xmm0, xmm1
	movupd	xmm1, XMMWORD PTR -48[rax]
	.loc 1 64 47 view .LVU498
	addpd	xmm13, xmm0
	.loc 1 64 59 view .LVU499
	movupd	xmm0, XMMWORD PTR -48[rdx]
	mulpd	xmm0, xmm1
	.loc 1 64 47 view .LVU500
	addpd	xmm14, xmm0
	.loc 1 64 59 view .LVU501
	movupd	xmm0, XMMWORD PTR -32[rdx]
	movupd	xmm1, XMMWORD PTR -32[rax]
	mulpd	xmm0, xmm1
	movupd	xmm1, XMMWORD PTR -16[rdx]
	.loc 1 64 47 view .LVU502
	addpd	xmm15, xmm0
	.loc 1 64 59 view .LVU503
	movupd	xmm0, XMMWORD PTR -16[rax]
	mulpd	xmm0, xmm1
	.loc 1 64 47 view .LVU504
	addpd	xmm11, xmm0
.LVL161:
	.loc 1 64 47 view .LVU505
.LBE42:
.LBE43:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU506
	cmp	r8, r11
	jnb	.L207
	movupd	xmm1, XMMWORD PTR 16[rsp]
	movups	XMMWORD PTR 80[rsp], xmm7
	movupd	xmm7, XMMWORD PTR [rsp]
	movups	XMMWORD PTR 32[rsp], xmm2
	movups	XMMWORD PTR 48[rsp], xmm3
	movups	XMMWORD PTR 64[rsp], xmm5
	movups	XMMWORD PTR 96[rsp], xmm9
	movups	XMMWORD PTR 112[rsp], xmm7
	movups	XMMWORD PTR 128[rsp], xmm1
	movups	XMMWORD PTR 144[rsp], xmm4
	movups	XMMWORD PTR 160[rsp], xmm6
	movups	XMMWORD PTR 176[rsp], xmm8
	movups	XMMWORD PTR 192[rsp], xmm10
	movups	XMMWORD PTR 208[rsp], xmm12
	movups	XMMWORD PTR 224[rsp], xmm13
	movups	XMMWORD PTR 240[rsp], xmm14
	movups	XMMWORD PTR 256[rsp], xmm15
	movups	XMMWORD PTR 272[rsp], xmm11
.L206:
.LVL162:
	.loc 1 62 18 is_stmt 0 discriminator 1 view .LVU507
.LBE39:
.LBB44:
	.loc 1 67 26 is_stmt 1 discriminator 1 view .LVU508
	.loc 1 67 38 is_stmt 0 discriminator 3 view .LVU509
	pxor	xmm0, xmm0
	addsd	xmm0, QWORD PTR 32[rsp]
	addsd	xmm0, QWORD PTR 40[rsp]
.LVL163:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU510
	.loc 1 67 26 discriminator 1 view .LVU511
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU512
	addsd	xmm0, QWORD PTR 48[rsp]
.LVL164:
	.loc 1 67 38 discriminator 3 view .LVU513
	addsd	xmm0, QWORD PTR 56[rsp]
.LVL165:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU514
	.loc 1 67 26 discriminator 1 view .LVU515
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU516
	addsd	xmm0, QWORD PTR 64[rsp]
.LVL166:
	.loc 1 67 38 discriminator 3 view .LVU517
	addsd	xmm0, QWORD PTR 72[rsp]
.LVL167:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU518
	.loc 1 67 26 discriminator 1 view .LVU519
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU520
	addsd	xmm0, QWORD PTR 80[rsp]
.LVL168:
	.loc 1 67 38 discriminator 3 view .LVU521
	addsd	xmm0, QWORD PTR 88[rsp]
.LVL169:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU522
	.loc 1 67 26 discriminator 1 view .LVU523
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU524
	addsd	xmm0, QWORD PTR 96[rsp]
.LVL170:
	.loc 1 67 38 discriminator 3 view .LVU525
	addsd	xmm0, QWORD PTR 104[rsp]
.LVL171:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU526
	.loc 1 67 26 discriminator 1 view .LVU527
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU528
	addsd	xmm0, QWORD PTR 112[rsp]
.LVL172:
	.loc 1 67 38 discriminator 3 view .LVU529
	addsd	xmm0, QWORD PTR 120[rsp]
.LVL173:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU530
	.loc 1 67 26 discriminator 1 view .LVU531
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU532
	addsd	xmm0, QWORD PTR 128[rsp]
.LVL174:
	.loc 1 67 38 discriminator 3 view .LVU533
	addsd	xmm0, QWORD PTR 136[rsp]
.LVL175:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU534
	.loc 1 67 26 discriminator 1 view .LVU535
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU536
	addsd	xmm0, QWORD PTR 144[rsp]
.LVL176:
	.loc 1 67 38 discriminator 3 view .LVU537
	addsd	xmm0, QWORD PTR 152[rsp]
.LVL177:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU538
	.loc 1 67 26 discriminator 1 view .LVU539
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU540
	addsd	xmm0, QWORD PTR 160[rsp]
.LVL178:
	.loc 1 67 38 discriminator 3 view .LVU541
	addsd	xmm0, QWORD PTR 168[rsp]
.LVL179:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU542
	.loc 1 67 26 discriminator 1 view .LVU543
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU544
	addsd	xmm0, QWORD PTR 176[rsp]
.LVL180:
	.loc 1 67 38 discriminator 3 view .LVU545
	addsd	xmm0, QWORD PTR 184[rsp]
.LVL181:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU546
	.loc 1 67 26 discriminator 1 view .LVU547
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU548
	addsd	xmm0, QWORD PTR 192[rsp]
.LVL182:
	.loc 1 67 38 discriminator 3 view .LVU549
	addsd	xmm0, QWORD PTR 200[rsp]
.LVL183:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU550
	.loc 1 67 26 discriminator 1 view .LVU551
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU552
	addsd	xmm0, QWORD PTR 208[rsp]
.LVL184:
	.loc 1 67 38 discriminator 3 view .LVU553
	addsd	xmm0, QWORD PTR 216[rsp]
.LVL185:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU554
	.loc 1 67 26 discriminator 1 view .LVU555
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU556
	addsd	xmm0, QWORD PTR 224[rsp]
.LVL186:
	.loc 1 67 38 discriminator 3 view .LVU557
	addsd	xmm0, QWORD PTR 232[rsp]
.LVL187:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU558
	.loc 1 67 26 discriminator 1 view .LVU559
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU560
	addsd	xmm0, QWORD PTR 240[rsp]
.LVL188:
	.loc 1 67 38 discriminator 3 view .LVU561
	addsd	xmm0, QWORD PTR 248[rsp]
.LVL189:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU562
	.loc 1 67 26 discriminator 1 view .LVU563
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU564
	addsd	xmm0, QWORD PTR 256[rsp]
.LVL190:
	.loc 1 67 38 discriminator 3 view .LVU565
	addsd	xmm0, QWORD PTR 264[rsp]
.LVL191:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU566
	.loc 1 67 26 discriminator 1 view .LVU567
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU568
	addsd	xmm0, QWORD PTR 272[rsp]
.LVL192:
	.loc 1 67 38 discriminator 3 view .LVU569
	addsd	xmm0, QWORD PTR 280[rsp]
.LVL193:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU570
	.loc 1 67 26 discriminator 1 view .LVU571
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU572
.LBE44:
	.loc 1 68 14 is_stmt 1 discriminator 1 view .LVU573
	cmp	rcx, r8
	jnb	.L205
	sub	r8, rcx
.LVL194:
	.loc 1 68 14 is_stmt 0 discriminator 1 view .LVU574
	cmp	r8, 1
	je	.L210
	mov	r11, r8
	lea	rdx, 0[0+rcx*8]
	xor	eax, eax
	shr	r11
	lea	rbx, [r9+rdx]
	add	rdx, r10
	sal	r11, 4
.LVL195:
	.p2align 4,,10
	.p2align 3
.L211:
	.loc 1 68 34 discriminator 2 view .LVU575
	movupd	xmm1, XMMWORD PTR [rdx+rax]
	movupd	xmm3, XMMWORD PTR [rbx+rax]
	add	rax, 16
	mulpd	xmm1, xmm3
	addsd	xmm0, xmm1
.LVL196:
	.loc 1 68 26 discriminator 2 view .LVU576
	unpckhpd	xmm1, xmm1
	addsd	xmm0, xmm1
.LVL197:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU577
	.loc 1 68 14 discriminator 1 view .LVU578
	cmp	r11, rax
	jne	.L211
	test	r8b, 1
	je	.L205
	and	r8, -2
	add	rcx, r8
.L210:
.LVL198:
	.loc 1 68 34 is_stmt 0 discriminator 2 view .LVU579
	movsd	xmm1, QWORD PTR [r10+rcx*8]
	mulsd	xmm1, QWORD PTR [r9+rcx*8]
	.loc 1 68 26 discriminator 2 view .LVU580
	addsd	xmm0, xmm1
.LVL199:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU581
	.loc 1 68 14 discriminator 1 view .LVU582
.L205:
	.loc 1 70 1 is_stmt 0 view .LVU583
	movups	xmm6, XMMWORD PTR 288[rsp]
	movups	xmm7, XMMWORD PTR 304[rsp]
	movups	xmm8, XMMWORD PTR 320[rsp]
	movups	xmm9, XMMWORD PTR 336[rsp]
	movups	xmm10, XMMWORD PTR 352[rsp]
	movups	xmm11, XMMWORD PTR 368[rsp]
	movups	xmm12, XMMWORD PTR 384[rsp]
	movups	xmm13, XMMWORD PTR 400[rsp]
	movups	xmm14, XMMWORD PTR 416[rsp]
	movups	xmm15, XMMWORD PTR 432[rsp]
	add	rsp, 456
	.cfi_remember_state
	.cfi_restore 32
	.cfi_restore 31
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 28
	.cfi_restore 27
	.cfi_restore 26
	.cfi_restore 25
	.cfi_restore 24
	.cfi_restore 23
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	pop	rdi
	.cfi_restore 5
	.cfi_def_cfa_offset 8
	ret
.LVL200:
.L214:
	.cfi_restore_state
	.loc 1 61 12 view .LVU584
	xor	ecx, ecx
	jmp	.L206
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
.LVL201:
.LFB43:
	.loc 1 76 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 76 15 is_stmt 0 view .LVU586
	.seh_endprologue
.LVL202:
.LBB45:
	.loc 1 77 26 is_stmt 1 discriminator 1 view .LVU587
	test	r9, r9
	je	.L224
	cmp	r9, 1
	je	.L229
	mov	rcx, r9
	movddup	xmm2, xmm0
	xor	eax, eax
	shr	rcx
	sal	rcx, 4
.LVL203:
	.p2align 4,,10
	.p2align 3
.L227:
	.loc 1 77 45 is_stmt 0 discriminator 3 view .LVU588
	movupd	xmm1, XMMWORD PTR [rdx+rax]
	.loc 1 77 52 discriminator 3 view .LVU589
	movupd	xmm3, XMMWORD PTR [r8+rax]
	.loc 1 77 45 discriminator 3 view .LVU590
	mulpd	xmm1, xmm2
	.loc 1 77 52 discriminator 3 view .LVU591
	addpd	xmm1, xmm3
	.loc 1 77 41 discriminator 3 view .LVU592
	movups	XMMWORD PTR [r8+rax], xmm1
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU593
	.loc 1 77 26 discriminator 1 view .LVU594
	add	rax, 16
	cmp	rax, rcx
	jne	.L227
	test	r9b, 1
	je	.L224
	and	r9, -2
.LVL204:
.L226:
	.loc 1 77 55 is_stmt 0 discriminator 3 view .LVU595
	lea	rax, [r8+r9*8]
	.loc 1 77 45 discriminator 3 view .LVU596
	mulsd	xmm0, QWORD PTR [rdx+r9*8]
.LVL205:
	.loc 1 77 52 discriminator 3 view .LVU597
	addsd	xmm0, QWORD PTR [rax]
	.loc 1 77 41 discriminator 3 view .LVU598
	movsd	QWORD PTR [rax], xmm0
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU599
	.loc 1 77 26 discriminator 1 view .LVU600
.LVL206:
.L224:
	.loc 1 77 26 is_stmt 0 discriminator 1 view .LVU601
.LBE45:
	.loc 1 78 1 view .LVU602
	ret
.LVL207:
.L229:
.LBB46:
	.loc 1 77 17 view .LVU603
	xor	r9d, r9d
.LVL208:
	.loc 1 77 17 view .LVU604
	jmp	.L226
.LBE46:
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
.LVL209:
.LFB44:
	.loc 1 81 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 81 15 is_stmt 0 view .LVU606
	.seh_endprologue
.LVL210:
.LBB47:
	.loc 1 82 26 is_stmt 1 discriminator 1 view .LVU607
	test	r9, r9
	je	.L237
	cmp	QWORD PTR 40[rsp], 1
	jne	.L254
	cmp	r9, 1
	je	.L245
	mov	rcx, r9
	movddup	xmm2, xmm0
	xor	eax, eax
	shr	rcx
	sal	rcx, 4
.LVL211:
	.p2align 4,,10
	.p2align 3
.L243:
	.loc 1 82 49 is_stmt 0 discriminator 3 view .LVU608
	movupd	xmm1, XMMWORD PTR [rdx+rax]
	.loc 1 82 60 discriminator 3 view .LVU609
	movupd	xmm3, XMMWORD PTR [r8+rax]
	.loc 1 82 49 discriminator 3 view .LVU610
	mulpd	xmm1, xmm2
	.loc 1 82 60 discriminator 3 view .LVU611
	addpd	xmm1, xmm3
	.loc 1 82 45 discriminator 3 view .LVU612
	movups	XMMWORD PTR [r8+rax], xmm1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU613
	.loc 1 82 26 discriminator 1 view .LVU614
	add	rax, 16
	cmp	rax, rcx
	jne	.L243
	test	r9b, 1
	je	.L237
	and	r9, -2
.LVL212:
.L242:
	.loc 1 82 63 is_stmt 0 discriminator 3 view .LVU615
	lea	rax, [r8+r9*8]
	.loc 1 82 49 discriminator 3 view .LVU616
	mulsd	xmm0, QWORD PTR [rdx+r9*8]
.LVL213:
	.loc 1 82 60 discriminator 3 view .LVU617
	addsd	xmm0, QWORD PTR [rax]
	.loc 1 82 45 discriminator 3 view .LVU618
	movsd	QWORD PTR [rax], xmm0
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU619
	.loc 1 82 26 discriminator 1 view .LVU620
.LVL214:
.L237:
	.loc 1 82 26 is_stmt 0 discriminator 1 view .LVU621
.LBE47:
	.loc 1 83 1 view .LVU622
	ret
.LVL215:
	.p2align 4,,10
	.p2align 3
.L254:
	.loc 1 83 1 view .LVU623
	mov	rax, QWORD PTR 40[rsp]
.LBB48:
	.loc 1 82 17 view .LVU624
	xor	ecx, ecx
	lea	r10, 0[0+rax*8]
	.loc 1 82 26 discriminator 1 view .LVU625
	xor	eax, eax
.LVL216:
	.p2align 4,,10
	.p2align 3
.L240:
	.loc 1 82 49 discriminator 3 view .LVU626
	movsd	xmm1, QWORD PTR [rdx+rax]
	.loc 1 82 5 discriminator 3 view .LVU627
	add	rcx, 1
.LVL217:
	.loc 1 82 49 discriminator 3 view .LVU628
	mulsd	xmm1, xmm0
	.loc 1 82 60 discriminator 3 view .LVU629
	addsd	xmm1, QWORD PTR [r8+rax]
	.loc 1 82 45 discriminator 3 view .LVU630
	movsd	QWORD PTR [r8+rax], xmm1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU631
.LVL218:
	.loc 1 82 26 discriminator 1 view .LVU632
	add	rax, r10
	cmp	r9, rcx
	jne	.L240
.LBE48:
	.loc 1 83 1 is_stmt 0 view .LVU633
	ret
.LVL219:
.L245:
.LBB49:
	.loc 1 82 17 view .LVU634
	xor	r9d, r9d
.LVL220:
	.loc 1 82 17 view .LVU635
	jmp	.L242
.LBE49:
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
.LVL221:
.LFB45:
	.loc 1 86 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 86 15 is_stmt 0 view .LVU637
	push	rsi
	.seh_pushreg	rsi
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	.seh_endprologue
.LVL222:
.LBB50:
	.loc 1 88 26 is_stmt 1 discriminator 1 view .LVU638
.LBE50:
	.loc 1 86 15 is_stmt 0 view .LVU639
	mov	rsi, QWORD PTR 56[rsp]
	mov	rcx, rdx
.LBB51:
	.loc 1 88 26 discriminator 1 view .LVU640
	test	rsi, rsi
	je	.L255
	lea	rax, -1[rsi]
	cmp	rax, 2
	jbe	.L260
	mov	rbx, rsi
	movddup	xmm3, xmm0
	mov	rax, r9
	mov	rdx, r8
.LVL223:
	.loc 1 88 26 discriminator 1 view .LVU641
	shr	rbx, 2
	sal	rbx, 4
	add	rbx, r9
.LVL224:
	.p2align 4,,10
	.p2align 3
.L258:
	.loc 1 88 48 discriminator 3 view .LVU642
	movsx	r11, DWORD PTR 8[rax]
	movsx	r10, DWORD PTR 12[rax]
	add	rax, 16
	add	rdx, 32
	.loc 1 88 57 discriminator 3 view .LVU643
	movupd	xmm4, XMMWORD PTR -16[rdx]
	movupd	xmm5, XMMWORD PTR -32[rdx]
	.loc 1 88 48 discriminator 3 view .LVU644
	movsd	xmm1, QWORD PTR [rcx+r11*8]
	movsx	r11, DWORD PTR -16[rax]
	movhpd	xmm1, QWORD PTR [rcx+r10*8]
	movsd	xmm2, QWORD PTR [rcx+r11*8]
	movsx	r10, DWORD PTR -12[rax]
	.loc 1 88 45 discriminator 3 view .LVU645
	mulpd	xmm1, xmm3
	.loc 1 88 48 discriminator 3 view .LVU646
	movhpd	xmm2, QWORD PTR [rcx+r10*8]
	.loc 1 88 45 discriminator 3 view .LVU647
	mulpd	xmm2, xmm3
	.loc 1 88 57 discriminator 3 view .LVU648
	addpd	xmm1, xmm4
	addpd	xmm2, xmm5
	.loc 1 88 41 discriminator 3 view .LVU649
	movups	XMMWORD PTR -16[rdx], xmm1
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU650
	.loc 1 88 26 discriminator 1 view .LVU651
	.loc 1 88 41 is_stmt 0 discriminator 3 view .LVU652
	movups	XMMWORD PTR -32[rdx], xmm2
	cmp	rax, rbx
	jne	.L258
	test	sil, 3
	je	.L255
	mov	rax, rsi
	and	rax, -4
.LVL225:
.L257:
	.loc 1 88 54 discriminator 3 view .LVU653
	movsx	rbx, DWORD PTR [r9+rax*4]
	.loc 1 88 60 discriminator 3 view .LVU654
	lea	rdx, 0[0+rax*8]
	.loc 1 88 54 discriminator 3 view .LVU655
	lea	r11, 0[0+rax*4]
	.loc 1 88 60 discriminator 3 view .LVU656
	lea	r10, [r8+rdx]
	.loc 1 88 45 discriminator 3 view .LVU657
	movsd	xmm1, QWORD PTR [rcx+rbx*8]
	mulsd	xmm1, xmm0
	.loc 1 88 57 discriminator 3 view .LVU658
	addsd	xmm1, QWORD PTR [r10]
	.loc 1 88 41 discriminator 3 view .LVU659
	movsd	QWORD PTR [r10], xmm1
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU660
	.loc 1 88 26 discriminator 1 view .LVU661
	.loc 1 88 5 is_stmt 0 discriminator 3 view .LVU662
	lea	r10, 1[rax]
	.loc 1 88 26 discriminator 1 view .LVU663
	cmp	r10, rsi
	jnb	.L255
	.loc 1 88 54 discriminator 3 view .LVU664
	movsx	rbx, DWORD PTR 4[r9+r11]
	.loc 1 88 60 discriminator 3 view .LVU665
	lea	r10, 8[r8+rdx]
	.loc 1 88 5 discriminator 3 view .LVU666
	add	rax, 2
	.loc 1 88 45 discriminator 3 view .LVU667
	movsd	xmm1, QWORD PTR [rcx+rbx*8]
	mulsd	xmm1, xmm0
	.loc 1 88 57 discriminator 3 view .LVU668
	addsd	xmm1, QWORD PTR [r10]
	.loc 1 88 41 discriminator 3 view .LVU669
	movsd	QWORD PTR [r10], xmm1
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU670
	.loc 1 88 26 discriminator 1 view .LVU671
	cmp	rax, rsi
	jnb	.L255
	.loc 1 88 60 is_stmt 0 discriminator 3 view .LVU672
	lea	rax, 16[r8+rdx]
	.loc 1 88 54 discriminator 3 view .LVU673
	movsx	rdx, DWORD PTR 8[r9+r11]
	.loc 1 88 45 discriminator 3 view .LVU674
	mulsd	xmm0, QWORD PTR [rcx+rdx*8]
.LVL226:
	.loc 1 88 57 discriminator 3 view .LVU675
	addsd	xmm0, QWORD PTR [rax]
	.loc 1 88 41 discriminator 3 view .LVU676
	movsd	QWORD PTR [rax], xmm0
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU677
	.loc 1 88 26 discriminator 1 view .LVU678
.LVL227:
.L255:
	.loc 1 88 26 is_stmt 0 discriminator 1 view .LVU679
.LBE51:
	.loc 1 89 1 view .LVU680
	pop	rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	pop	rsi
	.cfi_restore 4
	.cfi_def_cfa_offset 8
.LVL228:
	.loc 1 89 1 view .LVU681
	ret
.LVL229:
.L260:
	.cfi_restore_state
.LBB52:
	.loc 1 88 17 view .LVU682
	xor	eax, eax
	jmp	.L257
.LBE52:
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
.LVL230:
.LFB46:
	.loc 1 95 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 95 15 is_stmt 0 view .LVU684
	.seh_endprologue
.LVL231:
.LBB53:
	.loc 1 96 26 is_stmt 1 discriminator 1 view .LVU685
	test	r9, r9
	je	.L268
	cmp	r9, 1
	je	.L273
	mov	r10, r9
	xor	eax, eax
	shr	r10
	sal	r10, 4
.LVL232:
	.p2align 4,,10
	.p2align 3
.L271:
	.loc 1 96 48 is_stmt 0 discriminator 3 view .LVU686
	movupd	xmm0, XMMWORD PTR [rcx+rax]
	movupd	xmm1, XMMWORD PTR [rdx+rax]
	mulpd	xmm0, xmm1
	.loc 1 96 41 discriminator 3 view .LVU687
	movups	XMMWORD PTR [r8+rax], xmm0
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU688
	.loc 1 96 26 discriminator 1 view .LVU689
	add	rax, 16
	cmp	rax, r10
	jne	.L271
	test	r9b, 1
	je	.L268
	and	r9, -2
.LVL233:
.L270:
	.loc 1 96 48 is_stmt 0 discriminator 3 view .LVU690
	movsd	xmm0, QWORD PTR [rdx+r9*8]
	mulsd	xmm0, QWORD PTR [rcx+r9*8]
	.loc 1 96 41 discriminator 3 view .LVU691
	movsd	QWORD PTR [r8+r9*8], xmm0
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU692
	.loc 1 96 26 discriminator 1 view .LVU693
.LVL234:
.L268:
	.loc 1 96 26 is_stmt 0 discriminator 1 view .LVU694
.LBE53:
	.loc 1 97 1 view .LVU695
	ret
.LVL235:
.L273:
.LBB54:
	.loc 1 96 17 view .LVU696
	xor	r9d, r9d
.LVL236:
	.loc 1 96 17 view .LVU697
	jmp	.L270
.LBE54:
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
.LVL237:
.LFB47:
	.loc 1 147 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 147 13 is_stmt 0 view .LVU699
	.seh_endprologue
	.loc 1 148 17 view .LVU700
	fldz
	.loc 1 147 13 view .LVU701
	mov	rax, rcx
	.loc 1 148 17 view .LVU702
	fstp	TBYTE PTR [rcx]
	fld	TBYTE PTR [rcx]
.LVL238:
.LBB55:
	.loc 1 149 26 is_stmt 1 discriminator 1 view .LVU703
	test	r9, r9
	je	.L288
	.loc 1 149 17 is_stmt 0 view .LVU704
	xor	r10d, r10d
.LVL239:
	.p2align 4,,10
	.p2align 3
.L283:
	.loc 1 149 61 discriminator 3 view .LVU705
	fld	QWORD PTR [r8+r10*8]
	.loc 1 149 59 discriminator 3 view .LVU706
	fmul	QWORD PTR [rdx+r10*8]
	.loc 1 149 5 discriminator 3 view .LVU707
	add	r10, 1
.LVL240:
	.loc 1 149 38 discriminator 3 view .LVU708
	faddp	st(1), st
	.loc 1 149 5 is_stmt 1 discriminator 3 view .LVU709
.LVL241:
	.loc 1 149 26 discriminator 1 view .LVU710
	cmp	r9, r10
	jne	.L283
	fstp	TBYTE PTR [rax]
.LBE55:
	.loc 1 150 12 is_stmt 0 view .LVU711
	jmp	.L281
.LVL242:
	.p2align 4,,10
	.p2align 3
.L288:
	.loc 1 150 12 view .LVU712
	fstp	st(0)
.LVL243:
.L281:
	.loc 1 151 1 view .LVU713
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
.LVL244:
.LFB48:
	.loc 1 154 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 154 13 is_stmt 0 view .LVU715
	sub	rsp, 40
	.seh_stackalloc	40
	.cfi_def_cfa_offset 48
	.seh_endprologue
	.loc 1 154 13 view .LVU716
	movsd	QWORD PTR 8[rsp], xmm1
	.loc 1 154 67 view .LVU717
	fld	QWORD PTR 8[rsp]
	.loc 1 154 13 view .LVU718
	mov	rax, rcx
	movsd	QWORD PTR 16[rsp], xmm2
	.loc 1 154 67 view .LVU719
	fmul	QWORD PTR 16[rsp]
	.loc 1 154 13 view .LVU720
	movsd	QWORD PTR 24[rsp], xmm3
	.loc 1 154 84 view .LVU721
	fadd	QWORD PTR 24[rsp]
	.loc 1 154 99 view .LVU722
	fstp	TBYTE PTR [rcx]
	.loc 1 154 102 view .LVU723
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
.LVL245:
.LFB49:
	.loc 1 157 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 157 13 is_stmt 0 view .LVU725
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
	.loc 1 157 13 view .LVU726
	movsd	QWORD PTR [rsp], xmm1
	.loc 1 157 61 view .LVU727
	fld	QWORD PTR [rsp]
	.loc 1 157 13 view .LVU728
	mov	rax, rcx
	movsd	QWORD PTR 8[rsp], xmm2
	.loc 1 157 61 view .LVU729
	fmul	QWORD PTR 8[rsp]
	.loc 1 157 76 view .LVU730
	fstp	TBYTE PTR [rcx]
	.loc 1 157 79 view .LVU731
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
.LVL246:
.LFB50:
	.loc 1 14 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 14 12 is_stmt 0 view .LVU733
	.seh_endprologue
.LVL247:
.LBB56:
	.loc 1 16 26 is_stmt 1 discriminator 1 view .LVU734
	test	r8, r8
	je	.L297
	lea	rax, -1[r8]
	cmp	rax, 2
	jbe	.L298
	mov	r9, r8
	xor	eax, eax
	pxor	xmm3, xmm3
	shr	r9, 2
	sal	r9, 4
.LVL248:
	.p2align 4,,10
	.p2align 3
.L294:
	.loc 1 16 46 is_stmt 0 discriminator 3 view .LVU735
	movdqu	xmm0, XMMWORD PTR [rcx+rax]
	movdqu	xmm2, XMMWORD PTR [rdx+rax]
	movdqu	xmm1, XMMWORD PTR [rcx+rax]
	movdqu	xmm4, XMMWORD PTR [rdx+rax]
	add	rax, 16
	psrlq	xmm0, 32
	psrlq	xmm2, 32
	pmuludq	xmm1, xmm4
	pmuludq	xmm0, xmm2
	pshufd	xmm1, xmm1, 8
	pshufd	xmm0, xmm0, 8
	punpckldq	xmm1, xmm0
	.loc 1 16 38 discriminator 3 view .LVU736
	paddd	xmm3, xmm1
.LVL249:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU737
	.loc 1 16 26 discriminator 1 view .LVU738
	cmp	rax, r9
	jne	.L294
	movdqa	xmm0, xmm3
	psrldq	xmm0, 8
	paddd	xmm3, xmm0
	movdqa	xmm0, xmm3
	psrldq	xmm0, 4
	paddd	xmm3, xmm0
	movd	eax, xmm3
	test	r8b, 3
	je	.L291
	mov	r9, r8
	and	r9, -4
.LVL250:
.L293:
	.loc 1 16 46 is_stmt 0 discriminator 3 view .LVU739
	mov	r11d, DWORD PTR [rcx+r9*4]
	imul	r11d, DWORD PTR [rdx+r9*4]
	.loc 1 16 42 discriminator 3 view .LVU740
	lea	r10, 0[0+r9*4]
	.loc 1 16 38 discriminator 3 view .LVU741
	add	eax, r11d
.LVL251:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU742
	.loc 1 16 26 discriminator 1 view .LVU743
	.loc 1 16 5 is_stmt 0 discriminator 3 view .LVU744
	lea	r11, 1[r9]
	.loc 1 16 26 discriminator 1 view .LVU745
	cmp	r11, r8
	jnb	.L291
	.loc 1 16 46 discriminator 3 view .LVU746
	mov	r11d, DWORD PTR 4[rcx+r10]
	imul	r11d, DWORD PTR 4[rdx+r10]
	.loc 1 16 5 discriminator 3 view .LVU747
	add	r9, 2
	.loc 1 16 38 discriminator 3 view .LVU748
	add	eax, r11d
.LVL252:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU749
	.loc 1 16 26 discriminator 1 view .LVU750
	cmp	r9, r8
	jnb	.L291
	.loc 1 16 46 is_stmt 0 discriminator 3 view .LVU751
	mov	edx, DWORD PTR 8[rdx+r10]
.LVL253:
	.loc 1 16 46 discriminator 3 view .LVU752
	imul	edx, DWORD PTR 8[rcx+r10]
	.loc 1 16 38 discriminator 3 view .LVU753
	add	eax, edx
.LVL254:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU754
	.loc 1 16 26 discriminator 1 view .LVU755
.L291:
	.loc 1 16 26 is_stmt 0 discriminator 1 view .LVU756
.LBE56:
	.loc 1 18 1 view .LVU757
	ret
.LVL255:
	.p2align 4,,10
	.p2align 3
.L297:
	.loc 1 15 7 view .LVU758
	xor	eax, eax
	.loc 1 18 1 view .LVU759
	ret
.L298:
.LBB57:
	.loc 1 16 17 view .LVU760
	xor	r9d, r9d
.LBE57:
	.loc 1 15 7 view .LVU761
	xor	eax, eax
	jmp	.L293
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
.LVL256:
.LFB51:
	.loc 1 26 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 26 12 is_stmt 0 view .LVU763
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
	sub	rsp, 32
	.seh_stackalloc	32
	.cfi_def_cfa_offset 64
	.seh_endprologue
.LVL257:
	.loc 1 28 7 view .LVU764
	pxor	xmm0, xmm0
	.loc 1 26 12 view .LVU765
	mov	r9, rdx
	.loc 1 28 7 view .LVU766
	movups	XMMWORD PTR [rsp], xmm0
	movups	XMMWORD PTR 16[rsp], xmm0
.LVL258:
.LBB58:
	.loc 1 30 18 is_stmt 1 discriminator 1 view .LVU767
	cmp	r8, 7
	jbe	.L317
	lea	r10, -8[r8]
	pxor	xmm3, xmm3
	xor	eax, eax
	xor	edx, edx
.LVL259:
	.loc 1 30 18 is_stmt 0 discriminator 1 view .LVU768
	mov	r11, r10
	movdqa	xmm4, xmm3
	shr	r11, 3
	add	r11, 1
.LVL260:
	.p2align 4,,10
	.p2align 3
.L307:
.LBB59:
	.loc 1 31 30 is_stmt 1 discriminator 1 view .LVU769
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU770
	movdqu	xmm0, XMMWORD PTR [r9+rax]
	movdqu	xmm2, XMMWORD PTR [rcx+rax]
	add	rdx, 1
	movdqu	xmm5, XMMWORD PTR [rcx+rax]
	movdqu	xmm1, XMMWORD PTR [r9+rax]
	psrlq	xmm2, 32
	psrlq	xmm0, 32
	pmuludq	xmm1, xmm5
	pmuludq	xmm0, xmm2
	movdqu	xmm2, XMMWORD PTR 16[rcx+rax]
	movdqu	xmm5, XMMWORD PTR 16[rcx+rax]
	psrlq	xmm2, 32
	pshufd	xmm0, xmm0, 8
	pshufd	xmm1, xmm1, 8
	punpckldq	xmm1, xmm0
	movdqu	xmm0, XMMWORD PTR 16[r9+rax]
	.loc 1 31 47 discriminator 3 view .LVU771
	paddd	xmm4, xmm1
	.loc 1 31 59 discriminator 3 view .LVU772
	movdqu	xmm1, XMMWORD PTR 16[r9+rax]
	add	rax, 32
	psrlq	xmm0, 32
	pmuludq	xmm1, xmm5
	pmuludq	xmm0, xmm2
	pshufd	xmm1, xmm1, 8
	pshufd	xmm0, xmm0, 8
	punpckldq	xmm1, xmm0
	.loc 1 31 47 discriminator 3 view .LVU773
	paddd	xmm3, xmm1
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU774
.LVL261:
	.loc 1 31 30 discriminator 1 view .LVU775
	.loc 1 31 9 discriminator 3 view .LVU776
	.loc 1 31 30 discriminator 1 view .LVU777
	.loc 1 31 9 discriminator 3 view .LVU778
	.loc 1 31 30 discriminator 1 view .LVU779
	.loc 1 31 9 discriminator 3 view .LVU780
	.loc 1 31 30 discriminator 1 view .LVU781
	.loc 1 31 9 discriminator 3 view .LVU782
	.loc 1 31 30 discriminator 1 view .LVU783
	.loc 1 31 9 discriminator 3 view .LVU784
	.loc 1 31 30 discriminator 1 view .LVU785
	.loc 1 31 9 discriminator 3 view .LVU786
	.loc 1 31 30 discriminator 1 view .LVU787
	.loc 1 31 9 discriminator 3 view .LVU788
	.loc 1 31 30 discriminator 1 view .LVU789
.LBE59:
	.loc 1 30 18 discriminator 1 view .LVU790
	cmp	rdx, r11
	jb	.L307
	and	r10, -8
	movups	XMMWORD PTR [rsp], xmm4
	movdqa	xmm0, xmm4
	add	r10, 8
	movups	XMMWORD PTR 16[rsp], xmm3
.LVL262:
.L308:
	.loc 1 30 18 is_stmt 0 discriminator 1 view .LVU791
.LBE58:
.LBB60:
	.loc 1 34 26 is_stmt 1 discriminator 1 view .LVU792
	.loc 1 34 5 discriminator 3 view .LVU793
	.loc 1 34 26 discriminator 1 view .LVU794
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU795
	paddd	xmm0, XMMWORD PTR 16[rsp]
.LVL263:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU796
	.loc 1 34 26 discriminator 1 view .LVU797
	movdqa	xmm1, xmm0
	psrldq	xmm1, 8
	paddd	xmm0, xmm1
	movdqa	xmm1, xmm0
	psrldq	xmm1, 4
	paddd	xmm0, xmm1
	movd	edx, xmm0
.LVL264:
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU798
.LBE60:
	.loc 1 35 14 is_stmt 1 discriminator 1 view .LVU799
	cmp	r10, r8
	jnb	.L303
	mov	rdi, r8
	sub	rdi, r10
	lea	rax, -1[rdi]
	cmp	rax, 2
	jbe	.L309
	mov	rbx, rdi
	lea	r11, 0[0+r10*4]
	pxor	xmm3, xmm3
	xor	eax, eax
	shr	rbx, 2
	lea	rsi, [rcx+r11]
	add	r11, r9
	sal	rbx, 4
.LVL265:
	.p2align 4,,10
	.p2align 3
.L310:
	.loc 1 35 34 is_stmt 0 discriminator 2 view .LVU800
	movdqu	xmm0, XMMWORD PTR [r11+rax]
	movdqu	xmm2, XMMWORD PTR [rsi+rax]
	movdqu	xmm1, XMMWORD PTR [r11+rax]
	movdqu	xmm4, XMMWORD PTR [rsi+rax]
	add	rax, 16
	psrlq	xmm0, 32
	psrlq	xmm2, 32
	pmuludq	xmm1, xmm4
	pmuludq	xmm0, xmm2
	pshufd	xmm1, xmm1, 8
	pshufd	xmm0, xmm0, 8
	punpckldq	xmm1, xmm0
	.loc 1 35 26 discriminator 2 view .LVU801
	paddd	xmm3, xmm1
.LVL266:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU802
	.loc 1 35 14 discriminator 1 view .LVU803
	cmp	rbx, rax
	jne	.L310
	movdqa	xmm0, xmm3
	psrldq	xmm0, 8
	paddd	xmm3, xmm0
	movdqa	xmm0, xmm3
	psrldq	xmm0, 4
	paddd	xmm3, xmm0
	movd	eax, xmm3
	add	edx, eax
	test	dil, 3
	je	.L303
	and	rdi, -4
	add	r10, rdi
.LVL267:
.L309:
	.loc 1 35 34 is_stmt 0 discriminator 2 view .LVU804
	mov	r11d, DWORD PTR [r9+r10*4]
	imul	r11d, DWORD PTR [rcx+r10*4]
	.loc 1 35 30 discriminator 2 view .LVU805
	lea	rax, 0[0+r10*4]
	.loc 1 35 26 discriminator 2 view .LVU806
	add	edx, r11d
.LVL268:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU807
	.loc 1 35 14 discriminator 1 view .LVU808
	.loc 1 35 5 is_stmt 0 discriminator 2 view .LVU809
	lea	r11, 1[r10]
	.loc 1 35 14 discriminator 1 view .LVU810
	cmp	r11, r8
	jnb	.L303
	.loc 1 35 34 discriminator 2 view .LVU811
	mov	r11d, DWORD PTR 4[rcx+rax]
	imul	r11d, DWORD PTR 4[r9+rax]
	.loc 1 35 5 discriminator 2 view .LVU812
	add	r10, 2
	.loc 1 35 26 discriminator 2 view .LVU813
	add	edx, r11d
.LVL269:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU814
	.loc 1 35 14 discriminator 1 view .LVU815
	cmp	r10, r8
	jnb	.L303
	.loc 1 35 34 is_stmt 0 discriminator 2 view .LVU816
	mov	r8d, DWORD PTR 8[r9+rax]
.LVL270:
	.loc 1 35 34 discriminator 2 view .LVU817
	imul	r8d, DWORD PTR 8[rcx+rax]
	.loc 1 35 26 discriminator 2 view .LVU818
	add	edx, r8d
.LVL271:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU819
	.loc 1 35 14 discriminator 1 view .LVU820
.L303:
	.loc 1 37 1 is_stmt 0 view .LVU821
	mov	eax, edx
	add	rsp, 32
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 24
	pop	rsi
	.cfi_restore 4
	.cfi_def_cfa_offset 16
	pop	rdi
	.cfi_restore 5
	.cfi_def_cfa_offset 8
	ret
.LVL272:
.L317:
	.cfi_restore_state
	.loc 1 37 1 view .LVU822
	movdqu	xmm0, XMMWORD PTR [rsp]
	.loc 1 29 12 view .LVU823
	xor	r10d, r10d
	jmp	.L308
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
.LVL273:
.LFB52:
	.loc 1 45 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 45 12 is_stmt 0 view .LVU825
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
.LVL274:
.LBB61:
.LBB62:
	.loc 1 47 9 view .LVU826
	pxor	xmm0, xmm0
	movups	XMMWORD PTR [rsp], xmm0
.LVL275:
	.loc 1 47 9 view .LVU827
	test	r8, r8
	je	.L319
	cmp	r8, 3
	jbe	.L324
	mov	r9, r8
	xor	eax, eax
	pxor	xmm3, xmm3
	shr	r9, 2
	sal	r9, 4
.LVL276:
	.p2align 4,,10
	.p2align 3
.L321:
	.loc 1 48 46 view .LVU828
	movdqu	xmm0, XMMWORD PTR [rcx+rax]
	movdqu	xmm2, XMMWORD PTR [rdx+rax]
	movdqu	xmm1, XMMWORD PTR [rcx+rax]
	movdqu	xmm4, XMMWORD PTR [rdx+rax]
	add	rax, 16
	psrlq	xmm0, 32
	psrlq	xmm2, 32
	pmuludq	xmm1, xmm4
	pmuludq	xmm0, xmm2
	pshufd	xmm1, xmm1, 8
	pshufd	xmm0, xmm0, 8
	punpckldq	xmm1, xmm0
	.loc 1 48 38 view .LVU829
	paddd	xmm3, xmm1
	cmp	r9, rax
	jne	.L321
	mov	rax, r8
	movups	XMMWORD PTR [rsp], xmm3
	and	rax, -4
	test	r8b, 3
	je	.L319
.L320:
.LVL277:
	.loc 1 48 46 view .LVU830
	mov	r9d, DWORD PTR [rcx+rax*4]
	lea	r10, 1[rax]
	.loc 1 48 42 view .LVU831
	lea	r11, 0[0+rax*4]
	.loc 1 48 46 view .LVU832
	imul	r9d, DWORD PTR [rdx+rax*4]
	.loc 1 48 38 view .LVU833
	add	r9d, DWORD PTR [rsp]
	mov	DWORD PTR [rsp], r9d
	.loc 1 48 38 view .LVU834
	cmp	r10, r8
	jnb	.L319
	.loc 1 48 46 view .LVU835
	mov	r10d, DWORD PTR 4[rcx+r11]
	imul	r10d, DWORD PTR 4[rdx+r11]
	add	rax, 2
	.loc 1 48 38 view .LVU836
	add	r9d, r10d
	mov	DWORD PTR [rsp], r9d
	.loc 1 48 38 view .LVU837
	cmp	rax, r8
	jnb	.L319
	.loc 1 48 46 view .LVU838
	mov	eax, DWORD PTR 8[rcx+r11]
	imul	eax, DWORD PTR 8[rdx+r11]
	.loc 1 48 38 view .LVU839
	add	eax, r9d
	mov	DWORD PTR [rsp], eax
.LVL278:
.L319:
	.loc 1 48 38 view .LVU840
	movdqu	xmm0, XMMWORD PTR [rsp]
	psrldq	xmm0, 8
	paddd	xmm0, XMMWORD PTR [rsp]
.LBE62:
.LBE61:
	.loc 1 49 12 discriminator 1 view .LVU841
	movdqa	xmm1, xmm0
	psrldq	xmm1, 4
	paddd	xmm0, xmm1
	movd	eax, xmm0
	.loc 1 50 1 view .LVU842
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL279:
.L324:
	.cfi_restore_state
.LBB64:
.LBB63:
	.loc 1 47 9 view .LVU843
	xor	eax, eax
	jmp	.L320
.LBE63:
.LBE64:
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
.LVL280:
.LFB53:
	.loc 1 58 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 58 12 is_stmt 0 view .LVU845
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
	sub	rsp, 208
	.seh_stackalloc	208
	.cfi_def_cfa_offset 240
	movups	XMMWORD PTR 128[rsp], xmm6
	.seh_savexmm	xmm6, 128
	movups	XMMWORD PTR 144[rsp], xmm7
	.seh_savexmm	xmm7, 144
	movups	XMMWORD PTR 160[rsp], xmm8
	.seh_savexmm	xmm8, 160
	movups	XMMWORD PTR 176[rsp], xmm9
	.seh_savexmm	xmm9, 176
	movups	XMMWORD PTR 192[rsp], xmm10
	.seh_savexmm	xmm10, 192
	.cfi_offset 23, -112
	.cfi_offset 24, -96
	.cfi_offset 25, -80
	.cfi_offset 26, -64
	.cfi_offset 27, -48
	.seh_endprologue
.LVL281:
	.loc 1 60 7 view .LVU846
	xor	eax, eax
	.loc 1 58 12 view .LVU847
	mov	r10, rcx
	.loc 1 60 7 view .LVU848
	mov	rdi, rsp
	mov	ecx, 16
.LVL282:
	.loc 1 58 12 view .LVU849
	mov	r11, rdx
	.loc 1 60 7 view .LVU850
	rep stosq
.LVL283:
.LBB65:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU851
	cmp	r8, 31
	jbe	.L342
	pxor	xmm5, xmm5
	mov	rdx, r10
.LVL284:
	.loc 1 62 18 is_stmt 0 discriminator 1 view .LVU852
	mov	rax, r11
	mov	ecx, 32
	movdqa	xmm2, xmm5
	movdqa	xmm1, xmm5
	movdqa	xmm8, xmm5
	movdqa	xmm7, xmm5
	movdqa	xmm6, xmm5
	movdqa	xmm4, xmm5
	movdqa	xmm3, xmm5
.LVL285:
	.p2align 4,,10
	.p2align 3
.L335:
.LBB66:
.LBB67:
	.loc 1 64 59 view .LVU853
	movdqu	xmm0, XMMWORD PTR [rax]
	movdqu	xmm9, XMMWORD PTR [rdx]
	mov	r9, rcx
.LBE67:
.LBE66:
	.loc 1 62 18 discriminator 1 view .LVU854
	lea	rcx, 32[rcx]
.LVL286:
.LBB70:
.LBB68:
	.loc 1 64 59 view .LVU855
	movdqu	xmm10, XMMWORD PTR [rax]
.LBE68:
.LBE70:
	.loc 1 62 18 discriminator 1 view .LVU856
	sub	rdx, -128
	sub	rax, -128
.LBB71:
.LBB69:
	.loc 1 64 59 view .LVU857
	pmuludq	xmm9, xmm0
	movdqu	xmm0, XMMWORD PTR -128[rdx]
	psrlq	xmm10, 32
	psrlq	xmm0, 32
	pmuludq	xmm0, xmm10
	movdqu	xmm10, XMMWORD PTR -112[rax]
	pshufd	xmm9, xmm9, 8
	psrlq	xmm10, 32
	pshufd	xmm0, xmm0, 8
	punpckldq	xmm9, xmm0
	movdqu	xmm0, XMMWORD PTR -112[rax]
	.loc 1 64 47 view .LVU858
	paddd	xmm3, xmm9
	.loc 1 64 59 view .LVU859
	movdqu	xmm9, XMMWORD PTR -112[rdx]
	pmuludq	xmm9, xmm0
	movdqu	xmm0, XMMWORD PTR -112[rdx]
	psrlq	xmm0, 32
	pmuludq	xmm0, xmm10
	movdqu	xmm10, XMMWORD PTR -96[rax]
	pshufd	xmm9, xmm9, 8
	psrlq	xmm10, 32
	pshufd	xmm0, xmm0, 8
	punpckldq	xmm9, xmm0
	movdqu	xmm0, XMMWORD PTR -96[rax]
	.loc 1 64 47 view .LVU860
	paddd	xmm4, xmm9
	.loc 1 64 59 view .LVU861
	movdqu	xmm9, XMMWORD PTR -96[rdx]
	pmuludq	xmm9, xmm0
	movdqu	xmm0, XMMWORD PTR -96[rdx]
	psrlq	xmm0, 32
	pmuludq	xmm0, xmm10
	movdqu	xmm10, XMMWORD PTR -80[rax]
	pshufd	xmm9, xmm9, 8
	psrlq	xmm10, 32
	pshufd	xmm0, xmm0, 8
	punpckldq	xmm9, xmm0
	movdqu	xmm0, XMMWORD PTR -80[rax]
	.loc 1 64 47 view .LVU862
	paddd	xmm6, xmm9
	.loc 1 64 59 view .LVU863
	movdqu	xmm9, XMMWORD PTR -80[rdx]
	pmuludq	xmm9, xmm0
	movdqu	xmm0, XMMWORD PTR -80[rdx]
	psrlq	xmm0, 32
	pmuludq	xmm0, xmm10
	movdqu	xmm10, XMMWORD PTR -64[rax]
	pshufd	xmm9, xmm9, 8
	psrlq	xmm10, 32
	pshufd	xmm0, xmm0, 8
	punpckldq	xmm9, xmm0
	movdqu	xmm0, XMMWORD PTR -64[rax]
	.loc 1 64 47 view .LVU864
	paddd	xmm7, xmm9
	.loc 1 64 59 view .LVU865
	movdqu	xmm9, XMMWORD PTR -64[rdx]
	pmuludq	xmm9, xmm0
	movdqu	xmm0, XMMWORD PTR -64[rdx]
	psrlq	xmm0, 32
	pmuludq	xmm0, xmm10
	movdqu	xmm10, XMMWORD PTR -48[rax]
	pshufd	xmm9, xmm9, 8
	psrlq	xmm10, 32
	pshufd	xmm0, xmm0, 8
	punpckldq	xmm9, xmm0
	movdqu	xmm0, XMMWORD PTR -48[rax]
	.loc 1 64 47 view .LVU866
	paddd	xmm8, xmm9
	.loc 1 64 59 view .LVU867
	movdqu	xmm9, XMMWORD PTR -48[rdx]
	pmuludq	xmm9, xmm0
	movdqu	xmm0, XMMWORD PTR -48[rdx]
	psrlq	xmm0, 32
	pmuludq	xmm0, xmm10
	movdqu	xmm10, XMMWORD PTR -32[rax]
	pshufd	xmm9, xmm9, 8
	psrlq	xmm10, 32
	pshufd	xmm0, xmm0, 8
	punpckldq	xmm9, xmm0
	movdqu	xmm0, XMMWORD PTR -32[rax]
	.loc 1 64 47 view .LVU868
	paddd	xmm1, xmm9
	.loc 1 64 59 view .LVU869
	movdqu	xmm9, XMMWORD PTR -32[rdx]
	pmuludq	xmm9, xmm0
	movdqu	xmm0, XMMWORD PTR -32[rdx]
	psrlq	xmm0, 32
	pmuludq	xmm0, xmm10
	movdqu	xmm10, XMMWORD PTR -16[rax]
	pshufd	xmm9, xmm9, 8
	psrlq	xmm10, 32
	pshufd	xmm0, xmm0, 8
	punpckldq	xmm9, xmm0
	movdqu	xmm0, XMMWORD PTR -16[rax]
	.loc 1 64 47 view .LVU870
	paddd	xmm2, xmm9
	.loc 1 64 59 view .LVU871
	movdqu	xmm9, XMMWORD PTR -16[rdx]
	pmuludq	xmm9, xmm0
	movdqu	xmm0, XMMWORD PTR -16[rdx]
	psrlq	xmm0, 32
	pmuludq	xmm0, xmm10
	pshufd	xmm9, xmm9, 8
	pshufd	xmm0, xmm0, 8
	punpckldq	xmm9, xmm0
	.loc 1 64 47 view .LVU872
	paddd	xmm5, xmm9
.LVL287:
	.loc 1 64 47 view .LVU873
.LBE69:
.LBE71:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU874
	cmp	r8, rcx
	jnb	.L335
	movups	XMMWORD PTR [rsp], xmm3
	movdqa	xmm0, xmm3
	movups	XMMWORD PTR 16[rsp], xmm4
	movups	XMMWORD PTR 32[rsp], xmm6
	movups	XMMWORD PTR 48[rsp], xmm7
	movups	XMMWORD PTR 64[rsp], xmm8
	movups	XMMWORD PTR 80[rsp], xmm1
	movups	XMMWORD PTR 96[rsp], xmm2
	movups	XMMWORD PTR 112[rsp], xmm5
.L334:
.LVL288:
	.loc 1 62 18 is_stmt 0 discriminator 1 view .LVU875
.LBE65:
.LBB72:
	.loc 1 67 26 is_stmt 1 discriminator 1 view .LVU876
	.loc 1 67 5 discriminator 3 view .LVU877
	.loc 1 67 26 discriminator 1 view .LVU878
	.loc 1 67 38 is_stmt 0 discriminator 3 view .LVU879
	paddd	xmm0, XMMWORD PTR 16[rsp]
.LVL289:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU880
	.loc 1 67 26 discriminator 1 view .LVU881
	.loc 1 67 38 is_stmt 0 discriminator 3 view .LVU882
	paddd	xmm0, XMMWORD PTR 32[rsp]
.LVL290:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU883
	.loc 1 67 26 discriminator 1 view .LVU884
	.loc 1 67 38 is_stmt 0 discriminator 3 view .LVU885
	paddd	xmm0, XMMWORD PTR 48[rsp]
.LVL291:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU886
	.loc 1 67 26 discriminator 1 view .LVU887
	.loc 1 67 38 is_stmt 0 discriminator 3 view .LVU888
	paddd	xmm0, XMMWORD PTR 64[rsp]
.LVL292:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU889
	.loc 1 67 26 discriminator 1 view .LVU890
	.loc 1 67 38 is_stmt 0 discriminator 3 view .LVU891
	paddd	xmm0, XMMWORD PTR 80[rsp]
.LVL293:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU892
	.loc 1 67 26 discriminator 1 view .LVU893
	.loc 1 67 38 is_stmt 0 discriminator 3 view .LVU894
	paddd	xmm0, XMMWORD PTR 96[rsp]
.LVL294:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU895
	.loc 1 67 26 discriminator 1 view .LVU896
	.loc 1 67 38 is_stmt 0 discriminator 3 view .LVU897
	paddd	xmm0, XMMWORD PTR 112[rsp]
.LVL295:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU898
	.loc 1 67 26 discriminator 1 view .LVU899
	movdqa	xmm1, xmm0
	psrldq	xmm1, 8
	paddd	xmm0, xmm1
	movdqa	xmm1, xmm0
	psrldq	xmm1, 4
	paddd	xmm0, xmm1
	movd	eax, xmm0
.LVL296:
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU900
.LBE72:
	.loc 1 68 14 is_stmt 1 discriminator 1 view .LVU901
	cmp	r9, r8
	jnb	.L333
	mov	rdi, r8
	sub	rdi, r9
	lea	rdx, -1[rdi]
	cmp	rdx, 2
	jbe	.L338
	mov	rbx, rdi
	lea	rcx, 0[0+r9*4]
	pxor	xmm3, xmm3
	xor	edx, edx
	shr	rbx, 2
	lea	rsi, [r10+rcx]
	add	rcx, r11
	sal	rbx, 4
.LVL297:
	.p2align 4,,10
	.p2align 3
.L339:
	.loc 1 68 34 is_stmt 0 discriminator 2 view .LVU902
	movdqu	xmm0, XMMWORD PTR [rcx+rdx]
	movdqu	xmm2, XMMWORD PTR [rsi+rdx]
	movdqu	xmm1, XMMWORD PTR [rcx+rdx]
	movdqu	xmm4, XMMWORD PTR [rsi+rdx]
	add	rdx, 16
	psrlq	xmm0, 32
	psrlq	xmm2, 32
	pmuludq	xmm1, xmm4
	pmuludq	xmm0, xmm2
	pshufd	xmm1, xmm1, 8
	pshufd	xmm0, xmm0, 8
	punpckldq	xmm1, xmm0
	.loc 1 68 26 discriminator 2 view .LVU903
	paddd	xmm3, xmm1
.LVL298:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU904
	.loc 1 68 14 discriminator 1 view .LVU905
	cmp	rbx, rdx
	jne	.L339
	movdqa	xmm0, xmm3
	psrldq	xmm0, 8
	paddd	xmm3, xmm0
	movdqa	xmm0, xmm3
	psrldq	xmm0, 4
	paddd	xmm3, xmm0
	movd	edx, xmm3
	add	eax, edx
	test	dil, 3
	je	.L333
	and	rdi, -4
	add	r9, rdi
.LVL299:
.L338:
	.loc 1 68 34 is_stmt 0 discriminator 2 view .LVU906
	mov	edx, DWORD PTR [r10+r9*4]
	imul	edx, DWORD PTR [r11+r9*4]
	.loc 1 68 30 discriminator 2 view .LVU907
	lea	rcx, 0[0+r9*4]
	.loc 1 68 26 discriminator 2 view .LVU908
	add	eax, edx
.LVL300:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU909
	.loc 1 68 14 discriminator 1 view .LVU910
	.loc 1 68 5 is_stmt 0 discriminator 2 view .LVU911
	lea	rdx, 1[r9]
	.loc 1 68 14 discriminator 1 view .LVU912
	cmp	rdx, r8
	jnb	.L333
	.loc 1 68 34 discriminator 2 view .LVU913
	mov	edx, DWORD PTR 4[r10+rcx]
	imul	edx, DWORD PTR 4[r11+rcx]
	.loc 1 68 26 discriminator 2 view .LVU914
	add	eax, edx
.LVL301:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU915
	.loc 1 68 14 discriminator 1 view .LVU916
	.loc 1 68 5 is_stmt 0 discriminator 2 view .LVU917
	lea	rdx, 2[r9]
	.loc 1 68 14 discriminator 1 view .LVU918
	cmp	rdx, r8
	jnb	.L333
	.loc 1 68 34 discriminator 2 view .LVU919
	mov	edx, DWORD PTR 8[r11+rcx]
	imul	edx, DWORD PTR 8[r10+rcx]
	.loc 1 68 26 discriminator 2 view .LVU920
	add	eax, edx
.LVL302:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU921
	.loc 1 68 14 discriminator 1 view .LVU922
.L333:
	.loc 1 70 1 is_stmt 0 view .LVU923
	movups	xmm6, XMMWORD PTR 128[rsp]
	movups	xmm7, XMMWORD PTR 144[rsp]
	movups	xmm8, XMMWORD PTR 160[rsp]
	movups	xmm9, XMMWORD PTR 176[rsp]
	movups	xmm10, XMMWORD PTR 192[rsp]
	add	rsp, 208
	.cfi_remember_state
	.cfi_restore 27
	.cfi_restore 26
	.cfi_restore 25
	.cfi_restore 24
	.cfi_restore 23
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 24
	pop	rsi
	.cfi_restore 4
	.cfi_def_cfa_offset 16
	pop	rdi
	.cfi_restore 5
	.cfi_def_cfa_offset 8
	ret
.LVL303:
.L342:
	.cfi_restore_state
	.loc 1 70 1 view .LVU924
	movdqu	xmm0, XMMWORD PTR [rsp]
	.loc 1 61 12 view .LVU925
	xor	r9d, r9d
	jmp	.L334
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
.LVL304:
.LFB54:
	.loc 1 76 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 76 15 is_stmt 0 view .LVU927
	.seh_endprologue
.LVL305:
.LBB73:
	.loc 1 77 26 is_stmt 1 discriminator 1 view .LVU928
.LBE73:
	.loc 1 76 15 is_stmt 0 view .LVU929
	mov	r11d, ecx
	mov	r10, rdx
.LBB74:
	.loc 1 77 26 discriminator 1 view .LVU930
	test	r9, r9
	je	.L349
	lea	rax, -1[r9]
	cmp	rax, 2
	jbe	.L354
	movd	xmm4, ecx
	mov	rdx, r9
.LVL306:
	.loc 1 77 26 discriminator 1 view .LVU931
	xor	eax, eax
	pshufd	xmm2, xmm4, 0
	shr	rdx, 2
	movdqa	xmm3, xmm2
	sal	rdx, 4
	psrlq	xmm3, 32
.LVL307:
	.p2align 4,,10
	.p2align 3
.L352:
	.loc 1 77 45 discriminator 3 view .LVU932
	movdqu	xmm0, XMMWORD PTR [r10+rax]
	movdqu	xmm1, XMMWORD PTR [r10+rax]
	psrlq	xmm0, 32
	pmuludq	xmm1, xmm2
	pmuludq	xmm0, xmm3
	pshufd	xmm1, xmm1, 8
	pshufd	xmm0, xmm0, 8
	punpckldq	xmm1, xmm0
	.loc 1 77 52 discriminator 3 view .LVU933
	movdqu	xmm0, XMMWORD PTR [r8+rax]
	paddd	xmm0, xmm1
	.loc 1 77 41 discriminator 3 view .LVU934
	movups	XMMWORD PTR [r8+rax], xmm0
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU935
	.loc 1 77 26 discriminator 1 view .LVU936
	add	rax, 16
	cmp	rax, rdx
	jne	.L352
	test	r9b, 3
	je	.L349
	mov	rcx, r9
.LVL308:
	.loc 1 77 26 is_stmt 0 discriminator 1 view .LVU937
	and	rcx, -4
.LVL309:
.L351:
	.loc 1 77 45 discriminator 3 view .LVU938
	mov	edx, DWORD PTR [r10+rcx*4]
	.loc 1 77 48 discriminator 3 view .LVU939
	lea	rax, 0[0+rcx*4]
	.loc 1 77 45 discriminator 3 view .LVU940
	imul	edx, r11d
	.loc 1 77 52 discriminator 3 view .LVU941
	add	DWORD PTR [r8+rax], edx
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU942
	.loc 1 77 26 discriminator 1 view .LVU943
	.loc 1 77 5 is_stmt 0 discriminator 3 view .LVU944
	lea	rdx, 1[rcx]
	.loc 1 77 26 discriminator 1 view .LVU945
	cmp	rdx, r9
	jnb	.L349
	.loc 1 77 45 discriminator 3 view .LVU946
	mov	edx, DWORD PTR 4[r10+rax]
	.loc 1 77 5 discriminator 3 view .LVU947
	add	rcx, 2
	.loc 1 77 45 discriminator 3 view .LVU948
	imul	edx, r11d
	.loc 1 77 52 discriminator 3 view .LVU949
	add	DWORD PTR 4[r8+rax], edx
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU950
	.loc 1 77 26 discriminator 1 view .LVU951
	cmp	rcx, r9
	jnb	.L349
	.loc 1 77 45 is_stmt 0 discriminator 3 view .LVU952
	mov	edx, DWORD PTR 8[r10+rax]
	imul	edx, r11d
	.loc 1 77 52 discriminator 3 view .LVU953
	add	DWORD PTR 8[r8+rax], edx
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU954
	.loc 1 77 26 discriminator 1 view .LVU955
.LVL310:
.L349:
	.loc 1 77 26 is_stmt 0 discriminator 1 view .LVU956
.LBE74:
	.loc 1 78 1 view .LVU957
	ret
.LVL311:
.L354:
.LBB75:
	.loc 1 77 17 view .LVU958
	xor	ecx, ecx
.LVL312:
	.loc 1 77 17 view .LVU959
	jmp	.L351
.LBE75:
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
.LVL313:
.LFB55:
	.loc 1 81 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 81 15 is_stmt 0 view .LVU961
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.seh_endprologue
.LVL314:
.LBB76:
	.loc 1 82 26 is_stmt 1 discriminator 1 view .LVU962
	test	r9, r9
	je	.L362
	cmp	QWORD PTR 48[rsp], 1
	jne	.L379
	lea	rax, -1[r9]
	cmp	rax, 2
	jbe	.L370
	movd	xmm4, ecx
	mov	r10, r9
	xor	eax, eax
	pshufd	xmm2, xmm4, 0
	shr	r10, 2
	movdqa	xmm3, xmm2
	sal	r10, 4
	psrlq	xmm3, 32
.LVL315:
	.p2align 4,,10
	.p2align 3
.L368:
	.loc 1 82 49 is_stmt 0 discriminator 3 view .LVU963
	movdqu	xmm0, XMMWORD PTR [rdx+rax]
	movdqu	xmm1, XMMWORD PTR [rdx+rax]
	psrlq	xmm0, 32
	pmuludq	xmm1, xmm2
	pmuludq	xmm0, xmm3
	pshufd	xmm1, xmm1, 8
	pshufd	xmm0, xmm0, 8
	punpckldq	xmm1, xmm0
	.loc 1 82 60 discriminator 3 view .LVU964
	movdqu	xmm0, XMMWORD PTR [r8+rax]
	paddd	xmm0, xmm1
	.loc 1 82 45 discriminator 3 view .LVU965
	movups	XMMWORD PTR [r8+rax], xmm0
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU966
	.loc 1 82 26 discriminator 1 view .LVU967
	add	rax, 16
	cmp	rax, r10
	jne	.L368
	mov	r10, r9
	and	r10, -4
	test	r9b, 3
	je	.L362
.L367:
.LVL316:
	.loc 1 82 49 is_stmt 0 discriminator 3 view .LVU968
	mov	r11d, DWORD PTR [rdx+r10*4]
	.loc 1 82 52 discriminator 3 view .LVU969
	lea	rax, 0[0+r10*4]
	.loc 1 82 49 discriminator 3 view .LVU970
	imul	r11d, ecx
	.loc 1 82 60 discriminator 3 view .LVU971
	add	DWORD PTR [r8+rax], r11d
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU972
	.loc 1 82 26 discriminator 1 view .LVU973
	.loc 1 82 5 is_stmt 0 discriminator 3 view .LVU974
	lea	r11, 1[r10]
	.loc 1 82 26 discriminator 1 view .LVU975
	cmp	r11, r9
	jnb	.L362
	.loc 1 82 49 discriminator 3 view .LVU976
	mov	r11d, DWORD PTR 4[rdx+rax]
	.loc 1 82 5 discriminator 3 view .LVU977
	add	r10, 2
	.loc 1 82 49 discriminator 3 view .LVU978
	imul	r11d, ecx
	.loc 1 82 60 discriminator 3 view .LVU979
	add	DWORD PTR 4[r8+rax], r11d
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU980
	.loc 1 82 26 discriminator 1 view .LVU981
	cmp	r10, r9
	jnb	.L362
	.loc 1 82 49 is_stmt 0 discriminator 3 view .LVU982
	imul	ecx, DWORD PTR 8[rdx+rax]
.LVL317:
	.loc 1 82 60 discriminator 3 view .LVU983
	add	DWORD PTR 8[r8+rax], ecx
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU984
	.loc 1 82 26 discriminator 1 view .LVU985
.LVL318:
.L362:
	.loc 1 82 26 is_stmt 0 discriminator 1 view .LVU986
.LBE76:
	.loc 1 83 1 view .LVU987
	pop	rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
.LVL319:
	.p2align 4,,10
	.p2align 3
.L379:
	.cfi_restore_state
	.loc 1 83 1 view .LVU988
	mov	rax, QWORD PTR 48[rsp]
.LBB77:
	.loc 1 82 17 view .LVU989
	xor	r10d, r10d
	lea	r11, 0[0+rax*4]
	.loc 1 82 26 discriminator 1 view .LVU990
	xor	eax, eax
.LVL320:
	.p2align 4,,10
	.p2align 3
.L365:
	.loc 1 82 49 discriminator 3 view .LVU991
	mov	ebx, DWORD PTR [rdx+rax]
	.loc 1 82 5 discriminator 3 view .LVU992
	add	r10, 1
.LVL321:
	.loc 1 82 49 discriminator 3 view .LVU993
	imul	ebx, ecx
	.loc 1 82 60 discriminator 3 view .LVU994
	add	DWORD PTR [r8+rax], ebx
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU995
.LVL322:
	.loc 1 82 26 discriminator 1 view .LVU996
	add	rax, r11
	cmp	r9, r10
	jne	.L365
.LBE77:
	.loc 1 83 1 is_stmt 0 view .LVU997
	pop	rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
.LVL323:
.L370:
	.cfi_restore_state
.LBB78:
	.loc 1 82 17 view .LVU998
	xor	r10d, r10d
	jmp	.L367
.LBE78:
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
.LVL324:
.LFB56:
	.loc 1 86 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 86 15 is_stmt 0 view .LVU1000
	push	rbp
	.seh_pushreg	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rdi
	.seh_pushreg	rdi
	.cfi_def_cfa_offset 24
	.cfi_offset 5, -24
	push	rsi
	.seh_pushreg	rsi
	.cfi_def_cfa_offset 32
	.cfi_offset 4, -32
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	.seh_endprologue
.LVL325:
.LBB79:
	.loc 1 88 26 is_stmt 1 discriminator 1 view .LVU1001
.LBE79:
	.loc 1 86 15 is_stmt 0 view .LVU1002
	mov	rbp, QWORD PTR 72[rsp]
	mov	ebx, ecx
.LBB80:
	.loc 1 88 26 discriminator 1 view .LVU1003
	test	rbp, rbp
	je	.L380
	lea	rax, -1[rbp]
	cmp	rax, 2
	jbe	.L385
	movd	xmm5, ecx
	mov	rdi, rbp
	xor	eax, eax
	pshufd	xmm3, xmm5, 0
	shr	rdi, 2
	movdqa	xmm4, xmm3
	sal	rdi, 4
	psrlq	xmm4, 32
.LVL326:
	.p2align 4,,10
	.p2align 3
.L383:
	.loc 1 88 26 discriminator 1 view .LVU1004
	lea	rcx, [r9+rax]
	.loc 1 88 48 discriminator 3 view .LVU1005
	movsx	r10, DWORD PTR [rcx]
	movsx	r11, DWORD PTR 4[rcx]
	movsx	rsi, DWORD PTR 8[rcx]
	movsx	rcx, DWORD PTR 12[rcx]
	movd	xmm2, DWORD PTR [rdx+r11*4]
	movd	xmm0, DWORD PTR [rdx+rcx*4]
	movd	xmm1, DWORD PTR [rdx+rsi*4]
	punpckldq	xmm1, xmm0
	movd	xmm0, DWORD PTR [rdx+r10*4]
	punpckldq	xmm0, xmm2
	punpcklqdq	xmm0, xmm1
	.loc 1 88 45 discriminator 3 view .LVU1006
	movdqa	xmm1, xmm0
	psrlq	xmm0, 32
	pmuludq	xmm1, xmm3
	pmuludq	xmm0, xmm4
	pshufd	xmm1, xmm1, 8
	pshufd	xmm0, xmm0, 8
	punpckldq	xmm1, xmm0
	.loc 1 88 57 discriminator 3 view .LVU1007
	movdqu	xmm0, XMMWORD PTR [r8+rax]
	paddd	xmm0, xmm1
	.loc 1 88 41 discriminator 3 view .LVU1008
	movups	XMMWORD PTR [r8+rax], xmm0
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU1009
	.loc 1 88 26 discriminator 1 view .LVU1010
	add	rax, 16
	cmp	rdi, rax
	jne	.L383
	test	bpl, 3
	je	.L380
	mov	rcx, rbp
	and	rcx, -4
.LVL327:
.L382:
	.loc 1 88 54 is_stmt 0 discriminator 3 view .LVU1011
	movsx	r10, DWORD PTR [r9+rcx*4]
	lea	rax, 0[0+rcx*4]
	.loc 1 88 45 discriminator 3 view .LVU1012
	mov	esi, DWORD PTR [rdx+r10*4]
	.loc 1 88 5 discriminator 3 view .LVU1013
	lea	r10, 1[rcx]
	.loc 1 88 45 discriminator 3 view .LVU1014
	imul	esi, ebx
	.loc 1 88 57 discriminator 3 view .LVU1015
	add	DWORD PTR [r8+rax], esi
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU1016
	.loc 1 88 26 discriminator 1 view .LVU1017
	cmp	r10, rbp
	jnb	.L380
	.loc 1 88 54 is_stmt 0 discriminator 3 view .LVU1018
	movsx	r10, DWORD PTR 4[r9+rax]
	.loc 1 88 5 discriminator 3 view .LVU1019
	add	rcx, 2
	.loc 1 88 45 discriminator 3 view .LVU1020
	mov	edi, DWORD PTR [rdx+r10*4]
	imul	edi, ebx
	.loc 1 88 57 discriminator 3 view .LVU1021
	add	DWORD PTR 4[r8+rax], edi
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU1022
	.loc 1 88 26 discriminator 1 view .LVU1023
	cmp	rcx, rbp
	jnb	.L380
	.loc 1 88 54 is_stmt 0 discriminator 3 view .LVU1024
	movsx	rcx, DWORD PTR 8[r9+rax]
	.loc 1 88 45 discriminator 3 view .LVU1025
	imul	ebx, DWORD PTR [rdx+rcx*4]
.LVL328:
	.loc 1 88 57 discriminator 3 view .LVU1026
	add	DWORD PTR 8[r8+rax], ebx
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU1027
	.loc 1 88 26 discriminator 1 view .LVU1028
.LVL329:
.L380:
	.loc 1 88 26 is_stmt 0 discriminator 1 view .LVU1029
.LBE80:
	.loc 1 89 1 view .LVU1030
	pop	rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 32
	pop	rsi
	.cfi_restore 4
	.cfi_def_cfa_offset 24
	pop	rdi
	.cfi_restore 5
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL330:
	.loc 1 89 1 view .LVU1031
	ret
.LVL331:
.L385:
	.cfi_restore_state
.LBB81:
	.loc 1 88 17 view .LVU1032
	xor	ecx, ecx
.LVL332:
	.loc 1 88 17 view .LVU1033
	jmp	.L382
.LBE81:
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
.LVL333:
.LFB57:
	.loc 1 95 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 95 15 is_stmt 0 view .LVU1035
	.seh_endprologue
.LVL334:
.LBB82:
	.loc 1 96 26 is_stmt 1 discriminator 1 view .LVU1036
	test	r9, r9
	je	.L393
	lea	rax, -1[r9]
	cmp	rax, 2
	jbe	.L398
	mov	r10, r9
	xor	eax, eax
	shr	r10, 2
	sal	r10, 4
.LVL335:
	.p2align 4,,10
	.p2align 3
.L396:
	.loc 1 96 48 is_stmt 0 discriminator 3 view .LVU1037
	movdqu	xmm0, XMMWORD PTR [rcx+rax]
	movdqu	xmm2, XMMWORD PTR [rdx+rax]
	movdqu	xmm1, XMMWORD PTR [rcx+rax]
	movdqu	xmm3, XMMWORD PTR [rdx+rax]
	psrlq	xmm0, 32
	psrlq	xmm2, 32
	pmuludq	xmm1, xmm3
	pmuludq	xmm0, xmm2
	pshufd	xmm1, xmm1, 8
	pshufd	xmm0, xmm0, 8
	punpckldq	xmm1, xmm0
	.loc 1 96 41 discriminator 3 view .LVU1038
	movups	XMMWORD PTR [r8+rax], xmm1
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU1039
	.loc 1 96 26 discriminator 1 view .LVU1040
	add	rax, 16
	cmp	rax, r10
	jne	.L396
	test	r9b, 3
	je	.L393
	mov	rax, r9
	and	rax, -4
.L395:
.LVL336:
	.loc 1 96 48 is_stmt 0 discriminator 3 view .LVU1041
	mov	r11d, DWORD PTR [rcx+rax*4]
	imul	r11d, DWORD PTR [rdx+rax*4]
	.loc 1 96 44 discriminator 3 view .LVU1042
	lea	r10, 0[0+rax*4]
	.loc 1 96 41 discriminator 3 view .LVU1043
	mov	DWORD PTR [r8+rax*4], r11d
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU1044
	.loc 1 96 26 discriminator 1 view .LVU1045
	.loc 1 96 5 is_stmt 0 discriminator 3 view .LVU1046
	lea	r11, 1[rax]
	.loc 1 96 26 discriminator 1 view .LVU1047
	cmp	r11, r9
	jnb	.L393
	.loc 1 96 48 discriminator 3 view .LVU1048
	mov	r11d, DWORD PTR 4[rcx+r10]
	imul	r11d, DWORD PTR 4[rdx+r10]
	.loc 1 96 5 discriminator 3 view .LVU1049
	add	rax, 2
	.loc 1 96 41 discriminator 3 view .LVU1050
	mov	DWORD PTR 4[r8+r10], r11d
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU1051
	.loc 1 96 26 discriminator 1 view .LVU1052
	cmp	rax, r9
	jnb	.L393
	.loc 1 96 48 is_stmt 0 discriminator 3 view .LVU1053
	mov	eax, DWORD PTR 8[rdx+r10]
	imul	eax, DWORD PTR 8[rcx+r10]
	.loc 1 96 41 discriminator 3 view .LVU1054
	mov	DWORD PTR 8[r8+r10], eax
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU1055
	.loc 1 96 26 discriminator 1 view .LVU1056
.LVL337:
.L393:
	.loc 1 96 26 is_stmt 0 discriminator 1 view .LVU1057
.LBE82:
	.loc 1 97 1 view .LVU1058
	ret
.LVL338:
.L398:
.LBB83:
	.loc 1 96 17 view .LVU1059
	xor	eax, eax
	jmp	.L395
.LBE83:
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
.LVL339:
.LFB58:
	.loc 1 147 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 147 13 is_stmt 0 view .LVU1061
	.seh_endprologue
	.loc 1 148 17 view .LVU1062
	fldz
	.loc 1 147 13 view .LVU1063
	mov	rax, rcx
	.loc 1 148 17 view .LVU1064
	fstp	TBYTE PTR [rcx]
	fld	TBYTE PTR [rcx]
.LVL340:
.LBB84:
	.loc 1 149 26 is_stmt 1 discriminator 1 view .LVU1065
	test	r9, r9
	je	.L413
	.loc 1 149 17 is_stmt 0 view .LVU1066
	xor	r10d, r10d
.LVL341:
	.p2align 4,,10
	.p2align 3
.L408:
	.loc 1 149 41 discriminator 3 view .LVU1067
	fild	DWORD PTR [rdx+r10*4]
	.loc 1 149 61 discriminator 3 view .LVU1068
	fild	DWORD PTR [r8+r10*4]
	.loc 1 149 5 discriminator 3 view .LVU1069
	add	r10, 1
.LVL342:
	.loc 1 149 59 discriminator 3 view .LVU1070
	fmulp	st(1), st
	.loc 1 149 38 discriminator 3 view .LVU1071
	faddp	st(1), st
	.loc 1 149 5 is_stmt 1 discriminator 3 view .LVU1072
.LVL343:
	.loc 1 149 26 discriminator 1 view .LVU1073
	cmp	r9, r10
	jne	.L408
	fstp	TBYTE PTR [rax]
.LBE84:
	.loc 1 150 12 is_stmt 0 view .LVU1074
	jmp	.L406
.LVL344:
	.p2align 4,,10
	.p2align 3
.L413:
	.loc 1 150 12 view .LVU1075
	fstp	st(0)
.LVL345:
.L406:
	.loc 1 151 1 view .LVU1076
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
.LVL346:
.LFB59:
	.loc 1 154 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 154 13 is_stmt 0 view .LVU1078
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
	.loc 1 154 13 view .LVU1079
	mov	DWORD PTR 4[rsp], r8d
	mov	rax, rcx
	.loc 1 154 52 view .LVU1080
	mov	DWORD PTR 12[rsp], edx
	fild	DWORD PTR 12[rsp]
	.loc 1 154 13 view .LVU1081
	mov	DWORD PTR 8[rsp], r9d
	.loc 1 154 69 view .LVU1082
	fild	DWORD PTR 4[rsp]
	.loc 1 154 67 view .LVU1083
	fmulp	st(1), st
	.loc 1 154 86 view .LVU1084
	fild	DWORD PTR 8[rsp]
	.loc 1 154 84 view .LVU1085
	faddp	st(1), st
	.loc 1 154 99 view .LVU1086
	fstp	TBYTE PTR [rcx]
	.loc 1 154 102 view .LVU1087
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
.LVL347:
.LFB60:
	.loc 1 157 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 157 13 is_stmt 0 view .LVU1089
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
	.loc 1 157 13 view .LVU1090
	mov	DWORD PTR 8[rsp], r8d
	mov	rax, rcx
	.loc 1 157 46 view .LVU1091
	mov	DWORD PTR 12[rsp], edx
	fild	DWORD PTR 12[rsp]
	.loc 1 157 63 view .LVU1092
	fild	DWORD PTR 8[rsp]
	.loc 1 157 61 view .LVU1093
	fmulp	st(1), st
	.loc 1 157 76 view .LVU1094
	fstp	TBYTE PTR [rcx]
	.loc 1 157 79 view .LVU1095
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
.LVL348:
.LFB61:
	.loc 1 115 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 115 12 is_stmt 0 view .LVU1097
	sub	rsp, 328
	.seh_stackalloc	328
	.cfi_def_cfa_offset 336
	movups	XMMWORD PTR 192[rsp], xmm6
	.seh_savexmm	xmm6, 192
	movups	XMMWORD PTR 208[rsp], xmm7
	.seh_savexmm	xmm7, 208
	movups	XMMWORD PTR 224[rsp], xmm8
	.seh_savexmm	xmm8, 224
	movups	XMMWORD PTR 240[rsp], xmm9
	.seh_savexmm	xmm9, 240
	movups	XMMWORD PTR 256[rsp], xmm10
	.seh_savexmm	xmm10, 256
	movups	XMMWORD PTR 272[rsp], xmm11
	.seh_savexmm	xmm11, 272
	movups	XMMWORD PTR 288[rsp], xmm12
	.seh_savexmm	xmm12, 288
	movups	XMMWORD PTR 304[rsp], xmm13
	.seh_savexmm	xmm13, 304
	.cfi_offset 23, -144
	.cfi_offset 24, -128
	.cfi_offset 25, -112
	.cfi_offset 26, -96
	.cfi_offset 27, -80
	.cfi_offset 28, -64
	.cfi_offset 29, -48
	.cfi_offset 30, -32
	.seh_endprologue
.LVL349:
.LBB85:
	.loc 1 125 23 is_stmt 1 discriminator 1 view .LVU1098
	.loc 1 125 5 discriminator 3 view .LVU1099
	.loc 1 125 23 discriminator 1 view .LVU1100
	.loc 1 125 23 is_stmt 0 discriminator 1 view .LVU1101
.LBE85:
	.loc 1 126 13 view .LVU1102
	pxor	xmm0, xmm0
.LBB86:
	.loc 1 125 40 discriminator 3 view .LVU1103
	movss	xmm13, DWORD PTR .LC25[rip]
	movss	xmm12, DWORD PTR .LC23[rip]
	movss	xmm11, DWORD PTR .LC21[rip]
	movss	xmm10, DWORD PTR .LC19[rip]
	movss	xmm9, DWORD PTR .LC17[rip]
	movss	xmm7, DWORD PTR .LC13[rip]
	shufps	xmm13, xmm13, 0
	shufps	xmm12, xmm12, 0
	movss	xmm8, DWORD PTR .LC15[rip]
	movss	xmm6, DWORD PTR .LC11[rip]
	shufps	xmm11, xmm11, 0
	shufps	xmm10, xmm10, 0
	movss	xmm5, DWORD PTR .LC9[rip]
	shufps	xmm9, xmm9, 0
	shufps	xmm7, xmm7, 0
	movss	xmm4, DWORD PTR .LC7[rip]
	movss	xmm3, DWORD PTR .LC5[rip]
	shufps	xmm8, xmm8, 0
	shufps	xmm6, xmm6, 0
.LBE86:
	.loc 1 126 13 view .LVU1104
	addss	xmm1, xmm0
.LVL350:
	.loc 1 126 27 view .LVU1105
	addss	xmm2, xmm0
.LVL351:
.LBB87:
	.loc 1 125 40 discriminator 3 view .LVU1106
	shufps	xmm5, xmm5, 0
.LBE87:
.LBB88:
	.loc 1 127 28 discriminator 1 view .LVU1107
	movss	xmm0, DWORD PTR .LC27[rip]
.LBE88:
.LBB91:
	.loc 1 125 40 discriminator 3 view .LVU1108
	shufps	xmm4, xmm4, 0
	shufps	xmm3, xmm3, 0
	movups	XMMWORD PTR 16[rsp], xmm13
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1109
.LVL352:
	.loc 1 125 23 discriminator 1 view .LVU1110
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1111
	movups	XMMWORD PTR 32[rsp], xmm12
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1112
.LVL353:
	.loc 1 125 23 discriminator 1 view .LVU1113
	.loc 1 125 23 is_stmt 0 discriminator 1 view .LVU1114
.LBE91:
.LBB92:
	.loc 1 127 28 discriminator 1 view .LVU1115
	shufps	xmm0, xmm0, 0
.LBE92:
.LBB93:
	.loc 1 125 40 discriminator 3 view .LVU1116
	movups	XMMWORD PTR 48[rsp], xmm11
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1117
.LVL354:
	.loc 1 125 23 discriminator 1 view .LVU1118
	.loc 1 125 23 is_stmt 0 discriminator 1 view .LVU1119
.LBE93:
	.loc 1 126 13 view .LVU1120
	shufps	xmm1, xmm1, 0
	.loc 1 126 27 view .LVU1121
	shufps	xmm2, xmm2, 0
.LBB94:
	.loc 1 125 40 discriminator 3 view .LVU1122
	movups	XMMWORD PTR 64[rsp], xmm10
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1123
.LVL355:
	.loc 1 125 23 discriminator 1 view .LVU1124
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1125
	movups	XMMWORD PTR 80[rsp], xmm9
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1126
.LVL356:
	.loc 1 125 23 discriminator 1 view .LVU1127
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1128
	movups	XMMWORD PTR 96[rsp], xmm8
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1129
.LVL357:
	.loc 1 125 23 discriminator 1 view .LVU1130
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1131
	movups	XMMWORD PTR 112[rsp], xmm7
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1132
.LVL358:
	.loc 1 125 23 discriminator 1 view .LVU1133
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1134
	movups	XMMWORD PTR 128[rsp], xmm6
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1135
.LVL359:
	.loc 1 125 23 discriminator 1 view .LVU1136
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1137
	movups	XMMWORD PTR 144[rsp], xmm5
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1138
.LVL360:
	.loc 1 125 23 discriminator 1 view .LVU1139
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1140
	movups	XMMWORD PTR 160[rsp], xmm4
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1141
.LVL361:
	.loc 1 125 23 discriminator 1 view .LVU1142
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1143
	movups	XMMWORD PTR 176[rsp], xmm3
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1144
.LVL362:
	.loc 1 125 23 discriminator 1 view .LVU1145
	.loc 1 125 23 is_stmt 0 discriminator 1 view .LVU1146
.LBE94:
.LBB95:
	.loc 1 127 28 is_stmt 1 discriminator 1 view .LVU1147
	test	rcx, rcx
	je	.L417
	.loc 1 127 17 is_stmt 0 view .LVU1148
	xor	eax, eax
.LVL363:
	.p2align 4,,10
	.p2align 3
.L418:
.LBB89:
	.loc 1 129 23 is_stmt 1 discriminator 1 view .LVU1149
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU1150
	mulps	xmm0, xmm1
.LBE89:
	.loc 1 127 5 discriminator 2 view .LVU1151
	add	rax, 1
.LVL364:
.LBB90:
	.loc 1 129 53 discriminator 3 view .LVU1152
	mulps	xmm13, xmm1
	mulps	xmm12, xmm1
	mulps	xmm11, xmm1
	mulps	xmm10, xmm1
	mulps	xmm9, xmm1
	.loc 1 129 58 discriminator 3 view .LVU1153
	addps	xmm0, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1154
.LVL365:
	.loc 1 129 23 discriminator 1 view .LVU1155
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU1156
	mulps	xmm8, xmm1
	.loc 1 129 58 discriminator 3 view .LVU1157
	addps	xmm13, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1158
.LVL366:
	.loc 1 129 23 discriminator 1 view .LVU1159
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU1160
	mulps	xmm7, xmm1
	.loc 1 129 58 discriminator 3 view .LVU1161
	addps	xmm12, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1162
.LVL367:
	.loc 1 129 23 discriminator 1 view .LVU1163
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU1164
	mulps	xmm6, xmm1
	.loc 1 129 58 discriminator 3 view .LVU1165
	addps	xmm11, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1166
.LVL368:
	.loc 1 129 23 discriminator 1 view .LVU1167
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU1168
	mulps	xmm5, xmm1
	.loc 1 129 58 discriminator 3 view .LVU1169
	addps	xmm10, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1170
.LVL369:
	.loc 1 129 23 discriminator 1 view .LVU1171
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU1172
	mulps	xmm4, xmm1
	.loc 1 129 58 discriminator 3 view .LVU1173
	addps	xmm9, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1174
.LVL370:
	.loc 1 129 23 discriminator 1 view .LVU1175
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU1176
	mulps	xmm3, xmm1
	.loc 1 129 58 discriminator 3 view .LVU1177
	addps	xmm8, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1178
.LVL371:
	.loc 1 129 23 discriminator 1 view .LVU1179
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1180
	addps	xmm7, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1181
.LVL372:
	.loc 1 129 23 discriminator 1 view .LVU1182
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1183
	addps	xmm6, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1184
.LVL373:
	.loc 1 129 23 discriminator 1 view .LVU1185
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1186
	addps	xmm5, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1187
.LVL374:
	.loc 1 129 23 discriminator 1 view .LVU1188
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1189
	addps	xmm4, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1190
.LVL375:
	.loc 1 129 23 discriminator 1 view .LVU1191
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1192
	addps	xmm3, xmm2
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1193
.LVL376:
	.loc 1 129 23 discriminator 1 view .LVU1194
.LBE90:
	.loc 1 127 5 discriminator 2 view .LVU1195
	.loc 1 127 28 discriminator 1 view .LVU1196
	cmp	rcx, rax
	jne	.L418
	movups	XMMWORD PTR 16[rsp], xmm13
	movups	XMMWORD PTR 32[rsp], xmm12
	movups	XMMWORD PTR 48[rsp], xmm11
	movups	XMMWORD PTR 64[rsp], xmm10
	movups	XMMWORD PTR 80[rsp], xmm9
	movups	XMMWORD PTR 96[rsp], xmm8
	movups	XMMWORD PTR 112[rsp], xmm7
	movups	XMMWORD PTR 128[rsp], xmm6
	movups	XMMWORD PTR 144[rsp], xmm5
	movups	XMMWORD PTR 160[rsp], xmm4
	movups	XMMWORD PTR 176[rsp], xmm3
.LVL377:
.L417:
	.loc 1 127 28 is_stmt 0 discriminator 1 view .LVU1197
.LBE95:
.LBB96:
	.loc 1 132 23 is_stmt 1 discriminator 1 view .LVU1198
	.loc 1 132 5 discriminator 3 view .LVU1199
	.loc 1 132 23 discriminator 1 view .LVU1200
	.loc 1 132 5 discriminator 3 view .LVU1201
	.loc 1 132 23 discriminator 1 view .LVU1202
	.loc 1 132 5 discriminator 3 view .LVU1203
	.loc 1 132 23 discriminator 1 view .LVU1204
	.loc 1 132 5 discriminator 3 view .LVU1205
	.loc 1 132 23 discriminator 1 view .LVU1206
	.loc 1 132 5 discriminator 3 view .LVU1207
	.loc 1 132 23 discriminator 1 view .LVU1208
	.loc 1 132 5 discriminator 3 view .LVU1209
	.loc 1 132 23 discriminator 1 view .LVU1210
	.loc 1 132 5 discriminator 3 view .LVU1211
	.loc 1 132 23 discriminator 1 view .LVU1212
	.loc 1 132 5 discriminator 3 view .LVU1213
	.loc 1 132 23 discriminator 1 view .LVU1214
	.loc 1 132 5 discriminator 3 view .LVU1215
	.loc 1 132 23 discriminator 1 view .LVU1216
	.loc 1 132 5 discriminator 3 view .LVU1217
	.loc 1 132 23 discriminator 1 view .LVU1218
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU1219
	addps	xmm0, XMMWORD PTR 16[rsp]
.LVL378:
	.loc 1 132 35 discriminator 3 view .LVU1220
	addps	xmm0, XMMWORD PTR 32[rsp]
.LBE96:
.LBB97:
	.loc 1 138 35 discriminator 3 view .LVU1221
	pxor	xmm2, xmm2
.LVL379:
	.loc 1 138 35 discriminator 3 view .LVU1222
.LBE97:
.LBB98:
	.loc 1 132 35 discriminator 3 view .LVU1223
	addps	xmm0, XMMWORD PTR 48[rsp]
	addps	xmm0, XMMWORD PTR 64[rsp]
	addps	xmm0, XMMWORD PTR 80[rsp]
	addps	xmm0, XMMWORD PTR 96[rsp]
	addps	xmm0, XMMWORD PTR 112[rsp]
	addps	xmm0, XMMWORD PTR 128[rsp]
	addps	xmm0, XMMWORD PTR 144[rsp]
	addps	xmm0, XMMWORD PTR 160[rsp]
	addps	xmm0, XMMWORD PTR 176[rsp]
.LVL380:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU1224
	.loc 1 132 23 discriminator 1 view .LVU1225
.LBE98:
	.loc 1 133 21 is_stmt 0 view .LVU1226
	mov	rax, QWORD PTR .LC28[rip]
	.loc 1 141 1 view .LVU1227
	movups	xmm6, XMMWORD PTR 192[rsp]
	movups	xmm7, XMMWORD PTR 208[rsp]
	movups	xmm8, XMMWORD PTR 224[rsp]
	.loc 1 133 21 view .LVU1228
	mov	QWORD PTR [r9], rax
.LVL381:
.LBB99:
	.loc 1 138 23 is_stmt 1 discriminator 1 view .LVU1229
.LBE99:
	.loc 1 141 1 is_stmt 0 view .LVU1230
	movups	xmm9, XMMWORD PTR 240[rsp]
.LBB100:
	.loc 1 138 39 discriminator 3 view .LVU1231
	movaps	xmm1, xmm0
.LVL382:
	.loc 1 138 39 discriminator 3 view .LVU1232
.LBE100:
	.loc 1 141 1 view .LVU1233
	movups	xmm10, XMMWORD PTR 256[rsp]
	movups	xmm11, XMMWORD PTR 272[rsp]
.LBB101:
	.loc 1 138 35 discriminator 3 view .LVU1234
	addss	xmm1, xmm2
.LVL383:
	.loc 1 138 5 is_stmt 1 discriminator 3 view .LVU1235
	.loc 1 138 23 discriminator 1 view .LVU1236
	.loc 1 138 39 is_stmt 0 discriminator 3 view .LVU1237
	movaps	xmm2, xmm0
.LVL384:
	.loc 1 138 39 discriminator 3 view .LVU1238
.LBE101:
	.loc 1 141 1 view .LVU1239
	movups	xmm12, XMMWORD PTR 288[rsp]
	movups	xmm13, XMMWORD PTR 304[rsp]
.LBB102:
	.loc 1 138 39 discriminator 3 view .LVU1240
	shufps	xmm2, xmm0, 85
	.loc 1 138 35 discriminator 3 view .LVU1241
	addss	xmm2, xmm1
.LVL385:
	.loc 1 138 5 is_stmt 1 discriminator 3 view .LVU1242
	.loc 1 138 23 discriminator 1 view .LVU1243
	.loc 1 138 39 is_stmt 0 discriminator 3 view .LVU1244
	movaps	xmm1, xmm0
	unpckhps	xmm1, xmm0
	shufps	xmm0, xmm0, 255
.LVL386:
	.loc 1 138 35 discriminator 3 view .LVU1245
	addss	xmm1, xmm2
.LVL387:
	.loc 1 138 5 is_stmt 1 discriminator 3 view .LVU1246
	.loc 1 138 23 discriminator 1 view .LVU1247
	.loc 1 138 5 discriminator 3 view .LVU1248
	.loc 1 138 23 discriminator 1 view .LVU1249
	.loc 1 138 35 is_stmt 0 discriminator 3 view .LVU1250
	addss	xmm0, xmm1
.LBE102:
	.loc 1 141 1 view .LVU1251
	add	rsp, 328
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
.LFE61:
	.seh_endproc
	.section	.text$_Z10peak_flopsIdET_yS0_S0_Pd,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z10peak_flopsIdET_yS0_S0_Pd
	.def	_Z10peak_flopsIdET_yS0_S0_Pd;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z10peak_flopsIdET_yS0_S0_Pd
_Z10peak_flopsIdET_yS0_S0_Pd:
.LVL388:
.LFB62:
	.loc 1 115 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 115 12 is_stmt 0 view .LVU1253
	sub	rsp, 344
	.seh_stackalloc	344
	.cfi_def_cfa_offset 352
	movups	XMMWORD PTR 192[rsp], xmm6
	.seh_savexmm	xmm6, 192
	movups	XMMWORD PTR 208[rsp], xmm7
	.seh_savexmm	xmm7, 208
	movups	XMMWORD PTR 224[rsp], xmm8
	.seh_savexmm	xmm8, 224
	movups	XMMWORD PTR 240[rsp], xmm9
	.seh_savexmm	xmm9, 240
	movups	XMMWORD PTR 256[rsp], xmm10
	.seh_savexmm	xmm10, 256
	movups	XMMWORD PTR 272[rsp], xmm11
	.seh_savexmm	xmm11, 272
	movups	XMMWORD PTR 288[rsp], xmm12
	.seh_savexmm	xmm12, 288
	movups	XMMWORD PTR 304[rsp], xmm13
	.seh_savexmm	xmm13, 304
	movups	XMMWORD PTR 320[rsp], xmm14
	.seh_savexmm	xmm14, 320
	.cfi_offset 23, -160
	.cfi_offset 24, -144
	.cfi_offset 25, -128
	.cfi_offset 26, -112
	.cfi_offset 27, -96
	.cfi_offset 28, -80
	.cfi_offset 29, -64
	.cfi_offset 30, -48
	.cfi_offset 31, -32
	.seh_endprologue
.LVL389:
.LBB103:
	.loc 1 125 23 is_stmt 1 discriminator 1 view .LVU1254
	.loc 1 125 5 discriminator 3 view .LVU1255
	.loc 1 125 23 discriminator 1 view .LVU1256
	.loc 1 125 23 is_stmt 0 discriminator 1 view .LVU1257
.LBE103:
	.loc 1 126 13 view .LVU1258
	pxor	xmm14, xmm14
.LBB104:
	.loc 1 125 40 discriminator 3 view .LVU1259
	movddup	xmm13, QWORD PTR .LC50[rip]
	movddup	xmm12, QWORD PTR .LC48[rip]
	movddup	xmm11, QWORD PTR .LC46[rip]
	movddup	xmm10, QWORD PTR .LC44[rip]
	movddup	xmm9, QWORD PTR .LC42[rip]
	movddup	xmm8, QWORD PTR .LC40[rip]
	movddup	xmm7, QWORD PTR .LC38[rip]
	movddup	xmm6, QWORD PTR .LC36[rip]
	movddup	xmm5, QWORD PTR .LC34[rip]
	movddup	xmm4, QWORD PTR .LC32[rip]
	movddup	xmm3, QWORD PTR .LC30[rip]
.LBE104:
	.loc 1 126 13 view .LVU1260
	addsd	xmm1, xmm14
.LVL390:
	.loc 1 126 27 view .LVU1261
	addsd	xmm2, xmm14
.LVL391:
.LBB105:
	.loc 1 125 40 discriminator 3 view .LVU1262
	movups	XMMWORD PTR 16[rsp], xmm13
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1263
.LVL392:
	.loc 1 125 23 discriminator 1 view .LVU1264
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1265
	movups	XMMWORD PTR 32[rsp], xmm12
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1266
.LVL393:
	.loc 1 125 23 discriminator 1 view .LVU1267
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1268
	movups	XMMWORD PTR 48[rsp], xmm11
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1269
.LVL394:
	.loc 1 125 23 discriminator 1 view .LVU1270
	.loc 1 125 23 is_stmt 0 discriminator 1 view .LVU1271
.LBE105:
	.loc 1 126 13 view .LVU1272
	movddup	xmm0, xmm1
.LBB106:
	.loc 1 125 40 discriminator 3 view .LVU1273
	movups	XMMWORD PTR 64[rsp], xmm10
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1274
.LVL395:
	.loc 1 125 23 discriminator 1 view .LVU1275
	.loc 1 125 23 is_stmt 0 discriminator 1 view .LVU1276
.LBE106:
	.loc 1 126 27 view .LVU1277
	movddup	xmm1, xmm2
.LBB107:
	.loc 1 127 28 discriminator 1 view .LVU1278
	movddup	xmm2, QWORD PTR .LC52[rip]
.LBE107:
.LBB110:
	.loc 1 125 40 discriminator 3 view .LVU1279
	movups	XMMWORD PTR 80[rsp], xmm9
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1280
.LVL396:
	.loc 1 125 23 discriminator 1 view .LVU1281
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1282
	movups	XMMWORD PTR 96[rsp], xmm8
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1283
.LVL397:
	.loc 1 125 23 discriminator 1 view .LVU1284
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1285
	movups	XMMWORD PTR 112[rsp], xmm7
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1286
.LVL398:
	.loc 1 125 23 discriminator 1 view .LVU1287
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1288
	movups	XMMWORD PTR 128[rsp], xmm6
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1289
.LVL399:
	.loc 1 125 23 discriminator 1 view .LVU1290
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1291
	movups	XMMWORD PTR 144[rsp], xmm5
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1292
.LVL400:
	.loc 1 125 23 discriminator 1 view .LVU1293
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1294
	movups	XMMWORD PTR 160[rsp], xmm4
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1295
.LVL401:
	.loc 1 125 23 discriminator 1 view .LVU1296
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1297
	movups	XMMWORD PTR 176[rsp], xmm3
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1298
.LVL402:
	.loc 1 125 23 discriminator 1 view .LVU1299
	.loc 1 125 23 is_stmt 0 discriminator 1 view .LVU1300
.LBE110:
.LBB111:
	.loc 1 127 28 is_stmt 1 discriminator 1 view .LVU1301
	test	rcx, rcx
	je	.L422
	.loc 1 127 17 is_stmt 0 view .LVU1302
	xor	eax, eax
.LVL403:
	.p2align 4,,10
	.p2align 3
.L423:
.LBB108:
	.loc 1 129 23 is_stmt 1 discriminator 1 view .LVU1303
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU1304
	mulpd	xmm2, xmm0
.LBE108:
	.loc 1 127 5 discriminator 2 view .LVU1305
	add	rax, 1
.LVL404:
.LBB109:
	.loc 1 129 53 discriminator 3 view .LVU1306
	mulpd	xmm13, xmm0
	mulpd	xmm12, xmm0
	mulpd	xmm11, xmm0
	mulpd	xmm10, xmm0
	mulpd	xmm9, xmm0
	.loc 1 129 58 discriminator 3 view .LVU1307
	addpd	xmm2, xmm1
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1308
.LVL405:
	.loc 1 129 23 discriminator 1 view .LVU1309
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU1310
	mulpd	xmm8, xmm0
	.loc 1 129 58 discriminator 3 view .LVU1311
	addpd	xmm13, xmm1
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1312
.LVL406:
	.loc 1 129 23 discriminator 1 view .LVU1313
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU1314
	mulpd	xmm7, xmm0
	.loc 1 129 58 discriminator 3 view .LVU1315
	addpd	xmm12, xmm1
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1316
.LVL407:
	.loc 1 129 23 discriminator 1 view .LVU1317
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU1318
	mulpd	xmm6, xmm0
	.loc 1 129 58 discriminator 3 view .LVU1319
	addpd	xmm11, xmm1
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1320
.LVL408:
	.loc 1 129 23 discriminator 1 view .LVU1321
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU1322
	mulpd	xmm5, xmm0
	.loc 1 129 58 discriminator 3 view .LVU1323
	addpd	xmm10, xmm1
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1324
.LVL409:
	.loc 1 129 23 discriminator 1 view .LVU1325
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU1326
	mulpd	xmm4, xmm0
	.loc 1 129 58 discriminator 3 view .LVU1327
	addpd	xmm9, xmm1
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1328
.LVL410:
	.loc 1 129 23 discriminator 1 view .LVU1329
	.loc 1 129 53 is_stmt 0 discriminator 3 view .LVU1330
	mulpd	xmm3, xmm0
	.loc 1 129 58 discriminator 3 view .LVU1331
	addpd	xmm8, xmm1
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1332
.LVL411:
	.loc 1 129 23 discriminator 1 view .LVU1333
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1334
	addpd	xmm7, xmm1
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1335
.LVL412:
	.loc 1 129 23 discriminator 1 view .LVU1336
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1337
	addpd	xmm6, xmm1
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1338
.LVL413:
	.loc 1 129 23 discriminator 1 view .LVU1339
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1340
	addpd	xmm5, xmm1
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1341
.LVL414:
	.loc 1 129 23 discriminator 1 view .LVU1342
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1343
	addpd	xmm4, xmm1
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1344
.LVL415:
	.loc 1 129 23 discriminator 1 view .LVU1345
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1346
	addpd	xmm3, xmm1
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1347
.LVL416:
	.loc 1 129 23 discriminator 1 view .LVU1348
.LBE109:
	.loc 1 127 5 discriminator 2 view .LVU1349
	.loc 1 127 28 discriminator 1 view .LVU1350
	cmp	rcx, rax
	jne	.L423
	movups	XMMWORD PTR 16[rsp], xmm13
	movups	XMMWORD PTR 32[rsp], xmm12
	movups	XMMWORD PTR 48[rsp], xmm11
	movups	XMMWORD PTR 64[rsp], xmm10
	movups	XMMWORD PTR 80[rsp], xmm9
	movups	XMMWORD PTR 96[rsp], xmm8
	movups	XMMWORD PTR 112[rsp], xmm7
	movups	XMMWORD PTR 128[rsp], xmm6
	movups	XMMWORD PTR 144[rsp], xmm5
	movups	XMMWORD PTR 160[rsp], xmm4
	movups	XMMWORD PTR 176[rsp], xmm3
.LVL417:
.L422:
	.loc 1 127 28 is_stmt 0 discriminator 1 view .LVU1351
.LBE111:
.LBB112:
	.loc 1 132 23 is_stmt 1 discriminator 1 view .LVU1352
	.loc 1 132 5 discriminator 3 view .LVU1353
	.loc 1 132 23 discriminator 1 view .LVU1354
	.loc 1 132 5 discriminator 3 view .LVU1355
	.loc 1 132 23 discriminator 1 view .LVU1356
	.loc 1 132 5 discriminator 3 view .LVU1357
	.loc 1 132 23 discriminator 1 view .LVU1358
	.loc 1 132 5 discriminator 3 view .LVU1359
	.loc 1 132 23 discriminator 1 view .LVU1360
	.loc 1 132 5 discriminator 3 view .LVU1361
	.loc 1 132 23 discriminator 1 view .LVU1362
	.loc 1 132 5 discriminator 3 view .LVU1363
	.loc 1 132 23 discriminator 1 view .LVU1364
	.loc 1 132 5 discriminator 3 view .LVU1365
	.loc 1 132 23 discriminator 1 view .LVU1366
	.loc 1 132 5 discriminator 3 view .LVU1367
	.loc 1 132 23 discriminator 1 view .LVU1368
	.loc 1 132 5 discriminator 3 view .LVU1369
	.loc 1 132 23 discriminator 1 view .LVU1370
	.loc 1 132 5 discriminator 3 view .LVU1371
	.loc 1 132 23 discriminator 1 view .LVU1372
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU1373
	addpd	xmm2, XMMWORD PTR 16[rsp]
.LVL418:
	.loc 1 132 35 discriminator 3 view .LVU1374
	movupd	xmm0, XMMWORD PTR 32[rsp]
.LVL419:
	.loc 1 132 35 discriminator 3 view .LVU1375
.LBE112:
	.loc 1 133 21 view .LVU1376
	mov	rax, QWORD PTR .LC53[rip]
	.loc 1 141 1 view .LVU1377
	movups	xmm6, XMMWORD PTR 192[rsp]
	movups	xmm7, XMMWORD PTR 208[rsp]
	movups	xmm8, XMMWORD PTR 224[rsp]
	movups	xmm9, XMMWORD PTR 240[rsp]
.LBB113:
	.loc 1 132 35 discriminator 3 view .LVU1378
	addpd	xmm0, xmm2
.LBE113:
	.loc 1 133 21 view .LVU1379
	mov	QWORD PTR [r9], rax
.LBB114:
	.loc 1 138 35 discriminator 3 view .LVU1380
	pxor	xmm2, xmm2
.LBE114:
	.loc 1 141 1 view .LVU1381
	movups	xmm10, XMMWORD PTR 256[rsp]
.LBB115:
	.loc 1 132 35 discriminator 3 view .LVU1382
	addpd	xmm0, XMMWORD PTR 48[rsp]
.LBE115:
	.loc 1 141 1 view .LVU1383
	movups	xmm11, XMMWORD PTR 272[rsp]
.LBB116:
	.loc 1 132 35 discriminator 3 view .LVU1384
	addpd	xmm0, XMMWORD PTR 64[rsp]
.LBE116:
	.loc 1 141 1 view .LVU1385
	movups	xmm12, XMMWORD PTR 288[rsp]
.LBB117:
	.loc 1 132 35 discriminator 3 view .LVU1386
	addpd	xmm0, XMMWORD PTR 80[rsp]
.LBE117:
	.loc 1 141 1 view .LVU1387
	movups	xmm13, XMMWORD PTR 304[rsp]
.LBB118:
	.loc 1 132 35 discriminator 3 view .LVU1388
	addpd	xmm0, XMMWORD PTR 96[rsp]
.LBE118:
	.loc 1 141 1 view .LVU1389
	movups	xmm14, XMMWORD PTR 320[rsp]
.LVL420:
.LBB119:
	.loc 1 132 35 discriminator 3 view .LVU1390
	addpd	xmm0, XMMWORD PTR 112[rsp]
	addpd	xmm0, XMMWORD PTR 128[rsp]
	addpd	xmm0, XMMWORD PTR 144[rsp]
	addpd	xmm0, XMMWORD PTR 160[rsp]
	addpd	xmm0, XMMWORD PTR 176[rsp]
.LVL421:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU1391
	.loc 1 132 23 discriminator 1 view .LVU1392
	.loc 1 132 23 is_stmt 0 discriminator 1 view .LVU1393
.LBE119:
.LBB120:
	.loc 1 138 23 is_stmt 1 discriminator 1 view .LVU1394
	.loc 1 138 39 is_stmt 0 discriminator 3 view .LVU1395
	movapd	xmm1, xmm0
.LVL422:
	.loc 1 138 39 discriminator 3 view .LVU1396
	unpckhpd	xmm0, xmm0
.LVL423:
	.loc 1 138 35 discriminator 3 view .LVU1397
	addsd	xmm1, xmm2
.LVL424:
	.loc 1 138 5 is_stmt 1 discriminator 3 view .LVU1398
	.loc 1 138 23 discriminator 1 view .LVU1399
	.loc 1 138 5 discriminator 3 view .LVU1400
	.loc 1 138 23 discriminator 1 view .LVU1401
	.loc 1 138 35 is_stmt 0 discriminator 3 view .LVU1402
	addsd	xmm0, xmm1
.LBE120:
	.loc 1 141 1 view .LVU1403
	add	rsp, 344
	.cfi_restore 31
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
.LC5:
	.long	1065445491
	.align 4
.LC7:
	.long	1065437102
	.align 4
.LC9:
	.long	1065428713
	.align 4
.LC11:
	.long	1065420325
	.align 4
.LC13:
	.long	1065411936
	.align 4
.LC15:
	.long	1065403548
	.align 4
.LC17:
	.long	1065395159
	.align 4
.LC19:
	.long	1065386770
	.align 4
.LC21:
	.long	1065378382
	.align 4
.LC23:
	.long	1065369993
	.align 4
.LC25:
	.long	1065361605
	.align 4
.LC27:
	.long	1065353216
	.align 8
.LC28:
	.long	0
	.long	1079508992
	.align 8
.LC30:
	.long	1443109011
	.long	1072704782
	.align 8
.LC32:
	.long	-1030792151
	.long	1072703733
	.align 8
.LC34:
	.long	790273982
	.long	1072702685
	.align 8
.LC36:
	.long	-1683627180
	.long	1072701636
	.align 8
.LC38:
	.long	137438953
	.long	1072700588
	.align 8
.LC40:
	.long	1958505087
	.long	1072699539
	.align 8
.LC42:
	.long	-515396076
	.long	1072698490
	.align 8
.LC44:
	.long	1305670058
	.long	1072697442
	.align 8
.LC46:
	.long	-1168231105
	.long	1072696393
	.align 8
.LC48:
	.long	652835029
	.long	1072695345
	.align 8
.LC50:
	.long	-1821066134
	.long	1072694296
	.align 8
.LC52:
	.long	0
	.long	1072693248
	.align 8
.LC53:
	.long	0
	.long	1078460416
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
	.long	0x1f48
	.word	0x5
	.byte	0x1
	.byte	0x8
	.secrel32	.Ldebug_abbrev0
	.uleb128 0x1a
	.ascii "GNU C++17 13.1.0 -masm=intel -mtune=generic -march=nocona -g -O3 -std=c++17 -fopenmp-simd\0"
	.byte	0x21
	.secrel32	.LASF0
	.secrel32	.LASF1
	.secrel32	.LLRL139
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
	.uleb128 0x5
	.ascii "intptr_t\0"
	.byte	0x2
	.byte	0x3e
	.byte	0x23
	.long	0xb5
	.uleb128 0x5
	.ascii "uintptr_t\0"
	.byte	0x2
	.byte	0x4b
	.byte	0x2c
	.long	0x9b
	.uleb128 0x9
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x12
	.long	0xff
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x1b
	.byte	0x20
	.byte	0x10
	.byte	0x3
	.word	0x1a8
	.byte	0x10
	.ascii "11max_align_t\0"
	.long	0x173
	.uleb128 0x16
	.ascii "__max_align_ll\0"
	.word	0x1a9
	.byte	0xd
	.long	0xb5
	.byte	0x8
	.byte	0
	.uleb128 0x16
	.ascii "__max_align_ld\0"
	.word	0x1aa
	.byte	0xf
	.long	0x173
	.byte	0x10
	.byte	0x10
	.byte	0
	.uleb128 0x9
	.byte	0x10
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0x1c
	.ascii "max_align_t\0"
	.byte	0x3
	.word	0x1ab
	.byte	0x3
	.long	0x127
	.byte	0x10
	.uleb128 0x1d
	.ascii "std\0"
	.byte	0x6
	.word	0x132
	.byte	0xb
	.long	0x2a3
	.uleb128 0x6
	.byte	0x4
	.byte	0x3a
	.byte	0xb
	.long	0x182
	.uleb128 0x6
	.byte	0x5
	.byte	0x33
	.byte	0xb
	.long	0x2b4
	.uleb128 0x6
	.byte	0x5
	.byte	0x34
	.byte	0xb
	.long	0x2e2
	.uleb128 0x6
	.byte	0x5
	.byte	0x35
	.byte	0xb
	.long	0x310
	.uleb128 0x6
	.byte	0x5
	.byte	0x36
	.byte	0xb
	.long	0x336
	.uleb128 0x6
	.byte	0x5
	.byte	0x38
	.byte	0xb
	.long	0x409
	.uleb128 0x6
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.long	0x432
	.uleb128 0x6
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.long	0x45d
	.uleb128 0x6
	.byte	0x5
	.byte	0x3b
	.byte	0xb
	.long	0x488
	.uleb128 0x6
	.byte	0x5
	.byte	0x3d
	.byte	0xb
	.long	0x357
	.uleb128 0x6
	.byte	0x5
	.byte	0x3e
	.byte	0xb
	.long	0x382
	.uleb128 0x6
	.byte	0x5
	.byte	0x3f
	.byte	0xb
	.long	0x3af
	.uleb128 0x6
	.byte	0x5
	.byte	0x40
	.byte	0xb
	.long	0x3dc
	.uleb128 0x6
	.byte	0x5
	.byte	0x42
	.byte	0xb
	.long	0x4b3
	.uleb128 0x6
	.byte	0x5
	.byte	0x43
	.byte	0xb
	.long	0xc6
	.uleb128 0x6
	.byte	0x5
	.byte	0x45
	.byte	0xb
	.long	0x2d2
	.uleb128 0x6
	.byte	0x5
	.byte	0x46
	.byte	0xb
	.long	0x2ff
	.uleb128 0x6
	.byte	0x5
	.byte	0x47
	.byte	0xb
	.long	0x325
	.uleb128 0x6
	.byte	0x5
	.byte	0x48
	.byte	0xb
	.long	0x346
	.uleb128 0x6
	.byte	0x5
	.byte	0x4a
	.byte	0xb
	.long	0x41d
	.uleb128 0x6
	.byte	0x5
	.byte	0x4b
	.byte	0xb
	.long	0x447
	.uleb128 0x6
	.byte	0x5
	.byte	0x4c
	.byte	0xb
	.long	0x472
	.uleb128 0x6
	.byte	0x5
	.byte	0x4d
	.byte	0xb
	.long	0x49d
	.uleb128 0x6
	.byte	0x5
	.byte	0x4f
	.byte	0xb
	.long	0x36c
	.uleb128 0x6
	.byte	0x5
	.byte	0x50
	.byte	0xb
	.long	0x398
	.uleb128 0x6
	.byte	0x5
	.byte	0x51
	.byte	0xb
	.long	0x3c5
	.uleb128 0x6
	.byte	0x5
	.byte	0x52
	.byte	0xb
	.long	0x3f2
	.uleb128 0x6
	.byte	0x5
	.byte	0x54
	.byte	0xb
	.long	0x4c4
	.uleb128 0x6
	.byte	0x5
	.byte	0x55
	.byte	0xb
	.long	0xd7
	.uleb128 0x1e
	.ascii "size_t\0"
	.byte	0x6
	.word	0x134
	.byte	0x1a
	.long	0x9b
	.uleb128 0x12
	.long	0x28d
	.byte	0
	.uleb128 0x9
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x5
	.ascii "int8_t\0"
	.byte	0x7
	.byte	0x23
	.byte	0x15
	.long	0x2c3
	.uleb128 0x9
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x5
	.ascii "uint8_t\0"
	.byte	0x7
	.byte	0x24
	.byte	0x19
	.long	0x2a3
	.uleb128 0x5
	.ascii "int16_t\0"
	.byte	0x7
	.byte	0x25
	.byte	0x10
	.long	0x2f2
	.uleb128 0x9
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x5
	.ascii "uint16_t\0"
	.byte	0x7
	.byte	0x26
	.byte	0x19
	.long	0xe9
	.uleb128 0x5
	.ascii "int32_t\0"
	.byte	0x7
	.byte	0x27
	.byte	0xe
	.long	0xff
	.uleb128 0x12
	.long	0x310
	.uleb128 0x5
	.ascii "uint32_t\0"
	.byte	0x7
	.byte	0x28
	.byte	0x14
	.long	0x117
	.uleb128 0x5
	.ascii "int64_t\0"
	.byte	0x7
	.byte	0x29
	.byte	0x26
	.long	0xb5
	.uleb128 0x5
	.ascii "uint64_t\0"
	.byte	0x7
	.byte	0x2a
	.byte	0x30
	.long	0x9b
	.uleb128 0x5
	.ascii "int_least8_t\0"
	.byte	0x7
	.byte	0x2d
	.byte	0x15
	.long	0x2c3
	.uleb128 0x5
	.ascii "uint_least8_t\0"
	.byte	0x7
	.byte	0x2e
	.byte	0x19
	.long	0x2a3
	.uleb128 0x5
	.ascii "int_least16_t\0"
	.byte	0x7
	.byte	0x2f
	.byte	0x10
	.long	0x2f2
	.uleb128 0x5
	.ascii "uint_least16_t\0"
	.byte	0x7
	.byte	0x30
	.byte	0x19
	.long	0xe9
	.uleb128 0x5
	.ascii "int_least32_t\0"
	.byte	0x7
	.byte	0x31
	.byte	0xe
	.long	0xff
	.uleb128 0x5
	.ascii "uint_least32_t\0"
	.byte	0x7
	.byte	0x32
	.byte	0x14
	.long	0x117
	.uleb128 0x5
	.ascii "int_least64_t\0"
	.byte	0x7
	.byte	0x33
	.byte	0x26
	.long	0xb5
	.uleb128 0x5
	.ascii "uint_least64_t\0"
	.byte	0x7
	.byte	0x34
	.byte	0x30
	.long	0x9b
	.uleb128 0x5
	.ascii "int_fast8_t\0"
	.byte	0x7
	.byte	0x3a
	.byte	0x15
	.long	0x2c3
	.uleb128 0x5
	.ascii "uint_fast8_t\0"
	.byte	0x7
	.byte	0x3b
	.byte	0x17
	.long	0x2a3
	.uleb128 0x5
	.ascii "int_fast16_t\0"
	.byte	0x7
	.byte	0x3c
	.byte	0x10
	.long	0x2f2
	.uleb128 0x5
	.ascii "uint_fast16_t\0"
	.byte	0x7
	.byte	0x3d
	.byte	0x19
	.long	0xe9
	.uleb128 0x5
	.ascii "int_fast32_t\0"
	.byte	0x7
	.byte	0x3e
	.byte	0xe
	.long	0xff
	.uleb128 0x5
	.ascii "uint_fast32_t\0"
	.byte	0x7
	.byte	0x3f
	.byte	0x18
	.long	0x117
	.uleb128 0x5
	.ascii "int_fast64_t\0"
	.byte	0x7
	.byte	0x40
	.byte	0x26
	.long	0xb5
	.uleb128 0x5
	.ascii "uint_fast64_t\0"
	.byte	0x7
	.byte	0x41
	.byte	0x30
	.long	0x9b
	.uleb128 0x5
	.ascii "intmax_t\0"
	.byte	0x7
	.byte	0x44
	.byte	0x26
	.long	0xb5
	.uleb128 0x5
	.ascii "uintmax_t\0"
	.byte	0x7
	.byte	0x45
	.byte	0x30
	.long	0x9b
	.uleb128 0x6
	.byte	0x1
	.byte	0x3
	.byte	0xc
	.long	0x28d
	.uleb128 0x8
	.ascii "peak_flops<double>\0"
	.byte	0x73
	.byte	0xc
	.ascii "_Z10peak_flopsIdET_yS0_S0_Pd\0"
	.long	0x80
	.quad	.LFB62
	.quad	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.long	0x677
	.uleb128 0x4
	.ascii "T\0"
	.long	0x80
	.uleb128 0x1
	.ascii "iters\0"
	.byte	0x73
	.byte	0x1e
	.long	0x28d
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.ascii "m\0"
	.byte	0x73
	.byte	0x27
	.long	0x80
	.secrel32	.LLST123
	.secrel32	.LVUS123
	.uleb128 0x3
	.ascii "c\0"
	.byte	0x73
	.byte	0x2c
	.long	0x80
	.secrel32	.LLST124
	.secrel32	.LVUS124
	.uleb128 0x17
	.secrel32	.LASF2
	.byte	0x73
	.long	0x67c
	.uleb128 0x1
	.byte	0x59
	.uleb128 0xc
	.ascii "K\0"
	.byte	0x74
	.byte	0x13
	.long	0x106
	.byte	0xc
	.uleb128 0x5
	.ascii "V\0"
	.byte	0x1
	.byte	0x79
	.byte	0xf
	.long	0x686
	.uleb128 0x12
	.long	0x579
	.uleb128 0xc
	.ascii "L\0"
	.byte	0x7a
	.byte	0x13
	.long	0x106
	.byte	0x2
	.uleb128 0xf
	.long	0x579
	.long	0x5a2
	.uleb128 0x10
	.long	0x9b
	.byte	0xb
	.byte	0
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x7c
	.long	0x592
	.uleb128 0x3
	.byte	0x91
	.sleb128 -352
	.uleb128 0x2
	.ascii "vm\0"
	.byte	0x7e
	.byte	0xd
	.long	0x583
	.secrel32	.LLST125
	.secrel32	.LVUS125
	.uleb128 0x2
	.ascii "vc\0"
	.byte	0x7e
	.byte	0x1b
	.long	0x583
	.secrel32	.LLST126
	.secrel32	.LVUS126
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x83
	.byte	0x7
	.long	0x579
	.secrel32	.LLST127
	.secrel32	.LVUS127
	.uleb128 0x2
	.ascii "r\0"
	.byte	0x89
	.byte	0x7
	.long	0x80
	.secrel32	.LLST128
	.secrel32	.LVUS128
	.uleb128 0xd
	.secrel32	.LLRL129
	.long	0x611
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x7d
	.byte	0xe
	.long	0xff
	.secrel32	.LLST130
	.secrel32	.LVUS130
	.byte	0
	.uleb128 0xd
	.secrel32	.LLRL131
	.long	0x644
	.uleb128 0x2
	.ascii "it\0"
	.byte	0x7f
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST132
	.secrel32	.LVUS132
	.uleb128 0x7
	.secrel32	.LLRL133
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x81
	.byte	0x12
	.long	0xff
	.secrel32	.LLST134
	.secrel32	.LVUS134
	.byte	0
	.byte	0
	.uleb128 0xd
	.secrel32	.LLRL135
	.long	0x65f
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x84
	.byte	0xe
	.long	0xff
	.secrel32	.LLST136
	.secrel32	.LVUS136
	.byte	0
	.uleb128 0x7
	.secrel32	.LLRL137
	.uleb128 0x2
	.ascii "l\0"
	.byte	0x8a
	.byte	0xe
	.long	0xff
	.secrel32	.LLST138
	.secrel32	.LVUS138
	.byte	0
	.byte	0
	.uleb128 0x12
	.long	0x80
	.uleb128 0x13
	.long	0x80
	.uleb128 0x14
	.long	0x67c
	.uleb128 0x18
	.long	0x80
	.long	0x692
	.uleb128 0x19
	.byte	0x1
	.byte	0
	.uleb128 0x8
	.ascii "peak_flops<float>\0"
	.byte	0x73
	.byte	0xc
	.ascii "_Z10peak_flopsIfET_yS0_S0_Pd\0"
	.long	0x8a
	.quad	.LFB61
	.quad	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.long	0x82a
	.uleb128 0x4
	.ascii "T\0"
	.long	0x8a
	.uleb128 0x1
	.ascii "iters\0"
	.byte	0x73
	.byte	0x1e
	.long	0x28d
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.ascii "m\0"
	.byte	0x73
	.byte	0x27
	.long	0x8a
	.secrel32	.LLST107
	.secrel32	.LVUS107
	.uleb128 0x3
	.ascii "c\0"
	.byte	0x73
	.byte	0x2c
	.long	0x8a
	.secrel32	.LLST108
	.secrel32	.LVUS108
	.uleb128 0x17
	.secrel32	.LASF2
	.byte	0x73
	.long	0x67c
	.uleb128 0x1
	.byte	0x59
	.uleb128 0xc
	.ascii "K\0"
	.byte	0x74
	.byte	0x13
	.long	0x106
	.byte	0xc
	.uleb128 0x5
	.ascii "V\0"
	.byte	0x1
	.byte	0x79
	.byte	0xf
	.long	0x82f
	.uleb128 0x12
	.long	0x72c
	.uleb128 0xc
	.ascii "L\0"
	.byte	0x7a
	.byte	0x13
	.long	0x106
	.byte	0x4
	.uleb128 0xf
	.long	0x72c
	.long	0x755
	.uleb128 0x10
	.long	0x9b
	.byte	0xb
	.byte	0
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x7c
	.long	0x745
	.uleb128 0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x2
	.ascii "vm\0"
	.byte	0x7e
	.byte	0xd
	.long	0x736
	.secrel32	.LLST109
	.secrel32	.LVUS109
	.uleb128 0x2
	.ascii "vc\0"
	.byte	0x7e
	.byte	0x1b
	.long	0x736
	.secrel32	.LLST110
	.secrel32	.LVUS110
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x83
	.byte	0x7
	.long	0x72c
	.secrel32	.LLST111
	.secrel32	.LVUS111
	.uleb128 0x2
	.ascii "r\0"
	.byte	0x89
	.byte	0x7
	.long	0x8a
	.secrel32	.LLST112
	.secrel32	.LVUS112
	.uleb128 0xd
	.secrel32	.LLRL113
	.long	0x7c4
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x7d
	.byte	0xe
	.long	0xff
	.secrel32	.LLST114
	.secrel32	.LVUS114
	.byte	0
	.uleb128 0xd
	.secrel32	.LLRL115
	.long	0x7f7
	.uleb128 0x2
	.ascii "it\0"
	.byte	0x7f
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST116
	.secrel32	.LVUS116
	.uleb128 0x7
	.secrel32	.LLRL117
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x81
	.byte	0x12
	.long	0xff
	.secrel32	.LLST118
	.secrel32	.LVUS118
	.byte	0
	.byte	0
	.uleb128 0xd
	.secrel32	.LLRL119
	.long	0x812
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x84
	.byte	0xe
	.long	0xff
	.secrel32	.LLST120
	.secrel32	.LVUS120
	.byte	0
	.uleb128 0x7
	.secrel32	.LLRL121
	.uleb128 0x2
	.ascii "l\0"
	.byte	0x8a
	.byte	0xe
	.long	0xff
	.secrel32	.LLST122
	.secrel32	.LVUS122
	.byte	0
	.byte	0
	.uleb128 0x12
	.long	0x8a
	.uleb128 0x18
	.long	0x8a
	.long	0x83b
	.uleb128 0x19
	.byte	0x3
	.byte	0
	.uleb128 0x8
	.ascii "vmul_ref_elem<int>\0"
	.byte	0x9d
	.byte	0xd
	.ascii "_Z13vmul_ref_elemIiEeT_S0_\0"
	.long	0x173
	.quad	.LFB60
	.quad	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.long	0x8a4
	.uleb128 0x4
	.ascii "T\0"
	.long	0xff
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9d
	.byte	0x1d
	.long	0xff
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9d
	.byte	0x22
	.long	0xff
	.uleb128 0x1
	.byte	0x58
	.byte	0
	.uleb128 0x8
	.ascii "saxpy_ref_elem<int>\0"
	.byte	0x9a
	.byte	0xd
	.ascii "_Z14saxpy_ref_elemIiEeT_S0_S0_\0"
	.long	0x173
	.quad	.LFB59
	.quad	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.long	0x91d
	.uleb128 0x4
	.ascii "T\0"
	.long	0xff
	.uleb128 0x1
	.ascii "a\0"
	.byte	0x9a
	.byte	0x1e
	.long	0xff
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9a
	.byte	0x23
	.long	0xff
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9a
	.byte	0x28
	.long	0xff
	.uleb128 0x1
	.byte	0x59
	.byte	0
	.uleb128 0x8
	.ascii "dot_ref<int>\0"
	.byte	0x93
	.byte	0xd
	.ascii "_Z7dot_refIiEePKT_S2_y\0"
	.long	0x173
	.quad	.LFB58
	.quad	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.long	0x9bb
	.uleb128 0x4
	.ascii "T\0"
	.long	0xff
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x93
	.byte	0x1e
	.long	0x9bb
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x93
	.byte	0x2a
	.long	0x9bb
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x93
	.byte	0x34
	.long	0x28d
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x94
	.byte	0x11
	.long	0x173
	.secrel32	.LLST105
	.secrel32	.LVUS105
	.uleb128 0xe
	.quad	.LBB84
	.quad	.LBE84-.LBB84
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x95
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST106
	.secrel32	.LVUS106
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	0x106
	.uleb128 0x14
	.long	0x9bb
	.uleb128 0xa
	.ascii "vmul<int>\0"
	.byte	0x5f
	.ascii "_Z4vmulIiEvPKT_S2_PS0_y\0"
	.quad	.LFB57
	.quad	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.long	0xa4a
	.uleb128 0x4
	.ascii "T\0"
	.long	0xff
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x5f
	.byte	0x2a
	.long	0x9c0
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x5f
	.byte	0x43
	.long	0x9c0
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "z\0"
	.byte	0x5f
	.byte	0x56
	.long	0xa4f
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x5f
	.byte	0x60
	.long	0x28d
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x7
	.secrel32	.LLRL103
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x60
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST104
	.secrel32	.LVUS104
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	0xff
	.uleb128 0x14
	.long	0xa4a
	.uleb128 0xa
	.ascii "saxpy_gather<int>\0"
	.byte	0x56
	.ascii "_Z12saxpy_gatherIiEvT_PKS0_PS0_PKiy\0"
	.quad	.LFB56
	.quad	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.long	0xb06
	.uleb128 0x4
	.ascii "T\0"
	.long	0xff
	.uleb128 0x3
	.ascii "a\0"
	.byte	0x56
	.byte	0x1e
	.long	0xff
	.secrel32	.LLST99
	.secrel32	.LVUS99
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x56
	.byte	0x37
	.long	0x9c0
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x56
	.byte	0x4a
	.long	0xa4f
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "idx\0"
	.byte	0x57
	.byte	0x3d
	.long	0xb0b
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x57
	.byte	0x49
	.long	0x28d
	.secrel32	.LLST100
	.secrel32	.LVUS100
	.uleb128 0x7
	.secrel32	.LLRL101
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x58
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST102
	.secrel32	.LVUS102
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	0x320
	.uleb128 0x14
	.long	0xb06
	.uleb128 0xa
	.ascii "saxpy_stride<int>\0"
	.byte	0x51
	.ascii "_Z12saxpy_strideIiEvT_PKS0_PS0_yy\0"
	.quad	.LFB55
	.quad	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.long	0xbb9
	.uleb128 0x4
	.ascii "T\0"
	.long	0xff
	.uleb128 0x3
	.ascii "a\0"
	.byte	0x51
	.byte	0x1e
	.long	0xff
	.secrel32	.LLST96
	.secrel32	.LVUS96
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x51
	.byte	0x37
	.long	0x9c0
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x51
	.byte	0x4a
	.long	0xa4f
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x51
	.byte	0x54
	.long	0x28d
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x1
	.ascii "s\0"
	.byte	0x51
	.byte	0x5e
	.long	0x28d
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x7
	.secrel32	.LLRL97
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x52
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST98
	.secrel32	.LVUS98
	.byte	0
	.byte	0
	.uleb128 0xa
	.ascii "saxpy<int>\0"
	.byte	0x4c
	.ascii "_Z5saxpyIiEvT_PKS0_PS0_y\0"
	.quad	.LFB54
	.quad	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.long	0xc4c
	.uleb128 0x4
	.ascii "T\0"
	.long	0xff
	.uleb128 0x3
	.ascii "a\0"
	.byte	0x4c
	.byte	0x17
	.long	0xff
	.secrel32	.LLST92
	.secrel32	.LVUS92
	.uleb128 0x3
	.ascii "x\0"
	.byte	0x4c
	.byte	0x30
	.long	0x9c0
	.secrel32	.LLST93
	.secrel32	.LVUS93
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x4c
	.byte	0x43
	.long	0xa4f
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x4c
	.byte	0x4d
	.long	0x28d
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x7
	.secrel32	.LLRL94
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x4d
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST95
	.secrel32	.LVUS95
	.byte	0
	.byte	0
	.uleb128 0x8
	.ascii "dot_simd_acc<int>\0"
	.byte	0x3a
	.byte	0xc
	.ascii "_Z12dot_simd_accIiET_PKS0_S2_y\0"
	.long	0xff
	.quad	.LFB53
	.quad	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.long	0xd4e
	.uleb128 0x4
	.ascii "T\0"
	.long	0xff
	.uleb128 0x3
	.ascii "x\0"
	.byte	0x3a
	.byte	0x2f
	.long	0x9c0
	.secrel32	.LLST86
	.secrel32	.LVUS86
	.uleb128 0x3
	.ascii "y\0"
	.byte	0x3a
	.byte	0x48
	.long	0x9c0
	.secrel32	.LLST87
	.secrel32	.LVUS87
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x3a
	.byte	0x52
	.long	0x28d
	.uleb128 0x1
	.byte	0x58
	.uleb128 0xc
	.ascii "W\0"
	.byte	0x3b
	.byte	0x16
	.long	0x29d
	.byte	0x20
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x3c
	.long	0xd4e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x3d
	.byte	0xc
	.long	0x28d
	.secrel32	.LLST88
	.secrel32	.LVUS88
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x42
	.byte	0x7
	.long	0xff
	.secrel32	.LLST89
	.secrel32	.LVUS89
	.uleb128 0xd
	.secrel32	.LLRL90
	.long	0xd2a
	.uleb128 0xb
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x28d
	.uleb128 0x7
	.secrel32	.LLRL90
	.uleb128 0xb
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x28d
	.byte	0
	.byte	0
	.uleb128 0xe
	.quad	.LBB72
	.quad	.LBE72-.LBB72
	.uleb128 0x2
	.ascii "j\0"
	.byte	0x43
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST91
	.secrel32	.LVUS91
	.byte	0
	.byte	0
	.uleb128 0xf
	.long	0xff
	.long	0xd5e
	.uleb128 0x10
	.long	0x9b
	.byte	0x1f
	.byte	0
	.uleb128 0x8
	.ascii "dot_simd<int>\0"
	.byte	0x2d
	.byte	0xc
	.ascii "_Z8dot_simdIiET_PKS0_S2_y\0"
	.long	0xff
	.quad	.LFB52
	.quad	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.long	0xe0c
	.uleb128 0x4
	.ascii "T\0"
	.long	0xff
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x2d
	.byte	0x2b
	.long	0x9c0
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x2d
	.byte	0x44
	.long	0x9c0
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x2d
	.byte	0x4e
	.long	0x28d
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0xff
	.secrel32	.LLST83
	.secrel32	.LVUS83
	.uleb128 0x7
	.secrel32	.LLRL84
	.uleb128 0xb
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x28d
	.uleb128 0x7
	.secrel32	.LLRL84
	.uleb128 0xb
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0xff
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST85
	.secrel32	.LVUS85
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
	.ascii "dot_multiacc<int>\0"
	.byte	0x1a
	.byte	0xc
	.ascii "_Z12dot_multiaccIiET_PKS0_S2_y\0"
	.long	0xff
	.quad	.LFB51
	.quad	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.long	0xf12
	.uleb128 0x4
	.ascii "T\0"
	.long	0xff
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x1a
	.byte	0x2f
	.long	0x9c0
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.ascii "y\0"
	.byte	0x1a
	.byte	0x48
	.long	0x9c0
	.secrel32	.LLST77
	.secrel32	.LVUS77
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x1a
	.byte	0x52
	.long	0x28d
	.secrel32	.LLST78
	.secrel32	.LVUS78
	.uleb128 0xc
	.ascii "K\0"
	.byte	0x1b
	.byte	0x16
	.long	0x29d
	.byte	0x8
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x1c
	.long	0xf12
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x1d
	.byte	0xc
	.long	0x28d
	.secrel32	.LLST79
	.secrel32	.LVUS79
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x21
	.byte	0x7
	.long	0xff
	.secrel32	.LLST80
	.secrel32	.LVUS80
	.uleb128 0x15
	.quad	.LBB59
	.quad	.LBE59-.LBB59
	.long	0xeee
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x1f
	.byte	0x15
	.long	0x28d
	.secrel32	.LLST81
	.secrel32	.LVUS81
	.byte	0
	.uleb128 0xe
	.quad	.LBB60
	.quad	.LBE60-.LBB60
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x22
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST82
	.secrel32	.LVUS82
	.byte	0
	.byte	0
	.uleb128 0xf
	.long	0xff
	.long	0xf22
	.uleb128 0x10
	.long	0x9b
	.byte	0x7
	.byte	0
	.uleb128 0x8
	.ascii "dot_strict<int>\0"
	.byte	0xe
	.byte	0xc
	.ascii "_Z10dot_strictIiET_PKS0_S2_y\0"
	.long	0xff
	.quad	.LFB50
	.quad	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.long	0xfc3
	.uleb128 0x4
	.ascii "T\0"
	.long	0xff
	.uleb128 0x1
	.ascii "x\0"
	.byte	0xe
	.byte	0x2d
	.long	0x9c0
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.ascii "y\0"
	.byte	0xe
	.byte	0x46
	.long	0x9c0
	.secrel32	.LLST73
	.secrel32	.LVUS73
	.uleb128 0x1
	.ascii "n\0"
	.byte	0xe
	.byte	0x50
	.long	0x28d
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.ascii "s\0"
	.byte	0xf
	.byte	0x7
	.long	0xff
	.secrel32	.LLST74
	.secrel32	.LVUS74
	.uleb128 0x7
	.secrel32	.LLRL75
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x10
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST76
	.secrel32	.LVUS76
	.byte	0
	.byte	0
	.uleb128 0x8
	.ascii "vmul_ref_elem<double>\0"
	.byte	0x9d
	.byte	0xd
	.ascii "_Z13vmul_ref_elemIdEeT_S0_\0"
	.long	0x173
	.quad	.LFB49
	.quad	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.long	0x102f
	.uleb128 0x4
	.ascii "T\0"
	.long	0x80
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9d
	.byte	0x1d
	.long	0x80
	.uleb128 0x1
	.byte	0x62
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9d
	.byte	0x22
	.long	0x80
	.uleb128 0x1
	.byte	0x63
	.byte	0
	.uleb128 0x8
	.ascii "saxpy_ref_elem<double>\0"
	.byte	0x9a
	.byte	0xd
	.ascii "_Z14saxpy_ref_elemIdEeT_S0_S0_\0"
	.long	0x173
	.quad	.LFB48
	.quad	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.long	0x10ab
	.uleb128 0x4
	.ascii "T\0"
	.long	0x80
	.uleb128 0x1
	.ascii "a\0"
	.byte	0x9a
	.byte	0x1e
	.long	0x80
	.uleb128 0x1
	.byte	0x62
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9a
	.byte	0x23
	.long	0x80
	.uleb128 0x1
	.byte	0x63
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9a
	.byte	0x28
	.long	0x80
	.uleb128 0x1
	.byte	0x64
	.byte	0
	.uleb128 0x8
	.ascii "dot_ref<double>\0"
	.byte	0x93
	.byte	0xd
	.ascii "_Z7dot_refIdEePKT_S2_y\0"
	.long	0x173
	.quad	.LFB47
	.quad	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.long	0x114c
	.uleb128 0x4
	.ascii "T\0"
	.long	0x80
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x93
	.byte	0x1e
	.long	0x114c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x93
	.byte	0x2a
	.long	0x114c
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x93
	.byte	0x34
	.long	0x28d
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x94
	.byte	0x11
	.long	0x173
	.secrel32	.LLST71
	.secrel32	.LVUS71
	.uleb128 0xe
	.quad	.LBB55
	.quad	.LBE55-.LBB55
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x95
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST72
	.secrel32	.LVUS72
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	0x677
	.uleb128 0x14
	.long	0x114c
	.uleb128 0xa
	.ascii "vmul<double>\0"
	.byte	0x5f
	.ascii "_Z4vmulIdEvPKT_S2_PS0_y\0"
	.quad	.LFB46
	.quad	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.long	0x11e4
	.uleb128 0x4
	.ascii "T\0"
	.long	0x80
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x5f
	.byte	0x2a
	.long	0x1151
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x5f
	.byte	0x43
	.long	0x1151
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "z\0"
	.byte	0x5f
	.byte	0x56
	.long	0x681
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x5f
	.byte	0x60
	.long	0x28d
	.secrel32	.LLST68
	.secrel32	.LVUS68
	.uleb128 0x7
	.secrel32	.LLRL69
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x60
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST70
	.secrel32	.LVUS70
	.byte	0
	.byte	0
	.uleb128 0xa
	.ascii "saxpy_gather<double>\0"
	.byte	0x56
	.ascii "_Z12saxpy_gatherIdEvT_PKS0_PS0_PKiy\0"
	.quad	.LFB45
	.quad	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.long	0x129f
	.uleb128 0x4
	.ascii "T\0"
	.long	0x80
	.uleb128 0x3
	.ascii "a\0"
	.byte	0x56
	.byte	0x1e
	.long	0x80
	.secrel32	.LLST63
	.secrel32	.LVUS63
	.uleb128 0x3
	.ascii "x\0"
	.byte	0x56
	.byte	0x37
	.long	0x1151
	.secrel32	.LLST64
	.secrel32	.LVUS64
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x56
	.byte	0x4a
	.long	0x681
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "idx\0"
	.byte	0x57
	.byte	0x3d
	.long	0xb0b
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x57
	.byte	0x49
	.long	0x28d
	.secrel32	.LLST65
	.secrel32	.LVUS65
	.uleb128 0x7
	.secrel32	.LLRL66
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x58
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST67
	.secrel32	.LVUS67
	.byte	0
	.byte	0
	.uleb128 0xa
	.ascii "saxpy_stride<double>\0"
	.byte	0x51
	.ascii "_Z12saxpy_strideIdEvT_PKS0_PS0_yy\0"
	.quad	.LFB44
	.quad	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.long	0x1351
	.uleb128 0x4
	.ascii "T\0"
	.long	0x80
	.uleb128 0x3
	.ascii "a\0"
	.byte	0x51
	.byte	0x1e
	.long	0x80
	.secrel32	.LLST59
	.secrel32	.LVUS59
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x51
	.byte	0x37
	.long	0x1151
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x51
	.byte	0x4a
	.long	0x681
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x51
	.byte	0x54
	.long	0x28d
	.secrel32	.LLST60
	.secrel32	.LVUS60
	.uleb128 0x1
	.ascii "s\0"
	.byte	0x51
	.byte	0x5e
	.long	0x28d
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x7
	.secrel32	.LLRL61
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x52
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST62
	.secrel32	.LVUS62
	.byte	0
	.byte	0
	.uleb128 0xa
	.ascii "saxpy<double>\0"
	.byte	0x4c
	.ascii "_Z5saxpyIdEvT_PKS0_PS0_y\0"
	.quad	.LFB43
	.quad	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.long	0x13e7
	.uleb128 0x4
	.ascii "T\0"
	.long	0x80
	.uleb128 0x3
	.ascii "a\0"
	.byte	0x4c
	.byte	0x17
	.long	0x80
	.secrel32	.LLST55
	.secrel32	.LVUS55
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x4c
	.byte	0x30
	.long	0x1151
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x4c
	.byte	0x43
	.long	0x681
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x4c
	.byte	0x4d
	.long	0x28d
	.secrel32	.LLST56
	.secrel32	.LVUS56
	.uleb128 0x7
	.secrel32	.LLRL57
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x4d
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST58
	.secrel32	.LVUS58
	.byte	0
	.byte	0
	.uleb128 0x8
	.ascii "dot_simd_acc<double>\0"
	.byte	0x3a
	.byte	0xc
	.ascii "_Z12dot_simd_accIdET_PKS0_S2_y\0"
	.long	0x80
	.quad	.LFB42
	.quad	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.long	0x14f2
	.uleb128 0x4
	.ascii "T\0"
	.long	0x80
	.uleb128 0x3
	.ascii "x\0"
	.byte	0x3a
	.byte	0x2f
	.long	0x1151
	.secrel32	.LLST48
	.secrel32	.LVUS48
	.uleb128 0x3
	.ascii "y\0"
	.byte	0x3a
	.byte	0x48
	.long	0x1151
	.secrel32	.LLST49
	.secrel32	.LVUS49
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x3a
	.byte	0x52
	.long	0x28d
	.secrel32	.LLST50
	.secrel32	.LVUS50
	.uleb128 0xc
	.ascii "W\0"
	.byte	0x3b
	.byte	0x16
	.long	0x29d
	.byte	0x20
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x3c
	.long	0x14f2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -448
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x3d
	.byte	0xc
	.long	0x28d
	.secrel32	.LLST51
	.secrel32	.LVUS51
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x42
	.byte	0x7
	.long	0x80
	.secrel32	.LLST52
	.secrel32	.LVUS52
	.uleb128 0xd
	.secrel32	.LLRL53
	.long	0x14ce
	.uleb128 0xb
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x28d
	.uleb128 0x7
	.secrel32	.LLRL53
	.uleb128 0xb
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x28d
	.byte	0
	.byte	0
	.uleb128 0xe
	.quad	.LBB44
	.quad	.LBE44-.LBB44
	.uleb128 0x2
	.ascii "j\0"
	.byte	0x43
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST54
	.secrel32	.LVUS54
	.byte	0
	.byte	0
	.uleb128 0xf
	.long	0x80
	.long	0x1502
	.uleb128 0x10
	.long	0x9b
	.byte	0x1f
	.byte	0
	.uleb128 0x8
	.ascii "dot_simd<double>\0"
	.byte	0x2d
	.byte	0xc
	.ascii "_Z8dot_simdIdET_PKS0_S2_y\0"
	.long	0x80
	.quad	.LFB41
	.quad	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.long	0x15b9
	.uleb128 0x4
	.ascii "T\0"
	.long	0x80
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x2d
	.byte	0x2b
	.long	0x1151
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x2d
	.byte	0x44
	.long	0x1151
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x2d
	.byte	0x4e
	.long	0x28d
	.secrel32	.LLST44
	.secrel32	.LVUS44
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0x80
	.secrel32	.LLST45
	.secrel32	.LVUS45
	.uleb128 0x7
	.secrel32	.LLRL46
	.uleb128 0xb
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x28d
	.uleb128 0x7
	.secrel32	.LLRL46
	.uleb128 0xb
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0x80
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST47
	.secrel32	.LVUS47
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
	.ascii "dot_multiacc<double>\0"
	.byte	0x1a
	.byte	0xc
	.ascii "_Z12dot_multiaccIdET_PKS0_S2_y\0"
	.long	0x80
	.quad	.LFB40
	.quad	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.long	0x16c9
	.uleb128 0x4
	.ascii "T\0"
	.long	0x80
	.uleb128 0x3
	.ascii "x\0"
	.byte	0x1a
	.byte	0x2f
	.long	0x1151
	.secrel32	.LLST37
	.secrel32	.LVUS37
	.uleb128 0x3
	.ascii "y\0"
	.byte	0x1a
	.byte	0x48
	.long	0x1151
	.secrel32	.LLST38
	.secrel32	.LVUS38
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x1a
	.byte	0x52
	.long	0x28d
	.secrel32	.LLST39
	.secrel32	.LVUS39
	.uleb128 0xc
	.ascii "K\0"
	.byte	0x1b
	.byte	0x16
	.long	0x29d
	.byte	0x8
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x1c
	.long	0x16c9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x1d
	.byte	0xc
	.long	0x28d
	.secrel32	.LLST40
	.secrel32	.LVUS40
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x21
	.byte	0x7
	.long	0x80
	.secrel32	.LLST41
	.secrel32	.LVUS41
	.uleb128 0x15
	.quad	.LBB33
	.quad	.LBE33-.LBB33
	.long	0x16a5
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x1f
	.byte	0x15
	.long	0x28d
	.secrel32	.LLST42
	.secrel32	.LVUS42
	.byte	0
	.uleb128 0xe
	.quad	.LBB34
	.quad	.LBE34-.LBB34
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x22
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST43
	.secrel32	.LVUS43
	.byte	0
	.byte	0
	.uleb128 0xf
	.long	0x80
	.long	0x16d9
	.uleb128 0x10
	.long	0x9b
	.byte	0x7
	.byte	0
	.uleb128 0x8
	.ascii "dot_strict<double>\0"
	.byte	0xe
	.byte	0xc
	.ascii "_Z10dot_strictIdET_PKS0_S2_y\0"
	.long	0x80
	.quad	.LFB39
	.quad	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.long	0x177d
	.uleb128 0x4
	.ascii "T\0"
	.long	0x80
	.uleb128 0x1
	.ascii "x\0"
	.byte	0xe
	.byte	0x2d
	.long	0x1151
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0xe
	.byte	0x46
	.long	0x1151
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.ascii "n\0"
	.byte	0xe
	.byte	0x50
	.long	0x28d
	.secrel32	.LLST33
	.secrel32	.LVUS33
	.uleb128 0x2
	.ascii "s\0"
	.byte	0xf
	.byte	0x7
	.long	0x80
	.secrel32	.LLST34
	.secrel32	.LVUS34
	.uleb128 0x7
	.secrel32	.LLRL35
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x10
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST36
	.secrel32	.LVUS36
	.byte	0
	.byte	0
	.uleb128 0x8
	.ascii "vmul_ref_elem<float>\0"
	.byte	0x9d
	.byte	0xd
	.ascii "_Z13vmul_ref_elemIfEeT_S0_\0"
	.long	0x173
	.quad	.LFB38
	.quad	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.long	0x17e8
	.uleb128 0x4
	.ascii "T\0"
	.long	0x8a
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9d
	.byte	0x1d
	.long	0x8a
	.uleb128 0x1
	.byte	0x62
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9d
	.byte	0x22
	.long	0x8a
	.uleb128 0x1
	.byte	0x63
	.byte	0
	.uleb128 0x8
	.ascii "saxpy_ref_elem<float>\0"
	.byte	0x9a
	.byte	0xd
	.ascii "_Z14saxpy_ref_elemIfEeT_S0_S0_\0"
	.long	0x173
	.quad	.LFB37
	.quad	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.long	0x1863
	.uleb128 0x4
	.ascii "T\0"
	.long	0x8a
	.uleb128 0x1
	.ascii "a\0"
	.byte	0x9a
	.byte	0x1e
	.long	0x8a
	.uleb128 0x1
	.byte	0x62
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9a
	.byte	0x23
	.long	0x8a
	.uleb128 0x1
	.byte	0x63
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9a
	.byte	0x28
	.long	0x8a
	.uleb128 0x1
	.byte	0x64
	.byte	0
	.uleb128 0x8
	.ascii "dot_ref<float>\0"
	.byte	0x93
	.byte	0xd
	.ascii "_Z7dot_refIfEePKT_S2_y\0"
	.long	0x173
	.quad	.LFB36
	.quad	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.long	0x1903
	.uleb128 0x4
	.ascii "T\0"
	.long	0x8a
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x93
	.byte	0x1e
	.long	0x1903
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x93
	.byte	0x2a
	.long	0x1903
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x93
	.byte	0x34
	.long	0x28d
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x94
	.byte	0x11
	.long	0x173
	.secrel32	.LLST31
	.secrel32	.LVUS31
	.uleb128 0xe
	.quad	.LBB28
	.quad	.LBE28-.LBB28
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x95
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST32
	.secrel32	.LVUS32
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	0x82a
	.uleb128 0x14
	.long	0x1903
	.uleb128 0xa
	.ascii "vmul<float>\0"
	.byte	0x5f
	.ascii "_Z4vmulIfEvPKT_S2_PS0_y\0"
	.quad	.LFB35
	.quad	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.long	0x199a
	.uleb128 0x4
	.ascii "T\0"
	.long	0x8a
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x5f
	.byte	0x2a
	.long	0x1908
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x5f
	.byte	0x43
	.long	0x1908
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "z\0"
	.byte	0x5f
	.byte	0x56
	.long	0x199f
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x5f
	.byte	0x60
	.long	0x28d
	.secrel32	.LLST28
	.secrel32	.LVUS28
	.uleb128 0x7
	.secrel32	.LLRL29
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x60
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST30
	.secrel32	.LVUS30
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	0x8a
	.uleb128 0x14
	.long	0x199a
	.uleb128 0xa
	.ascii "saxpy_gather<float>\0"
	.byte	0x56
	.ascii "_Z12saxpy_gatherIfEvT_PKS0_PS0_PKiy\0"
	.quad	.LFB34
	.quad	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.long	0x1a58
	.uleb128 0x4
	.ascii "T\0"
	.long	0x8a
	.uleb128 0x3
	.ascii "a\0"
	.byte	0x56
	.byte	0x1e
	.long	0x8a
	.secrel32	.LLST24
	.secrel32	.LVUS24
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x56
	.byte	0x37
	.long	0x1908
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x56
	.byte	0x4a
	.long	0x199f
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "idx\0"
	.byte	0x57
	.byte	0x3d
	.long	0xb0b
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x57
	.byte	0x49
	.long	0x28d
	.secrel32	.LLST25
	.secrel32	.LVUS25
	.uleb128 0x7
	.secrel32	.LLRL26
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x58
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST27
	.secrel32	.LVUS27
	.byte	0
	.byte	0
	.uleb128 0xa
	.ascii "saxpy_stride<float>\0"
	.byte	0x51
	.ascii "_Z12saxpy_strideIfEvT_PKS0_PS0_yy\0"
	.quad	.LFB33
	.quad	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.long	0x1b09
	.uleb128 0x4
	.ascii "T\0"
	.long	0x8a
	.uleb128 0x3
	.ascii "a\0"
	.byte	0x51
	.byte	0x1e
	.long	0x8a
	.secrel32	.LLST20
	.secrel32	.LVUS20
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x51
	.byte	0x37
	.long	0x1908
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x51
	.byte	0x4a
	.long	0x199f
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x51
	.byte	0x54
	.long	0x28d
	.secrel32	.LLST21
	.secrel32	.LVUS21
	.uleb128 0x1
	.ascii "s\0"
	.byte	0x51
	.byte	0x5e
	.long	0x28d
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x7
	.secrel32	.LLRL22
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x52
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST23
	.secrel32	.LVUS23
	.byte	0
	.byte	0
	.uleb128 0xa
	.ascii "saxpy<float>\0"
	.byte	0x4c
	.ascii "_Z5saxpyIfEvT_PKS0_PS0_y\0"
	.quad	.LFB32
	.quad	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.long	0x1b9e
	.uleb128 0x4
	.ascii "T\0"
	.long	0x8a
	.uleb128 0x3
	.ascii "a\0"
	.byte	0x4c
	.byte	0x17
	.long	0x8a
	.secrel32	.LLST16
	.secrel32	.LVUS16
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x4c
	.byte	0x30
	.long	0x1908
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x4c
	.byte	0x43
	.long	0x199f
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x4c
	.byte	0x4d
	.long	0x28d
	.secrel32	.LLST17
	.secrel32	.LVUS17
	.uleb128 0x7
	.secrel32	.LLRL18
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x4d
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST19
	.secrel32	.LVUS19
	.byte	0
	.byte	0
	.uleb128 0x8
	.ascii "dot_simd_acc<float>\0"
	.byte	0x3a
	.byte	0xc
	.ascii "_Z12dot_simd_accIfET_PKS0_S2_y\0"
	.long	0x8a
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0x1c9c
	.uleb128 0x4
	.ascii "T\0"
	.long	0x8a
	.uleb128 0x3
	.ascii "x\0"
	.byte	0x3a
	.byte	0x2f
	.long	0x1908
	.secrel32	.LLST11
	.secrel32	.LVUS11
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x3a
	.byte	0x48
	.long	0x1908
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x3a
	.byte	0x52
	.long	0x28d
	.uleb128 0x1
	.byte	0x58
	.uleb128 0xc
	.ascii "W\0"
	.byte	0x3b
	.byte	0x16
	.long	0x29d
	.byte	0x20
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x3c
	.long	0x1c9c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x3d
	.byte	0xc
	.long	0x28d
	.secrel32	.LLST12
	.secrel32	.LVUS12
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x42
	.byte	0x7
	.long	0x8a
	.secrel32	.LLST13
	.secrel32	.LVUS13
	.uleb128 0xd
	.secrel32	.LLRL14
	.long	0x1c78
	.uleb128 0xb
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x28d
	.uleb128 0x7
	.secrel32	.LLRL14
	.uleb128 0xb
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x28d
	.byte	0
	.byte	0
	.uleb128 0xe
	.quad	.LBB17
	.quad	.LBE17-.LBB17
	.uleb128 0x2
	.ascii "j\0"
	.byte	0x43
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST15
	.secrel32	.LVUS15
	.byte	0
	.byte	0
	.uleb128 0xf
	.long	0x8a
	.long	0x1cac
	.uleb128 0x10
	.long	0x9b
	.byte	0x1f
	.byte	0
	.uleb128 0x8
	.ascii "dot_simd<float>\0"
	.byte	0x2d
	.byte	0xc
	.ascii "_Z8dot_simdIfET_PKS0_S2_y\0"
	.long	0x8a
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.long	0x1d5c
	.uleb128 0x4
	.ascii "T\0"
	.long	0x8a
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x2d
	.byte	0x2b
	.long	0x1908
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x2d
	.byte	0x44
	.long	0x1908
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x2d
	.byte	0x4e
	.long	0x28d
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0x8a
	.secrel32	.LLST8
	.secrel32	.LVUS8
	.uleb128 0x7
	.secrel32	.LLRL9
	.uleb128 0xb
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x28d
	.uleb128 0x7
	.secrel32	.LLRL9
	.uleb128 0xb
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0x8a
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST10
	.secrel32	.LVUS10
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
	.ascii "dot_multiacc<float>\0"
	.byte	0x1a
	.byte	0xc
	.ascii "_Z12dot_multiaccIfET_PKS0_S2_y\0"
	.long	0x8a
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0x1e5e
	.uleb128 0x4
	.ascii "T\0"
	.long	0x8a
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x1a
	.byte	0x2f
	.long	0x1908
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.ascii "y\0"
	.byte	0x1a
	.byte	0x48
	.long	0x1908
	.secrel32	.LLST3
	.secrel32	.LVUS3
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x1a
	.byte	0x52
	.long	0x28d
	.uleb128 0x1
	.byte	0x58
	.uleb128 0xc
	.ascii "K\0"
	.byte	0x1b
	.byte	0x16
	.long	0x29d
	.byte	0x8
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x1c
	.long	0x1e5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x1d
	.byte	0xc
	.long	0x28d
	.secrel32	.LLST4
	.secrel32	.LVUS4
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x21
	.byte	0x7
	.long	0x8a
	.secrel32	.LLST5
	.secrel32	.LVUS5
	.uleb128 0x15
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.long	0x1e3a
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x1f
	.byte	0x15
	.long	0x28d
	.secrel32	.LLST6
	.secrel32	.LVUS6
	.byte	0
	.uleb128 0xe
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x22
	.byte	0x11
	.long	0x28d
	.secrel32	.LLST7
	.secrel32	.LVUS7
	.byte	0
	.byte	0
	.uleb128 0xf
	.long	0x8a
	.long	0x1e6e
	.uleb128 0x10
	.long	0x9b
	.byte	0x7
	.byte	0
	.uleb128 0x8
	.ascii "dot_strict<float>\0"
	.byte	0xe
	.byte	0xc
	.ascii "_Z10dot_strictIfET_PKS0_S2_y\0"
	.long	0x8a
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0x1f0b
	.uleb128 0x4
	.ascii "T\0"
	.long	0x8a
	.uleb128 0x1
	.ascii "x\0"
	.byte	0xe
	.byte	0x2d
	.long	0x1908
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0xe
	.byte	0x46
	.long	0x1908
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0xe
	.byte	0x50
	.long	0x28d
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.ascii "s\0"
	.byte	0xf
	.byte	0x7
	.long	0x8a
	.secrel32	.LLST0
	.secrel32	.LVUS0
	.uleb128 0x7
	.secrel32	.LLRL1
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x10
	.byte	0x11
	.long	0x28d
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
	.uleb128 0x4
	.uleb128 0x2f
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0xb
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x2107
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x21
	.byte	0
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
.LVUS123:
	.uleb128 0
	.uleb128 .LVU1261
	.uleb128 .LVU1261
	.uleb128 0
.LLST123:
	.byte	0x6
	.quad	.LVL388
	.byte	0x4
	.uleb128 .LVL388-.LVL388
	.uleb128 .LVL390-.LVL388
	.uleb128 0x1
	.byte	0x62
	.byte	0x4
	.uleb128 .LVL390-.LVL388
	.uleb128 .LFE62-.LVL388
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x12
	.uleb128 0x80
	.byte	0x9f
	.byte	0
.LVUS124:
	.uleb128 0
	.uleb128 .LVU1262
	.uleb128 .LVU1262
	.uleb128 0
.LLST124:
	.byte	0x6
	.quad	.LVL388
	.byte	0x4
	.uleb128 .LVL388-.LVL388
	.uleb128 .LVL391-.LVL388
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL391-.LVL388
	.uleb128 .LFE62-.LVL388
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x13
	.uleb128 0x80
	.byte	0x9f
	.byte	0
.LVUS125:
	.uleb128 .LVU1300
	.uleb128 .LVU1375
.LLST125:
	.byte	0x8
	.quad	.LVL402
	.uleb128 .LVL419-.LVL402
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS126:
	.uleb128 .LVU1300
	.uleb128 .LVU1396
.LLST126:
	.byte	0x8
	.quad	.LVL402
	.uleb128 .LVL422-.LVL402
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LVUS127:
	.uleb128 .LVU1351
	.uleb128 .LVU1353
	.uleb128 .LVU1391
	.uleb128 .LVU1397
.LLST127:
	.byte	0x6
	.quad	.LVL417
	.byte	0x4
	.uleb128 .LVL417-.LVL417
	.uleb128 .LVL417-.LVL417
	.uleb128 0x3
	.byte	0x91
	.sleb128 -352
	.byte	0x4
	.uleb128 .LVL421-.LVL417
	.uleb128 .LVL423-.LVL417
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS128:
	.uleb128 .LVU1393
	.uleb128 .LVU1398
	.uleb128 .LVU1398
	.uleb128 .LVU1400
.LLST128:
	.byte	0x8
	.quad	.LVL421
	.uleb128 .LVL424-.LVL421
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0x8
	.quad	.LVL424
	.uleb128 .LVL424-.LVL424
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LVUS130:
	.uleb128 .LVU1254
	.uleb128 .LVU1256
	.uleb128 .LVU1256
	.uleb128 .LVU1264
	.uleb128 .LVU1264
	.uleb128 .LVU1267
	.uleb128 .LVU1267
	.uleb128 .LVU1270
	.uleb128 .LVU1270
	.uleb128 .LVU1275
	.uleb128 .LVU1275
	.uleb128 .LVU1281
	.uleb128 .LVU1281
	.uleb128 .LVU1284
	.uleb128 .LVU1284
	.uleb128 .LVU1287
	.uleb128 .LVU1287
	.uleb128 .LVU1290
	.uleb128 .LVU1290
	.uleb128 .LVU1293
	.uleb128 .LVU1293
	.uleb128 .LVU1296
	.uleb128 .LVU1296
	.uleb128 .LVU1299
	.uleb128 .LVU1299
	.uleb128 0
.LLST130:
	.byte	0x6
	.quad	.LVL389
	.byte	0x4
	.uleb128 .LVL389-.LVL389
	.uleb128 .LVL389-.LVL389
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL389-.LVL389
	.uleb128 .LVL392-.LVL389
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL392-.LVL389
	.uleb128 .LVL393-.LVL389
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL393-.LVL389
	.uleb128 .LVL394-.LVL389
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL394-.LVL389
	.uleb128 .LVL395-.LVL389
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL395-.LVL389
	.uleb128 .LVL396-.LVL389
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL396-.LVL389
	.uleb128 .LVL397-.LVL389
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL397-.LVL389
	.uleb128 .LVL398-.LVL389
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL398-.LVL389
	.uleb128 .LVL399-.LVL389
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL399-.LVL389
	.uleb128 .LVL400-.LVL389
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL400-.LVL389
	.uleb128 .LVL401-.LVL389
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL401-.LVL389
	.uleb128 .LVL402-.LVL389
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL402-.LVL389
	.uleb128 .LFE62-.LVL389
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS132:
	.uleb128 .LVU1300
	.uleb128 .LVU1303
	.uleb128 .LVU1303
	.uleb128 .LVU1306
	.uleb128 .LVU1306
	.uleb128 .LVU1350
	.uleb128 .LVU1350
	.uleb128 .LVU1351
.LLST132:
	.byte	0x6
	.quad	.LVL402
	.byte	0x4
	.uleb128 .LVL402-.LVL402
	.uleb128 .LVL403-.LVL402
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL403-.LVL402
	.uleb128 .LVL404-.LVL402
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL404-.LVL402
	.uleb128 .LVL416-.LVL402
	.uleb128 0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL416-.LVL402
	.uleb128 .LVL417-.LVL402
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS134:
	.uleb128 .LVU1303
	.uleb128 .LVU1309
	.uleb128 .LVU1309
	.uleb128 .LVU1313
	.uleb128 .LVU1313
	.uleb128 .LVU1317
	.uleb128 .LVU1317
	.uleb128 .LVU1321
	.uleb128 .LVU1321
	.uleb128 .LVU1325
	.uleb128 .LVU1325
	.uleb128 .LVU1329
	.uleb128 .LVU1329
	.uleb128 .LVU1333
	.uleb128 .LVU1333
	.uleb128 .LVU1336
	.uleb128 .LVU1336
	.uleb128 .LVU1339
	.uleb128 .LVU1339
	.uleb128 .LVU1342
	.uleb128 .LVU1342
	.uleb128 .LVU1345
	.uleb128 .LVU1345
	.uleb128 .LVU1348
	.uleb128 .LVU1348
	.uleb128 .LVU1351
.LLST134:
	.byte	0x6
	.quad	.LVL403
	.byte	0x4
	.uleb128 .LVL403-.LVL403
	.uleb128 .LVL405-.LVL403
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL405-.LVL403
	.uleb128 .LVL406-.LVL403
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL406-.LVL403
	.uleb128 .LVL407-.LVL403
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL407-.LVL403
	.uleb128 .LVL408-.LVL403
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL408-.LVL403
	.uleb128 .LVL409-.LVL403
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL409-.LVL403
	.uleb128 .LVL410-.LVL403
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL410-.LVL403
	.uleb128 .LVL411-.LVL403
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL411-.LVL403
	.uleb128 .LVL412-.LVL403
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL412-.LVL403
	.uleb128 .LVL413-.LVL403
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL413-.LVL403
	.uleb128 .LVL414-.LVL403
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL414-.LVL403
	.uleb128 .LVL415-.LVL403
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL415-.LVL403
	.uleb128 .LVL416-.LVL403
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL416-.LVL403
	.uleb128 .LVL417-.LVL403
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS136:
	.uleb128 .LVU1351
	.uleb128 .LVU1354
	.uleb128 .LVU1354
	.uleb128 .LVU1356
	.uleb128 .LVU1356
	.uleb128 .LVU1358
	.uleb128 .LVU1358
	.uleb128 .LVU1360
	.uleb128 .LVU1360
	.uleb128 .LVU1362
	.uleb128 .LVU1362
	.uleb128 .LVU1364
	.uleb128 .LVU1364
	.uleb128 .LVU1366
	.uleb128 .LVU1366
	.uleb128 .LVU1368
	.uleb128 .LVU1368
	.uleb128 .LVU1370
	.uleb128 .LVU1370
	.uleb128 .LVU1372
	.uleb128 .LVU1372
	.uleb128 .LVU1392
	.uleb128 .LVU1392
	.uleb128 0
.LLST136:
	.byte	0x6
	.quad	.LVL417
	.byte	0x4
	.uleb128 .LVL417-.LVL417
	.uleb128 .LVL417-.LVL417
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL417-.LVL417
	.uleb128 .LVL417-.LVL417
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL417-.LVL417
	.uleb128 .LVL417-.LVL417
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL417-.LVL417
	.uleb128 .LVL417-.LVL417
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL417-.LVL417
	.uleb128 .LVL417-.LVL417
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL417-.LVL417
	.uleb128 .LVL417-.LVL417
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL417-.LVL417
	.uleb128 .LVL417-.LVL417
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL417-.LVL417
	.uleb128 .LVL417-.LVL417
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL417-.LVL417
	.uleb128 .LVL417-.LVL417
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL417-.LVL417
	.uleb128 .LVL417-.LVL417
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL417-.LVL417
	.uleb128 .LVL421-.LVL417
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL421-.LVL417
	.uleb128 .LFE62-.LVL417
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS138:
	.uleb128 .LVU1393
	.uleb128 .LVU1399
	.uleb128 .LVU1399
	.uleb128 .LVU1401
	.uleb128 .LVU1401
	.uleb128 0
.LLST138:
	.byte	0x6
	.quad	.LVL421
	.byte	0x4
	.uleb128 .LVL421-.LVL421
	.uleb128 .LVL424-.LVL421
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL424-.LVL421
	.uleb128 .LVL424-.LVL421
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL424-.LVL421
	.uleb128 .LFE62-.LVL421
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0
.LVUS107:
	.uleb128 0
	.uleb128 .LVU1105
	.uleb128 .LVU1105
	.uleb128 0
.LLST107:
	.byte	0x6
	.quad	.LVL348
	.byte	0x4
	.uleb128 .LVL348-.LVL348
	.uleb128 .LVL350-.LVL348
	.uleb128 0x1
	.byte	0x62
	.byte	0x4
	.uleb128 .LVL350-.LVL348
	.uleb128 .LFE61-.LVL348
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x12
	.uleb128 0x8a
	.byte	0x9f
	.byte	0
.LVUS108:
	.uleb128 0
	.uleb128 .LVU1106
	.uleb128 .LVU1106
	.uleb128 0
.LLST108:
	.byte	0x6
	.quad	.LVL348
	.byte	0x4
	.uleb128 .LVL348-.LVL348
	.uleb128 .LVL351-.LVL348
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL351-.LVL348
	.uleb128 .LFE61-.LVL348
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x13
	.uleb128 0x8a
	.byte	0x9f
	.byte	0
.LVUS109:
	.uleb128 .LVU1146
	.uleb128 .LVU1232
.LLST109:
	.byte	0x8
	.quad	.LVL362
	.uleb128 .LVL382-.LVL362
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LVUS110:
	.uleb128 .LVU1146
	.uleb128 .LVU1222
.LLST110:
	.byte	0x8
	.quad	.LVL362
	.uleb128 .LVL379-.LVL362
	.uleb128 0x1
	.byte	0x63
	.byte	0
.LVUS111:
	.uleb128 .LVU1197
	.uleb128 .LVU1199
	.uleb128 .LVU1224
	.uleb128 .LVU1245
.LLST111:
	.byte	0x6
	.quad	.LVL377
	.byte	0x4
	.uleb128 .LVL377-.LVL377
	.uleb128 .LVL377-.LVL377
	.uleb128 0x3
	.byte	0x91
	.sleb128 -336
	.byte	0x4
	.uleb128 .LVL380-.LVL377
	.uleb128 .LVL386-.LVL377
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS112:
	.uleb128 .LVU1229
	.uleb128 .LVU1235
	.uleb128 .LVU1235
	.uleb128 .LVU1242
	.uleb128 .LVU1242
	.uleb128 .LVU1246
	.uleb128 .LVU1246
	.uleb128 .LVU1248
.LLST112:
	.byte	0x6
	.quad	.LVL381
	.byte	0x4
	.uleb128 .LVL381-.LVL381
	.uleb128 .LVL383-.LVL381
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x4
	.uleb128 .LVL383-.LVL381
	.uleb128 .LVL385-.LVL381
	.uleb128 0x1
	.byte	0x62
	.byte	0x4
	.uleb128 .LVL385-.LVL381
	.uleb128 .LVL387-.LVL381
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL387-.LVL381
	.uleb128 .LVL387-.LVL381
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LVUS114:
	.uleb128 .LVU1098
	.uleb128 .LVU1100
	.uleb128 .LVU1100
	.uleb128 .LVU1110
	.uleb128 .LVU1110
	.uleb128 .LVU1113
	.uleb128 .LVU1113
	.uleb128 .LVU1118
	.uleb128 .LVU1118
	.uleb128 .LVU1124
	.uleb128 .LVU1124
	.uleb128 .LVU1127
	.uleb128 .LVU1127
	.uleb128 .LVU1130
	.uleb128 .LVU1130
	.uleb128 .LVU1133
	.uleb128 .LVU1133
	.uleb128 .LVU1136
	.uleb128 .LVU1136
	.uleb128 .LVU1139
	.uleb128 .LVU1139
	.uleb128 .LVU1142
	.uleb128 .LVU1142
	.uleb128 .LVU1145
	.uleb128 .LVU1145
	.uleb128 0
.LLST114:
	.byte	0x6
	.quad	.LVL349
	.byte	0x4
	.uleb128 .LVL349-.LVL349
	.uleb128 .LVL349-.LVL349
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL349-.LVL349
	.uleb128 .LVL352-.LVL349
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL352-.LVL349
	.uleb128 .LVL353-.LVL349
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL353-.LVL349
	.uleb128 .LVL354-.LVL349
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL354-.LVL349
	.uleb128 .LVL355-.LVL349
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL355-.LVL349
	.uleb128 .LVL356-.LVL349
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL356-.LVL349
	.uleb128 .LVL357-.LVL349
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL357-.LVL349
	.uleb128 .LVL358-.LVL349
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL358-.LVL349
	.uleb128 .LVL359-.LVL349
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL359-.LVL349
	.uleb128 .LVL360-.LVL349
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL360-.LVL349
	.uleb128 .LVL361-.LVL349
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL361-.LVL349
	.uleb128 .LVL362-.LVL349
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL362-.LVL349
	.uleb128 .LFE61-.LVL349
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS116:
	.uleb128 .LVU1146
	.uleb128 .LVU1149
	.uleb128 .LVU1149
	.uleb128 .LVU1152
	.uleb128 .LVU1152
	.uleb128 .LVU1196
	.uleb128 .LVU1196
	.uleb128 .LVU1197
.LLST116:
	.byte	0x6
	.quad	.LVL362
	.byte	0x4
	.uleb128 .LVL362-.LVL362
	.uleb128 .LVL363-.LVL362
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL363-.LVL362
	.uleb128 .LVL364-.LVL362
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL364-.LVL362
	.uleb128 .LVL376-.LVL362
	.uleb128 0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL376-.LVL362
	.uleb128 .LVL377-.LVL362
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS118:
	.uleb128 .LVU1149
	.uleb128 .LVU1155
	.uleb128 .LVU1155
	.uleb128 .LVU1159
	.uleb128 .LVU1159
	.uleb128 .LVU1163
	.uleb128 .LVU1163
	.uleb128 .LVU1167
	.uleb128 .LVU1167
	.uleb128 .LVU1171
	.uleb128 .LVU1171
	.uleb128 .LVU1175
	.uleb128 .LVU1175
	.uleb128 .LVU1179
	.uleb128 .LVU1179
	.uleb128 .LVU1182
	.uleb128 .LVU1182
	.uleb128 .LVU1185
	.uleb128 .LVU1185
	.uleb128 .LVU1188
	.uleb128 .LVU1188
	.uleb128 .LVU1191
	.uleb128 .LVU1191
	.uleb128 .LVU1194
	.uleb128 .LVU1194
	.uleb128 .LVU1197
.LLST118:
	.byte	0x6
	.quad	.LVL363
	.byte	0x4
	.uleb128 .LVL363-.LVL363
	.uleb128 .LVL365-.LVL363
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL365-.LVL363
	.uleb128 .LVL366-.LVL363
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL366-.LVL363
	.uleb128 .LVL367-.LVL363
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL367-.LVL363
	.uleb128 .LVL368-.LVL363
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL368-.LVL363
	.uleb128 .LVL369-.LVL363
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL369-.LVL363
	.uleb128 .LVL370-.LVL363
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL370-.LVL363
	.uleb128 .LVL371-.LVL363
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL371-.LVL363
	.uleb128 .LVL372-.LVL363
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL372-.LVL363
	.uleb128 .LVL373-.LVL363
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL373-.LVL363
	.uleb128 .LVL374-.LVL363
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL374-.LVL363
	.uleb128 .LVL375-.LVL363
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL375-.LVL363
	.uleb128 .LVL376-.LVL363
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL376-.LVL363
	.uleb128 .LVL377-.LVL363
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS120:
	.uleb128 .LVU1197
	.uleb128 .LVU1200
	.uleb128 .LVU1200
	.uleb128 .LVU1202
	.uleb128 .LVU1202
	.uleb128 .LVU1204
	.uleb128 .LVU1204
	.uleb128 .LVU1206
	.uleb128 .LVU1206
	.uleb128 .LVU1208
	.uleb128 .LVU1208
	.uleb128 .LVU1210
	.uleb128 .LVU1210
	.uleb128 .LVU1212
	.uleb128 .LVU1212
	.uleb128 .LVU1214
	.uleb128 .LVU1214
	.uleb128 .LVU1216
	.uleb128 .LVU1216
	.uleb128 .LVU1218
	.uleb128 .LVU1218
	.uleb128 .LVU1225
	.uleb128 .LVU1225
	.uleb128 0
.LLST120:
	.byte	0x6
	.quad	.LVL377
	.byte	0x4
	.uleb128 .LVL377-.LVL377
	.uleb128 .LVL377-.LVL377
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL377-.LVL377
	.uleb128 .LVL377-.LVL377
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL377-.LVL377
	.uleb128 .LVL377-.LVL377
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL377-.LVL377
	.uleb128 .LVL377-.LVL377
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL377-.LVL377
	.uleb128 .LVL377-.LVL377
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL377-.LVL377
	.uleb128 .LVL377-.LVL377
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL377-.LVL377
	.uleb128 .LVL377-.LVL377
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL377-.LVL377
	.uleb128 .LVL377-.LVL377
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL377-.LVL377
	.uleb128 .LVL377-.LVL377
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL377-.LVL377
	.uleb128 .LVL377-.LVL377
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL377-.LVL377
	.uleb128 .LVL380-.LVL377
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL380-.LVL377
	.uleb128 .LFE61-.LVL377
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS122:
	.uleb128 .LVU1229
	.uleb128 .LVU1236
	.uleb128 .LVU1236
	.uleb128 .LVU1243
	.uleb128 .LVU1243
	.uleb128 .LVU1247
	.uleb128 .LVU1247
	.uleb128 .LVU1249
	.uleb128 .LVU1249
	.uleb128 0
.LLST122:
	.byte	0x6
	.quad	.LVL381
	.byte	0x4
	.uleb128 .LVL381-.LVL381
	.uleb128 .LVL383-.LVL381
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL383-.LVL381
	.uleb128 .LVL385-.LVL381
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL385-.LVL381
	.uleb128 .LVL387-.LVL381
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL387-.LVL381
	.uleb128 .LVL387-.LVL381
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL387-.LVL381
	.uleb128 .LFE61-.LVL381
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0
.LVUS105:
	.uleb128 0
	.uleb128 .LVU1075
	.uleb128 .LVU1075
	.uleb128 0
.LLST105:
	.byte	0x6
	.quad	.LVL339
	.byte	0x4
	.uleb128 .LVL339-.LVL339
	.uleb128 .LVL344-.LVL339
	.uleb128 0x2
	.byte	0x72
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL344-.LVL339
	.uleb128 .LFE58-.LVL339
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.byte	0
.LVUS106:
	.uleb128 .LVU1065
	.uleb128 .LVU1067
	.uleb128 .LVU1067
	.uleb128 .LVU1070
	.uleb128 .LVU1070
	.uleb128 .LVU1073
	.uleb128 .LVU1073
	.uleb128 .LVU1075
	.uleb128 .LVU1075
	.uleb128 .LVU1076
.LLST106:
	.byte	0x6
	.quad	.LVL340
	.byte	0x4
	.uleb128 .LVL340-.LVL340
	.uleb128 .LVL341-.LVL340
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL341-.LVL340
	.uleb128 .LVL342-.LVL340
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL342-.LVL340
	.uleb128 .LVL343-.LVL340
	.uleb128 0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL343-.LVL340
	.uleb128 .LVL344-.LVL340
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL344-.LVL340
	.uleb128 .LVL345-.LVL340
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS104:
	.uleb128 .LVU1036
	.uleb128 .LVU1037
	.uleb128 .LVU1059
	.uleb128 0
.LLST104:
	.byte	0x6
	.quad	.LVL334
	.byte	0x4
	.uleb128 .LVL334-.LVL334
	.uleb128 .LVL335-.LVL334
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL338-.LVL334
	.uleb128 .LFE57-.LVL334
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS99:
	.uleb128 0
	.uleb128 .LVU1004
	.uleb128 .LVU1004
	.uleb128 .LVU1026
	.uleb128 .LVU1026
	.uleb128 .LVU1032
	.uleb128 .LVU1032
	.uleb128 .LVU1033
	.uleb128 .LVU1033
	.uleb128 0
.LLST99:
	.byte	0x6
	.quad	.LVL324
	.byte	0x4
	.uleb128 .LVL324-.LVL324
	.uleb128 .LVL326-.LVL324
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL326-.LVL324
	.uleb128 .LVL328-.LVL324
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL328-.LVL324
	.uleb128 .LVL331-.LVL324
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL331-.LVL324
	.uleb128 .LVL332-.LVL324
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL332-.LVL324
	.uleb128 .LFE56-.LVL324
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LVUS100:
	.uleb128 0
	.uleb128 .LVU1011
	.uleb128 .LVU1011
	.uleb128 .LVU1031
	.uleb128 .LVU1031
	.uleb128 .LVU1032
	.uleb128 .LVU1032
	.uleb128 0
.LLST100:
	.byte	0x6
	.quad	.LVL324
	.byte	0x4
	.uleb128 .LVL324-.LVL324
	.uleb128 .LVL327-.LVL324
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.byte	0x4
	.uleb128 .LVL327-.LVL324
	.uleb128 .LVL330-.LVL324
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL330-.LVL324
	.uleb128 .LVL331-.LVL324
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.byte	0x4
	.uleb128 .LVL331-.LVL324
	.uleb128 .LFE56-.LVL324
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LVUS102:
	.uleb128 .LVU1001
	.uleb128 .LVU1004
	.uleb128 .LVU1032
	.uleb128 0
.LLST102:
	.byte	0x6
	.quad	.LVL325
	.byte	0x4
	.uleb128 .LVL325-.LVL325
	.uleb128 .LVL326-.LVL325
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL331-.LVL325
	.uleb128 .LFE56-.LVL325
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS96:
	.uleb128 0
	.uleb128 .LVU983
	.uleb128 .LVU983
	.uleb128 .LVU988
	.uleb128 .LVU988
	.uleb128 0
.LLST96:
	.byte	0x6
	.quad	.LVL313
	.byte	0x4
	.uleb128 .LVL313-.LVL313
	.uleb128 .LVL317-.LVL313
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL317-.LVL313
	.uleb128 .LVL319-.LVL313
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL319-.LVL313
	.uleb128 .LFE55-.LVL313
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS98:
	.uleb128 .LVU962
	.uleb128 .LVU963
	.uleb128 .LVU988
	.uleb128 .LVU991
	.uleb128 .LVU991
	.uleb128 .LVU993
	.uleb128 .LVU993
	.uleb128 .LVU996
	.uleb128 .LVU996
	.uleb128 .LVU998
	.uleb128 .LVU998
	.uleb128 0
.LLST98:
	.byte	0x6
	.quad	.LVL314
	.byte	0x4
	.uleb128 .LVL314-.LVL314
	.uleb128 .LVL315-.LVL314
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL319-.LVL314
	.uleb128 .LVL320-.LVL314
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL320-.LVL314
	.uleb128 .LVL321-.LVL314
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL321-.LVL314
	.uleb128 .LVL322-.LVL314
	.uleb128 0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL322-.LVL314
	.uleb128 .LVL323-.LVL314
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL323-.LVL314
	.uleb128 .LFE55-.LVL314
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS92:
	.uleb128 0
	.uleb128 .LVU937
	.uleb128 .LVU937
	.uleb128 .LVU938
	.uleb128 .LVU938
	.uleb128 .LVU958
	.uleb128 .LVU958
	.uleb128 .LVU959
	.uleb128 .LVU959
	.uleb128 0
.LLST92:
	.byte	0x6
	.quad	.LVL304
	.byte	0x4
	.uleb128 .LVL304-.LVL304
	.uleb128 .LVL308-.LVL304
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL308-.LVL304
	.uleb128 .LVL309-.LVL304
	.uleb128 0x1
	.byte	0x65
	.byte	0x4
	.uleb128 .LVL309-.LVL304
	.uleb128 .LVL311-.LVL304
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL311-.LVL304
	.uleb128 .LVL312-.LVL304
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL312-.LVL304
	.uleb128 .LFE54-.LVL304
	.uleb128 0x1
	.byte	0x5b
	.byte	0
.LVUS93:
	.uleb128 0
	.uleb128 .LVU931
	.uleb128 .LVU931
	.uleb128 .LVU958
	.uleb128 .LVU958
	.uleb128 0
.LLST93:
	.byte	0x6
	.quad	.LVL304
	.byte	0x4
	.uleb128 .LVL304-.LVL304
	.uleb128 .LVL306-.LVL304
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL306-.LVL304
	.uleb128 .LVL311-.LVL304
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL311-.LVL304
	.uleb128 .LFE54-.LVL304
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS95:
	.uleb128 .LVU928
	.uleb128 .LVU932
	.uleb128 .LVU958
	.uleb128 0
.LLST95:
	.byte	0x6
	.quad	.LVL305
	.byte	0x4
	.uleb128 .LVL305-.LVL305
	.uleb128 .LVL307-.LVL305
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL311-.LVL305
	.uleb128 .LFE54-.LVL305
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS86:
	.uleb128 0
	.uleb128 .LVU849
	.uleb128 .LVU849
	.uleb128 0
.LLST86:
	.byte	0x6
	.quad	.LVL280
	.byte	0x4
	.uleb128 .LVL280-.LVL280
	.uleb128 .LVL282-.LVL280
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL282-.LVL280
	.uleb128 .LFE53-.LVL280
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LVUS87:
	.uleb128 0
	.uleb128 .LVU852
	.uleb128 .LVU852
	.uleb128 .LVU924
	.uleb128 .LVU924
	.uleb128 0
.LLST87:
	.byte	0x6
	.quad	.LVL280
	.byte	0x4
	.uleb128 .LVL280-.LVL280
	.uleb128 .LVL284-.LVL280
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL284-.LVL280
	.uleb128 .LVL303-.LVL280
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL303-.LVL280
	.uleb128 .LFE53-.LVL280
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS88:
	.uleb128 .LVU851
	.uleb128 .LVU853
	.uleb128 .LVU853
	.uleb128 .LVU855
	.uleb128 .LVU855
	.uleb128 .LVU873
	.uleb128 .LVU924
	.uleb128 0
.LLST88:
	.byte	0x6
	.quad	.LVL283
	.byte	0x4
	.uleb128 .LVL283-.LVL283
	.uleb128 .LVL285-.LVL283
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL285-.LVL283
	.uleb128 .LVL286-.LVL283
	.uleb128 0x3
	.byte	0x72
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL286-.LVL283
	.uleb128 .LVL287-.LVL283
	.uleb128 0x3
	.byte	0x79
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL303-.LVL283
	.uleb128 .LFE53-.LVL283
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS89:
	.uleb128 .LVU875
	.uleb128 .LVU877
	.uleb128 .LVU900
	.uleb128 .LVU902
	.uleb128 .LVU906
	.uleb128 .LVU923
.LLST89:
	.byte	0x6
	.quad	.LVL288
	.byte	0x4
	.uleb128 .LVL288-.LVL288
	.uleb128 .LVL288-.LVL288
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL296-.LVL288
	.uleb128 .LVL297-.LVL288
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL299-.LVL288
	.uleb128 .LVL302-.LVL288
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS91:
	.uleb128 .LVU875
	.uleb128 .LVU877
.LLST91:
	.byte	0x8
	.quad	.LVL288
	.uleb128 .LVL288-.LVL288
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS83:
	.uleb128 .LVU826
	.uleb128 .LVU840
	.uleb128 .LVU843
	.uleb128 0
.LLST83:
	.byte	0x6
	.quad	.LVL274
	.byte	0x4
	.uleb128 .LVL274-.LVL274
	.uleb128 .LVL278-.LVL274
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL279-.LVL274
	.uleb128 .LFE52-.LVL274
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS85:
	.uleb128 .LVU827
	.uleb128 .LVU828
	.uleb128 .LVU843
	.uleb128 0
.LLST85:
	.byte	0x6
	.quad	.LVL275
	.byte	0x4
	.uleb128 .LVL275-.LVL275
	.uleb128 .LVL276-.LVL275
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL279-.LVL275
	.uleb128 .LFE52-.LVL275
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS77:
	.uleb128 0
	.uleb128 .LVU768
	.uleb128 .LVU768
	.uleb128 .LVU822
	.uleb128 .LVU822
	.uleb128 0
.LLST77:
	.byte	0x6
	.quad	.LVL256
	.byte	0x4
	.uleb128 .LVL256-.LVL256
	.uleb128 .LVL259-.LVL256
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL259-.LVL256
	.uleb128 .LVL272-.LVL256
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL272-.LVL256
	.uleb128 .LFE51-.LVL256
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS78:
	.uleb128 0
	.uleb128 .LVU817
	.uleb128 .LVU817
	.uleb128 .LVU822
	.uleb128 .LVU822
	.uleb128 0
.LLST78:
	.byte	0x6
	.quad	.LVL256
	.byte	0x4
	.uleb128 .LVL256-.LVL256
	.uleb128 .LVL270-.LVL256
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL270-.LVL256
	.uleb128 .LVL272-.LVL256
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL272-.LVL256
	.uleb128 .LFE51-.LVL256
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LVUS79:
	.uleb128 .LVU767
	.uleb128 .LVU769
	.uleb128 .LVU822
	.uleb128 0
.LLST79:
	.byte	0x6
	.quad	.LVL258
	.byte	0x4
	.uleb128 .LVL258-.LVL258
	.uleb128 .LVL260-.LVL258
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL272-.LVL258
	.uleb128 .LFE51-.LVL258
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS80:
	.uleb128 .LVU791
	.uleb128 .LVU793
	.uleb128 .LVU798
	.uleb128 .LVU800
	.uleb128 .LVU804
	.uleb128 .LVU821
.LLST80:
	.byte	0x6
	.quad	.LVL262
	.byte	0x4
	.uleb128 .LVL262-.LVL262
	.uleb128 .LVL262-.LVL262
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL264-.LVL262
	.uleb128 .LVL265-.LVL262
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL267-.LVL262
	.uleb128 .LVL271-.LVL262
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS81:
	.uleb128 .LVU769
	.uleb128 .LVU775
	.uleb128 .LVU775
	.uleb128 .LVU777
	.uleb128 .LVU777
	.uleb128 .LVU779
	.uleb128 .LVU779
	.uleb128 .LVU781
	.uleb128 .LVU781
	.uleb128 .LVU783
	.uleb128 .LVU783
	.uleb128 .LVU785
	.uleb128 .LVU785
	.uleb128 .LVU787
	.uleb128 .LVU787
	.uleb128 .LVU789
	.uleb128 .LVU789
	.uleb128 .LVU791
.LLST81:
	.byte	0x6
	.quad	.LVL260
	.byte	0x4
	.uleb128 .LVL260-.LVL260
	.uleb128 .LVL261-.LVL260
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL261-.LVL260
	.uleb128 .LVL261-.LVL260
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL261-.LVL260
	.uleb128 .LVL261-.LVL260
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL261-.LVL260
	.uleb128 .LVL261-.LVL260
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL261-.LVL260
	.uleb128 .LVL261-.LVL260
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL261-.LVL260
	.uleb128 .LVL261-.LVL260
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL261-.LVL260
	.uleb128 .LVL261-.LVL260
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL261-.LVL260
	.uleb128 .LVL261-.LVL260
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL261-.LVL260
	.uleb128 .LVL262-.LVL260
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0
.LVUS82:
	.uleb128 .LVU791
	.uleb128 .LVU793
.LLST82:
	.byte	0x8
	.quad	.LVL262
	.uleb128 .LVL262-.LVL262
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS73:
	.uleb128 0
	.uleb128 .LVU752
	.uleb128 .LVU752
	.uleb128 .LVU758
	.uleb128 .LVU758
	.uleb128 0
.LLST73:
	.byte	0x6
	.quad	.LVL246
	.byte	0x4
	.uleb128 .LVL246-.LVL246
	.uleb128 .LVL253-.LVL246
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL253-.LVL246
	.uleb128 .LVL255-.LVL246
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL255-.LVL246
	.uleb128 .LFE50-.LVL246
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS74:
	.uleb128 .LVU734
	.uleb128 .LVU735
	.uleb128 .LVU739
	.uleb128 .LVU756
	.uleb128 .LVU758
	.uleb128 0
.LLST74:
	.byte	0x6
	.quad	.LVL247
	.byte	0x4
	.uleb128 .LVL247-.LVL247
	.uleb128 .LVL248-.LVL247
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL250-.LVL247
	.uleb128 .LVL254-.LVL247
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL255-.LVL247
	.uleb128 .LFE50-.LVL247
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS76:
	.uleb128 .LVU734
	.uleb128 .LVU735
	.uleb128 .LVU758
	.uleb128 0
.LLST76:
	.byte	0x6
	.quad	.LVL247
	.byte	0x4
	.uleb128 .LVL247-.LVL247
	.uleb128 .LVL248-.LVL247
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL255-.LVL247
	.uleb128 .LFE50-.LVL247
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS71:
	.uleb128 0
	.uleb128 .LVU712
	.uleb128 .LVU712
	.uleb128 0
.LLST71:
	.byte	0x6
	.quad	.LVL237
	.byte	0x4
	.uleb128 .LVL237-.LVL237
	.uleb128 .LVL242-.LVL237
	.uleb128 0x2
	.byte	0x72
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL242-.LVL237
	.uleb128 .LFE47-.LVL237
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.byte	0
.LVUS72:
	.uleb128 .LVU703
	.uleb128 .LVU705
	.uleb128 .LVU705
	.uleb128 .LVU708
	.uleb128 .LVU708
	.uleb128 .LVU710
	.uleb128 .LVU710
	.uleb128 .LVU712
	.uleb128 .LVU712
	.uleb128 .LVU713
.LLST72:
	.byte	0x6
	.quad	.LVL238
	.byte	0x4
	.uleb128 .LVL238-.LVL238
	.uleb128 .LVL239-.LVL238
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL239-.LVL238
	.uleb128 .LVL240-.LVL238
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL240-.LVL238
	.uleb128 .LVL241-.LVL238
	.uleb128 0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL241-.LVL238
	.uleb128 .LVL242-.LVL238
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL242-.LVL238
	.uleb128 .LVL243-.LVL238
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS68:
	.uleb128 0
	.uleb128 .LVU690
	.uleb128 .LVU690
	.uleb128 .LVU696
	.uleb128 .LVU696
	.uleb128 .LVU697
	.uleb128 .LVU697
	.uleb128 0
.LLST68:
	.byte	0x6
	.quad	.LVL230
	.byte	0x4
	.uleb128 .LVL230-.LVL230
	.uleb128 .LVL233-.LVL230
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL233-.LVL230
	.uleb128 .LVL235-.LVL230
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL235-.LVL230
	.uleb128 .LVL236-.LVL230
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL236-.LVL230
	.uleb128 .LFE46-.LVL230
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0
.LVUS70:
	.uleb128 .LVU685
	.uleb128 .LVU686
	.uleb128 .LVU696
	.uleb128 0
.LLST70:
	.byte	0x6
	.quad	.LVL231
	.byte	0x4
	.uleb128 .LVL231-.LVL231
	.uleb128 .LVL232-.LVL231
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL235-.LVL231
	.uleb128 .LFE46-.LVL231
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS63:
	.uleb128 0
	.uleb128 .LVU675
	.uleb128 .LVU675
	.uleb128 .LVU682
	.uleb128 .LVU682
	.uleb128 0
.LLST63:
	.byte	0x6
	.quad	.LVL221
	.byte	0x4
	.uleb128 .LVL221-.LVL221
	.uleb128 .LVL226-.LVL221
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL226-.LVL221
	.uleb128 .LVL229-.LVL221
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x11
	.uleb128 0x80
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL229-.LVL221
	.uleb128 .LFE45-.LVL221
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS64:
	.uleb128 0
	.uleb128 .LVU641
	.uleb128 .LVU641
	.uleb128 .LVU682
	.uleb128 .LVU682
	.uleb128 0
.LLST64:
	.byte	0x6
	.quad	.LVL221
	.byte	0x4
	.uleb128 .LVL221-.LVL221
	.uleb128 .LVL223-.LVL221
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL223-.LVL221
	.uleb128 .LVL229-.LVL221
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL229-.LVL221
	.uleb128 .LFE45-.LVL221
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS65:
	.uleb128 0
	.uleb128 .LVU653
	.uleb128 .LVU653
	.uleb128 .LVU681
	.uleb128 .LVU681
	.uleb128 .LVU682
	.uleb128 .LVU682
	.uleb128 0
.LLST65:
	.byte	0x6
	.quad	.LVL221
	.byte	0x4
	.uleb128 .LVL221-.LVL221
	.uleb128 .LVL225-.LVL221
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.byte	0x4
	.uleb128 .LVL225-.LVL221
	.uleb128 .LVL228-.LVL221
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL228-.LVL221
	.uleb128 .LVL229-.LVL221
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.byte	0x4
	.uleb128 .LVL229-.LVL221
	.uleb128 .LFE45-.LVL221
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LVUS67:
	.uleb128 .LVU638
	.uleb128 .LVU642
	.uleb128 .LVU682
	.uleb128 0
.LLST67:
	.byte	0x6
	.quad	.LVL222
	.byte	0x4
	.uleb128 .LVL222-.LVL222
	.uleb128 .LVL224-.LVL222
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL229-.LVL222
	.uleb128 .LFE45-.LVL222
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS59:
	.uleb128 0
	.uleb128 .LVU617
	.uleb128 .LVU617
	.uleb128 .LVU623
	.uleb128 .LVU623
	.uleb128 0
.LLST59:
	.byte	0x6
	.quad	.LVL209
	.byte	0x4
	.uleb128 .LVL209-.LVL209
	.uleb128 .LVL213-.LVL209
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL213-.LVL209
	.uleb128 .LVL215-.LVL209
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x11
	.uleb128 0x80
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL215-.LVL209
	.uleb128 .LFE44-.LVL209
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS60:
	.uleb128 0
	.uleb128 .LVU615
	.uleb128 .LVU615
	.uleb128 .LVU623
	.uleb128 .LVU623
	.uleb128 .LVU635
	.uleb128 .LVU635
	.uleb128 0
.LLST60:
	.byte	0x6
	.quad	.LVL209
	.byte	0x4
	.uleb128 .LVL209-.LVL209
	.uleb128 .LVL212-.LVL209
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL212-.LVL209
	.uleb128 .LVL215-.LVL209
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL215-.LVL209
	.uleb128 .LVL220-.LVL209
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL220-.LVL209
	.uleb128 .LFE44-.LVL209
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0
.LVUS62:
	.uleb128 .LVU607
	.uleb128 .LVU608
	.uleb128 .LVU623
	.uleb128 .LVU626
	.uleb128 .LVU626
	.uleb128 .LVU628
	.uleb128 .LVU628
	.uleb128 .LVU632
	.uleb128 .LVU632
	.uleb128 .LVU634
	.uleb128 .LVU634
	.uleb128 0
.LLST62:
	.byte	0x6
	.quad	.LVL210
	.byte	0x4
	.uleb128 .LVL210-.LVL210
	.uleb128 .LVL211-.LVL210
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL215-.LVL210
	.uleb128 .LVL216-.LVL210
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL216-.LVL210
	.uleb128 .LVL217-.LVL210
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL217-.LVL210
	.uleb128 .LVL218-.LVL210
	.uleb128 0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL218-.LVL210
	.uleb128 .LVL219-.LVL210
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL219-.LVL210
	.uleb128 .LFE44-.LVL210
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS55:
	.uleb128 0
	.uleb128 .LVU597
	.uleb128 .LVU597
	.uleb128 .LVU603
	.uleb128 .LVU603
	.uleb128 0
.LLST55:
	.byte	0x6
	.quad	.LVL201
	.byte	0x4
	.uleb128 .LVL201-.LVL201
	.uleb128 .LVL205-.LVL201
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL205-.LVL201
	.uleb128 .LVL207-.LVL201
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x11
	.uleb128 0x80
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL207-.LVL201
	.uleb128 .LFE43-.LVL201
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS56:
	.uleb128 0
	.uleb128 .LVU595
	.uleb128 .LVU595
	.uleb128 .LVU603
	.uleb128 .LVU603
	.uleb128 .LVU604
	.uleb128 .LVU604
	.uleb128 0
.LLST56:
	.byte	0x6
	.quad	.LVL201
	.byte	0x4
	.uleb128 .LVL201-.LVL201
	.uleb128 .LVL204-.LVL201
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL204-.LVL201
	.uleb128 .LVL207-.LVL201
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL207-.LVL201
	.uleb128 .LVL208-.LVL201
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL208-.LVL201
	.uleb128 .LFE43-.LVL201
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0
.LVUS58:
	.uleb128 .LVU587
	.uleb128 .LVU588
	.uleb128 .LVU603
	.uleb128 0
.LLST58:
	.byte	0x6
	.quad	.LVL202
	.byte	0x4
	.uleb128 .LVL202-.LVL202
	.uleb128 .LVL203-.LVL202
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL207-.LVL202
	.uleb128 .LFE43-.LVL202
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS48:
	.uleb128 0
	.uleb128 .LVU466
	.uleb128 .LVU466
	.uleb128 0
.LLST48:
	.byte	0x6
	.quad	.LVL154
	.byte	0x4
	.uleb128 .LVL154-.LVL154
	.uleb128 .LVL156-.LVL154
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL156-.LVL154
	.uleb128 .LFE42-.LVL154
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LVUS49:
	.uleb128 0
	.uleb128 .LVU469
	.uleb128 .LVU469
	.uleb128 .LVU584
	.uleb128 .LVU584
	.uleb128 0
.LLST49:
	.byte	0x6
	.quad	.LVL154
	.byte	0x4
	.uleb128 .LVL154-.LVL154
	.uleb128 .LVL158-.LVL154
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL158-.LVL154
	.uleb128 .LVL200-.LVL154
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL200-.LVL154
	.uleb128 .LFE42-.LVL154
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS50:
	.uleb128 0
	.uleb128 .LVU574
	.uleb128 .LVU574
	.uleb128 .LVU584
	.uleb128 .LVU584
	.uleb128 0
.LLST50:
	.byte	0x6
	.quad	.LVL154
	.byte	0x4
	.uleb128 .LVL154-.LVL154
	.uleb128 .LVL194-.LVL154
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL194-.LVL154
	.uleb128 .LVL200-.LVL154
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL200-.LVL154
	.uleb128 .LFE42-.LVL154
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LVUS51:
	.uleb128 .LVU468
	.uleb128 .LVU470
	.uleb128 .LVU470
	.uleb128 .LVU472
	.uleb128 .LVU472
	.uleb128 .LVU505
	.uleb128 .LVU584
	.uleb128 0
.LLST51:
	.byte	0x6
	.quad	.LVL157
	.byte	0x4
	.uleb128 .LVL157-.LVL157
	.uleb128 .LVL159-.LVL157
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL159-.LVL157
	.uleb128 .LVL160-.LVL157
	.uleb128 0x3
	.byte	0x7b
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL160-.LVL157
	.uleb128 .LVL161-.LVL157
	.uleb128 0x3
	.byte	0x72
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL200-.LVL157
	.uleb128 .LFE42-.LVL157
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS52:
	.uleb128 .LVU507
	.uleb128 .LVU510
	.uleb128 .LVU510
	.uleb128 .LVU513
	.uleb128 .LVU513
	.uleb128 .LVU514
	.uleb128 .LVU514
	.uleb128 .LVU517
	.uleb128 .LVU517
	.uleb128 .LVU518
	.uleb128 .LVU518
	.uleb128 .LVU521
	.uleb128 .LVU521
	.uleb128 .LVU522
	.uleb128 .LVU522
	.uleb128 .LVU525
	.uleb128 .LVU525
	.uleb128 .LVU526
	.uleb128 .LVU526
	.uleb128 .LVU529
	.uleb128 .LVU529
	.uleb128 .LVU530
	.uleb128 .LVU530
	.uleb128 .LVU533
	.uleb128 .LVU534
	.uleb128 .LVU537
	.uleb128 .LVU538
	.uleb128 .LVU541
	.uleb128 .LVU542
	.uleb128 .LVU545
	.uleb128 .LVU546
	.uleb128 .LVU549
	.uleb128 .LVU550
	.uleb128 .LVU553
	.uleb128 .LVU554
	.uleb128 .LVU557
	.uleb128 .LVU558
	.uleb128 .LVU561
	.uleb128 .LVU562
	.uleb128 .LVU565
	.uleb128 .LVU566
	.uleb128 .LVU569
	.uleb128 .LVU570
	.uleb128 .LVU576
	.uleb128 .LVU577
	.uleb128 .LVU584
.LLST52:
	.byte	0x6
	.quad	.LVL162
	.byte	0x4
	.uleb128 .LVL162-.LVL162
	.uleb128 .LVL163-.LVL162
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0x4
	.uleb128 .LVL163-.LVL162
	.uleb128 .LVL164-.LVL162
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL164-.LVL162
	.uleb128 .LVL165-.LVL162
	.uleb128 0x1d
	.byte	0x91
	.sleb128 -448
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0xa4
	.uleb128 0x80
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -440
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL165-.LVL162
	.uleb128 .LVL166-.LVL162
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL166-.LVL162
	.uleb128 .LVL167-.LVL162
	.uleb128 0x2d
	.byte	0x91
	.sleb128 -448
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0xa4
	.uleb128 0x80
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -440
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -432
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -424
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL167-.LVL162
	.uleb128 .LVL168-.LVL162
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL168-.LVL162
	.uleb128 .LVL169-.LVL162
	.uleb128 0x3d
	.byte	0x91
	.sleb128 -448
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0xa4
	.uleb128 0x80
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -440
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -432
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -424
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -416
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -408
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL169-.LVL162
	.uleb128 .LVL170-.LVL162
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL170-.LVL162
	.uleb128 .LVL171-.LVL162
	.uleb128 0x4d
	.byte	0x91
	.sleb128 -448
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0xa4
	.uleb128 0x80
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -440
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -432
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -424
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -416
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -408
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -400
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -392
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL171-.LVL162
	.uleb128 .LVL172-.LVL162
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL172-.LVL162
	.uleb128 .LVL173-.LVL162
	.uleb128 0x5d
	.byte	0x91
	.sleb128 -448
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0xa4
	.uleb128 0x80
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -440
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -432
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -424
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -416
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -408
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -400
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -392
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -384
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -376
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL173-.LVL162
	.uleb128 .LVL174-.LVL162
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL175-.LVL162
	.uleb128 .LVL176-.LVL162
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL177-.LVL162
	.uleb128 .LVL178-.LVL162
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL179-.LVL162
	.uleb128 .LVL180-.LVL162
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL181-.LVL162
	.uleb128 .LVL182-.LVL162
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL183-.LVL162
	.uleb128 .LVL184-.LVL162
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL185-.LVL162
	.uleb128 .LVL186-.LVL162
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL187-.LVL162
	.uleb128 .LVL188-.LVL162
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL189-.LVL162
	.uleb128 .LVL190-.LVL162
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL191-.LVL162
	.uleb128 .LVL192-.LVL162
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL193-.LVL162
	.uleb128 .LVL196-.LVL162
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL197-.LVL162
	.uleb128 .LVL200-.LVL162
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS54:
	.uleb128 .LVU507
	.uleb128 .LVU509
.LLST54:
	.byte	0x8
	.quad	.LVL162
	.uleb128 .LVL162-.LVL162
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS44:
	.uleb128 0
	.uleb128 .LVU453
	.uleb128 .LVU453
	.uleb128 .LVU458
	.uleb128 .LVU458
	.uleb128 .LVU460
	.uleb128 .LVU460
	.uleb128 0
.LLST44:
	.byte	0x6
	.quad	.LVL144
	.byte	0x4
	.uleb128 .LVL144-.LVL144
	.uleb128 .LVL148-.LVL144
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL148-.LVL144
	.uleb128 .LVL151-.LVL144
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL151-.LVL144
	.uleb128 .LVL153-.LVL144
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL153-.LVL144
	.uleb128 .LFE41-.LVL144
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0
.LVUS45:
	.uleb128 .LVU449
	.uleb128 .LVU456
	.uleb128 .LVU458
	.uleb128 0
.LLST45:
	.byte	0x6
	.quad	.LVL145
	.byte	0x4
	.uleb128 .LVL145-.LVL145
	.uleb128 .LVL150-.LVL145
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0x4
	.uleb128 .LVL151-.LVL145
	.uleb128 .LFE41-.LVL145
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0
.LVUS47:
	.uleb128 .LVU450
	.uleb128 .LVU451
	.uleb128 .LVU459
	.uleb128 0
.LLST47:
	.byte	0x6
	.quad	.LVL146
	.byte	0x4
	.uleb128 .LVL146-.LVL146
	.uleb128 .LVL147-.LVL146
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL152-.LVL146
	.uleb128 .LFE41-.LVL146
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS37:
	.uleb128 0
	.uleb128 .LVU389
	.uleb128 .LVU389
	.uleb128 .LVU390
	.uleb128 .LVU390
	.uleb128 .LVU445
	.uleb128 .LVU445
	.uleb128 0
.LLST37:
	.byte	0x6
	.quad	.LVL122
	.byte	0x4
	.uleb128 .LVL122-.LVL122
	.uleb128 .LVL125-.LVL122
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL125-.LVL122
	.uleb128 .LVL126-.LVL122
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL126-.LVL122
	.uleb128 .LVL142-.LVL122
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL142-.LVL122
	.uleb128 .LFE40-.LVL122
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS38:
	.uleb128 0
	.uleb128 .LVU390
	.uleb128 .LVU390
	.uleb128 .LVU445
	.uleb128 .LVU445
	.uleb128 .LVU446
	.uleb128 .LVU446
	.uleb128 0
.LLST38:
	.byte	0x6
	.quad	.LVL122
	.byte	0x4
	.uleb128 .LVL122-.LVL122
	.uleb128 .LVL126-.LVL122
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL126-.LVL122
	.uleb128 .LVL142-.LVL122
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL142-.LVL122
	.uleb128 .LVL143-.LVL122
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL143-.LVL122
	.uleb128 .LFE40-.LVL122
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LVUS39:
	.uleb128 0
	.uleb128 .LVU435
	.uleb128 .LVU435
	.uleb128 .LVU445
	.uleb128 .LVU445
	.uleb128 0
.LLST39:
	.byte	0x6
	.quad	.LVL122
	.byte	0x4
	.uleb128 .LVL122-.LVL122
	.uleb128 .LVL136-.LVL122
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL136-.LVL122
	.uleb128 .LVL142-.LVL122
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL142-.LVL122
	.uleb128 .LFE40-.LVL122
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LVUS40:
	.uleb128 .LVU388
	.uleb128 .LVU390
	.uleb128 .LVU445
	.uleb128 0
.LLST40:
	.byte	0x6
	.quad	.LVL124
	.byte	0x4
	.uleb128 .LVL124-.LVL124
	.uleb128 .LVL126-.LVL124
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL142-.LVL124
	.uleb128 .LFE40-.LVL124
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS41:
	.uleb128 .LVU416
	.uleb128 .LVU419
	.uleb128 .LVU419
	.uleb128 .LVU422
	.uleb128 .LVU422
	.uleb128 .LVU423
	.uleb128 .LVU423
	.uleb128 .LVU426
	.uleb128 .LVU426
	.uleb128 .LVU427
	.uleb128 .LVU427
	.uleb128 .LVU430
	.uleb128 .LVU430
	.uleb128 .LVU431
	.uleb128 .LVU431
	.uleb128 .LVU437
	.uleb128 .LVU438
	.uleb128 .LVU445
.LLST41:
	.byte	0x6
	.quad	.LVL128
	.byte	0x4
	.uleb128 .LVL128-.LVL128
	.uleb128 .LVL129-.LVL128
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0x4
	.uleb128 .LVL129-.LVL128
	.uleb128 .LVL130-.LVL128
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL130-.LVL128
	.uleb128 .LVL131-.LVL128
	.uleb128 0x1d
	.byte	0x91
	.sleb128 -80
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0xa4
	.uleb128 0x80
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -72
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL131-.LVL128
	.uleb128 .LVL132-.LVL128
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL132-.LVL128
	.uleb128 .LVL133-.LVL128
	.uleb128 0x2b
	.byte	0x91
	.sleb128 -80
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0xa4
	.uleb128 0x80
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -72
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -64
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -56
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL133-.LVL128
	.uleb128 .LVL134-.LVL128
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL134-.LVL128
	.uleb128 .LVL135-.LVL128
	.uleb128 0x39
	.byte	0x91
	.sleb128 -80
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0xa4
	.uleb128 0x80
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -72
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -64
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -56
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -48
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x91
	.sleb128 -40
	.byte	0xa6
	.byte	0x8
	.uleb128 0x80
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL135-.LVL128
	.uleb128 .LVL138-.LVL128
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL139-.LVL128
	.uleb128 .LVL142-.LVL128
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS42:
	.uleb128 .LVU390
	.uleb128 .LVU400
	.uleb128 .LVU400
	.uleb128 .LVU402
	.uleb128 .LVU402
	.uleb128 .LVU404
	.uleb128 .LVU404
	.uleb128 .LVU406
	.uleb128 .LVU406
	.uleb128 .LVU408
	.uleb128 .LVU408
	.uleb128 .LVU410
	.uleb128 .LVU410
	.uleb128 .LVU412
	.uleb128 .LVU412
	.uleb128 .LVU414
	.uleb128 .LVU414
	.uleb128 .LVU416
.LLST42:
	.byte	0x6
	.quad	.LVL126
	.byte	0x4
	.uleb128 .LVL126-.LVL126
	.uleb128 .LVL127-.LVL126
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL127-.LVL126
	.uleb128 .LVL127-.LVL126
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL127-.LVL126
	.uleb128 .LVL127-.LVL126
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL127-.LVL126
	.uleb128 .LVL127-.LVL126
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL127-.LVL126
	.uleb128 .LVL127-.LVL126
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL127-.LVL126
	.uleb128 .LVL127-.LVL126
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL127-.LVL126
	.uleb128 .LVL127-.LVL126
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL127-.LVL126
	.uleb128 .LVL127-.LVL126
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL127-.LVL126
	.uleb128 .LVL128-.LVL126
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0
.LVUS43:
	.uleb128 .LVU416
	.uleb128 .LVU418
.LLST43:
	.byte	0x8
	.quad	.LVL128
	.uleb128 .LVL128-.LVL128
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS33:
	.uleb128 0
	.uleb128 .LVU372
	.uleb128 .LVU372
	.uleb128 .LVU378
	.uleb128 .LVU378
	.uleb128 .LVU381
	.uleb128 .LVU381
	.uleb128 0
.LLST33:
	.byte	0x6
	.quad	.LVL113
	.byte	0x4
	.uleb128 .LVL113-.LVL113
	.uleb128 .LVL118-.LVL113
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL118-.LVL113
	.uleb128 .LVL120-.LVL113
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL120-.LVL113
	.uleb128 .LVL121-.LVL113
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL121-.LVL113
	.uleb128 .LFE39-.LVL113
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0
.LVUS34:
	.uleb128 .LVU366
	.uleb128 .LVU368
	.uleb128 .LVU368
	.uleb128 .LVU369
	.uleb128 .LVU370
	.uleb128 .LVU378
	.uleb128 .LVU378
	.uleb128 0
.LLST34:
	.byte	0x6
	.quad	.LVL114
	.byte	0x4
	.uleb128 .LVL114-.LVL114
	.uleb128 .LVL115-.LVL114
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0x4
	.uleb128 .LVL115-.LVL114
	.uleb128 .LVL116-.LVL114
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL117-.LVL114
	.uleb128 .LVL120-.LVL114
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL120-.LVL114
	.uleb128 .LFE39-.LVL114
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0
.LVUS36:
	.uleb128 .LVU366
	.uleb128 .LVU368
	.uleb128 .LVU378
	.uleb128 0
.LLST36:
	.byte	0x6
	.quad	.LVL114
	.byte	0x4
	.uleb128 .LVL114-.LVL114
	.uleb128 .LVL115-.LVL114
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL120-.LVL114
	.uleb128 .LFE39-.LVL114
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS31:
	.uleb128 0
	.uleb128 .LVU344
	.uleb128 .LVU344
	.uleb128 0
.LLST31:
	.byte	0x6
	.quad	.LVL104
	.byte	0x4
	.uleb128 .LVL104-.LVL104
	.uleb128 .LVL109-.LVL104
	.uleb128 0x2
	.byte	0x72
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL109-.LVL104
	.uleb128 .LFE36-.LVL104
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.byte	0
.LVUS32:
	.uleb128 .LVU335
	.uleb128 .LVU337
	.uleb128 .LVU337
	.uleb128 .LVU340
	.uleb128 .LVU340
	.uleb128 .LVU342
	.uleb128 .LVU342
	.uleb128 .LVU344
	.uleb128 .LVU344
	.uleb128 .LVU345
.LLST32:
	.byte	0x6
	.quad	.LVL105
	.byte	0x4
	.uleb128 .LVL105-.LVL105
	.uleb128 .LVL106-.LVL105
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL106-.LVL105
	.uleb128 .LVL107-.LVL105
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL107-.LVL105
	.uleb128 .LVL108-.LVL105
	.uleb128 0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL108-.LVL105
	.uleb128 .LVL109-.LVL105
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL109-.LVL105
	.uleb128 .LVL110-.LVL105
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS28:
	.uleb128 0
	.uleb128 .LVU316
	.uleb128 .LVU316
	.uleb128 .LVU329
	.uleb128 .LVU329
	.uleb128 0
.LLST28:
	.byte	0x6
	.quad	.LVL97
	.byte	0x4
	.uleb128 .LVL97-.LVL97
	.uleb128 .LVL100-.LVL97
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL100-.LVL97
	.uleb128 .LVL103-.LVL97
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL103-.LVL97
	.uleb128 .LFE35-.LVL97
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LVUS30:
	.uleb128 .LVU310
	.uleb128 .LVU311
	.uleb128 .LVU329
	.uleb128 0
.LLST30:
	.byte	0x6
	.quad	.LVL98
	.byte	0x4
	.uleb128 .LVL98-.LVL98
	.uleb128 .LVL99-.LVL98
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL103-.LVL98
	.uleb128 .LFE35-.LVL98
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS24:
	.uleb128 0
	.uleb128 .LVU301
	.uleb128 .LVU301
	.uleb128 .LVU307
	.uleb128 .LVU307
	.uleb128 0
.LLST24:
	.byte	0x6
	.quad	.LVL88
	.byte	0x4
	.uleb128 .LVL88-.LVL88
	.uleb128 .LVL94-.LVL88
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL94-.LVL88
	.uleb128 .LVL96-.LVL88
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x11
	.uleb128 0x8a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL96-.LVL88
	.uleb128 .LFE34-.LVL88
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS25:
	.uleb128 0
	.uleb128 .LVU289
	.uleb128 .LVU289
	.uleb128 .LVU290
	.uleb128 .LVU290
	.uleb128 .LVU307
	.uleb128 .LVU307
	.uleb128 0
.LLST25:
	.byte	0x6
	.quad	.LVL88
	.byte	0x4
	.uleb128 .LVL88-.LVL88
	.uleb128 .LVL91-.LVL88
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.byte	0x4
	.uleb128 .LVL91-.LVL88
	.uleb128 .LVL92-.LVL88
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL92-.LVL88
	.uleb128 .LVL96-.LVL88
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.byte	0x4
	.uleb128 .LVL96-.LVL88
	.uleb128 .LFE34-.LVL88
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LVUS27:
	.uleb128 .LVU278
	.uleb128 .LVU281
	.uleb128 .LVU307
	.uleb128 0
.LLST27:
	.byte	0x6
	.quad	.LVL89
	.byte	0x4
	.uleb128 .LVL89-.LVL89
	.uleb128 .LVL90-.LVL89
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL96-.LVL89
	.uleb128 .LFE34-.LVL89
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS20:
	.uleb128 0
	.uleb128 .LVU258
	.uleb128 .LVU258
	.uleb128 .LVU264
	.uleb128 .LVU264
	.uleb128 0
.LLST20:
	.byte	0x6
	.quad	.LVL76
	.byte	0x4
	.uleb128 .LVL76-.LVL76
	.uleb128 .LVL81-.LVL76
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL81-.LVL76
	.uleb128 .LVL83-.LVL76
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x11
	.uleb128 0x8a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL83-.LVL76
	.uleb128 .LFE33-.LVL76
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS21:
	.uleb128 0
	.uleb128 .LVU247
	.uleb128 .LVU247
	.uleb128 .LVU264
	.uleb128 .LVU264
	.uleb128 0
.LLST21:
	.byte	0x6
	.quad	.LVL76
	.byte	0x4
	.uleb128 .LVL76-.LVL76
	.uleb128 .LVL79-.LVL76
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL79-.LVL76
	.uleb128 .LVL83-.LVL76
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL83-.LVL76
	.uleb128 .LFE33-.LVL76
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LVUS23:
	.uleb128 .LVU238
	.uleb128 .LVU239
	.uleb128 .LVU264
	.uleb128 .LVU267
	.uleb128 .LVU267
	.uleb128 .LVU269
	.uleb128 .LVU269
	.uleb128 .LVU273
	.uleb128 .LVU273
	.uleb128 .LVU275
	.uleb128 .LVU275
	.uleb128 0
.LLST23:
	.byte	0x6
	.quad	.LVL77
	.byte	0x4
	.uleb128 .LVL77-.LVL77
	.uleb128 .LVL78-.LVL77
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL83-.LVL77
	.uleb128 .LVL84-.LVL77
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL84-.LVL77
	.uleb128 .LVL85-.LVL77
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL85-.LVL77
	.uleb128 .LVL86-.LVL77
	.uleb128 0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL86-.LVL77
	.uleb128 .LVL87-.LVL77
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL87-.LVL77
	.uleb128 .LFE33-.LVL77
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS16:
	.uleb128 0
	.uleb128 .LVU229
	.uleb128 .LVU229
	.uleb128 .LVU235
	.uleb128 .LVU235
	.uleb128 0
.LLST16:
	.byte	0x6
	.quad	.LVL68
	.byte	0x4
	.uleb128 .LVL68-.LVL68
	.uleb128 .LVL73-.LVL68
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL73-.LVL68
	.uleb128 .LVL75-.LVL68
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x11
	.uleb128 0x8a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL75-.LVL68
	.uleb128 .LFE32-.LVL68
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS17:
	.uleb128 0
	.uleb128 .LVU218
	.uleb128 .LVU218
	.uleb128 .LVU235
	.uleb128 .LVU235
	.uleb128 0
.LLST17:
	.byte	0x6
	.quad	.LVL68
	.byte	0x4
	.uleb128 .LVL68-.LVL68
	.uleb128 .LVL71-.LVL68
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL71-.LVL68
	.uleb128 .LVL75-.LVL68
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL75-.LVL68
	.uleb128 .LFE32-.LVL68
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LVUS19:
	.uleb128 .LVU209
	.uleb128 .LVU210
	.uleb128 .LVU235
	.uleb128 0
.LLST19:
	.byte	0x6
	.quad	.LVL69
	.byte	0x4
	.uleb128 .LVL69-.LVL69
	.uleb128 .LVL70-.LVL69
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL75-.LVL69
	.uleb128 .LFE32-.LVL69
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS11:
	.uleb128 0
	.uleb128 .LVU119
	.uleb128 .LVU119
	.uleb128 0
.LLST11:
	.byte	0x6
	.quad	.LVL37
	.byte	0x4
	.uleb128 .LVL37-.LVL37
	.uleb128 .LVL39-.LVL37
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL39-.LVL37
	.uleb128 .LFE31-.LVL37
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LVUS12:
	.uleb128 .LVU120
	.uleb128 .LVU121
	.uleb128 .LVU121
	.uleb128 .LVU123
	.uleb128 .LVU123
	.uleb128 .LVU140
	.uleb128 .LVU206
	.uleb128 0
.LLST12:
	.byte	0x6
	.quad	.LVL40
	.byte	0x4
	.uleb128 .LVL40-.LVL40
	.uleb128 .LVL41-.LVL40
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL41-.LVL40
	.uleb128 .LVL42-.LVL40
	.uleb128 0x3
	.byte	0x7b
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL42-.LVL40
	.uleb128 .LVL43-.LVL40
	.uleb128 0x3
	.byte	0x70
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL67-.LVL40
	.uleb128 .LFE31-.LVL40
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS13:
	.uleb128 .LVU142
	.uleb128 .LVU146
	.uleb128 .LVU146
	.uleb128 .LVU149
	.uleb128 .LVU149
	.uleb128 .LVU151
	.uleb128 .LVU151
	.uleb128 .LVU154
	.uleb128 .LVU154
	.uleb128 .LVU156
	.uleb128 .LVU156
	.uleb128 .LVU159
	.uleb128 .LVU161
	.uleb128 .LVU164
	.uleb128 .LVU166
	.uleb128 .LVU169
	.uleb128 .LVU171
	.uleb128 .LVU174
	.uleb128 .LVU176
	.uleb128 .LVU179
	.uleb128 .LVU181
	.uleb128 .LVU186
	.uleb128 .LVU188
	.uleb128 .LVU206
.LLST13:
	.byte	0x6
	.quad	.LVL44
	.byte	0x4
	.uleb128 .LVL44-.LVL44
	.uleb128 .LVL45-.LVL44
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x4
	.uleb128 .LVL45-.LVL44
	.uleb128 .LVL46-.LVL44
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL46-.LVL44
	.uleb128 .LVL47-.LVL44
	.uleb128 0x29
	.byte	0x91
	.sleb128 -224
	.byte	0xa6
	.byte	0x4
	.uleb128 0x8a
	.byte	0xa4
	.uleb128 0x8a
	.byte	0x4
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -220
	.byte	0xa6
	.byte	0x4
	.uleb128 0x8a
	.byte	0x22
	.byte	0x91
	.sleb128 -216
	.byte	0xa6
	.byte	0x4
	.uleb128 0x8a
	.byte	0x22
	.byte	0x91
	.sleb128 -212
	.byte	0xa6
	.byte	0x4
	.uleb128 0x8a
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL47-.LVL44
	.uleb128 .LVL48-.LVL44
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL48-.LVL44
	.uleb128 .LVL49-.LVL44
	.uleb128 0x49
	.byte	0x91
	.sleb128 -224
	.byte	0xa6
	.byte	0x4
	.uleb128 0x8a
	.byte	0xa4
	.uleb128 0x8a
	.byte	0x4
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -220
	.byte	0xa6
	.byte	0x4
	.uleb128 0x8a
	.byte	0x22
	.byte	0x91
	.sleb128 -216
	.byte	0xa6
	.byte	0x4
	.uleb128 0x8a
	.byte	0x22
	.byte	0x91
	.sleb128 -212
	.byte	0xa6
	.byte	0x4
	.uleb128 0x8a
	.byte	0x22
	.byte	0x91
	.sleb128 -208
	.byte	0xa6
	.byte	0x4
	.uleb128 0x8a
	.byte	0x22
	.byte	0x91
	.sleb128 -204
	.byte	0xa6
	.byte	0x4
	.uleb128 0x8a
	.byte	0x22
	.byte	0x91
	.sleb128 -200
	.byte	0xa6
	.byte	0x4
	.uleb128 0x8a
	.byte	0x22
	.byte	0x91
	.sleb128 -196
	.byte	0xa6
	.byte	0x4
	.uleb128 0x8a
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL49-.LVL44
	.uleb128 .LVL50-.LVL44
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL51-.LVL44
	.uleb128 .LVL52-.LVL44
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL53-.LVL44
	.uleb128 .LVL54-.LVL44
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL55-.LVL44
	.uleb128 .LVL56-.LVL44
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL57-.LVL44
	.uleb128 .LVL58-.LVL44
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL59-.LVL44
	.uleb128 .LVL61-.LVL44
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL62-.LVL44
	.uleb128 .LVL67-.LVL44
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS15:
	.uleb128 .LVU142
	.uleb128 .LVU144
.LLST15:
	.byte	0x8
	.quad	.LVL44
	.uleb128 .LVL44-.LVL44
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS8:
	.uleb128 .LVU97
	.uleb128 .LVU111
	.uleb128 .LVU113
	.uleb128 0
.LLST8:
	.byte	0x6
	.quad	.LVL30
	.byte	0x4
	.uleb128 .LVL30-.LVL30
	.uleb128 .LVL35-.LVL30
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x4
	.uleb128 .LVL36-.LVL30
	.uleb128 .LFE30-.LVL30
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0
.LVUS10:
	.uleb128 .LVU98
	.uleb128 .LVU99
	.uleb128 .LVU113
	.uleb128 0
.LLST10:
	.byte	0x6
	.quad	.LVL31
	.byte	0x4
	.uleb128 .LVL31-.LVL31
	.uleb128 .LVL32-.LVL31
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL36-.LVL31
	.uleb128 .LFE30-.LVL31
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS3:
	.uleb128 0
	.uleb128 .LVU36
	.uleb128 .LVU36
	.uleb128 .LVU93
	.uleb128 .LVU93
	.uleb128 .LVU94
	.uleb128 .LVU94
	.uleb128 0
.LLST3:
	.byte	0x6
	.quad	.LVL10
	.byte	0x4
	.uleb128 .LVL10-.LVL10
	.uleb128 .LVL13-.LVL10
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL13-.LVL10
	.uleb128 .LVL27-.LVL10
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL27-.LVL10
	.uleb128 .LVL28-.LVL10
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL28-.LVL10
	.uleb128 .LFE29-.LVL10
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LVUS4:
	.uleb128 .LVU35
	.uleb128 .LVU37
	.uleb128 .LVU93
	.uleb128 0
.LLST4:
	.byte	0x6
	.quad	.LVL12
	.byte	0x4
	.uleb128 .LVL12-.LVL12
	.uleb128 .LVL14-.LVL12
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL27-.LVL12
	.uleb128 .LFE29-.LVL12
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS5:
	.uleb128 .LVU59
	.uleb128 .LVU63
	.uleb128 .LVU63
	.uleb128 .LVU66
	.uleb128 .LVU66
	.uleb128 .LVU68
	.uleb128 .LVU68
	.uleb128 .LVU73
	.uleb128 .LVU75
	.uleb128 .LVU93
.LLST5:
	.byte	0x6
	.quad	.LVL16
	.byte	0x4
	.uleb128 .LVL16-.LVL16
	.uleb128 .LVL17-.LVL16
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x4
	.uleb128 .LVL17-.LVL16
	.uleb128 .LVL18-.LVL16
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL18-.LVL16
	.uleb128 .LVL19-.LVL16
	.uleb128 0x25
	.byte	0x91
	.sleb128 -64
	.byte	0xa6
	.byte	0x4
	.uleb128 0x8a
	.byte	0xa4
	.uleb128 0x8a
	.byte	0x4
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -60
	.byte	0xa6
	.byte	0x4
	.uleb128 0x8a
	.byte	0x22
	.byte	0x91
	.sleb128 -56
	.byte	0xa6
	.byte	0x4
	.uleb128 0x8a
	.byte	0x22
	.byte	0x91
	.sleb128 -52
	.byte	0xa6
	.byte	0x4
	.uleb128 0x8a
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL19-.LVL16
	.uleb128 .LVL21-.LVL16
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL22-.LVL16
	.uleb128 .LVL27-.LVL16
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS6:
	.uleb128 .LVU37
	.uleb128 .LVU43
	.uleb128 .LVU43
	.uleb128 .LVU45
	.uleb128 .LVU45
	.uleb128 .LVU47
	.uleb128 .LVU47
	.uleb128 .LVU49
	.uleb128 .LVU49
	.uleb128 .LVU51
	.uleb128 .LVU51
	.uleb128 .LVU53
	.uleb128 .LVU53
	.uleb128 .LVU55
	.uleb128 .LVU55
	.uleb128 .LVU57
	.uleb128 .LVU57
	.uleb128 .LVU59
.LLST6:
	.byte	0x6
	.quad	.LVL14
	.byte	0x4
	.uleb128 .LVL14-.LVL14
	.uleb128 .LVL15-.LVL14
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL15-.LVL14
	.uleb128 .LVL15-.LVL14
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL15-.LVL14
	.uleb128 .LVL15-.LVL14
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL15-.LVL14
	.uleb128 .LVL15-.LVL14
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL15-.LVL14
	.uleb128 .LVL15-.LVL14
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL15-.LVL14
	.uleb128 .LVL15-.LVL14
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL15-.LVL14
	.uleb128 .LVL15-.LVL14
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL15-.LVL14
	.uleb128 .LVL15-.LVL14
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL15-.LVL14
	.uleb128 .LVL16-.LVL14
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0
.LVUS7:
	.uleb128 .LVU59
	.uleb128 .LVU61
.LLST7:
	.byte	0x8
	.quad	.LVL16
	.uleb128 .LVL16-.LVL16
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS0:
	.uleb128 .LVU2
	.uleb128 .LVU4
	.uleb128 .LVU4
	.uleb128 .LVU5
	.uleb128 .LVU7
	.uleb128 .LVU26
	.uleb128 .LVU26
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
	.uleb128 .LVL3-.LVL1
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL4-.LVL1
	.uleb128 .LVL9-.LVL1
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL9-.LVL1
	.uleb128 .LFE28-.LVL1
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0
.LVUS2:
	.uleb128 .LVU2
	.uleb128 .LVU4
	.uleb128 .LVU26
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
	.uleb128 .LVL9-.LVL1
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
	.byte	0x4
	.uleb128 .LBB4-.LBB2
	.uleb128 .LBE4-.LBB2
	.byte	0
.LLRL9:
	.byte	0x5
	.quad	.LBB8
	.byte	0x4
	.uleb128 .LBB8-.LBB8
	.uleb128 .LBE8-.LBB8
	.byte	0x4
	.uleb128 .LBB11-.LBB8
	.uleb128 .LBE11-.LBB8
	.byte	0
.LLRL14:
	.byte	0x5
	.quad	.LBB13
	.byte	0x4
	.uleb128 .LBB13-.LBB13
	.uleb128 .LBE13-.LBB13
	.byte	0x4
	.uleb128 .LBB16-.LBB13
	.uleb128 .LBE16-.LBB13
	.byte	0
.LLRL18:
	.byte	0x5
	.quad	.LBB18
	.byte	0x4
	.uleb128 .LBB18-.LBB18
	.uleb128 .LBE18-.LBB18
	.byte	0x4
	.uleb128 .LBB19-.LBB18
	.uleb128 .LBE19-.LBB18
	.byte	0
.LLRL22:
	.byte	0x5
	.quad	.LBB20
	.byte	0x4
	.uleb128 .LBB20-.LBB20
	.uleb128 .LBE20-.LBB20
	.byte	0x4
	.uleb128 .LBB21-.LBB20
	.uleb128 .LBE21-.LBB20
	.byte	0x4
	.uleb128 .LBB22-.LBB20
	.uleb128 .LBE22-.LBB20
	.byte	0
.LLRL26:
	.byte	0x5
	.quad	.LBB23
	.byte	0x4
	.uleb128 .LBB23-.LBB23
	.uleb128 .LBE23-.LBB23
	.byte	0x4
	.uleb128 .LBB24-.LBB23
	.uleb128 .LBE24-.LBB23
	.byte	0x4
	.uleb128 .LBB25-.LBB23
	.uleb128 .LBE25-.LBB23
	.byte	0
.LLRL29:
	.byte	0x5
	.quad	.LBB26
	.byte	0x4
	.uleb128 .LBB26-.LBB26
	.uleb128 .LBE26-.LBB26
	.byte	0x4
	.uleb128 .LBB27-.LBB26
	.uleb128 .LBE27-.LBB26
	.byte	0
.LLRL35:
	.byte	0x5
	.quad	.LBB29
	.byte	0x4
	.uleb128 .LBB29-.LBB29
	.uleb128 .LBE29-.LBB29
	.byte	0x4
	.uleb128 .LBB30-.LBB29
	.uleb128 .LBE30-.LBB29
	.byte	0x4
	.uleb128 .LBB31-.LBB29
	.uleb128 .LBE31-.LBB29
	.byte	0
.LLRL46:
	.byte	0x5
	.quad	.LBB35
	.byte	0x4
	.uleb128 .LBB35-.LBB35
	.uleb128 .LBE35-.LBB35
	.byte	0x4
	.uleb128 .LBB38-.LBB35
	.uleb128 .LBE38-.LBB35
	.byte	0
.LLRL53:
	.byte	0x5
	.quad	.LBB40
	.byte	0x4
	.uleb128 .LBB40-.LBB40
	.uleb128 .LBE40-.LBB40
	.byte	0x4
	.uleb128 .LBB43-.LBB40
	.uleb128 .LBE43-.LBB40
	.byte	0
.LLRL57:
	.byte	0x5
	.quad	.LBB45
	.byte	0x4
	.uleb128 .LBB45-.LBB45
	.uleb128 .LBE45-.LBB45
	.byte	0x4
	.uleb128 .LBB46-.LBB45
	.uleb128 .LBE46-.LBB45
	.byte	0
.LLRL61:
	.byte	0x5
	.quad	.LBB47
	.byte	0x4
	.uleb128 .LBB47-.LBB47
	.uleb128 .LBE47-.LBB47
	.byte	0x4
	.uleb128 .LBB48-.LBB47
	.uleb128 .LBE48-.LBB47
	.byte	0x4
	.uleb128 .LBB49-.LBB47
	.uleb128 .LBE49-.LBB47
	.byte	0
.LLRL66:
	.byte	0x5
	.quad	.LBB50
	.byte	0x4
	.uleb128 .LBB50-.LBB50
	.uleb128 .LBE50-.LBB50
	.byte	0x4
	.uleb128 .LBB51-.LBB50
	.uleb128 .LBE51-.LBB50
	.byte	0x4
	.uleb128 .LBB52-.LBB50
	.uleb128 .LBE52-.LBB50
	.byte	0
.LLRL69:
	.byte	0x5
	.quad	.LBB53
	.byte	0x4
	.uleb128 .LBB53-.LBB53
	.uleb128 .LBE53-.LBB53
	.byte	0x4
	.uleb128 .LBB54-.LBB53
	.uleb128 .LBE54-.LBB53
	.byte	0
.LLRL75:
	.byte	0x5
	.quad	.LBB56
	.byte	0x4
	.uleb128 .LBB56-.LBB56
	.uleb128 .LBE56-.LBB56
	.byte	0x4
	.uleb128 .LBB57-.LBB56
	.uleb128 .LBE57-.LBB56
	.byte	0
.LLRL84:
	.byte	0x5
	.quad	.LBB61
	.byte	0x4
	.uleb128 .LBB61-.LBB61
	.uleb128 .LBE61-.LBB61
	.byte	0x4
	.uleb128 .LBB64-.LBB61
	.uleb128 .LBE64-.LBB61
	.byte	0
.LLRL90:
	.byte	0x5
	.quad	.LBB66
	.byte	0x4
	.uleb128 .LBB66-.LBB66
	.uleb128 .LBE66-.LBB66
	.byte	0x4
	.uleb128 .LBB70-.LBB66
	.uleb128 .LBE70-.LBB66
	.byte	0x4
	.uleb128 .LBB71-.LBB66
	.uleb128 .LBE71-.LBB66
	.byte	0
.LLRL94:
	.byte	0x5
	.quad	.LBB73
	.byte	0x4
	.uleb128 .LBB73-.LBB73
	.uleb128 .LBE73-.LBB73
	.byte	0x4
	.uleb128 .LBB74-.LBB73
	.uleb128 .LBE74-.LBB73
	.byte	0x4
	.uleb128 .LBB75-.LBB73
	.uleb128 .LBE75-.LBB73
	.byte	0
.LLRL97:
	.byte	0x5
	.quad	.LBB76
	.byte	0x4
	.uleb128 .LBB76-.LBB76
	.uleb128 .LBE76-.LBB76
	.byte	0x4
	.uleb128 .LBB77-.LBB76
	.uleb128 .LBE77-.LBB76
	.byte	0x4
	.uleb128 .LBB78-.LBB76
	.uleb128 .LBE78-.LBB76
	.byte	0
.LLRL101:
	.byte	0x5
	.quad	.LBB79
	.byte	0x4
	.uleb128 .LBB79-.LBB79
	.uleb128 .LBE79-.LBB79
	.byte	0x4
	.uleb128 .LBB80-.LBB79
	.uleb128 .LBE80-.LBB79
	.byte	0x4
	.uleb128 .LBB81-.LBB79
	.uleb128 .LBE81-.LBB79
	.byte	0
.LLRL103:
	.byte	0x5
	.quad	.LBB82
	.byte	0x4
	.uleb128 .LBB82-.LBB82
	.uleb128 .LBE82-.LBB82
	.byte	0x4
	.uleb128 .LBB83-.LBB82
	.uleb128 .LBE83-.LBB82
	.byte	0
.LLRL113:
	.byte	0x5
	.quad	.LBB85
	.byte	0x4
	.uleb128 .LBB85-.LBB85
	.uleb128 .LBE85-.LBB85
	.byte	0x4
	.uleb128 .LBB86-.LBB85
	.uleb128 .LBE86-.LBB85
	.byte	0x4
	.uleb128 .LBB87-.LBB85
	.uleb128 .LBE87-.LBB85
	.byte	0x4
	.uleb128 .LBB91-.LBB85
	.uleb128 .LBE91-.LBB85
	.byte	0x4
	.uleb128 .LBB93-.LBB85
	.uleb128 .LBE93-.LBB85
	.byte	0x4
	.uleb128 .LBB94-.LBB85
	.uleb128 .LBE94-.LBB85
	.byte	0
.LLRL115:
	.byte	0x5
	.quad	.LBB88
	.byte	0x4
	.uleb128 .LBB88-.LBB88
	.uleb128 .LBE88-.LBB88
	.byte	0x4
	.uleb128 .LBB92-.LBB88
	.uleb128 .LBE92-.LBB88
	.byte	0x4
	.uleb128 .LBB95-.LBB88
	.uleb128 .LBE95-.LBB88
	.byte	0
.LLRL117:
	.byte	0x5
	.quad	.LBB89
	.byte	0x4
	.uleb128 .LBB89-.LBB89
	.uleb128 .LBE89-.LBB89
	.byte	0x4
	.uleb128 .LBB90-.LBB89
	.uleb128 .LBE90-.LBB89
	.byte	0
.LLRL119:
	.byte	0x5
	.quad	.LBB96
	.byte	0x4
	.uleb128 .LBB96-.LBB96
	.uleb128 .LBE96-.LBB96
	.byte	0x4
	.uleb128 .LBB98-.LBB96
	.uleb128 .LBE98-.LBB96
	.byte	0
.LLRL121:
	.byte	0x5
	.quad	.LBB97
	.byte	0x4
	.uleb128 .LBB97-.LBB97
	.uleb128 .LBE97-.LBB97
	.byte	0x4
	.uleb128 .LBB99-.LBB97
	.uleb128 .LBE99-.LBB97
	.byte	0x4
	.uleb128 .LBB100-.LBB97
	.uleb128 .LBE100-.LBB97
	.byte	0x4
	.uleb128 .LBB101-.LBB97
	.uleb128 .LBE101-.LBB97
	.byte	0x4
	.uleb128 .LBB102-.LBB97
	.uleb128 .LBE102-.LBB97
	.byte	0
.LLRL129:
	.byte	0x5
	.quad	.LBB103
	.byte	0x4
	.uleb128 .LBB103-.LBB103
	.uleb128 .LBE103-.LBB103
	.byte	0x4
	.uleb128 .LBB104-.LBB103
	.uleb128 .LBE104-.LBB103
	.byte	0x4
	.uleb128 .LBB105-.LBB103
	.uleb128 .LBE105-.LBB103
	.byte	0x4
	.uleb128 .LBB106-.LBB103
	.uleb128 .LBE106-.LBB103
	.byte	0x4
	.uleb128 .LBB110-.LBB103
	.uleb128 .LBE110-.LBB103
	.byte	0
.LLRL131:
	.byte	0x5
	.quad	.LBB107
	.byte	0x4
	.uleb128 .LBB107-.LBB107
	.uleb128 .LBE107-.LBB107
	.byte	0x4
	.uleb128 .LBB111-.LBB107
	.uleb128 .LBE111-.LBB107
	.byte	0
.LLRL133:
	.byte	0x5
	.quad	.LBB108
	.byte	0x4
	.uleb128 .LBB108-.LBB108
	.uleb128 .LBE108-.LBB108
	.byte	0x4
	.uleb128 .LBB109-.LBB108
	.uleb128 .LBE109-.LBB108
	.byte	0
.LLRL135:
	.byte	0x5
	.quad	.LBB112
	.byte	0x4
	.uleb128 .LBB112-.LBB112
	.uleb128 .LBE112-.LBB112
	.byte	0x4
	.uleb128 .LBB113-.LBB112
	.uleb128 .LBE113-.LBB112
	.byte	0x4
	.uleb128 .LBB115-.LBB112
	.uleb128 .LBE115-.LBB112
	.byte	0x4
	.uleb128 .LBB116-.LBB112
	.uleb128 .LBE116-.LBB112
	.byte	0x4
	.uleb128 .LBB117-.LBB112
	.uleb128 .LBE117-.LBB112
	.byte	0x4
	.uleb128 .LBB118-.LBB112
	.uleb128 .LBE118-.LBB112
	.byte	0x4
	.uleb128 .LBB119-.LBB112
	.uleb128 .LBE119-.LBB112
	.byte	0
.LLRL137:
	.byte	0x5
	.quad	.LBB114
	.byte	0x4
	.uleb128 .LBB114-.LBB114
	.uleb128 .LBE114-.LBB114
	.byte	0x4
	.uleb128 .LBB120-.LBB114
	.uleb128 .LBE120-.LBB114
	.byte	0
.LLRL139:
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
