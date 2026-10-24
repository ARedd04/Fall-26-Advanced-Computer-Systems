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
	vxorps	xmm0, xmm0, xmm0
	shr	r9, 2
	sal	r9, 4
.LVL2:
	.p2align 4
	.p2align 3
.L4:
.LBB3:
	.loc 1 16 46 discriminator 3 view .LVU4
	vmovups	xmm3, XMMWORD PTR [rcx+rax]
	vmulps	xmm1, xmm3, XMMWORD PTR [rdx+rax]
	add	rax, 16
	vaddss	xmm0, xmm0, xmm1
.LVL3:
	.loc 1 16 46 discriminator 3 view .LVU5
	vshufps	xmm2, xmm1, xmm1, 85
	vaddss	xmm0, xmm0, xmm2
	vunpckhps	xmm2, xmm1, xmm1
	.loc 1 16 38 discriminator 3 view .LVU6
	vshufps	xmm1, xmm1, xmm1, 255
	vaddss	xmm0, xmm0, xmm2
	vaddss	xmm0, xmm0, xmm1
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
	.loc 1 16 38 is_stmt 0 discriminator 3 view .LVU9
	vmovss	xmm4, DWORD PTR [rcx+rax*4]
	.loc 1 16 5 discriminator 3 view .LVU10
	lea	r10, 1[rax]
	.loc 1 16 42 discriminator 3 view .LVU11
	lea	r9, 0[0+rax*4]
	.loc 1 16 38 discriminator 3 view .LVU12
	vfmadd231ss	xmm0, xmm4, DWORD PTR [rdx+rax*4]
.LVL6:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU13
	.loc 1 16 26 discriminator 1 view .LVU14
	cmp	r10, r8
	jnb	.L1
	.loc 1 16 38 is_stmt 0 discriminator 3 view .LVU15
	vmovss	xmm5, DWORD PTR 4[rcx+r9]
	.loc 1 16 5 discriminator 3 view .LVU16
	add	rax, 2
	.loc 1 16 38 discriminator 3 view .LVU17
	vfmadd231ss	xmm0, xmm5, DWORD PTR 4[rdx+r9]
.LVL7:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU18
	.loc 1 16 26 discriminator 1 view .LVU19
	cmp	rax, r8
	jnb	.L1
	.loc 1 16 38 is_stmt 0 discriminator 3 view .LVU20
	vmovss	xmm5, DWORD PTR 8[rdx+r9]
	vfmadd231ss	xmm0, xmm5, DWORD PTR 8[rcx+r9]
.LVL8:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU21
	.loc 1 16 26 discriminator 1 view .LVU22
.L1:
	.loc 1 16 26 is_stmt 0 discriminator 1 view .LVU23
.LBE3:
	.loc 1 18 1 view .LVU24
	ret
.LVL9:
	.p2align 4
	.p2align 3
.L7:
	.loc 1 15 7 view .LVU25
	vxorps	xmm0, xmm0, xmm0
	.loc 1 18 1 view .LVU26
	ret
.L8:
.LBB4:
	.loc 1 16 17 view .LVU27
	xor	eax, eax
.LBE4:
	.loc 1 15 7 view .LVU28
	vxorps	xmm0, xmm0, xmm0
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
	.loc 1 26 12 is_stmt 0 view .LVU30
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
	.loc 1 28 7 view .LVU31
	vpxor	xmm0, xmm0, xmm0
	vextracti128	XMMWORD PTR 16[rsp], ymm0, 0x1
.LVL12:
.LBB5:
	.loc 1 30 18 is_stmt 1 discriminator 1 view .LVU32
.LBE5:
	.loc 1 26 12 is_stmt 0 view .LVU33
	mov	rax, rcx
	.loc 1 28 7 view .LVU34
	vmovdqu	XMMWORD PTR [rsp], xmm0
.LBB7:
	.loc 1 30 18 discriminator 1 view .LVU35
	cmp	r8, 7
	jbe	.L28
	lea	rcx, -8[r8]
.LVL13:
	.loc 1 30 18 discriminator 1 view .LVU36
	vxorps	xmm0, xmm0, xmm0
	xor	r9d, r9d
	xor	r10d, r10d
	mov	r11, rcx
	vmovaps	xmm1, xmm0
	shr	r11, 3
	inc	r11
.LVL14:
	.p2align 4
	.p2align 3
.L18:
.LBB6:
	.loc 1 31 30 is_stmt 1 discriminator 1 view .LVU37
	.loc 1 31 47 is_stmt 0 discriminator 3 view .LVU38
	vmovups	xmm3, XMMWORD PTR [rdx+r9]
	vmovups	xmm4, XMMWORD PTR 16[rdx+r9]
	inc	r10
	vfmadd231ps	xmm1, xmm3, XMMWORD PTR [rax+r9]
	vfmadd231ps	xmm0, xmm4, XMMWORD PTR 16[rax+r9]
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU39
.LVL15:
	.loc 1 31 30 discriminator 1 view .LVU40
	.loc 1 31 9 discriminator 3 view .LVU41
	.loc 1 31 30 discriminator 1 view .LVU42
	.loc 1 31 9 discriminator 3 view .LVU43
	.loc 1 31 30 discriminator 1 view .LVU44
	.loc 1 31 9 discriminator 3 view .LVU45
	.loc 1 31 30 discriminator 1 view .LVU46
	.loc 1 31 9 discriminator 3 view .LVU47
	.loc 1 31 30 discriminator 1 view .LVU48
	.loc 1 31 9 discriminator 3 view .LVU49
	.loc 1 31 30 discriminator 1 view .LVU50
	.loc 1 31 9 discriminator 3 view .LVU51
	.loc 1 31 30 discriminator 1 view .LVU52
	.loc 1 31 9 discriminator 3 view .LVU53
	.loc 1 31 30 discriminator 1 view .LVU54
.LBE6:
	.loc 1 30 18 discriminator 1 view .LVU55
	add	r9, 32
	cmp	r10, r11
	jb	.L18
	and	rcx, -8
	vmovups	XMMWORD PTR [rsp], xmm1
	vmovups	XMMWORD PTR 16[rsp], xmm0
	add	rcx, 8
.LVL16:
.L19:
	.loc 1 30 18 is_stmt 0 discriminator 1 view .LVU56
.LBE7:
.LBB8:
	.loc 1 34 26 is_stmt 1 discriminator 1 view .LVU57
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU58
	vxorps	xmm0, xmm0, xmm0
	vaddss	xmm0, xmm0, DWORD PTR [rsp]
	vaddss	xmm0, xmm0, DWORD PTR 4[rsp]
	.loc 1 34 38 discriminator 3 view .LVU59
	vaddss	xmm0, xmm0, DWORD PTR 8[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 12[rsp]
.LVL17:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU60
	.loc 1 34 26 discriminator 1 view .LVU61
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU62
	vaddss	xmm0, xmm0, DWORD PTR 16[rsp]
.LVL18:
	.loc 1 34 26 discriminator 1 view .LVU63
	vaddss	xmm0, xmm0, DWORD PTR 20[rsp]
	.loc 1 34 38 discriminator 3 view .LVU64
	vaddss	xmm0, xmm0, DWORD PTR 24[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 28[rsp]
.LVL19:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU65
	.loc 1 34 26 discriminator 1 view .LVU66
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU67
.LBE8:
	.loc 1 35 14 is_stmt 1 discriminator 1 view .LVU68
	cmp	rcx, r8
	jnb	.L14
	mov	rsi, r8
	sub	rsi, rcx
	lea	r9, -1[rsi]
	cmp	r9, 2
	jbe	.L20
	mov	r11, rsi
	lea	r10, 0[0+rcx*4]
	xor	r9d, r9d
	shr	r11, 2
	lea	rbx, [rax+r10]
	add	r10, rdx
	sal	r11, 4
.LVL20:
	.p2align 4
	.p2align 3
.L21:
	.loc 1 35 34 is_stmt 0 discriminator 2 view .LVU69
	vmovups	xmm5, XMMWORD PTR [r10+r9]
	vmulps	xmm1, xmm5, XMMWORD PTR [rbx+r9]
	add	r9, 16
	vaddss	xmm0, xmm0, xmm1
.LVL21:
	.loc 1 35 34 discriminator 2 view .LVU70
	vshufps	xmm2, xmm1, xmm1, 85
	vaddss	xmm2, xmm2, xmm0
	vunpckhps	xmm0, xmm1, xmm1
	.loc 1 35 26 discriminator 2 view .LVU71
	vshufps	xmm1, xmm1, xmm1, 255
	vaddss	xmm0, xmm0, xmm2
	vaddss	xmm0, xmm0, xmm1
.LVL22:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU72
	.loc 1 35 14 discriminator 1 view .LVU73
	cmp	r11, r9
	jne	.L21
	test	sil, 3
	je	.L14
	and	rsi, -4
	add	rcx, rsi
.L20:
.LVL23:
	.loc 1 35 26 is_stmt 0 discriminator 2 view .LVU74
	vmovss	xmm5, DWORD PTR [rdx+rcx*4]
	.loc 1 35 5 discriminator 2 view .LVU75
	lea	r10, 1[rcx]
	.loc 1 35 30 discriminator 2 view .LVU76
	lea	r9, 0[0+rcx*4]
	.loc 1 35 26 discriminator 2 view .LVU77
	vfmadd231ss	xmm0, xmm5, DWORD PTR [rax+rcx*4]
.LVL24:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU78
	.loc 1 35 14 discriminator 1 view .LVU79
	cmp	r10, r8
	jnb	.L14
	.loc 1 35 26 is_stmt 0 discriminator 2 view .LVU80
	vmovss	xmm5, DWORD PTR 4[rax+r9]
	.loc 1 35 5 discriminator 2 view .LVU81
	add	rcx, 2
	.loc 1 35 26 discriminator 2 view .LVU82
	vfmadd231ss	xmm0, xmm5, DWORD PTR 4[rdx+r9]
.LVL25:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU83
	.loc 1 35 14 discriminator 1 view .LVU84
	cmp	rcx, r8
	jnb	.L14
	.loc 1 35 26 is_stmt 0 discriminator 2 view .LVU85
	vmovss	xmm5, DWORD PTR 8[rdx+r9]
	vfmadd231ss	xmm0, xmm5, DWORD PTR 8[rax+r9]
.LVL26:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU86
	.loc 1 35 14 discriminator 1 view .LVU87
.L14:
	.loc 1 35 14 is_stmt 0 discriminator 1 view .LVU88
	vzeroupper
.LVL27:
	.loc 1 37 1 view .LVU89
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
.LVL28:
.L28:
	.cfi_restore_state
	.loc 1 29 12 view .LVU90
	xor	ecx, ecx
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
	.loc 1 45 12 is_stmt 0 view .LVU92
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
.LVL30:
.LBB9:
.LBB10:
	.loc 1 47 9 view .LVU93
	vpxor	xmm0, xmm0, xmm0
	vmovdqu	XMMWORD PTR [rsp], xmm0
.LVL31:
	.loc 1 47 9 view .LVU94
	test	r8, r8
	je	.L30
	cmp	r8, 3
	jbe	.L35
	mov	r9, r8
	xor	eax, eax
	vxorps	xmm1, xmm1, xmm1
	shr	r9, 2
	sal	r9, 4
.LVL32:
	.p2align 4
	.p2align 3
.L32:
	.loc 1 48 46 view .LVU95
	vmovups	xmm2, XMMWORD PTR [rcx+rax]
	vmulps	xmm0, xmm2, XMMWORD PTR [rdx+rax]
	add	rax, 16
	.loc 1 48 38 view .LVU96
	vaddps	xmm1, xmm1, xmm0
	cmp	r9, rax
	jne	.L32
	mov	rax, r8
	vmovups	XMMWORD PTR [rsp], xmm1
	and	rax, -4
	test	r8b, 3
	je	.L30
.L31:
.LVL33:
	.loc 1 48 38 view .LVU97
	vmovss	xmm3, DWORD PTR [rsp]
	vmovss	xmm0, DWORD PTR [rcx+rax*4]
	lea	r10, 1[rax]
	.loc 1 48 42 view .LVU98
	lea	r9, 0[0+rax*4]
	.loc 1 48 38 view .LVU99
	vfmadd132ss	xmm0, xmm3, DWORD PTR [rdx+rax*4]
	vmovss	DWORD PTR [rsp], xmm0
	.loc 1 48 38 view .LVU100
	cmp	r10, r8
	jnb	.L30
	.loc 1 48 38 view .LVU101
	vmovss	xmm4, DWORD PTR 4[rcx+r9]
	add	rax, 2
	vfmadd231ss	xmm0, xmm4, DWORD PTR 4[rdx+r9]
	vmovss	DWORD PTR [rsp], xmm0
	.loc 1 48 38 view .LVU102
	cmp	rax, r8
	jnb	.L30
	.loc 1 48 38 view .LVU103
	vmovss	xmm5, DWORD PTR 8[rcx+r9]
	vfmadd231ss	xmm0, xmm5, DWORD PTR 8[rdx+r9]
	vmovss	DWORD PTR [rsp], xmm0
.LVL34:
.L30:
	.loc 1 48 38 view .LVU104
	vxorps	xmm0, xmm0, xmm0
	vaddss	xmm0, xmm0, DWORD PTR [rsp]
	vaddss	xmm0, xmm0, DWORD PTR 4[rsp]
.LVL35:
	.loc 1 47 9 view .LVU105
	vaddss	xmm0, xmm0, DWORD PTR 8[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 12[rsp]
.LBE10:
.LBE9:
	.loc 1 50 1 view .LVU106
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL36:
.L35:
	.cfi_restore_state
.LBB12:
.LBB11:
	.loc 1 47 9 view .LVU107
	xor	eax, eax
	jmp	.L31
.LBE11:
.LBE12:
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
	.loc 1 58 12 is_stmt 0 view .LVU109
	push	rsi
	.seh_pushreg	rsi
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 184
	.seh_stackalloc	184
	.cfi_def_cfa_offset 208
	vmovups	XMMWORD PTR 128[rsp], xmm6
	.seh_savexmm	xmm6, 128
	vmovups	XMMWORD PTR 144[rsp], xmm7
	.seh_savexmm	xmm7, 144
	vmovups	XMMWORD PTR 160[rsp], xmm8
	.seh_savexmm	xmm8, 160
	.cfi_offset 23, -80
	.cfi_offset 24, -64
	.cfi_offset 25, -48
	.seh_endprologue
.LVL38:
	.loc 1 60 7 view .LVU110
	vpxor	xmm0, xmm0, xmm0
	vextracti128	XMMWORD PTR 16[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 32[rsp], ymm0, 0x1
	vmovdqu	XMMWORD PTR [rsp], xmm0
	vextracti128	XMMWORD PTR 48[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 64[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 80[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 96[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 112[rsp], ymm0, 0x1
.LVL39:
.LBB13:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU111
	cmp	r8, 31
	jbe	.L53
	mov	r10, rcx
	mov	r9, rdx
	mov	r11d, 32
	vxorps	xmm6, xmm6, xmm6
	vmovaps	xmm4, xmm6
	vmovaps	xmm3, xmm6
	vmovaps	xmm1, xmm6
	vmovaps	xmm0, xmm6
	vmovaps	xmm7, xmm6
	vmovaps	xmm5, xmm6
	vmovaps	xmm2, xmm6
.LVL40:
	.p2align 4
	.p2align 3
.L46:
.LBB14:
.LBB15:
	.loc 1 64 47 is_stmt 0 view .LVU112
	vmovups	xmm8, XMMWORD PTR [r10]
	mov	rax, r11
.LBE15:
.LBE14:
	.loc 1 62 18 discriminator 1 view .LVU113
	lea	r11, 32[r11]
.LVL41:
	.loc 1 62 18 discriminator 1 view .LVU114
	sub	r10, -128
.LBB18:
.LBB16:
	.loc 1 64 47 view .LVU115
	vfmadd231ps	xmm2, xmm8, XMMWORD PTR [r9]
	vmovups	xmm8, XMMWORD PTR -112[r10]
.LBE16:
.LBE18:
	.loc 1 62 18 discriminator 1 view .LVU116
	sub	r9, -128
.LBB19:
.LBB17:
	.loc 1 64 47 view .LVU117
	vfmadd231ps	xmm5, xmm8, XMMWORD PTR -112[r9]
	vmovups	xmm8, XMMWORD PTR -96[r10]
	vfmadd231ps	xmm7, xmm8, XMMWORD PTR -96[r9]
	vmovups	xmm8, XMMWORD PTR -80[r10]
	vfmadd231ps	xmm0, xmm8, XMMWORD PTR -80[r9]
	vmovups	xmm8, XMMWORD PTR -64[r10]
	vfmadd231ps	xmm1, xmm8, XMMWORD PTR -64[r9]
	vmovups	xmm8, XMMWORD PTR -48[r10]
	vfmadd231ps	xmm3, xmm8, XMMWORD PTR -48[r9]
	vmovups	xmm8, XMMWORD PTR -32[r10]
	vfmadd231ps	xmm4, xmm8, XMMWORD PTR -32[r9]
	vmovups	xmm8, XMMWORD PTR -16[r10]
	vfmadd231ps	xmm6, xmm8, XMMWORD PTR -16[r9]
.LVL42:
	.loc 1 64 47 view .LVU118
.LBE17:
.LBE19:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU119
	cmp	r8, r11
	jnb	.L46
	vmovups	XMMWORD PTR [rsp], xmm2
	vmovups	XMMWORD PTR 16[rsp], xmm5
	vmovups	XMMWORD PTR 32[rsp], xmm7
	vmovups	XMMWORD PTR 48[rsp], xmm0
	vmovups	XMMWORD PTR 64[rsp], xmm1
	vmovups	XMMWORD PTR 80[rsp], xmm3
	vmovups	XMMWORD PTR 96[rsp], xmm4
	vmovups	XMMWORD PTR 112[rsp], xmm6
.L45:
.LVL43:
	.loc 1 62 18 is_stmt 0 discriminator 1 view .LVU120
.LBE13:
.LBB20:
	.loc 1 67 26 is_stmt 1 discriminator 1 view .LVU121
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU122
	vxorps	xmm0, xmm0, xmm0
	vaddss	xmm0, xmm0, DWORD PTR [rsp]
	vaddss	xmm0, xmm0, DWORD PTR 4[rsp]
	.loc 1 67 38 discriminator 3 view .LVU123
	vaddss	xmm0, xmm0, DWORD PTR 8[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 12[rsp]
.LVL44:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU124
	.loc 1 67 26 discriminator 1 view .LVU125
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU126
	vaddss	xmm0, xmm0, DWORD PTR 16[rsp]
.LVL45:
	.loc 1 67 26 discriminator 1 view .LVU127
	vaddss	xmm0, xmm0, DWORD PTR 20[rsp]
	.loc 1 67 38 discriminator 3 view .LVU128
	vaddss	xmm0, xmm0, DWORD PTR 24[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 28[rsp]
.LVL46:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU129
	.loc 1 67 26 discriminator 1 view .LVU130
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU131
	vaddss	xmm0, xmm0, DWORD PTR 32[rsp]
.LVL47:
	.loc 1 67 26 discriminator 1 view .LVU132
	vaddss	xmm0, xmm0, DWORD PTR 36[rsp]
	.loc 1 67 38 discriminator 3 view .LVU133
	vaddss	xmm0, xmm0, DWORD PTR 40[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 44[rsp]
.LVL48:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU134
	.loc 1 67 26 discriminator 1 view .LVU135
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU136
	vaddss	xmm0, xmm0, DWORD PTR 48[rsp]
.LVL49:
	.loc 1 67 26 discriminator 1 view .LVU137
	vaddss	xmm0, xmm0, DWORD PTR 52[rsp]
	.loc 1 67 38 discriminator 3 view .LVU138
	vaddss	xmm0, xmm0, DWORD PTR 56[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 60[rsp]
.LVL50:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU139
	.loc 1 67 26 discriminator 1 view .LVU140
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU141
	vaddss	xmm0, xmm0, DWORD PTR 64[rsp]
.LVL51:
	.loc 1 67 26 discriminator 1 view .LVU142
	vaddss	xmm0, xmm0, DWORD PTR 68[rsp]
	.loc 1 67 38 discriminator 3 view .LVU143
	vaddss	xmm0, xmm0, DWORD PTR 72[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 76[rsp]
.LVL52:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU144
	.loc 1 67 26 discriminator 1 view .LVU145
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU146
	vaddss	xmm0, xmm0, DWORD PTR 80[rsp]
.LVL53:
	.loc 1 67 26 discriminator 1 view .LVU147
	vaddss	xmm0, xmm0, DWORD PTR 84[rsp]
	.loc 1 67 38 discriminator 3 view .LVU148
	vaddss	xmm0, xmm0, DWORD PTR 88[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 92[rsp]
.LVL54:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU149
	.loc 1 67 26 discriminator 1 view .LVU150
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU151
	vaddss	xmm0, xmm0, DWORD PTR 96[rsp]
.LVL55:
	.loc 1 67 26 discriminator 1 view .LVU152
	vaddss	xmm0, xmm0, DWORD PTR 100[rsp]
	.loc 1 67 38 discriminator 3 view .LVU153
	vaddss	xmm0, xmm0, DWORD PTR 104[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 108[rsp]
.LVL56:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU154
	.loc 1 67 26 discriminator 1 view .LVU155
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU156
	vaddss	xmm0, xmm0, DWORD PTR 112[rsp]
.LVL57:
	.loc 1 67 26 discriminator 1 view .LVU157
	vaddss	xmm0, xmm0, DWORD PTR 116[rsp]
	.loc 1 67 38 discriminator 3 view .LVU158
	vaddss	xmm0, xmm0, DWORD PTR 120[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 124[rsp]
.LVL58:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU159
	.loc 1 67 26 discriminator 1 view .LVU160
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU161
.LBE20:
	.loc 1 68 14 is_stmt 1 discriminator 1 view .LVU162
	cmp	rax, r8
	jnb	.L44
	mov	rsi, r8
	sub	rsi, rax
	lea	r9, -1[rsi]
	cmp	r9, 2
	jbe	.L49
	mov	r11, rsi
	lea	r10, 0[0+rax*4]
	xor	r9d, r9d
	shr	r11, 2
	lea	rbx, [rcx+r10]
	add	r10, rdx
	sal	r11, 4
.LVL59:
	.p2align 4
	.p2align 3
.L50:
	.loc 1 68 34 is_stmt 0 discriminator 2 view .LVU163
	vmovups	xmm3, XMMWORD PTR [r10+r9]
	vmulps	xmm1, xmm3, XMMWORD PTR [rbx+r9]
	add	r9, 16
	vaddss	xmm0, xmm1, xmm0
.LVL60:
	.loc 1 68 34 discriminator 2 view .LVU164
	vshufps	xmm2, xmm1, xmm1, 85
	vaddss	xmm2, xmm2, xmm0
	vunpckhps	xmm0, xmm1, xmm1
	.loc 1 68 26 discriminator 2 view .LVU165
	vshufps	xmm1, xmm1, xmm1, 255
	vaddss	xmm0, xmm0, xmm2
	vaddss	xmm0, xmm0, xmm1
.LVL61:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU166
	.loc 1 68 14 discriminator 1 view .LVU167
	cmp	r11, r9
	jne	.L50
	test	sil, 3
	je	.L44
	and	rsi, -4
	add	rax, rsi
.L49:
.LVL62:
	.loc 1 68 26 is_stmt 0 discriminator 2 view .LVU168
	vmovss	xmm4, DWORD PTR [rdx+rax*4]
	.loc 1 68 5 discriminator 2 view .LVU169
	lea	r10, 1[rax]
	.loc 1 68 30 discriminator 2 view .LVU170
	lea	r9, 0[0+rax*4]
	.loc 1 68 26 discriminator 2 view .LVU171
	vfmadd231ss	xmm0, xmm4, DWORD PTR [rcx+rax*4]
.LVL63:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU172
	.loc 1 68 14 discriminator 1 view .LVU173
	cmp	r10, r8
	jnb	.L44
	.loc 1 68 26 is_stmt 0 discriminator 2 view .LVU174
	vmovss	xmm5, DWORD PTR 4[rcx+r9]
	.loc 1 68 5 discriminator 2 view .LVU175
	add	rax, 2
	.loc 1 68 26 discriminator 2 view .LVU176
	vfmadd231ss	xmm0, xmm5, DWORD PTR 4[rdx+r9]
.LVL64:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU177
	.loc 1 68 14 discriminator 1 view .LVU178
	cmp	rax, r8
	jnb	.L44
	.loc 1 68 26 is_stmt 0 discriminator 2 view .LVU179
	vmovss	xmm6, DWORD PTR 8[rdx+r9]
	vfmadd231ss	xmm0, xmm6, DWORD PTR 8[rcx+r9]
.LVL65:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU180
	.loc 1 68 14 discriminator 1 view .LVU181
.L44:
	.loc 1 68 14 is_stmt 0 discriminator 1 view .LVU182
	vzeroupper
.LVL66:
	.loc 1 70 1 view .LVU183
	vmovups	xmm6, XMMWORD PTR 128[rsp]
	vmovups	xmm7, XMMWORD PTR 144[rsp]
	vmovups	xmm8, XMMWORD PTR 160[rsp]
	add	rsp, 184
	.cfi_remember_state
	.cfi_restore 25
	.cfi_restore 24
	.cfi_restore 23
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	pop	rsi
	.cfi_restore 4
	.cfi_def_cfa_offset 8
	ret
.LVL67:
.L53:
	.cfi_restore_state
	.loc 1 61 12 view .LVU184
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
	.loc 1 76 15 is_stmt 0 view .LVU186
	.seh_endprologue
.LVL69:
.LBB21:
	.loc 1 77 26 is_stmt 1 discriminator 1 view .LVU187
	test	r9, r9
	je	.L81
	lea	rax, -1[r9]
	cmp	rax, 2
	jbe	.L67
	mov	rcx, r9
	vshufps	xmm2, xmm0, xmm0, 0
	xor	eax, eax
	shr	rcx, 2
	sal	rcx, 4
.LVL70:
	.p2align 4
	.p2align 3
.L63:
	.loc 1 77 52 is_stmt 0 discriminator 3 view .LVU188
	vmovups	xmm1, XMMWORD PTR [rdx+rax]
	vfmadd213ps	xmm1, xmm2, XMMWORD PTR [r8+rax]
	.loc 1 77 41 discriminator 3 view .LVU189
	vmovups	XMMWORD PTR [r8+rax], xmm1
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU190
	.loc 1 77 26 discriminator 1 view .LVU191
	add	rax, 16
	cmp	rax, rcx
	jne	.L63
	test	r9b, 3
	je	.L81
	mov	rax, r9
	and	rax, -4
.L62:
	.loc 1 77 26 is_stmt 0 discriminator 1 view .LVU192
	sub	r9, rax
.LVL71:
	.loc 1 77 26 discriminator 1 view .LVU193
	cmp	r9, 1
	je	.L65
	lea	r10, 0[0+rax*4]
	.loc 1 77 52 discriminator 3 view .LVU194
	vmovsldup	xmm3, xmm0
	lea	rcx, [r8+r10]
	.loc 1 77 48 discriminator 3 view .LVU195
	vmovq	xmm1, QWORD PTR [rdx+r10]
	.loc 1 77 55 discriminator 3 view .LVU196
	vmovq	xmm2, QWORD PTR [rcx]
	.loc 1 77 52 discriminator 3 view .LVU197
	vfmadd132ps	xmm1, xmm2, xmm3
	.loc 1 77 41 discriminator 3 view .LVU198
	vmovlps	QWORD PTR [rcx], xmm1
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU199
	.loc 1 77 26 discriminator 1 view .LVU200
	test	r9b, 1
	je	.L81
	and	r9, -2
	add	rax, r9
.L65:
.LVL72:
	.loc 1 77 48 is_stmt 0 discriminator 3 view .LVU201
	sal	rax, 2
	.loc 1 77 55 discriminator 3 view .LVU202
	add	r8, rax
.LVL73:
	.loc 1 77 52 discriminator 3 view .LVU203
	vmovss	xmm4, DWORD PTR [r8]
	vfmadd132ss	xmm0, xmm4, DWORD PTR [rdx+rax]
.LVL74:
	.loc 1 77 41 discriminator 3 view .LVU204
	vmovss	DWORD PTR [r8], xmm0
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU205
	.loc 1 77 26 discriminator 1 view .LVU206
.LVL75:
.L81:
	.loc 1 77 26 is_stmt 0 discriminator 1 view .LVU207
.LBE21:
	.loc 1 78 1 view .LVU208
	ret
.LVL76:
.L67:
.LBB22:
	.loc 1 77 17 view .LVU209
	xor	eax, eax
	jmp	.L62
.LBE22:
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
.LVL77:
.LFB33:
	.loc 1 81 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 81 15 is_stmt 0 view .LVU211
	.seh_endprologue
.LVL78:
.LBB23:
	.loc 1 82 26 is_stmt 1 discriminator 1 view .LVU212
	test	r9, r9
	je	.L107
	cmp	QWORD PTR 40[rsp], 1
	jne	.L108
	lea	rax, -1[r9]
	cmp	rax, 2
	jbe	.L92
	mov	rcx, r9
	vshufps	xmm2, xmm0, xmm0, 0
	xor	eax, eax
	shr	rcx, 2
	sal	rcx, 4
.LVL79:
	.p2align 4
	.p2align 3
.L88:
	.loc 1 82 60 is_stmt 0 discriminator 3 view .LVU213
	vmovups	xmm1, XMMWORD PTR [rdx+rax]
	vfmadd213ps	xmm1, xmm2, XMMWORD PTR [r8+rax]
	.loc 1 82 45 discriminator 3 view .LVU214
	vmovups	XMMWORD PTR [r8+rax], xmm1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU215
	.loc 1 82 26 discriminator 1 view .LVU216
	add	rax, 16
	cmp	rax, rcx
	jne	.L88
	mov	rax, r9
	and	rax, -4
	test	r9b, 3
	je	.L107
.L87:
	.loc 1 82 26 is_stmt 0 discriminator 1 view .LVU217
	sub	r9, rax
.LVL80:
	.loc 1 82 26 discriminator 1 view .LVU218
	cmp	r9, 1
	je	.L90
	lea	r10, 0[0+rax*4]
	.loc 1 82 60 discriminator 3 view .LVU219
	vmovsldup	xmm3, xmm0
	lea	rcx, [r8+r10]
	.loc 1 82 52 discriminator 3 view .LVU220
	vmovq	xmm1, QWORD PTR [rdx+r10]
	.loc 1 82 63 discriminator 3 view .LVU221
	vmovq	xmm2, QWORD PTR [rcx]
	.loc 1 82 60 discriminator 3 view .LVU222
	vfmadd132ps	xmm1, xmm2, xmm3
	.loc 1 82 45 discriminator 3 view .LVU223
	vmovlps	QWORD PTR [rcx], xmm1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU224
	.loc 1 82 26 discriminator 1 view .LVU225
	test	r9b, 1
	je	.L107
	and	r9, -2
	add	rax, r9
.L90:
.LVL81:
	.loc 1 82 52 is_stmt 0 discriminator 3 view .LVU226
	sal	rax, 2
	.loc 1 82 63 discriminator 3 view .LVU227
	add	r8, rax
.LVL82:
	.loc 1 82 60 discriminator 3 view .LVU228
	vmovss	xmm4, DWORD PTR [r8]
	vfmadd132ss	xmm0, xmm4, DWORD PTR [rdx+rax]
.LVL83:
	.loc 1 82 45 discriminator 3 view .LVU229
	vmovss	DWORD PTR [r8], xmm0
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU230
	.loc 1 82 26 discriminator 1 view .LVU231
.LVL84:
.L107:
	.loc 1 82 26 is_stmt 0 discriminator 1 view .LVU232
.LBE23:
	.loc 1 83 1 view .LVU233
	ret
.LVL85:
	.p2align 4
	.p2align 3
.L108:
	.loc 1 83 1 view .LVU234
	mov	rax, QWORD PTR 40[rsp]
.LBB24:
	.loc 1 82 17 view .LVU235
	xor	ecx, ecx
	lea	r10, 0[0+rax*4]
	.loc 1 82 26 discriminator 1 view .LVU236
	xor	eax, eax
.LVL86:
	.p2align 4
	.p2align 3
.L85:
	.loc 1 82 60 discriminator 3 view .LVU237
	vmovss	xmm1, DWORD PTR [rdx+rax]
	.loc 1 82 5 discriminator 3 view .LVU238
	inc	rcx
.LVL87:
	.loc 1 82 60 discriminator 3 view .LVU239
	vfmadd213ss	xmm1, xmm0, DWORD PTR [r8+rax]
	.loc 1 82 45 discriminator 3 view .LVU240
	vmovss	DWORD PTR [r8+rax], xmm1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU241
.LVL88:
	.loc 1 82 26 discriminator 1 view .LVU242
	add	rax, r10
	cmp	r9, rcx
	jne	.L85
.LBE24:
	.loc 1 83 1 is_stmt 0 view .LVU243
	ret
.LVL89:
.L92:
.LBB25:
	.loc 1 82 17 view .LVU244
	xor	eax, eax
	jmp	.L87
.LBE25:
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
.LVL90:
.LFB34:
	.loc 1 86 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 86 15 is_stmt 0 view .LVU246
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
.LVL91:
.LBB26:
	.loc 1 88 26 is_stmt 1 discriminator 1 view .LVU247
.LBE26:
	.loc 1 86 15 is_stmt 0 view .LVU248
	mov	r10, QWORD PTR 64[rsp]
.LBB27:
	.loc 1 88 26 discriminator 1 view .LVU249
	test	r10, r10
	je	.L130
	lea	rax, -1[r10]
	cmp	rax, 2
	jbe	.L116
	mov	rsi, r10
	vshufps	xmm3, xmm0, xmm0, 0
	xor	eax, eax
	shr	rsi, 2
	sal	rsi, 4
.LVL92:
	.p2align 4
	.p2align 3
.L112:
	.loc 1 88 26 discriminator 1 view .LVU250
	lea	rcx, [r9+rax]
	.loc 1 88 48 discriminator 3 view .LVU251
	movsx	rbx, DWORD PTR [rcx]
	movsx	rdi, DWORD PTR 8[rcx]
	movsx	r11, DWORD PTR 4[rcx]
	movsx	rcx, DWORD PTR 12[rcx]
	vmovss	xmm2, DWORD PTR [rdx+rdi*4]
	vmovss	xmm1, DWORD PTR [rdx+rbx*4]
	vinsertps	xmm2, xmm2, DWORD PTR [rdx+rcx*4], 0x10
	vinsertps	xmm1, xmm1, DWORD PTR [rdx+r11*4], 0x10
	vmovlhps	xmm1, xmm1, xmm2
	.loc 1 88 57 discriminator 3 view .LVU252
	vfmadd213ps	xmm1, xmm3, XMMWORD PTR [r8+rax]
	.loc 1 88 41 discriminator 3 view .LVU253
	vmovups	XMMWORD PTR [r8+rax], xmm1
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU254
	.loc 1 88 26 discriminator 1 view .LVU255
	add	rax, 16
	cmp	rax, rsi
	jne	.L112
	test	r10b, 3
	je	.L130
	mov	rax, r10
	and	rax, -4
.LVL93:
.L111:
	.loc 1 88 26 is_stmt 0 discriminator 1 view .LVU256
	sub	r10, rax
.LVL94:
	.loc 1 88 26 discriminator 1 view .LVU257
	cmp	r10, 1
	je	.L114
	lea	rcx, 0[0+rax*4]
	.loc 1 88 57 discriminator 3 view .LVU258
	vmovsldup	xmm3, xmm0
	lea	r11, [r9+rcx]
	add	rcx, r8
	.loc 1 88 48 discriminator 3 view .LVU259
	movsx	rbx, DWORD PTR [r11]
	movsx	r11, DWORD PTR 4[r11]
	.loc 1 88 60 discriminator 3 view .LVU260
	vmovq	xmm2, QWORD PTR [rcx]
	.loc 1 88 48 discriminator 3 view .LVU261
	vmovss	xmm1, DWORD PTR [rdx+rbx*4]
	vinsertps	xmm1, xmm1, DWORD PTR [rdx+r11*4], 0x10
	.loc 1 88 57 discriminator 3 view .LVU262
	vfmadd132ps	xmm1, xmm2, xmm3
	.loc 1 88 41 discriminator 3 view .LVU263
	vmovlps	QWORD PTR [rcx], xmm1
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU264
	.loc 1 88 26 discriminator 1 view .LVU265
	test	r10b, 1
	je	.L130
	and	r10, -2
	add	rax, r10
.L114:
.LVL95:
	.loc 1 88 54 is_stmt 0 discriminator 3 view .LVU266
	sal	rax, 2
	.loc 1 88 60 discriminator 3 view .LVU267
	add	r8, rax
.LVL96:
	.loc 1 88 54 discriminator 3 view .LVU268
	movsx	rax, DWORD PTR [r9+rax]
	.loc 1 88 57 discriminator 3 view .LVU269
	vmovss	xmm4, DWORD PTR [r8]
	vfmadd132ss	xmm0, xmm4, DWORD PTR [rdx+rax*4]
.LVL97:
	.loc 1 88 41 discriminator 3 view .LVU270
	vmovss	DWORD PTR [r8], xmm0
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU271
	.loc 1 88 26 discriminator 1 view .LVU272
.LVL98:
.L130:
	.loc 1 88 26 is_stmt 0 discriminator 1 view .LVU273
.LBE27:
	.loc 1 89 1 view .LVU274
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
.LVL99:
.L116:
	.cfi_restore_state
.LBB28:
	.loc 1 88 17 view .LVU275
	xor	eax, eax
	jmp	.L111
.LBE28:
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
.LVL100:
.LFB35:
	.loc 1 95 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 95 15 is_stmt 0 view .LVU277
	.seh_endprologue
.LVL101:
.LBB29:
	.loc 1 96 26 is_stmt 1 discriminator 1 view .LVU278
	test	r9, r9
	je	.L152
	lea	rax, -1[r9]
	cmp	rax, 2
	jbe	.L138
	mov	r10, r9
	xor	eax, eax
	shr	r10, 2
	sal	r10, 4
.LVL102:
	.p2align 4
	.p2align 3
.L134:
	.loc 1 96 48 is_stmt 0 discriminator 3 view .LVU279
	vmovups	xmm2, XMMWORD PTR [rcx+rax]
	vmulps	xmm0, xmm2, XMMWORD PTR [rdx+rax]
	.loc 1 96 41 discriminator 3 view .LVU280
	vmovups	XMMWORD PTR [r8+rax], xmm0
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU281
	.loc 1 96 26 discriminator 1 view .LVU282
	add	rax, 16
	cmp	rax, r10
	jne	.L134
	test	r9b, 3
	je	.L152
	mov	rax, r9
	and	rax, -4
.L133:
	.loc 1 96 26 is_stmt 0 discriminator 1 view .LVU283
	sub	r9, rax
.LVL103:
	.loc 1 96 26 discriminator 1 view .LVU284
	cmp	r9, 1
	je	.L136
	lea	r10, 0[0+rax*4]
	.loc 1 96 44 discriminator 3 view .LVU285
	vmovq	xmm0, QWORD PTR [rcx+r10]
	.loc 1 96 51 discriminator 3 view .LVU286
	vmovq	xmm1, QWORD PTR [rdx+r10]
	.loc 1 96 48 discriminator 3 view .LVU287
	vmulps	xmm0, xmm0, xmm1
	.loc 1 96 41 discriminator 3 view .LVU288
	vmovlps	QWORD PTR [r8+r10], xmm0
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU289
	.loc 1 96 26 discriminator 1 view .LVU290
	test	r9b, 1
	je	.L152
	and	r9, -2
	add	rax, r9
.L136:
.LVL104:
	.loc 1 96 44 is_stmt 0 discriminator 3 view .LVU291
	sal	rax, 2
	.loc 1 96 48 discriminator 3 view .LVU292
	vmovss	xmm0, DWORD PTR [rcx+rax]
	vmulss	xmm0, xmm0, DWORD PTR [rdx+rax]
	.loc 1 96 41 discriminator 3 view .LVU293
	vmovss	DWORD PTR [r8+rax], xmm0
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU294
	.loc 1 96 26 discriminator 1 view .LVU295
.LVL105:
.L152:
	.loc 1 96 26 is_stmt 0 discriminator 1 view .LVU296
.LBE29:
	.loc 1 97 1 view .LVU297
	ret
.LVL106:
.L138:
.LBB30:
	.loc 1 96 17 view .LVU298
	xor	eax, eax
	jmp	.L133
.LBE30:
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
.LVL107:
.LFB36:
	.loc 1 147 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 147 13 is_stmt 0 view .LVU300
	.seh_endprologue
	.loc 1 148 17 view .LVU301
	fldz
	.loc 1 147 13 view .LVU302
	mov	rax, rcx
	.loc 1 148 17 view .LVU303
	fstp	TBYTE PTR [rcx]
	fld	TBYTE PTR [rcx]
.LVL108:
.LBB31:
	.loc 1 149 26 is_stmt 1 discriminator 1 view .LVU304
	test	r9, r9
	je	.L160
	.loc 1 149 17 is_stmt 0 view .LVU305
	xor	r10d, r10d
.LVL109:
	.p2align 4
	.p2align 3
.L155:
	.loc 1 149 61 discriminator 3 view .LVU306
	fld	DWORD PTR [r8+r10*4]
	.loc 1 149 59 discriminator 3 view .LVU307
	fmul	DWORD PTR [rdx+r10*4]
	.loc 1 149 5 discriminator 3 view .LVU308
	inc	r10
.LVL110:
	.loc 1 149 38 discriminator 3 view .LVU309
	faddp	st(1), st
	.loc 1 149 5 is_stmt 1 discriminator 3 view .LVU310
.LVL111:
	.loc 1 149 26 discriminator 1 view .LVU311
	cmp	r9, r10
	jne	.L155
	fstp	TBYTE PTR [rax]
.LBE31:
	.loc 1 150 12 is_stmt 0 view .LVU312
	jmp	.L153
.LVL112:
	.p2align 4
	.p2align 3
.L160:
	.loc 1 150 12 view .LVU313
	ffreep	st(0)
.LVL113:
.L153:
	.loc 1 151 1 view .LVU314
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
.LVL114:
.LFB37:
	.loc 1 154 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 154 13 is_stmt 0 view .LVU316
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
	.loc 1 154 13 view .LVU317
	vmovss	DWORD PTR 4[rsp], xmm1
	.loc 1 154 67 view .LVU318
	fld	DWORD PTR 4[rsp]
	.loc 1 154 13 view .LVU319
	vmovss	DWORD PTR 8[rsp], xmm2
	mov	rax, rcx
	vmovss	DWORD PTR 12[rsp], xmm3
	.loc 1 154 67 view .LVU320
	fmul	DWORD PTR 8[rsp]
	.loc 1 154 84 view .LVU321
	fadd	DWORD PTR 12[rsp]
	.loc 1 154 99 view .LVU322
	fstp	TBYTE PTR [rcx]
	.loc 1 154 102 view .LVU323
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
.LVL115:
.LFB38:
	.loc 1 157 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 157 13 is_stmt 0 view .LVU325
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
	.loc 1 157 13 view .LVU326
	vmovss	DWORD PTR 8[rsp], xmm1
	.loc 1 157 61 view .LVU327
	fld	DWORD PTR 8[rsp]
	.loc 1 157 13 view .LVU328
	vmovss	DWORD PTR 12[rsp], xmm2
	mov	rax, rcx
	.loc 1 157 61 view .LVU329
	fmul	DWORD PTR 12[rsp]
	.loc 1 157 76 view .LVU330
	fstp	TBYTE PTR [rcx]
	.loc 1 157 79 view .LVU331
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
.LVL116:
.LFB39:
	.loc 1 14 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 14 12 is_stmt 0 view .LVU333
	.seh_endprologue
.LVL117:
.LBB32:
	.loc 1 16 26 is_stmt 1 discriminator 1 view .LVU334
	test	r8, r8
	je	.L169
	cmp	r8, 1
	je	.L170
	mov	r9, r8
	xor	eax, eax
.LBE32:
	.loc 1 15 7 is_stmt 0 view .LVU335
	vxorpd	xmm0, xmm0, xmm0
	shr	r9
	sal	r9, 4
.LVL118:
	.p2align 4
	.p2align 3
.L166:
.LBB33:
	.loc 1 16 46 discriminator 3 view .LVU336
	vmovupd	xmm4, XMMWORD PTR [rcx+rax]
	vmulpd	xmm1, xmm4, XMMWORD PTR [rdx+rax]
	add	rax, 16
	vaddsd	xmm0, xmm0, xmm1
.LVL119:
	.loc 1 16 38 discriminator 3 view .LVU337
	vunpckhpd	xmm1, xmm1, xmm1
	vaddsd	xmm0, xmm1, xmm0
.LVL120:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU338
	.loc 1 16 26 discriminator 1 view .LVU339
	cmp	rax, r9
	jne	.L166
	test	r8b, 1
	je	.L163
	and	r8, -2
.LVL121:
.L165:
	.loc 1 16 38 is_stmt 0 discriminator 3 view .LVU340
	vmovsd	xmm3, QWORD PTR [rdx+r8*8]
	vfmadd231sd	xmm0, xmm3, QWORD PTR [rcx+r8*8]
.LVL122:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU341
	.loc 1 16 26 discriminator 1 view .LVU342
.L163:
	.loc 1 16 26 is_stmt 0 discriminator 1 view .LVU343
.LBE33:
	.loc 1 18 1 view .LVU344
	ret
.LVL123:
	.p2align 4
	.p2align 3
.L169:
	.loc 1 15 7 view .LVU345
	vxorpd	xmm0, xmm0, xmm0
	.loc 1 18 1 view .LVU346
	ret
.L170:
.LBB34:
	.loc 1 16 17 view .LVU347
	xor	r8d, r8d
.LVL124:
	.loc 1 16 17 view .LVU348
.LBE34:
	.loc 1 15 7 view .LVU349
	vxorpd	xmm0, xmm0, xmm0
	jmp	.L165
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
.LVL125:
.LFB40:
	.loc 1 26 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 26 12 is_stmt 0 view .LVU351
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	sub	rsp, 64
	.seh_stackalloc	64
	.cfi_def_cfa_offset 80
	.seh_endprologue
.LVL126:
	.loc 1 28 7 view .LVU352
	vpxor	xmm0, xmm0, xmm0
	vextracti128	XMMWORD PTR 16[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 32[rsp], ymm0, 0x1
	.loc 1 26 12 view .LVU353
	mov	r9, rdx
	.loc 1 28 7 view .LVU354
	vmovdqu	XMMWORD PTR [rsp], xmm0
	vextracti128	XMMWORD PTR 48[rsp], ymm0, 0x1
.LVL127:
.LBB35:
	.loc 1 30 18 is_stmt 1 discriminator 1 view .LVU355
	cmp	r8, 7
	jbe	.L192
	lea	rbx, -8[r8]
	vxorpd	xmm0, xmm0, xmm0
	mov	rax, rcx
	xor	r10d, r10d
	mov	r11, rbx
	vmovapd	xmm1, xmm0
	vmovapd	xmm2, xmm0
	vmovapd	xmm3, xmm0
	shr	r11, 3
	inc	r11
.LVL128:
	.p2align 4
	.p2align 3
.L179:
.LBB36:
	.loc 1 31 30 discriminator 1 view .LVU356
	.loc 1 31 47 is_stmt 0 discriminator 3 view .LVU357
	vmovupd	xmm4, XMMWORD PTR [rdx]
	vmovupd	xmm5, XMMWORD PTR 16[rdx]
	inc	r10
	add	rdx, 64
	vfmadd231pd	xmm3, xmm4, XMMWORD PTR [rax]
	vfmadd231pd	xmm2, xmm5, XMMWORD PTR 16[rax]
	add	rax, 64
	vmovupd	xmm4, XMMWORD PTR -32[rdx]
	vmovupd	xmm5, XMMWORD PTR -16[rdx]
	vfmadd231pd	xmm1, xmm4, XMMWORD PTR -32[rax]
	vfmadd231pd	xmm0, xmm5, XMMWORD PTR -16[rax]
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU358
.LVL129:
	.loc 1 31 30 discriminator 1 view .LVU359
	.loc 1 31 9 discriminator 3 view .LVU360
	.loc 1 31 30 discriminator 1 view .LVU361
	.loc 1 31 9 discriminator 3 view .LVU362
	.loc 1 31 30 discriminator 1 view .LVU363
	.loc 1 31 9 discriminator 3 view .LVU364
	.loc 1 31 30 discriminator 1 view .LVU365
	.loc 1 31 9 discriminator 3 view .LVU366
	.loc 1 31 30 discriminator 1 view .LVU367
	.loc 1 31 9 discriminator 3 view .LVU368
	.loc 1 31 30 discriminator 1 view .LVU369
	.loc 1 31 9 discriminator 3 view .LVU370
	.loc 1 31 30 discriminator 1 view .LVU371
	.loc 1 31 9 discriminator 3 view .LVU372
	.loc 1 31 30 discriminator 1 view .LVU373
.LBE36:
	.loc 1 30 18 discriminator 1 view .LVU374
	cmp	r10, r11
	jb	.L179
	and	rbx, -8
	vmovupd	XMMWORD PTR [rsp], xmm3
	vmovupd	XMMWORD PTR 16[rsp], xmm2
	lea	rax, 8[rbx]
	vmovupd	XMMWORD PTR 32[rsp], xmm1
	vmovupd	XMMWORD PTR 48[rsp], xmm0
.LVL130:
.L180:
	.loc 1 30 18 is_stmt 0 discriminator 1 view .LVU375
.LBE35:
.LBB37:
	.loc 1 34 26 is_stmt 1 discriminator 1 view .LVU376
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU377
	vxorpd	xmm0, xmm0, xmm0
	vaddsd	xmm0, xmm0, QWORD PTR [rsp]
	vaddsd	xmm0, xmm0, QWORD PTR 8[rsp]
.LVL131:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU378
	.loc 1 34 26 discriminator 1 view .LVU379
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU380
	vaddsd	xmm0, xmm0, QWORD PTR 16[rsp]
.LVL132:
	.loc 1 34 38 discriminator 3 view .LVU381
	vaddsd	xmm0, xmm0, QWORD PTR 24[rsp]
.LVL133:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU382
	.loc 1 34 26 discriminator 1 view .LVU383
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU384
	vaddsd	xmm0, xmm0, QWORD PTR 32[rsp]
.LVL134:
	.loc 1 34 38 discriminator 3 view .LVU385
	vaddsd	xmm0, xmm0, QWORD PTR 40[rsp]
.LVL135:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU386
	.loc 1 34 26 discriminator 1 view .LVU387
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU388
	vaddsd	xmm0, xmm0, QWORD PTR 48[rsp]
.LVL136:
	.loc 1 34 38 discriminator 3 view .LVU389
	vaddsd	xmm0, xmm0, QWORD PTR 56[rsp]
.LVL137:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU390
	.loc 1 34 26 discriminator 1 view .LVU391
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU392
.LBE37:
	.loc 1 35 14 is_stmt 1 discriminator 1 view .LVU393
	cmp	rax, r8
	jnb	.L175
	sub	r8, rax
.LVL138:
	.loc 1 35 14 is_stmt 0 discriminator 1 view .LVU394
	cmp	r8, 1
	je	.L181
	mov	r11, r8
	lea	r10, 0[0+rax*8]
	xor	edx, edx
	shr	r11
	lea	rbx, [rcx+r10]
	add	r10, r9
	sal	r11, 4
.LVL139:
	.p2align 4
	.p2align 3
.L182:
	.loc 1 35 34 discriminator 2 view .LVU395
	vmovupd	xmm2, XMMWORD PTR [r10+rdx]
	vmulpd	xmm1, xmm2, XMMWORD PTR [rbx+rdx]
	add	rdx, 16
	vaddsd	xmm0, xmm0, xmm1
.LVL140:
	.loc 1 35 26 discriminator 2 view .LVU396
	vunpckhpd	xmm1, xmm1, xmm1
	vaddsd	xmm0, xmm1, xmm0
.LVL141:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU397
	.loc 1 35 14 discriminator 1 view .LVU398
	cmp	r11, rdx
	jne	.L182
	test	r8b, 1
	je	.L175
	and	r8, -2
	add	rax, r8
.L181:
.LVL142:
	.loc 1 35 26 is_stmt 0 discriminator 2 view .LVU399
	vmovsd	xmm3, QWORD PTR [r9+rax*8]
	vfmadd231sd	xmm0, xmm3, QWORD PTR [rcx+rax*8]
.LVL143:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU400
	.loc 1 35 14 discriminator 1 view .LVU401
.L175:
	.loc 1 35 14 is_stmt 0 discriminator 1 view .LVU402
	vzeroupper
.LVL144:
	.loc 1 37 1 view .LVU403
	add	rsp, 64
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
.LVL145:
.L192:
	.cfi_restore_state
	.loc 1 29 12 view .LVU404
	xor	eax, eax
	jmp	.L180
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
.LVL146:
.LFB41:
	.loc 1 45 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 45 12 is_stmt 0 view .LVU406
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
.LVL147:
.LBB38:
.LBB39:
	.loc 1 47 9 view .LVU407
	vpxor	xmm0, xmm0, xmm0
	vmovdqu	XMMWORD PTR [rsp], xmm0
.LVL148:
	.loc 1 47 9 view .LVU408
	test	r8, r8
	je	.L194
	cmp	r8, 1
	je	.L199
	mov	r9, r8
	xor	eax, eax
	vxorpd	xmm1, xmm1, xmm1
	shr	r9
	sal	r9, 4
.LVL149:
	.p2align 4
	.p2align 3
.L196:
	.loc 1 48 46 view .LVU409
	vmovupd	xmm3, XMMWORD PTR [rcx+rax]
	vmulpd	xmm0, xmm3, XMMWORD PTR [rdx+rax]
	add	rax, 16
	.loc 1 48 38 view .LVU410
	vaddpd	xmm1, xmm1, xmm0
	cmp	r9, rax
	jne	.L196
	vmovupd	XMMWORD PTR [rsp], xmm1
	test	r8b, 1
	je	.L194
	and	r8, -2
.LVL150:
.L195:
	.loc 1 48 38 view .LVU411
	vmovsd	xmm2, QWORD PTR [rsp]
	vmovsd	xmm0, QWORD PTR [rcx+r8*8]
	vfmadd132sd	xmm0, xmm2, QWORD PTR [rdx+r8*8]
	vmovsd	QWORD PTR [rsp], xmm0
.LVL151:
.L194:
	.loc 1 47 9 view .LVU412
	vxorpd	xmm0, xmm0, xmm0
	vaddsd	xmm0, xmm0, QWORD PTR [rsp]
	vaddsd	xmm0, xmm0, QWORD PTR 8[rsp]
.LBE39:
.LBE38:
	.loc 1 50 1 view .LVU413
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL152:
.L199:
	.cfi_restore_state
.LBB41:
.LBB40:
	.loc 1 47 9 view .LVU414
	xor	r8d, r8d
.LVL153:
	.loc 1 47 9 view .LVU415
	jmp	.L195
.LBE40:
.LBE41:
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
	.loc 1 58 12 is_stmt 0 view .LVU417
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	sub	rsp, 448
	.seh_stackalloc	448
	.cfi_def_cfa_offset 464
	vmovups	XMMWORD PTR 288[rsp], xmm6
	.seh_savexmm	xmm6, 288
	vmovups	XMMWORD PTR 304[rsp], xmm7
	.seh_savexmm	xmm7, 304
	vmovups	XMMWORD PTR 320[rsp], xmm8
	.seh_savexmm	xmm8, 320
	vmovups	XMMWORD PTR 336[rsp], xmm9
	.seh_savexmm	xmm9, 336
	vmovups	XMMWORD PTR 352[rsp], xmm10
	.seh_savexmm	xmm10, 352
	vmovups	XMMWORD PTR 368[rsp], xmm11
	.seh_savexmm	xmm11, 368
	vmovups	XMMWORD PTR 384[rsp], xmm12
	.seh_savexmm	xmm12, 384
	vmovups	XMMWORD PTR 400[rsp], xmm13
	.seh_savexmm	xmm13, 400
	vmovups	XMMWORD PTR 416[rsp], xmm14
	.seh_savexmm	xmm14, 416
	vmovups	XMMWORD PTR 432[rsp], xmm15
	.seh_savexmm	xmm15, 432
	.cfi_offset 23, -176
	.cfi_offset 24, -160
	.cfi_offset 25, -144
	.cfi_offset 26, -128
	.cfi_offset 27, -112
	.cfi_offset 28, -96
	.cfi_offset 29, -80
	.cfi_offset 30, -64
	.cfi_offset 31, -48
	.cfi_offset 32, -32
	.seh_endprologue
.LVL155:
	.loc 1 60 7 view .LVU418
	vpxor	xmm0, xmm0, xmm0
	vextracti128	XMMWORD PTR 48[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 64[rsp], ymm0, 0x1
	.loc 1 58 12 view .LVU419
	mov	r9, rdx
	.loc 1 60 7 view .LVU420
	vmovdqu	XMMWORD PTR 32[rsp], xmm0
	vextracti128	XMMWORD PTR 80[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 96[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 112[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 128[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 144[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 160[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 176[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 192[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 208[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 224[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 240[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 256[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 272[rsp], ymm0, 0x1
.LVL156:
.LBB42:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU421
	cmp	r8, 31
	jbe	.L217
	mov	rdx, rcx
.LVL157:
	.loc 1 62 18 is_stmt 0 discriminator 1 view .LVU422
	mov	rax, r9
	mov	r11d, 32
	vxorpd	xmm11, xmm11, xmm11
	vmovapd	xmm15, xmm11
	vmovapd	xmm14, xmm11
	vmovapd	xmm13, xmm11
	vmovapd	xmm12, xmm11
	vmovapd	xmm10, xmm11
	vmovapd	xmm8, xmm11
	vmovapd	xmm6, xmm11
	vmovapd	xmm7, xmm11
	vmovupd	XMMWORD PTR [rsp], xmm11
	vmovapd	xmm2, xmm11
	vmovapd	xmm1, xmm11
	vmovapd	xmm9, xmm11
	vmovupd	XMMWORD PTR 16[rsp], xmm11
	vmovapd	xmm4, xmm11
	vmovapd	xmm3, xmm11
.LVL158:
	.p2align 4
	.p2align 3
.L210:
.LBB43:
.LBB44:
	.loc 1 64 47 view .LVU423
	vmovupd	xmm0, XMMWORD PTR [rdx]
	mov	r10, r11
.LBE44:
.LBE43:
	.loc 1 62 18 discriminator 1 view .LVU424
	lea	r11, 32[r11]
.LVL159:
	.loc 1 62 18 discriminator 1 view .LVU425
	add	rdx, 256
.LBB47:
.LBB45:
	.loc 1 64 47 view .LVU426
	vfmadd231pd	xmm3, xmm0, XMMWORD PTR [rax]
	vmovupd	xmm0, XMMWORD PTR -240[rdx]
.LBE45:
.LBE47:
	.loc 1 62 18 discriminator 1 view .LVU427
	add	rax, 256
.LBB48:
.LBB46:
	.loc 1 64 47 view .LVU428
	vmovupd	xmm5, XMMWORD PTR 16[rsp]
	vfmadd231pd	xmm4, xmm0, XMMWORD PTR -240[rax]
	vmovupd	xmm0, XMMWORD PTR -224[rdx]
	vfmadd231pd	xmm5, xmm0, XMMWORD PTR -224[rax]
	vmovupd	xmm0, XMMWORD PTR -208[rdx]
	vfmadd231pd	xmm7, xmm0, XMMWORD PTR -208[rax]
	vmovupd	xmm0, XMMWORD PTR -192[rdx]
	vfmadd231pd	xmm9, xmm0, XMMWORD PTR -192[rax]
	vmovupd	xmm0, XMMWORD PTR -176[rdx]
	vfmadd231pd	xmm1, xmm0, XMMWORD PTR -176[rax]
	vmovupd	xmm0, XMMWORD PTR -160[rdx]
	vfmadd231pd	xmm2, xmm0, XMMWORD PTR -160[rax]
	vmovupd	xmm0, XMMWORD PTR -144[rdx]
	vmovupd	XMMWORD PTR 16[rsp], xmm5
	vmovupd	xmm5, XMMWORD PTR [rsp]
	vfmadd231pd	xmm5, xmm0, XMMWORD PTR -144[rax]
	vmovupd	xmm0, XMMWORD PTR -128[rdx]
	vfmadd231pd	xmm6, xmm0, XMMWORD PTR -128[rax]
	vmovupd	xmm0, XMMWORD PTR -112[rdx]
	vfmadd231pd	xmm8, xmm0, XMMWORD PTR -112[rax]
	vmovupd	xmm0, XMMWORD PTR -96[rdx]
	vfmadd231pd	xmm10, xmm0, XMMWORD PTR -96[rax]
	vmovupd	xmm0, XMMWORD PTR -80[rdx]
	vfmadd231pd	xmm12, xmm0, XMMWORD PTR -80[rax]
	vmovupd	xmm0, XMMWORD PTR -64[rdx]
	vfmadd231pd	xmm13, xmm0, XMMWORD PTR -64[rax]
	vmovupd	xmm0, XMMWORD PTR -48[rdx]
	vfmadd231pd	xmm14, xmm0, XMMWORD PTR -48[rax]
	vmovupd	XMMWORD PTR [rsp], xmm5
	vmovupd	xmm0, XMMWORD PTR -32[rdx]
	vfmadd231pd	xmm15, xmm0, XMMWORD PTR -32[rax]
	vmovupd	xmm0, XMMWORD PTR -16[rax]
	vfmadd231pd	xmm11, xmm0, XMMWORD PTR -16[rdx]
.LVL160:
	.loc 1 64 47 view .LVU429
.LBE46:
.LBE48:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU430
	cmp	r8, r11
	jnb	.L210
	vmovupd	xmm5, XMMWORD PTR 16[rsp]
	vmovupd	XMMWORD PTR 80[rsp], xmm7
	vmovupd	xmm7, XMMWORD PTR [rsp]
	vmovupd	XMMWORD PTR 32[rsp], xmm3
	vmovupd	XMMWORD PTR 48[rsp], xmm4
	vmovupd	XMMWORD PTR 96[rsp], xmm9
	vmovupd	XMMWORD PTR 112[rsp], xmm1
	vmovupd	XMMWORD PTR 128[rsp], xmm2
	vmovupd	XMMWORD PTR 160[rsp], xmm6
	vmovupd	XMMWORD PTR 176[rsp], xmm8
	vmovupd	XMMWORD PTR 192[rsp], xmm10
	vmovupd	XMMWORD PTR 208[rsp], xmm12
	vmovupd	XMMWORD PTR 224[rsp], xmm13
	vmovupd	XMMWORD PTR 240[rsp], xmm14
	vmovupd	XMMWORD PTR 256[rsp], xmm15
	vmovupd	XMMWORD PTR 272[rsp], xmm11
	vmovupd	XMMWORD PTR 64[rsp], xmm5
	vmovupd	XMMWORD PTR 144[rsp], xmm7
.L209:
.LVL161:
	.loc 1 62 18 is_stmt 0 discriminator 1 view .LVU431
.LBE42:
.LBB49:
	.loc 1 67 26 is_stmt 1 discriminator 1 view .LVU432
	.loc 1 67 38 is_stmt 0 discriminator 3 view .LVU433
	vxorpd	xmm0, xmm0, xmm0
	vaddsd	xmm0, xmm0, QWORD PTR 32[rsp]
	vaddsd	xmm0, xmm0, QWORD PTR 40[rsp]
.LVL162:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU434
	.loc 1 67 26 discriminator 1 view .LVU435
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU436
	vaddsd	xmm0, xmm0, QWORD PTR 48[rsp]
.LVL163:
	.loc 1 67 38 discriminator 3 view .LVU437
	vaddsd	xmm0, xmm0, QWORD PTR 56[rsp]
.LVL164:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU438
	.loc 1 67 26 discriminator 1 view .LVU439
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU440
	vaddsd	xmm0, xmm0, QWORD PTR 64[rsp]
.LVL165:
	.loc 1 67 38 discriminator 3 view .LVU441
	vaddsd	xmm0, xmm0, QWORD PTR 72[rsp]
.LVL166:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU442
	.loc 1 67 26 discriminator 1 view .LVU443
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU444
	vaddsd	xmm0, xmm0, QWORD PTR 80[rsp]
.LVL167:
	.loc 1 67 38 discriminator 3 view .LVU445
	vaddsd	xmm0, xmm0, QWORD PTR 88[rsp]
.LVL168:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU446
	.loc 1 67 26 discriminator 1 view .LVU447
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU448
	vaddsd	xmm0, xmm0, QWORD PTR 96[rsp]
.LVL169:
	.loc 1 67 38 discriminator 3 view .LVU449
	vaddsd	xmm0, xmm0, QWORD PTR 104[rsp]
.LVL170:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU450
	.loc 1 67 26 discriminator 1 view .LVU451
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU452
	vaddsd	xmm0, xmm0, QWORD PTR 112[rsp]
.LVL171:
	.loc 1 67 38 discriminator 3 view .LVU453
	vaddsd	xmm0, xmm0, QWORD PTR 120[rsp]
.LVL172:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU454
	.loc 1 67 26 discriminator 1 view .LVU455
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU456
	vaddsd	xmm0, xmm0, QWORD PTR 128[rsp]
.LVL173:
	.loc 1 67 38 discriminator 3 view .LVU457
	vaddsd	xmm0, xmm0, QWORD PTR 136[rsp]
.LVL174:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU458
	.loc 1 67 26 discriminator 1 view .LVU459
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU460
	vaddsd	xmm0, xmm0, QWORD PTR 144[rsp]
.LVL175:
	.loc 1 67 38 discriminator 3 view .LVU461
	vaddsd	xmm0, xmm0, QWORD PTR 152[rsp]
.LVL176:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU462
	.loc 1 67 26 discriminator 1 view .LVU463
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU464
	vaddsd	xmm0, xmm0, QWORD PTR 160[rsp]
.LVL177:
	.loc 1 67 38 discriminator 3 view .LVU465
	vaddsd	xmm0, xmm0, QWORD PTR 168[rsp]
.LVL178:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU466
	.loc 1 67 26 discriminator 1 view .LVU467
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU468
	vaddsd	xmm0, xmm0, QWORD PTR 176[rsp]
.LVL179:
	.loc 1 67 38 discriminator 3 view .LVU469
	vaddsd	xmm0, xmm0, QWORD PTR 184[rsp]
.LVL180:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU470
	.loc 1 67 26 discriminator 1 view .LVU471
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU472
	vaddsd	xmm0, xmm0, QWORD PTR 192[rsp]
.LVL181:
	.loc 1 67 38 discriminator 3 view .LVU473
	vaddsd	xmm0, xmm0, QWORD PTR 200[rsp]
.LVL182:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU474
	.loc 1 67 26 discriminator 1 view .LVU475
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU476
	vaddsd	xmm0, xmm0, QWORD PTR 208[rsp]
.LVL183:
	.loc 1 67 38 discriminator 3 view .LVU477
	vaddsd	xmm0, xmm0, QWORD PTR 216[rsp]
.LVL184:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU478
	.loc 1 67 26 discriminator 1 view .LVU479
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU480
	vaddsd	xmm0, xmm0, QWORD PTR 224[rsp]
.LVL185:
	.loc 1 67 38 discriminator 3 view .LVU481
	vaddsd	xmm0, xmm0, QWORD PTR 232[rsp]
.LVL186:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU482
	.loc 1 67 26 discriminator 1 view .LVU483
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU484
	vaddsd	xmm0, xmm0, QWORD PTR 240[rsp]
.LVL187:
	.loc 1 67 38 discriminator 3 view .LVU485
	vaddsd	xmm0, xmm0, QWORD PTR 248[rsp]
.LVL188:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU486
	.loc 1 67 26 discriminator 1 view .LVU487
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU488
	vaddsd	xmm0, xmm0, QWORD PTR 256[rsp]
.LVL189:
	.loc 1 67 38 discriminator 3 view .LVU489
	vaddsd	xmm0, xmm0, QWORD PTR 264[rsp]
.LVL190:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU490
	.loc 1 67 26 discriminator 1 view .LVU491
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU492
	vaddsd	xmm0, xmm0, QWORD PTR 272[rsp]
.LVL191:
	.loc 1 67 38 discriminator 3 view .LVU493
	vaddsd	xmm0, xmm0, QWORD PTR 280[rsp]
.LVL192:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU494
	.loc 1 67 26 discriminator 1 view .LVU495
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU496
.LBE49:
	.loc 1 68 14 is_stmt 1 discriminator 1 view .LVU497
	cmp	r10, r8
	jnb	.L208
	sub	r8, r10
.LVL193:
	.loc 1 68 14 is_stmt 0 discriminator 1 view .LVU498
	cmp	r8, 1
	je	.L213
	mov	r11, r8
	lea	rdx, 0[0+r10*8]
	xor	eax, eax
	shr	r11
	lea	rbx, [rcx+rdx]
	add	rdx, r9
	sal	r11, 4
.LVL194:
	.p2align 4
	.p2align 3
.L214:
	.loc 1 68 34 discriminator 2 view .LVU499
	vmovupd	xmm4, XMMWORD PTR [rdx+rax]
	vmulpd	xmm1, xmm4, XMMWORD PTR [rbx+rax]
	add	rax, 16
	vaddsd	xmm0, xmm1, xmm0
.LVL195:
	.loc 1 68 26 discriminator 2 view .LVU500
	vunpckhpd	xmm1, xmm1, xmm1
	vaddsd	xmm0, xmm1, xmm0
.LVL196:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU501
	.loc 1 68 14 discriminator 1 view .LVU502
	cmp	r11, rax
	jne	.L214
	test	r8b, 1
	je	.L208
	and	r8, -2
	add	r10, r8
.L213:
.LVL197:
	.loc 1 68 26 is_stmt 0 discriminator 2 view .LVU503
	vmovsd	xmm3, QWORD PTR [r9+r10*8]
	vfmadd231sd	xmm0, xmm3, QWORD PTR [rcx+r10*8]
.LVL198:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU504
	.loc 1 68 14 discriminator 1 view .LVU505
.L208:
	.loc 1 68 14 is_stmt 0 discriminator 1 view .LVU506
	vzeroupper
.LVL199:
	.loc 1 70 1 view .LVU507
	vmovups	xmm6, XMMWORD PTR 288[rsp]
	vmovups	xmm7, XMMWORD PTR 304[rsp]
	vmovups	xmm8, XMMWORD PTR 320[rsp]
	vmovups	xmm9, XMMWORD PTR 336[rsp]
	vmovups	xmm10, XMMWORD PTR 352[rsp]
	vmovups	xmm11, XMMWORD PTR 368[rsp]
	vmovups	xmm12, XMMWORD PTR 384[rsp]
	vmovups	xmm13, XMMWORD PTR 400[rsp]
	vmovups	xmm14, XMMWORD PTR 416[rsp]
	vmovups	xmm15, XMMWORD PTR 432[rsp]
	add	rsp, 448
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
	.cfi_def_cfa_offset 16
	pop	rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
.LVL200:
.L217:
	.cfi_restore_state
	.loc 1 61 12 view .LVU508
	xor	r10d, r10d
	jmp	.L209
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
	.loc 1 76 15 is_stmt 0 view .LVU510
	.seh_endprologue
.LVL202:
.LBB50:
	.loc 1 77 26 is_stmt 1 discriminator 1 view .LVU511
	test	r9, r9
	je	.L240
	cmp	r9, 1
	je	.L232
	mov	rcx, r9
	vmovddup	xmm2, xmm0
	xor	eax, eax
	shr	rcx
	sal	rcx, 4
.LVL203:
	.p2align 4
	.p2align 3
.L230:
	.loc 1 77 52 is_stmt 0 discriminator 3 view .LVU512
	vmovupd	xmm1, XMMWORD PTR [rdx+rax]
	vfmadd213pd	xmm1, xmm2, XMMWORD PTR [r8+rax]
	.loc 1 77 41 discriminator 3 view .LVU513
	vmovupd	XMMWORD PTR [r8+rax], xmm1
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU514
	.loc 1 77 26 discriminator 1 view .LVU515
	add	rax, 16
	cmp	rax, rcx
	jne	.L230
	test	r9b, 1
	je	.L240
	and	r9, -2
.LVL204:
.L229:
	.loc 1 77 48 is_stmt 0 discriminator 3 view .LVU516
	sal	r9, 3
	.loc 1 77 55 discriminator 3 view .LVU517
	add	r8, r9
.LVL205:
	.loc 1 77 52 discriminator 3 view .LVU518
	vmovsd	xmm3, QWORD PTR [r8]
	vfmadd132sd	xmm0, xmm3, QWORD PTR [rdx+r9]
.LVL206:
	.loc 1 77 41 discriminator 3 view .LVU519
	vmovsd	QWORD PTR [r8], xmm0
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU520
	.loc 1 77 26 discriminator 1 view .LVU521
.LVL207:
.L240:
	.loc 1 77 26 is_stmt 0 discriminator 1 view .LVU522
.LBE50:
	.loc 1 78 1 view .LVU523
	ret
.LVL208:
.L232:
.LBB51:
	.loc 1 77 17 view .LVU524
	xor	r9d, r9d
.LVL209:
	.loc 1 77 17 view .LVU525
	jmp	.L229
.LBE51:
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
.LVL210:
.LFB44:
	.loc 1 81 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 81 15 is_stmt 0 view .LVU527
	.seh_endprologue
.LVL211:
.LBB52:
	.loc 1 82 26 is_stmt 1 discriminator 1 view .LVU528
	test	r9, r9
	je	.L258
	cmp	QWORD PTR 40[rsp], 1
	jne	.L259
	cmp	r9, 1
	je	.L249
	mov	rcx, r9
	vmovddup	xmm2, xmm0
	xor	eax, eax
	shr	rcx
	sal	rcx, 4
.LVL212:
	.p2align 4
	.p2align 3
.L247:
	.loc 1 82 60 is_stmt 0 discriminator 3 view .LVU529
	vmovupd	xmm1, XMMWORD PTR [rdx+rax]
	vfmadd213pd	xmm1, xmm2, XMMWORD PTR [r8+rax]
	.loc 1 82 45 discriminator 3 view .LVU530
	vmovupd	XMMWORD PTR [r8+rax], xmm1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU531
	.loc 1 82 26 discriminator 1 view .LVU532
	add	rax, 16
	cmp	rax, rcx
	jne	.L247
	test	r9b, 1
	je	.L258
	and	r9, -2
.LVL213:
.L246:
	.loc 1 82 52 is_stmt 0 discriminator 3 view .LVU533
	sal	r9, 3
	.loc 1 82 63 discriminator 3 view .LVU534
	add	r8, r9
.LVL214:
	.loc 1 82 60 discriminator 3 view .LVU535
	vmovsd	xmm3, QWORD PTR [r8]
	vfmadd132sd	xmm0, xmm3, QWORD PTR [rdx+r9]
.LVL215:
	.loc 1 82 45 discriminator 3 view .LVU536
	vmovsd	QWORD PTR [r8], xmm0
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU537
	.loc 1 82 26 discriminator 1 view .LVU538
.LVL216:
.L258:
	.loc 1 82 26 is_stmt 0 discriminator 1 view .LVU539
.LBE52:
	.loc 1 83 1 view .LVU540
	ret
.LVL217:
	.p2align 4
	.p2align 3
.L259:
	.loc 1 83 1 view .LVU541
	mov	rax, QWORD PTR 40[rsp]
.LBB53:
	.loc 1 82 17 view .LVU542
	xor	ecx, ecx
	lea	r10, 0[0+rax*8]
	.loc 1 82 26 discriminator 1 view .LVU543
	xor	eax, eax
.LVL218:
	.p2align 4
	.p2align 3
.L244:
	.loc 1 82 60 discriminator 3 view .LVU544
	vmovsd	xmm1, QWORD PTR [rdx+rax]
	.loc 1 82 5 discriminator 3 view .LVU545
	inc	rcx
.LVL219:
	.loc 1 82 60 discriminator 3 view .LVU546
	vfmadd213sd	xmm1, xmm0, QWORD PTR [r8+rax]
	.loc 1 82 45 discriminator 3 view .LVU547
	vmovsd	QWORD PTR [r8+rax], xmm1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU548
.LVL220:
	.loc 1 82 26 discriminator 1 view .LVU549
	add	rax, r10
	cmp	r9, rcx
	jne	.L244
.LBE53:
	.loc 1 83 1 is_stmt 0 view .LVU550
	ret
.LVL221:
.L249:
.LBB54:
	.loc 1 82 17 view .LVU551
	xor	r9d, r9d
.LVL222:
	.loc 1 82 17 view .LVU552
	jmp	.L246
.LBE54:
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
.LVL223:
.LFB45:
	.loc 1 86 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 86 15 is_stmt 0 view .LVU554
	push	rsi
	.seh_pushreg	rsi
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	.seh_endprologue
.LVL224:
.LBB55:
	.loc 1 88 26 is_stmt 1 discriminator 1 view .LVU555
.LBE55:
	.loc 1 86 15 is_stmt 0 view .LVU556
	mov	rsi, QWORD PTR 56[rsp]
	mov	rcx, rdx
.LBB56:
	.loc 1 88 26 discriminator 1 view .LVU557
	test	rsi, rsi
	je	.L273
	lea	rax, -1[rsi]
	cmp	rax, 2
	jbe	.L265
	mov	rbx, rsi
	vmovddup	xmm3, xmm0
	mov	rax, r9
	mov	rdx, r8
.LVL225:
	.loc 1 88 26 discriminator 1 view .LVU558
	shr	rbx, 2
	sal	rbx, 4
	add	rbx, r9
.LVL226:
	.p2align 4
	.p2align 3
.L263:
	.loc 1 88 48 discriminator 3 view .LVU559
	movsx	r11, DWORD PTR 8[rax]
	movsx	r10, DWORD PTR 12[rax]
	add	rax, 16
	add	rdx, 32
	vmovsd	xmm1, QWORD PTR [rcx+r11*8]
	movsx	r11, DWORD PTR -16[rax]
	vmovsd	xmm2, QWORD PTR [rcx+r11*8]
	vmovhpd	xmm1, xmm1, QWORD PTR [rcx+r10*8]
	movsx	r10, DWORD PTR -12[rax]
	.loc 1 88 57 discriminator 3 view .LVU560
	vfmadd213pd	xmm1, xmm3, XMMWORD PTR -16[rdx]
	.loc 1 88 48 discriminator 3 view .LVU561
	vmovhpd	xmm2, xmm2, QWORD PTR [rcx+r10*8]
	.loc 1 88 57 discriminator 3 view .LVU562
	vfmadd213pd	xmm2, xmm3, XMMWORD PTR -32[rdx]
	.loc 1 88 41 discriminator 3 view .LVU563
	vmovupd	XMMWORD PTR -16[rdx], xmm1
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU564
	.loc 1 88 26 discriminator 1 view .LVU565
	.loc 1 88 41 is_stmt 0 discriminator 3 view .LVU566
	vmovupd	XMMWORD PTR -32[rdx], xmm2
	cmp	rax, rbx
	jne	.L263
	test	sil, 3
	je	.L273
	mov	rax, rsi
	and	rax, -4
.LVL227:
.L262:
	.loc 1 88 54 discriminator 3 view .LVU567
	movsx	rbx, DWORD PTR [r9+rax*4]
	.loc 1 88 60 discriminator 3 view .LVU568
	lea	rdx, 0[0+rax*8]
	.loc 1 88 54 discriminator 3 view .LVU569
	lea	r11, 0[0+rax*4]
	.loc 1 88 60 discriminator 3 view .LVU570
	lea	r10, [r8+rdx]
	.loc 1 88 57 discriminator 3 view .LVU571
	vmovsd	xmm1, QWORD PTR [rcx+rbx*8]
	vfmadd213sd	xmm1, xmm0, QWORD PTR [r10]
	.loc 1 88 41 discriminator 3 view .LVU572
	vmovsd	QWORD PTR [r10], xmm1
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU573
	.loc 1 88 26 discriminator 1 view .LVU574
	.loc 1 88 5 is_stmt 0 discriminator 3 view .LVU575
	lea	r10, 1[rax]
	.loc 1 88 26 discriminator 1 view .LVU576
	cmp	r10, rsi
	jnb	.L273
	.loc 1 88 54 discriminator 3 view .LVU577
	movsx	rbx, DWORD PTR 4[r9+r11]
	.loc 1 88 60 discriminator 3 view .LVU578
	lea	r10, 8[r8+rdx]
	.loc 1 88 5 discriminator 3 view .LVU579
	add	rax, 2
	.loc 1 88 57 discriminator 3 view .LVU580
	vmovsd	xmm1, QWORD PTR [rcx+rbx*8]
	vfmadd213sd	xmm1, xmm0, QWORD PTR [r10]
	.loc 1 88 41 discriminator 3 view .LVU581
	vmovsd	QWORD PTR [r10], xmm1
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU582
	.loc 1 88 26 discriminator 1 view .LVU583
	cmp	rax, rsi
	jnb	.L273
	.loc 1 88 60 is_stmt 0 discriminator 3 view .LVU584
	lea	rax, 16[r8+rdx]
	.loc 1 88 54 discriminator 3 view .LVU585
	movsx	rdx, DWORD PTR 8[r9+r11]
	.loc 1 88 57 discriminator 3 view .LVU586
	vmovsd	xmm4, QWORD PTR [rax]
	vfmadd132sd	xmm0, xmm4, QWORD PTR [rcx+rdx*8]
.LVL228:
	.loc 1 88 41 discriminator 3 view .LVU587
	vmovsd	QWORD PTR [rax], xmm0
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU588
	.loc 1 88 26 discriminator 1 view .LVU589
.LVL229:
.L273:
	.loc 1 88 26 is_stmt 0 discriminator 1 view .LVU590
.LBE56:
	.loc 1 89 1 view .LVU591
	pop	rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	pop	rsi
	.cfi_restore 4
	.cfi_def_cfa_offset 8
.LVL230:
	.loc 1 89 1 view .LVU592
	ret
.LVL231:
.L265:
	.cfi_restore_state
.LBB57:
	.loc 1 88 17 view .LVU593
	xor	eax, eax
	jmp	.L262
.LBE57:
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
.LVL232:
.LFB46:
	.loc 1 95 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 95 15 is_stmt 0 view .LVU595
	.seh_endprologue
.LVL233:
.LBB58:
	.loc 1 96 26 is_stmt 1 discriminator 1 view .LVU596
	test	r9, r9
	je	.L287
	cmp	r9, 1
	je	.L279
	mov	r10, r9
	xor	eax, eax
	shr	r10
	sal	r10, 4
.LVL234:
	.p2align 4
	.p2align 3
.L277:
	.loc 1 96 48 is_stmt 0 discriminator 3 view .LVU597
	vmovupd	xmm1, XMMWORD PTR [rcx+rax]
	vmulpd	xmm0, xmm1, XMMWORD PTR [rdx+rax]
	.loc 1 96 41 discriminator 3 view .LVU598
	vmovupd	XMMWORD PTR [r8+rax], xmm0
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU599
	.loc 1 96 26 discriminator 1 view .LVU600
	add	rax, 16
	cmp	rax, r10
	jne	.L277
	test	r9b, 1
	je	.L287
	and	r9, -2
.LVL235:
.L276:
	.loc 1 96 44 is_stmt 0 discriminator 3 view .LVU601
	sal	r9, 3
	.loc 1 96 48 discriminator 3 view .LVU602
	vmovsd	xmm0, QWORD PTR [rdx+r9]
	vmulsd	xmm0, xmm0, QWORD PTR [rcx+r9]
	.loc 1 96 41 discriminator 3 view .LVU603
	vmovsd	QWORD PTR [r8+r9], xmm0
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU604
	.loc 1 96 26 discriminator 1 view .LVU605
.LVL236:
.L287:
	.loc 1 96 26 is_stmt 0 discriminator 1 view .LVU606
.LBE58:
	.loc 1 97 1 view .LVU607
	ret
.LVL237:
.L279:
.LBB59:
	.loc 1 96 17 view .LVU608
	xor	r9d, r9d
.LVL238:
	.loc 1 96 17 view .LVU609
	jmp	.L276
.LBE59:
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
.LVL239:
.LFB47:
	.loc 1 147 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 147 13 is_stmt 0 view .LVU611
	.seh_endprologue
	.loc 1 148 17 view .LVU612
	fldz
	.loc 1 147 13 view .LVU613
	mov	rax, rcx
	.loc 1 148 17 view .LVU614
	fstp	TBYTE PTR [rcx]
	fld	TBYTE PTR [rcx]
.LVL240:
.LBB60:
	.loc 1 149 26 is_stmt 1 discriminator 1 view .LVU615
	test	r9, r9
	je	.L295
	.loc 1 149 17 is_stmt 0 view .LVU616
	xor	r10d, r10d
.LVL241:
	.p2align 4
	.p2align 3
.L290:
	.loc 1 149 61 discriminator 3 view .LVU617
	fld	QWORD PTR [r8+r10*8]
	.loc 1 149 59 discriminator 3 view .LVU618
	fmul	QWORD PTR [rdx+r10*8]
	.loc 1 149 5 discriminator 3 view .LVU619
	inc	r10
.LVL242:
	.loc 1 149 38 discriminator 3 view .LVU620
	faddp	st(1), st
	.loc 1 149 5 is_stmt 1 discriminator 3 view .LVU621
.LVL243:
	.loc 1 149 26 discriminator 1 view .LVU622
	cmp	r9, r10
	jne	.L290
	fstp	TBYTE PTR [rax]
.LBE60:
	.loc 1 150 12 is_stmt 0 view .LVU623
	jmp	.L288
.LVL244:
	.p2align 4
	.p2align 3
.L295:
	.loc 1 150 12 view .LVU624
	ffreep	st(0)
.LVL245:
.L288:
	.loc 1 151 1 view .LVU625
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
.LVL246:
.LFB48:
	.loc 1 154 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 154 13 is_stmt 0 view .LVU627
	sub	rsp, 40
	.seh_stackalloc	40
	.cfi_def_cfa_offset 48
	.seh_endprologue
	.loc 1 154 13 view .LVU628
	vmovsd	QWORD PTR 8[rsp], xmm1
	.loc 1 154 67 view .LVU629
	fld	QWORD PTR 8[rsp]
	.loc 1 154 13 view .LVU630
	vmovsd	QWORD PTR 16[rsp], xmm2
	mov	rax, rcx
	vmovsd	QWORD PTR 24[rsp], xmm3
	.loc 1 154 67 view .LVU631
	fmul	QWORD PTR 16[rsp]
	.loc 1 154 84 view .LVU632
	fadd	QWORD PTR 24[rsp]
	.loc 1 154 99 view .LVU633
	fstp	TBYTE PTR [rcx]
	.loc 1 154 102 view .LVU634
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
.LVL247:
.LFB49:
	.loc 1 157 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 157 13 is_stmt 0 view .LVU636
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
	.loc 1 157 13 view .LVU637
	vmovsd	QWORD PTR [rsp], xmm1
	.loc 1 157 61 view .LVU638
	fld	QWORD PTR [rsp]
	.loc 1 157 13 view .LVU639
	vmovsd	QWORD PTR 8[rsp], xmm2
	mov	rax, rcx
	.loc 1 157 61 view .LVU640
	fmul	QWORD PTR 8[rsp]
	.loc 1 157 76 view .LVU641
	fstp	TBYTE PTR [rcx]
	.loc 1 157 79 view .LVU642
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
.LVL248:
.LFB50:
	.loc 1 14 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 14 12 is_stmt 0 view .LVU644
	.seh_endprologue
.LVL249:
.LBB61:
	.loc 1 16 26 is_stmt 1 discriminator 1 view .LVU645
	test	r8, r8
	je	.L304
	lea	rax, -1[r8]
	cmp	rax, 2
	jbe	.L305
	mov	r9, r8
	xor	eax, eax
	vpxor	xmm0, xmm0, xmm0
	shr	r9, 2
	sal	r9, 4
.LVL250:
	.p2align 4
	.p2align 3
.L301:
	.loc 1 16 46 is_stmt 0 discriminator 3 view .LVU646
	vmovdqu	xmm2, XMMWORD PTR [rcx+rax]
	vpmulld	xmm1, xmm2, XMMWORD PTR [rdx+rax]
	add	rax, 16
	.loc 1 16 38 discriminator 3 view .LVU647
	vpaddd	xmm0, xmm0, xmm1
.LVL251:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU648
	.loc 1 16 26 discriminator 1 view .LVU649
	cmp	rax, r9
	jne	.L301
	vpsrldq	xmm1, xmm0, 8
	vpaddd	xmm0, xmm0, xmm1
	vpsrldq	xmm1, xmm0, 4
	vpaddd	xmm0, xmm0, xmm1
	vmovd	eax, xmm0
	test	r8b, 3
	je	.L298
	mov	r10, r8
	and	r10, -4
.LVL252:
.L300:
	.loc 1 16 42 is_stmt 0 discriminator 3 view .LVU650
	lea	r9, 0[0+r10*4]
	.loc 1 16 46 discriminator 3 view .LVU651
	mov	r11d, DWORD PTR [rcx+r9]
	imul	r11d, DWORD PTR [rdx+r9]
	.loc 1 16 38 discriminator 3 view .LVU652
	add	eax, r11d
.LVL253:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU653
	.loc 1 16 26 discriminator 1 view .LVU654
	.loc 1 16 5 is_stmt 0 discriminator 3 view .LVU655
	lea	r11, 1[r10]
	.loc 1 16 26 discriminator 1 view .LVU656
	cmp	r11, r8
	jnb	.L298
	.loc 1 16 46 discriminator 3 view .LVU657
	mov	r11d, DWORD PTR 4[rcx+r9]
	imul	r11d, DWORD PTR 4[rdx+r9]
	.loc 1 16 5 discriminator 3 view .LVU658
	add	r10, 2
	.loc 1 16 38 discriminator 3 view .LVU659
	add	eax, r11d
.LVL254:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU660
	.loc 1 16 26 discriminator 1 view .LVU661
	cmp	r10, r8
	jnb	.L298
	.loc 1 16 46 is_stmt 0 discriminator 3 view .LVU662
	mov	edx, DWORD PTR 8[rdx+r9]
.LVL255:
	.loc 1 16 46 discriminator 3 view .LVU663
	imul	edx, DWORD PTR 8[rcx+r9]
	.loc 1 16 38 discriminator 3 view .LVU664
	add	eax, edx
.LVL256:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU665
	.loc 1 16 26 discriminator 1 view .LVU666
.L298:
	.loc 1 16 26 is_stmt 0 discriminator 1 view .LVU667
.LBE61:
	.loc 1 18 1 view .LVU668
	ret
.LVL257:
	.p2align 4
	.p2align 3
.L304:
	.loc 1 15 7 view .LVU669
	xor	eax, eax
	.loc 1 18 1 view .LVU670
	ret
.L305:
.LBB62:
	.loc 1 16 17 view .LVU671
	xor	r10d, r10d
.LBE62:
	.loc 1 15 7 view .LVU672
	xor	eax, eax
	jmp	.L300
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
.LVL258:
.LFB51:
	.loc 1 26 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 26 12 is_stmt 0 view .LVU674
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
.LVL259:
	.loc 1 28 7 view .LVU675
	vpxor	xmm0, xmm0, xmm0
	vextracti128	XMMWORD PTR 16[rsp], ymm0, 0x1
.LVL260:
.LBB63:
	.loc 1 30 18 is_stmt 1 discriminator 1 view .LVU676
.LBE63:
	.loc 1 26 12 is_stmt 0 view .LVU677
	mov	r9, rdx
	.loc 1 28 7 view .LVU678
	vmovdqu	XMMWORD PTR [rsp], xmm0
.LBB65:
	.loc 1 30 18 discriminator 1 view .LVU679
	cmp	r8, 7
	jbe	.L324
	lea	r10, -8[r8]
	vpxor	xmm1, xmm1, xmm1
	xor	eax, eax
	xor	edx, edx
.LVL261:
	.loc 1 30 18 discriminator 1 view .LVU680
	mov	r11, r10
	vmovdqa	xmm2, xmm1
	shr	r11, 3
	inc	r11
.LVL262:
	.p2align 4
	.p2align 3
.L314:
.LBB64:
	.loc 1 31 30 is_stmt 1 discriminator 1 view .LVU681
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU682
	vmovdqu	xmm3, XMMWORD PTR [r9+rax]
	vmovdqu	xmm4, XMMWORD PTR 16[r9+rax]
	inc	rdx
	vpmulld	xmm0, xmm3, XMMWORD PTR [rcx+rax]
	.loc 1 31 47 discriminator 3 view .LVU683
	vpaddd	xmm2, xmm2, xmm0
	.loc 1 31 59 discriminator 3 view .LVU684
	vpmulld	xmm0, xmm4, XMMWORD PTR 16[rcx+rax]
	add	rax, 32
	.loc 1 31 47 discriminator 3 view .LVU685
	vpaddd	xmm1, xmm1, xmm0
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU686
.LVL263:
	.loc 1 31 30 discriminator 1 view .LVU687
	.loc 1 31 9 discriminator 3 view .LVU688
	.loc 1 31 30 discriminator 1 view .LVU689
	.loc 1 31 9 discriminator 3 view .LVU690
	.loc 1 31 30 discriminator 1 view .LVU691
	.loc 1 31 9 discriminator 3 view .LVU692
	.loc 1 31 30 discriminator 1 view .LVU693
	.loc 1 31 9 discriminator 3 view .LVU694
	.loc 1 31 30 discriminator 1 view .LVU695
	.loc 1 31 9 discriminator 3 view .LVU696
	.loc 1 31 30 discriminator 1 view .LVU697
	.loc 1 31 9 discriminator 3 view .LVU698
	.loc 1 31 30 discriminator 1 view .LVU699
	.loc 1 31 9 discriminator 3 view .LVU700
	.loc 1 31 30 discriminator 1 view .LVU701
.LBE64:
	.loc 1 30 18 discriminator 1 view .LVU702
	cmp	rdx, r11
	jb	.L314
	and	r10, -8
	vmovdqu	XMMWORD PTR [rsp], xmm2
	vmovdqu	XMMWORD PTR 16[rsp], xmm1
	vmovdqa	xmm5, xmm2
	add	r10, 8
.LVL264:
.L315:
	.loc 1 30 18 is_stmt 0 discriminator 1 view .LVU703
.LBE65:
.LBB66:
	.loc 1 34 26 is_stmt 1 discriminator 1 view .LVU704
	.loc 1 34 5 discriminator 3 view .LVU705
	.loc 1 34 26 discriminator 1 view .LVU706
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU707
	vpaddd	xmm0, xmm5, XMMWORD PTR 16[rsp]
.LVL265:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU708
	.loc 1 34 26 discriminator 1 view .LVU709
	vpsrldq	xmm1, xmm0, 8
	vpaddd	xmm0, xmm0, xmm1
	vpsrldq	xmm1, xmm0, 4
	vpaddd	xmm0, xmm0, xmm1
	vmovd	edx, xmm0
.LVL266:
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU710
.LBE66:
	.loc 1 35 14 is_stmt 1 discriminator 1 view .LVU711
	cmp	r10, r8
	jnb	.L310
	mov	rdi, r8
	sub	rdi, r10
	lea	rax, -1[rdi]
	cmp	rax, 2
	jbe	.L316
	mov	rbx, rdi
	lea	r11, 0[0+r10*4]
	xor	eax, eax
	vpxor	xmm1, xmm1, xmm1
	shr	rbx, 2
	lea	rsi, [rcx+r11]
	add	r11, r9
	sal	rbx, 4
.LVL267:
	.p2align 4
	.p2align 3
.L317:
	.loc 1 35 34 is_stmt 0 discriminator 2 view .LVU712
	vmovdqu	xmm5, XMMWORD PTR [r11+rax]
	vpmulld	xmm0, xmm5, XMMWORD PTR [rsi+rax]
	add	rax, 16
	.loc 1 35 26 discriminator 2 view .LVU713
	vpaddd	xmm1, xmm1, xmm0
.LVL268:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU714
	.loc 1 35 14 discriminator 1 view .LVU715
	cmp	rbx, rax
	jne	.L317
	vpsrldq	xmm0, xmm1, 8
	vpaddd	xmm1, xmm1, xmm0
	vpsrldq	xmm0, xmm1, 4
	vpaddd	xmm1, xmm1, xmm0
	vmovd	eax, xmm1
	add	edx, eax
	test	dil, 3
	je	.L310
	and	rdi, -4
	add	r10, rdi
.LVL269:
.L316:
	.loc 1 35 30 is_stmt 0 discriminator 2 view .LVU716
	lea	rax, 0[0+r10*4]
	.loc 1 35 34 discriminator 2 view .LVU717
	mov	r11d, DWORD PTR [r9+rax]
	imul	r11d, DWORD PTR [rcx+rax]
	.loc 1 35 26 discriminator 2 view .LVU718
	add	edx, r11d
.LVL270:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU719
	.loc 1 35 14 discriminator 1 view .LVU720
	.loc 1 35 5 is_stmt 0 discriminator 2 view .LVU721
	lea	r11, 1[r10]
	.loc 1 35 14 discriminator 1 view .LVU722
	cmp	r11, r8
	jnb	.L310
	.loc 1 35 34 discriminator 2 view .LVU723
	mov	r11d, DWORD PTR 4[rcx+rax]
	imul	r11d, DWORD PTR 4[r9+rax]
	.loc 1 35 5 discriminator 2 view .LVU724
	add	r10, 2
	.loc 1 35 26 discriminator 2 view .LVU725
	add	edx, r11d
.LVL271:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU726
	.loc 1 35 14 discriminator 1 view .LVU727
	cmp	r10, r8
	jnb	.L310
	.loc 1 35 34 is_stmt 0 discriminator 2 view .LVU728
	mov	r8d, DWORD PTR 8[r9+rax]
.LVL272:
	.loc 1 35 34 discriminator 2 view .LVU729
	imul	r8d, DWORD PTR 8[rcx+rax]
	.loc 1 35 26 discriminator 2 view .LVU730
	add	edx, r8d
.LVL273:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU731
	.loc 1 35 14 discriminator 1 view .LVU732
.L310:
	.loc 1 37 1 is_stmt 0 view .LVU733
	mov	eax, edx
	vzeroupper
.LVL274:
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
.LVL275:
.L324:
	.cfi_restore_state
	.loc 1 37 1 view .LVU734
	vmovdqu	xmm5, XMMWORD PTR [rsp]
	.loc 1 29 12 view .LVU735
	xor	r10d, r10d
	jmp	.L315
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
.LVL276:
.LFB52:
	.loc 1 45 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 45 12 is_stmt 0 view .LVU737
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
.LVL277:
.LBB67:
.LBB68:
	.loc 1 47 9 view .LVU738
	vpxor	xmm0, xmm0, xmm0
	vmovdqu	XMMWORD PTR [rsp], xmm0
.LVL278:
	.loc 1 47 9 view .LVU739
	test	r8, r8
	je	.L326
	cmp	r8, 3
	jbe	.L331
	mov	r9, r8
	xor	eax, eax
	vpxor	xmm1, xmm1, xmm1
	shr	r9, 2
	sal	r9, 4
.LVL279:
	.p2align 4
	.p2align 3
.L328:
	.loc 1 48 46 view .LVU740
	vmovdqu	xmm3, XMMWORD PTR [rcx+rax]
	vpmulld	xmm0, xmm3, XMMWORD PTR [rdx+rax]
	add	rax, 16
	.loc 1 48 38 view .LVU741
	vpaddd	xmm1, xmm1, xmm0
	cmp	r9, rax
	jne	.L328
	mov	r11, r8
	vmovdqu	XMMWORD PTR [rsp], xmm1
	and	r11, -4
	test	r8b, 3
	je	.L326
.L327:
.LVL280:
	.loc 1 48 42 view .LVU742
	lea	r9, 0[0+r11*4]
	lea	r10, 1[r11]
	.loc 1 48 46 view .LVU743
	mov	eax, DWORD PTR [rcx+r9]
	imul	eax, DWORD PTR [rdx+r9]
	.loc 1 48 38 view .LVU744
	add	eax, DWORD PTR [rsp]
	mov	DWORD PTR [rsp], eax
	.loc 1 48 38 view .LVU745
	cmp	r10, r8
	jnb	.L326
	.loc 1 48 46 view .LVU746
	mov	r10d, DWORD PTR 4[rcx+r9]
	add	r11, 2
	imul	r10d, DWORD PTR 4[rdx+r9]
	.loc 1 48 38 view .LVU747
	add	eax, r10d
	mov	DWORD PTR [rsp], eax
	.loc 1 48 38 view .LVU748
	cmp	r11, r8
	jnb	.L326
	.loc 1 48 46 view .LVU749
	mov	ecx, DWORD PTR 8[rcx+r9]
.LVL281:
	.loc 1 48 46 view .LVU750
	imul	ecx, DWORD PTR 8[rdx+r9]
	.loc 1 48 38 view .LVU751
	add	eax, ecx
	mov	DWORD PTR [rsp], eax
.LVL282:
.L326:
	.loc 1 48 38 view .LVU752
	vmovdqu	xmm2, XMMWORD PTR [rsp]
	vpsrldq	xmm0, xmm2, 8
	vpaddd	xmm0, xmm0, XMMWORD PTR [rsp]
.LBE68:
.LBE67:
	.loc 1 49 12 discriminator 1 view .LVU753
	vpsrldq	xmm1, xmm0, 4
	vpaddd	xmm0, xmm0, xmm1
	vmovd	eax, xmm0
	.loc 1 50 1 view .LVU754
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL283:
.L331:
	.cfi_restore_state
.LBB70:
.LBB69:
	.loc 1 47 9 view .LVU755
	xor	r11d, r11d
	jmp	.L327
.LBE69:
.LBE70:
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
.LVL284:
.LFB53:
	.loc 1 58 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 58 12 is_stmt 0 view .LVU757
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
	sub	rsp, 176
	.seh_stackalloc	176
	.cfi_def_cfa_offset 208
	vmovups	XMMWORD PTR 128[rsp], xmm6
	.seh_savexmm	xmm6, 128
	vmovups	XMMWORD PTR 144[rsp], xmm7
	.seh_savexmm	xmm7, 144
	vmovups	XMMWORD PTR 160[rsp], xmm8
	.seh_savexmm	xmm8, 160
	.cfi_offset 23, -80
	.cfi_offset 24, -64
	.cfi_offset 25, -48
	.seh_endprologue
.LVL285:
	.loc 1 60 7 view .LVU758
	vpxor	xmm0, xmm0, xmm0
	vextracti128	XMMWORD PTR 16[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 32[rsp], ymm0, 0x1
	.loc 1 58 12 view .LVU759
	mov	r11, rcx
	mov	rbx, rdx
	.loc 1 60 7 view .LVU760
	vextracti128	XMMWORD PTR 48[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 64[rsp], ymm0, 0x1
	vmovdqu	XMMWORD PTR [rsp], xmm0
	vextracti128	XMMWORD PTR 80[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 96[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 112[rsp], ymm0, 0x1
.LVL286:
.LBB71:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU761
	cmp	r8, 31
	jbe	.L349
	mov	rdx, rcx
.LVL287:
	.loc 1 62 18 is_stmt 0 discriminator 1 view .LVU762
	mov	rax, rbx
	mov	ecx, 32
.LVL288:
	.loc 1 62 18 discriminator 1 view .LVU763
	vpxor	xmm5, xmm5, xmm5
	vmovdqa	xmm2, xmm5
	vmovdqa	xmm1, xmm5
	vmovdqa	xmm8, xmm5
	vmovdqa	xmm7, xmm5
	vmovdqa	xmm6, xmm5
	vmovdqa	xmm4, xmm5
	vmovdqa	xmm3, xmm5
.LVL289:
	.p2align 4
	.p2align 3
.L342:
.LBB72:
.LBB73:
	.loc 1 64 59 view .LVU764
	vmovdqu	xmm0, XMMWORD PTR [rdx]
	mov	r9, rcx
.LBE73:
.LBE72:
	.loc 1 62 18 discriminator 1 view .LVU765
	lea	rcx, 32[rcx]
.LVL290:
	.loc 1 62 18 discriminator 1 view .LVU766
	sub	rdx, -128
.LBB76:
.LBB74:
	.loc 1 64 59 view .LVU767
	vpmulld	xmm0, xmm0, XMMWORD PTR [rax]
.LBE74:
.LBE76:
	.loc 1 62 18 discriminator 1 view .LVU768
	sub	rax, -128
.LBB77:
.LBB75:
	.loc 1 64 47 view .LVU769
	vpaddd	xmm3, xmm3, xmm0
	.loc 1 64 59 view .LVU770
	vmovdqu	xmm0, XMMWORD PTR -112[rdx]
	vpmulld	xmm0, xmm0, XMMWORD PTR -112[rax]
	.loc 1 64 47 view .LVU771
	vpaddd	xmm4, xmm4, xmm0
	.loc 1 64 59 view .LVU772
	vmovdqu	xmm0, XMMWORD PTR -96[rdx]
	vpmulld	xmm0, xmm0, XMMWORD PTR -96[rax]
	.loc 1 64 47 view .LVU773
	vpaddd	xmm6, xmm6, xmm0
	.loc 1 64 59 view .LVU774
	vmovdqu	xmm0, XMMWORD PTR -80[rdx]
	vpmulld	xmm0, xmm0, XMMWORD PTR -80[rax]
	.loc 1 64 47 view .LVU775
	vpaddd	xmm7, xmm7, xmm0
	.loc 1 64 59 view .LVU776
	vmovdqu	xmm0, XMMWORD PTR -64[rdx]
	vpmulld	xmm0, xmm0, XMMWORD PTR -64[rax]
	.loc 1 64 47 view .LVU777
	vpaddd	xmm8, xmm8, xmm0
	.loc 1 64 59 view .LVU778
	vmovdqu	xmm0, XMMWORD PTR -48[rdx]
	vpmulld	xmm0, xmm0, XMMWORD PTR -48[rax]
	.loc 1 64 47 view .LVU779
	vpaddd	xmm1, xmm1, xmm0
	.loc 1 64 59 view .LVU780
	vmovdqu	xmm0, XMMWORD PTR -32[rdx]
	vpmulld	xmm0, xmm0, XMMWORD PTR -32[rax]
	.loc 1 64 47 view .LVU781
	vpaddd	xmm2, xmm2, xmm0
	.loc 1 64 59 view .LVU782
	vmovdqu	xmm0, XMMWORD PTR -16[rdx]
	vpmulld	xmm0, xmm0, XMMWORD PTR -16[rax]
	.loc 1 64 47 view .LVU783
	vpaddd	xmm5, xmm5, xmm0
.LVL291:
	.loc 1 64 47 view .LVU784
.LBE75:
.LBE77:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU785
	cmp	r8, rcx
	jnb	.L342
	vmovdqu	XMMWORD PTR [rsp], xmm3
	vmovdqu	XMMWORD PTR 16[rsp], xmm4
	vmovdqu	XMMWORD PTR 32[rsp], xmm6
	vmovdqu	XMMWORD PTR 48[rsp], xmm7
	vmovdqu	XMMWORD PTR 64[rsp], xmm8
	vmovdqu	XMMWORD PTR 80[rsp], xmm1
	vmovdqu	XMMWORD PTR 96[rsp], xmm2
	vmovdqu	XMMWORD PTR 112[rsp], xmm5
.L341:
.LVL292:
	.loc 1 62 18 is_stmt 0 discriminator 1 view .LVU786
.LBE71:
.LBB78:
	.loc 1 67 26 is_stmt 1 discriminator 1 view .LVU787
	.loc 1 67 5 discriminator 3 view .LVU788
	.loc 1 67 26 discriminator 1 view .LVU789
	.loc 1 67 38 is_stmt 0 discriminator 3 view .LVU790
	vpaddd	xmm0, xmm3, XMMWORD PTR 16[rsp]
.LVL293:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU791
	.loc 1 67 26 discriminator 1 view .LVU792
	.loc 1 67 38 is_stmt 0 discriminator 3 view .LVU793
	vpaddd	xmm0, xmm0, XMMWORD PTR 32[rsp]
.LVL294:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU794
	.loc 1 67 26 discriminator 1 view .LVU795
	.loc 1 67 38 is_stmt 0 discriminator 3 view .LVU796
	vpaddd	xmm0, xmm0, XMMWORD PTR 48[rsp]
.LVL295:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU797
	.loc 1 67 26 discriminator 1 view .LVU798
	.loc 1 67 38 is_stmt 0 discriminator 3 view .LVU799
	vpaddd	xmm0, xmm0, XMMWORD PTR 64[rsp]
.LVL296:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU800
	.loc 1 67 26 discriminator 1 view .LVU801
	.loc 1 67 38 is_stmt 0 discriminator 3 view .LVU802
	vpaddd	xmm0, xmm0, XMMWORD PTR 80[rsp]
.LVL297:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU803
	.loc 1 67 26 discriminator 1 view .LVU804
	.loc 1 67 38 is_stmt 0 discriminator 3 view .LVU805
	vpaddd	xmm0, xmm0, XMMWORD PTR 96[rsp]
.LVL298:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU806
	.loc 1 67 26 discriminator 1 view .LVU807
	.loc 1 67 38 is_stmt 0 discriminator 3 view .LVU808
	vpaddd	xmm0, xmm0, XMMWORD PTR 112[rsp]
.LVL299:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU809
	.loc 1 67 26 discriminator 1 view .LVU810
	vpsrldq	xmm1, xmm0, 8
	vpaddd	xmm0, xmm0, xmm1
	vpsrldq	xmm1, xmm0, 4
	vpaddd	xmm0, xmm0, xmm1
	vmovd	eax, xmm0
.LVL300:
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU811
.LBE78:
	.loc 1 68 14 is_stmt 1 discriminator 1 view .LVU812
	cmp	r9, r8
	jnb	.L340
	mov	rdi, r8
	sub	rdi, r9
	lea	rdx, -1[rdi]
	cmp	rdx, 2
	jbe	.L345
	mov	r10, rdi
	lea	rcx, 0[0+r9*4]
	xor	edx, edx
	vpxor	xmm1, xmm1, xmm1
	shr	r10, 2
	lea	rsi, [r11+rcx]
	add	rcx, rbx
	sal	r10, 4
.LVL301:
	.p2align 4
	.p2align 3
.L346:
	.loc 1 68 34 is_stmt 0 discriminator 2 view .LVU813
	vmovdqu	xmm2, XMMWORD PTR [rcx+rdx]
	vpmulld	xmm0, xmm2, XMMWORD PTR [rsi+rdx]
	add	rdx, 16
	.loc 1 68 26 discriminator 2 view .LVU814
	vpaddd	xmm1, xmm1, xmm0
.LVL302:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU815
	.loc 1 68 14 discriminator 1 view .LVU816
	cmp	r10, rdx
	jne	.L346
	vpsrldq	xmm0, xmm1, 8
	vpaddd	xmm1, xmm1, xmm0
	vpsrldq	xmm0, xmm1, 4
	vpaddd	xmm1, xmm1, xmm0
	vmovd	edx, xmm1
	add	eax, edx
	test	dil, 3
	je	.L340
	and	rdi, -4
	add	r9, rdi
.LVL303:
.L345:
	.loc 1 68 30 is_stmt 0 discriminator 2 view .LVU817
	lea	rcx, 0[0+r9*4]
	.loc 1 68 34 discriminator 2 view .LVU818
	mov	edx, DWORD PTR [r11+rcx]
	imul	edx, DWORD PTR [rbx+rcx]
	.loc 1 68 26 discriminator 2 view .LVU819
	add	eax, edx
.LVL304:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU820
	.loc 1 68 14 discriminator 1 view .LVU821
	.loc 1 68 5 is_stmt 0 discriminator 2 view .LVU822
	lea	rdx, 1[r9]
	.loc 1 68 14 discriminator 1 view .LVU823
	cmp	rdx, r8
	jnb	.L340
	.loc 1 68 34 discriminator 2 view .LVU824
	mov	edx, DWORD PTR 4[r11+rcx]
	imul	edx, DWORD PTR 4[rbx+rcx]
	.loc 1 68 26 discriminator 2 view .LVU825
	add	eax, edx
.LVL305:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU826
	.loc 1 68 14 discriminator 1 view .LVU827
	.loc 1 68 5 is_stmt 0 discriminator 2 view .LVU828
	lea	rdx, 2[r9]
	.loc 1 68 14 discriminator 1 view .LVU829
	cmp	rdx, r8
	jnb	.L340
	.loc 1 68 34 discriminator 2 view .LVU830
	mov	edx, DWORD PTR 8[rbx+rcx]
	imul	edx, DWORD PTR 8[r11+rcx]
	.loc 1 68 26 discriminator 2 view .LVU831
	add	eax, edx
.LVL306:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU832
	.loc 1 68 14 discriminator 1 view .LVU833
.L340:
	.loc 1 68 14 is_stmt 0 discriminator 1 view .LVU834
	vzeroupper
.LVL307:
	.loc 1 70 1 view .LVU835
	vmovups	xmm6, XMMWORD PTR 128[rsp]
	vmovups	xmm7, XMMWORD PTR 144[rsp]
	vmovups	xmm8, XMMWORD PTR 160[rsp]
	add	rsp, 176
	.cfi_remember_state
	.cfi_restore 25
	.cfi_restore 24
	.cfi_restore 23
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 24
.LVL308:
	.loc 1 70 1 view .LVU836
	pop	rsi
	.cfi_restore 4
	.cfi_def_cfa_offset 16
	pop	rdi
	.cfi_restore 5
	.cfi_def_cfa_offset 8
	ret
.LVL309:
.L349:
	.cfi_restore_state
	.loc 1 70 1 view .LVU837
	vmovdqu	xmm3, XMMWORD PTR [rsp]
	.loc 1 61 12 view .LVU838
	xor	r9d, r9d
	jmp	.L341
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
.LVL310:
.LFB54:
	.loc 1 76 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 76 15 is_stmt 0 view .LVU840
	.seh_endprologue
.LVL311:
.LBB79:
	.loc 1 77 26 is_stmt 1 discriminator 1 view .LVU841
.LBE79:
	.loc 1 76 15 is_stmt 0 view .LVU842
	mov	r10d, ecx
	mov	rcx, rdx
.LVL312:
.LBB80:
	.loc 1 77 26 discriminator 1 view .LVU843
	test	r9, r9
	je	.L369
	lea	rax, -1[r9]
	cmp	rax, 2
	jbe	.L361
	mov	rdx, r9
.LVL313:
	.loc 1 77 26 discriminator 1 view .LVU844
	vmovd	xmm2, r10d
	xor	eax, eax
	vpshufd	xmm1, xmm2, 0
	shr	rdx, 2
	sal	rdx, 4
.LVL314:
	.p2align 4
	.p2align 3
.L359:
	.loc 1 77 45 discriminator 3 view .LVU845
	vpmulld	xmm0, xmm1, XMMWORD PTR [rcx+rax]
	.loc 1 77 52 discriminator 3 view .LVU846
	vpaddd	xmm0, xmm0, XMMWORD PTR [r8+rax]
	.loc 1 77 41 discriminator 3 view .LVU847
	vmovdqu	XMMWORD PTR [r8+rax], xmm0
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU848
	.loc 1 77 26 discriminator 1 view .LVU849
	add	rax, 16
	cmp	rax, rdx
	jne	.L359
	test	r9b, 3
	je	.L369
	mov	rax, r9
	and	rax, -4
.L358:
.LVL315:
	.loc 1 77 45 is_stmt 0 discriminator 3 view .LVU850
	mov	r11d, DWORD PTR [rcx+rax*4]
	.loc 1 77 48 discriminator 3 view .LVU851
	lea	rdx, 0[0+rax*4]
	.loc 1 77 45 discriminator 3 view .LVU852
	imul	r11d, r10d
	.loc 1 77 52 discriminator 3 view .LVU853
	add	DWORD PTR [r8+rax*4], r11d
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU854
	.loc 1 77 26 discriminator 1 view .LVU855
	.loc 1 77 5 is_stmt 0 discriminator 3 view .LVU856
	lea	r11, 1[rax]
	.loc 1 77 26 discriminator 1 view .LVU857
	cmp	r11, r9
	jnb	.L369
	.loc 1 77 45 discriminator 3 view .LVU858
	mov	r11d, DWORD PTR 4[rcx+rdx]
	.loc 1 77 5 discriminator 3 view .LVU859
	add	rax, 2
	.loc 1 77 45 discriminator 3 view .LVU860
	imul	r11d, r10d
	.loc 1 77 52 discriminator 3 view .LVU861
	add	DWORD PTR 4[r8+rdx], r11d
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU862
	.loc 1 77 26 discriminator 1 view .LVU863
	cmp	rax, r9
	jnb	.L369
	.loc 1 77 45 is_stmt 0 discriminator 3 view .LVU864
	mov	eax, DWORD PTR 8[rcx+rdx]
	imul	eax, r10d
	.loc 1 77 52 discriminator 3 view .LVU865
	add	DWORD PTR 8[r8+rdx], eax
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU866
	.loc 1 77 26 discriminator 1 view .LVU867
.LVL316:
.L369:
	.loc 1 77 26 is_stmt 0 discriminator 1 view .LVU868
.LBE80:
	.loc 1 78 1 view .LVU869
	ret
.LVL317:
.L361:
.LBB81:
	.loc 1 77 17 view .LVU870
	xor	eax, eax
	jmp	.L358
.LBE81:
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
.LVL318:
.LFB55:
	.loc 1 81 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 81 15 is_stmt 0 view .LVU872
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.seh_endprologue
.LVL319:
.LBB82:
	.loc 1 82 26 is_stmt 1 discriminator 1 view .LVU873
	test	r9, r9
	je	.L387
	cmp	QWORD PTR 48[rsp], 1
	jne	.L388
	lea	rax, -1[r9]
	cmp	rax, 2
	jbe	.L378
	mov	r10, r9
	vmovd	xmm2, ecx
	xor	eax, eax
	vpshufd	xmm1, xmm2, 0
	shr	r10, 2
	sal	r10, 4
.LVL320:
	.p2align 4
	.p2align 3
.L376:
	.loc 1 82 49 is_stmt 0 discriminator 3 view .LVU874
	vpmulld	xmm0, xmm1, XMMWORD PTR [rdx+rax]
	.loc 1 82 60 discriminator 3 view .LVU875
	vpaddd	xmm0, xmm0, XMMWORD PTR [r8+rax]
	.loc 1 82 45 discriminator 3 view .LVU876
	vmovdqu	XMMWORD PTR [r8+rax], xmm0
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU877
	.loc 1 82 26 discriminator 1 view .LVU878
	add	rax, 16
	cmp	rax, r10
	jne	.L376
	mov	rax, r9
	and	rax, -4
	test	r9b, 3
	je	.L387
.L375:
.LVL321:
	.loc 1 82 49 is_stmt 0 discriminator 3 view .LVU879
	mov	r11d, DWORD PTR [rdx+rax*4]
	.loc 1 82 52 discriminator 3 view .LVU880
	lea	r10, 0[0+rax*4]
	.loc 1 82 49 discriminator 3 view .LVU881
	imul	r11d, ecx
	.loc 1 82 60 discriminator 3 view .LVU882
	add	DWORD PTR [r8+rax*4], r11d
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU883
	.loc 1 82 26 discriminator 1 view .LVU884
	.loc 1 82 5 is_stmt 0 discriminator 3 view .LVU885
	lea	r11, 1[rax]
	.loc 1 82 26 discriminator 1 view .LVU886
	cmp	r11, r9
	jnb	.L387
	.loc 1 82 49 discriminator 3 view .LVU887
	mov	r11d, DWORD PTR 4[rdx+r10]
	.loc 1 82 5 discriminator 3 view .LVU888
	add	rax, 2
	.loc 1 82 49 discriminator 3 view .LVU889
	imul	r11d, ecx
	.loc 1 82 60 discriminator 3 view .LVU890
	add	DWORD PTR 4[r8+r10], r11d
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU891
	.loc 1 82 26 discriminator 1 view .LVU892
	cmp	rax, r9
	jnb	.L387
	.loc 1 82 49 is_stmt 0 discriminator 3 view .LVU893
	imul	ecx, DWORD PTR 8[rdx+r10]
.LVL322:
	.loc 1 82 60 discriminator 3 view .LVU894
	add	DWORD PTR 8[r8+r10], ecx
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU895
	.loc 1 82 26 discriminator 1 view .LVU896
.LVL323:
.L387:
	.loc 1 82 26 is_stmt 0 discriminator 1 view .LVU897
.LBE82:
	.loc 1 83 1 view .LVU898
	pop	rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
.LVL324:
	.p2align 4
	.p2align 3
.L388:
	.cfi_restore_state
	.loc 1 83 1 view .LVU899
	mov	rax, QWORD PTR 48[rsp]
.LBB83:
	.loc 1 82 17 view .LVU900
	xor	r10d, r10d
	lea	r11, 0[0+rax*4]
	.loc 1 82 26 discriminator 1 view .LVU901
	xor	eax, eax
.LVL325:
	.p2align 4
	.p2align 3
.L373:
	.loc 1 82 49 discriminator 3 view .LVU902
	mov	ebx, DWORD PTR [rdx+rax]
	.loc 1 82 5 discriminator 3 view .LVU903
	inc	r10
.LVL326:
	.loc 1 82 49 discriminator 3 view .LVU904
	imul	ebx, ecx
	.loc 1 82 60 discriminator 3 view .LVU905
	add	DWORD PTR [r8+rax], ebx
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU906
.LVL327:
	.loc 1 82 26 discriminator 1 view .LVU907
	add	rax, r11
	cmp	r9, r10
	jne	.L373
.LBE83:
	.loc 1 83 1 is_stmt 0 view .LVU908
	pop	rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
.LVL328:
.L378:
	.cfi_restore_state
.LBB84:
	.loc 1 82 17 view .LVU909
	xor	eax, eax
	jmp	.L375
.LBE84:
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
.LVL329:
.LFB56:
	.loc 1 86 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 86 15 is_stmt 0 view .LVU911
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
.LVL330:
.LBB85:
	.loc 1 88 26 is_stmt 1 discriminator 1 view .LVU912
.LBE85:
	.loc 1 86 15 is_stmt 0 view .LVU913
	mov	rdi, QWORD PTR 72[rsp]
	mov	ebx, ecx
.LBB86:
	.loc 1 88 26 discriminator 1 view .LVU914
	test	rdi, rdi
	je	.L402
	lea	rax, -1[rdi]
	cmp	rax, 2
	jbe	.L394
	mov	rsi, rdi
	vmovd	xmm3, ecx
	xor	eax, eax
	vpshufd	xmm2, xmm3, 0
	shr	rsi, 2
	sal	rsi, 4
.LVL331:
	.p2align 4
	.p2align 3
.L392:
	.loc 1 88 26 discriminator 1 view .LVU915
	lea	rcx, [r9+rax]
	.loc 1 88 48 discriminator 3 view .LVU916
	movsx	r11, DWORD PTR [rcx]
	movsx	r10, DWORD PTR 4[rcx]
	movsx	rbp, DWORD PTR 8[rcx]
	movsx	rcx, DWORD PTR 12[rcx]
	vmovd	xmm0, DWORD PTR [rdx+r11*4]
	vpinsrd	xmm0, xmm0, DWORD PTR [rdx+r10*4], 1
	vmovd	xmm1, DWORD PTR [rdx+rbp*4]
	vpinsrd	xmm1, xmm1, DWORD PTR [rdx+rcx*4], 1
	vpunpcklqdq	xmm0, xmm0, xmm1
	.loc 1 88 45 discriminator 3 view .LVU917
	vpmulld	xmm0, xmm0, xmm2
	.loc 1 88 57 discriminator 3 view .LVU918
	vpaddd	xmm0, xmm0, XMMWORD PTR [r8+rax]
	.loc 1 88 41 discriminator 3 view .LVU919
	vmovdqu	XMMWORD PTR [r8+rax], xmm0
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU920
	.loc 1 88 26 discriminator 1 view .LVU921
	add	rax, 16
	cmp	rsi, rax
	jne	.L392
	test	dil, 3
	je	.L402
	mov	rax, rdi
	and	rax, -4
.LVL332:
.L391:
	.loc 1 88 54 is_stmt 0 discriminator 3 view .LVU922
	movsx	r10, DWORD PTR [r9+rax*4]
	lea	rcx, 0[0+rax*4]
	.loc 1 88 45 discriminator 3 view .LVU923
	mov	esi, DWORD PTR [rdx+r10*4]
	.loc 1 88 5 discriminator 3 view .LVU924
	lea	r10, 1[rax]
	.loc 1 88 45 discriminator 3 view .LVU925
	imul	esi, ebx
	.loc 1 88 57 discriminator 3 view .LVU926
	add	DWORD PTR [r8+rax*4], esi
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU927
	.loc 1 88 26 discriminator 1 view .LVU928
	cmp	r10, rdi
	jnb	.L402
	.loc 1 88 54 is_stmt 0 discriminator 3 view .LVU929
	movsx	r10, DWORD PTR 4[r9+rcx]
	.loc 1 88 5 discriminator 3 view .LVU930
	add	rax, 2
	.loc 1 88 45 discriminator 3 view .LVU931
	mov	esi, DWORD PTR [rdx+r10*4]
	imul	esi, ebx
	.loc 1 88 57 discriminator 3 view .LVU932
	add	DWORD PTR 4[r8+rcx], esi
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU933
	.loc 1 88 26 discriminator 1 view .LVU934
	cmp	rax, rdi
	jnb	.L402
	.loc 1 88 54 is_stmt 0 discriminator 3 view .LVU935
	movsx	rax, DWORD PTR 8[r9+rcx]
	.loc 1 88 45 discriminator 3 view .LVU936
	imul	ebx, DWORD PTR [rdx+rax*4]
.LVL333:
	.loc 1 88 57 discriminator 3 view .LVU937
	add	DWORD PTR 8[r8+rcx], ebx
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU938
	.loc 1 88 26 discriminator 1 view .LVU939
.LVL334:
.L402:
	.loc 1 88 26 is_stmt 0 discriminator 1 view .LVU940
.LBE86:
	.loc 1 89 1 view .LVU941
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
.LVL335:
	.loc 1 89 1 view .LVU942
	pop	rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	ret
.LVL336:
.L394:
	.cfi_restore_state
.LBB87:
	.loc 1 88 17 view .LVU943
	xor	eax, eax
	jmp	.L391
.LBE87:
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
.LVL337:
.LFB57:
	.loc 1 95 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 95 15 is_stmt 0 view .LVU945
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.seh_endprologue
.LVL338:
.LBB88:
	.loc 1 96 26 is_stmt 1 discriminator 1 view .LVU946
	test	r9, r9
	je	.L416
	lea	rax, -1[r9]
	cmp	rax, 2
	jbe	.L408
	mov	r10, r9
	xor	eax, eax
	shr	r10, 2
	sal	r10, 4
.LVL339:
	.p2align 4
	.p2align 3
.L406:
	.loc 1 96 48 is_stmt 0 discriminator 3 view .LVU947
	vmovdqu	xmm1, XMMWORD PTR [rcx+rax]
	vpmulld	xmm0, xmm1, XMMWORD PTR [rdx+rax]
	.loc 1 96 41 discriminator 3 view .LVU948
	vmovdqu	XMMWORD PTR [r8+rax], xmm0
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU949
	.loc 1 96 26 discriminator 1 view .LVU950
	add	rax, 16
	cmp	rax, r10
	jne	.L406
	test	r9b, 3
	je	.L416
	mov	r10, r9
	and	r10, -4
.L405:
.LVL340:
	.loc 1 96 44 is_stmt 0 discriminator 3 view .LVU951
	lea	rax, 0[0+r10*4]
	.loc 1 96 48 discriminator 3 view .LVU952
	mov	r11d, DWORD PTR [rcx+rax]
	imul	r11d, DWORD PTR [rdx+rax]
	.loc 1 96 41 discriminator 3 view .LVU953
	mov	DWORD PTR [r8+rax], r11d
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU954
	.loc 1 96 26 discriminator 1 view .LVU955
	.loc 1 96 5 is_stmt 0 discriminator 3 view .LVU956
	lea	r11, 1[r10]
	.loc 1 96 26 discriminator 1 view .LVU957
	cmp	r11, r9
	jnb	.L416
	.loc 1 96 48 discriminator 3 view .LVU958
	mov	ebx, DWORD PTR 4[rcx+rax]
	imul	ebx, DWORD PTR 4[rdx+rax]
	.loc 1 96 5 discriminator 3 view .LVU959
	add	r10, 2
	.loc 1 96 41 discriminator 3 view .LVU960
	mov	DWORD PTR 4[r8+rax], ebx
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU961
	.loc 1 96 26 discriminator 1 view .LVU962
	cmp	r10, r9
	jnb	.L416
	.loc 1 96 48 is_stmt 0 discriminator 3 view .LVU963
	mov	edx, DWORD PTR 8[rdx+rax]
.LVL341:
	.loc 1 96 48 discriminator 3 view .LVU964
	imul	edx, DWORD PTR 8[rcx+rax]
	.loc 1 96 41 discriminator 3 view .LVU965
	mov	DWORD PTR 8[r8+rax], edx
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU966
	.loc 1 96 26 discriminator 1 view .LVU967
.LVL342:
.L416:
	.loc 1 96 26 is_stmt 0 discriminator 1 view .LVU968
.LBE88:
	.loc 1 97 1 view .LVU969
	pop	rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
.LVL343:
.L408:
	.cfi_restore_state
.LBB89:
	.loc 1 96 17 view .LVU970
	xor	r10d, r10d
	jmp	.L405
.LBE89:
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
.LVL344:
.LFB58:
	.loc 1 147 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 147 13 is_stmt 0 view .LVU972
	.seh_endprologue
	.loc 1 148 17 view .LVU973
	fldz
	.loc 1 147 13 view .LVU974
	mov	rax, rcx
	.loc 1 148 17 view .LVU975
	fstp	TBYTE PTR [rcx]
	fld	TBYTE PTR [rcx]
.LVL345:
.LBB90:
	.loc 1 149 26 is_stmt 1 discriminator 1 view .LVU976
	test	r9, r9
	je	.L424
	.loc 1 149 17 is_stmt 0 view .LVU977
	xor	r10d, r10d
.LVL346:
	.p2align 4
	.p2align 3
.L419:
	.loc 1 149 41 discriminator 3 view .LVU978
	fild	DWORD PTR [rdx+r10*4]
	.loc 1 149 61 discriminator 3 view .LVU979
	fild	DWORD PTR [r8+r10*4]
	.loc 1 149 5 discriminator 3 view .LVU980
	inc	r10
.LVL347:
	.loc 1 149 59 discriminator 3 view .LVU981
	fmulp	st(1), st
	.loc 1 149 38 discriminator 3 view .LVU982
	faddp	st(1), st
	.loc 1 149 5 is_stmt 1 discriminator 3 view .LVU983
.LVL348:
	.loc 1 149 26 discriminator 1 view .LVU984
	cmp	r9, r10
	jne	.L419
	fstp	TBYTE PTR [rax]
.LBE90:
	.loc 1 150 12 is_stmt 0 view .LVU985
	jmp	.L417
.LVL349:
	.p2align 4
	.p2align 3
.L424:
	.loc 1 150 12 view .LVU986
	ffreep	st(0)
.LVL350:
.L417:
	.loc 1 151 1 view .LVU987
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
.LVL351:
.LFB59:
	.loc 1 154 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 154 13 is_stmt 0 view .LVU989
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
	.loc 1 154 52 view .LVU990
	mov	DWORD PTR 12[rsp], edx
	fild	DWORD PTR 12[rsp]
	.loc 1 154 69 view .LVU991
	mov	DWORD PTR 12[rsp], r8d
	.loc 1 154 13 view .LVU992
	mov	rax, rcx
	.loc 1 154 69 view .LVU993
	fild	DWORD PTR 12[rsp]
	.loc 1 154 86 view .LVU994
	mov	DWORD PTR 12[rsp], r9d
	.loc 1 154 67 view .LVU995
	fmulp	st(1), st
	.loc 1 154 86 view .LVU996
	fild	DWORD PTR 12[rsp]
	.loc 1 154 84 view .LVU997
	faddp	st(1), st
	.loc 1 154 99 view .LVU998
	fstp	TBYTE PTR [rcx]
	.loc 1 154 102 view .LVU999
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
.LVL352:
.LFB60:
	.loc 1 157 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 157 13 is_stmt 0 view .LVU1001
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
	.loc 1 157 46 view .LVU1002
	mov	DWORD PTR 12[rsp], edx
	fild	DWORD PTR 12[rsp]
	.loc 1 157 63 view .LVU1003
	mov	DWORD PTR 12[rsp], r8d
	.loc 1 157 13 view .LVU1004
	mov	rax, rcx
	.loc 1 157 63 view .LVU1005
	fild	DWORD PTR 12[rsp]
	.loc 1 157 61 view .LVU1006
	fmulp	st(1), st
	.loc 1 157 76 view .LVU1007
	fstp	TBYTE PTR [rcx]
	.loc 1 157 79 view .LVU1008
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
.LVL353:
.LFB61:
	.loc 1 115 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 115 12 is_stmt 0 view .LVU1010
	sub	rsp, 552
	.seh_stackalloc	552
	.cfi_def_cfa_offset 560
	vmovups	XMMWORD PTR 400[rsp], xmm6
	.seh_savexmm	xmm6, 400
	vmovups	XMMWORD PTR 416[rsp], xmm7
	.seh_savexmm	xmm7, 416
	vmovups	XMMWORD PTR 432[rsp], xmm8
	.seh_savexmm	xmm8, 432
	vmovups	XMMWORD PTR 448[rsp], xmm9
	.seh_savexmm	xmm9, 448
	vmovups	XMMWORD PTR 464[rsp], xmm10
	.seh_savexmm	xmm10, 464
	vmovups	XMMWORD PTR 480[rsp], xmm11
	.seh_savexmm	xmm11, 480
	vmovups	XMMWORD PTR 496[rsp], xmm12
	.seh_savexmm	xmm12, 496
	vmovups	XMMWORD PTR 512[rsp], xmm13
	.seh_savexmm	xmm13, 512
	vmovups	XMMWORD PTR 528[rsp], xmm14
	.seh_savexmm	xmm14, 528
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
.LVL354:
.LBB91:
	.loc 1 125 23 is_stmt 1 discriminator 1 view .LVU1011
	.loc 1 125 5 discriminator 3 view .LVU1012
	.loc 1 125 23 discriminator 1 view .LVU1013
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1014
	vbroadcastss	ymm13, DWORD PTR .LC25[rip]
	vbroadcastss	ymm12, DWORD PTR .LC23[rip]
.LBE91:
	.loc 1 126 13 view .LVU1015
	vxorps	xmm14, xmm14, xmm14
.LBB92:
	.loc 1 125 40 discriminator 3 view .LVU1016
	vbroadcastss	ymm11, DWORD PTR .LC21[rip]
	vbroadcastss	ymm10, DWORD PTR .LC19[rip]
	vbroadcastss	ymm9, DWORD PTR .LC17[rip]
	vbroadcastss	ymm8, DWORD PTR .LC15[rip]
	vbroadcastss	ymm7, DWORD PTR .LC13[rip]
	vbroadcastss	ymm6, DWORD PTR .LC11[rip]
	vbroadcastss	ymm5, DWORD PTR .LC9[rip]
	vbroadcastss	ymm4, DWORD PTR .LC7[rip]
	vbroadcastss	ymm3, DWORD PTR .LC5[rip]
.LBE92:
	.loc 1 126 13 view .LVU1017
	vaddss	xmm0, xmm1, xmm14
	.loc 1 126 27 view .LVU1018
	vaddss	xmm1, xmm2, xmm14
.LVL355:
	.loc 1 115 12 view .LVU1019
	lea	rax, 31[rsp]
	and	rax, -32
.LBB93:
	.loc 1 127 28 discriminator 1 view .LVU1020
	vbroadcastss	ymm2, DWORD PTR .LC27[rip]
.LVL356:
	.loc 1 127 28 discriminator 1 view .LVU1021
.LBE93:
.LBB96:
	.loc 1 125 40 discriminator 3 view .LVU1022
	vmovups	YMMWORD PTR 32[rax], ymm13
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1023
.LVL357:
	.loc 1 125 23 discriminator 1 view .LVU1024
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1025
	vmovups	YMMWORD PTR 64[rax], ymm12
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1026
.LVL358:
	.loc 1 125 23 discriminator 1 view .LVU1027
	.loc 1 125 23 is_stmt 0 discriminator 1 view .LVU1028
.LBE96:
	.loc 1 126 13 view .LVU1029
	vbroadcastss	ymm0, xmm0
	.loc 1 126 27 view .LVU1030
	vbroadcastss	ymm1, xmm1
.LBB97:
	.loc 1 125 40 discriminator 3 view .LVU1031
	vmovups	YMMWORD PTR 96[rax], ymm11
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1032
.LVL359:
	.loc 1 125 23 discriminator 1 view .LVU1033
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1034
	vmovups	YMMWORD PTR 128[rax], ymm10
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1035
.LVL360:
	.loc 1 125 23 discriminator 1 view .LVU1036
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1037
	vmovups	YMMWORD PTR 160[rax], ymm9
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1038
.LVL361:
	.loc 1 125 23 discriminator 1 view .LVU1039
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1040
	vmovups	YMMWORD PTR 192[rax], ymm8
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1041
.LVL362:
	.loc 1 125 23 discriminator 1 view .LVU1042
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1043
	vmovups	YMMWORD PTR 224[rax], ymm7
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1044
.LVL363:
	.loc 1 125 23 discriminator 1 view .LVU1045
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1046
	vmovups	YMMWORD PTR 256[rax], ymm6
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1047
.LVL364:
	.loc 1 125 23 discriminator 1 view .LVU1048
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1049
	vmovups	YMMWORD PTR 288[rax], ymm5
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1050
.LVL365:
	.loc 1 125 23 discriminator 1 view .LVU1051
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1052
	vmovups	YMMWORD PTR 320[rax], ymm4
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1053
.LVL366:
	.loc 1 125 23 discriminator 1 view .LVU1054
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1055
	vmovups	YMMWORD PTR 352[rax], ymm3
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1056
.LVL367:
	.loc 1 125 23 discriminator 1 view .LVU1057
	.loc 1 125 23 is_stmt 0 discriminator 1 view .LVU1058
.LBE97:
.LBB98:
	.loc 1 127 28 is_stmt 1 discriminator 1 view .LVU1059
	test	rcx, rcx
	je	.L428
	.loc 1 127 17 is_stmt 0 view .LVU1060
	xor	edx, edx
.LVL368:
	.p2align 4
	.p2align 3
.L429:
.LBB94:
	.loc 1 129 23 is_stmt 1 discriminator 1 view .LVU1061
.LBE94:
	.loc 1 127 5 is_stmt 0 discriminator 2 view .LVU1062
	inc	rdx
.LVL369:
.LBB95:
	.loc 1 129 58 discriminator 3 view .LVU1063
	vfmadd132ps	ymm2, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1064
.LVL370:
	.loc 1 129 23 discriminator 1 view .LVU1065
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1066
	vfmadd132ps	ymm13, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1067
.LVL371:
	.loc 1 129 23 discriminator 1 view .LVU1068
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1069
	vfmadd132ps	ymm12, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1070
.LVL372:
	.loc 1 129 23 discriminator 1 view .LVU1071
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1072
	vfmadd132ps	ymm11, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1073
.LVL373:
	.loc 1 129 23 discriminator 1 view .LVU1074
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1075
	vfmadd132ps	ymm10, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1076
.LVL374:
	.loc 1 129 23 discriminator 1 view .LVU1077
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1078
	vfmadd132ps	ymm9, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1079
.LVL375:
	.loc 1 129 23 discriminator 1 view .LVU1080
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1081
	vfmadd132ps	ymm8, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1082
.LVL376:
	.loc 1 129 23 discriminator 1 view .LVU1083
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1084
	vfmadd132ps	ymm7, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1085
.LVL377:
	.loc 1 129 23 discriminator 1 view .LVU1086
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1087
	vfmadd132ps	ymm6, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1088
.LVL378:
	.loc 1 129 23 discriminator 1 view .LVU1089
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1090
	vfmadd132ps	ymm5, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1091
.LVL379:
	.loc 1 129 23 discriminator 1 view .LVU1092
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1093
	vfmadd132ps	ymm4, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1094
.LVL380:
	.loc 1 129 23 discriminator 1 view .LVU1095
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1096
	vfmadd132ps	ymm3, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1097
.LVL381:
	.loc 1 129 23 discriminator 1 view .LVU1098
.LBE95:
	.loc 1 127 5 discriminator 2 view .LVU1099
	.loc 1 127 28 discriminator 1 view .LVU1100
	cmp	rcx, rdx
	jne	.L429
	vmovups	YMMWORD PTR 32[rax], ymm13
	vmovups	YMMWORD PTR 64[rax], ymm12
	vmovups	YMMWORD PTR 96[rax], ymm11
	vmovups	YMMWORD PTR 128[rax], ymm10
	vmovups	YMMWORD PTR 160[rax], ymm9
	vmovups	YMMWORD PTR 192[rax], ymm8
	vmovups	YMMWORD PTR 224[rax], ymm7
	vmovups	YMMWORD PTR 256[rax], ymm6
	vmovups	YMMWORD PTR 288[rax], ymm5
	vmovups	YMMWORD PTR 320[rax], ymm4
	vmovups	YMMWORD PTR 352[rax], ymm3
.LVL382:
.L428:
	.loc 1 127 28 is_stmt 0 discriminator 1 view .LVU1101
.LBE98:
.LBB99:
	.loc 1 132 23 is_stmt 1 discriminator 1 view .LVU1102
	.loc 1 132 5 discriminator 3 view .LVU1103
	.loc 1 132 23 discriminator 1 view .LVU1104
	.loc 1 132 5 discriminator 3 view .LVU1105
	.loc 1 132 23 discriminator 1 view .LVU1106
	.loc 1 132 5 discriminator 3 view .LVU1107
	.loc 1 132 23 discriminator 1 view .LVU1108
	.loc 1 132 5 discriminator 3 view .LVU1109
	.loc 1 132 23 discriminator 1 view .LVU1110
	.loc 1 132 5 discriminator 3 view .LVU1111
	.loc 1 132 23 discriminator 1 view .LVU1112
	.loc 1 132 5 discriminator 3 view .LVU1113
	.loc 1 132 23 discriminator 1 view .LVU1114
	.loc 1 132 5 discriminator 3 view .LVU1115
	.loc 1 132 23 discriminator 1 view .LVU1116
	.loc 1 132 5 discriminator 3 view .LVU1117
	.loc 1 132 23 discriminator 1 view .LVU1118
	.loc 1 132 5 discriminator 3 view .LVU1119
	.loc 1 132 23 discriminator 1 view .LVU1120
	.loc 1 132 5 discriminator 3 view .LVU1121
	.loc 1 132 23 discriminator 1 view .LVU1122
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU1123
	vaddps	ymm1, ymm2, YMMWORD PTR 32[rax]
.LVL383:
	.loc 1 132 35 discriminator 3 view .LVU1124
	vxorps	xmm3, xmm3, xmm3
	vaddps	ymm1, ymm1, YMMWORD PTR 64[rax]
	vaddps	ymm1, ymm1, YMMWORD PTR 96[rax]
	vaddps	ymm1, ymm1, YMMWORD PTR 128[rax]
	vaddps	ymm1, ymm1, YMMWORD PTR 160[rax]
	vaddps	ymm1, ymm1, YMMWORD PTR 192[rax]
	vaddps	ymm1, ymm1, YMMWORD PTR 224[rax]
	vaddps	ymm1, ymm1, YMMWORD PTR 256[rax]
	vaddps	ymm1, ymm1, YMMWORD PTR 288[rax]
	vaddps	ymm1, ymm1, YMMWORD PTR 320[rax]
	vaddps	ymm1, ymm1, YMMWORD PTR 352[rax]
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU1125
.LVL384:
	.loc 1 132 23 discriminator 1 view .LVU1126
	.loc 1 132 23 is_stmt 0 discriminator 1 view .LVU1127
.LBE99:
	.loc 1 133 21 view .LVU1128
	mov	rax, QWORD PTR .LC28[rip]
	mov	QWORD PTR [r9], rax
.LVL385:
.LBB100:
	.loc 1 138 23 is_stmt 1 discriminator 1 view .LVU1129
	.loc 1 138 23 is_stmt 0 discriminator 1 view .LVU1130
	vaddss	xmm0, xmm1, xmm3
.LVL386:
	.loc 1 138 23 discriminator 1 view .LVU1131
	vshufps	xmm3, xmm1, xmm1, 85
	.loc 1 138 35 discriminator 3 view .LVU1132
	vshufps	xmm2, xmm1, xmm1, 255
	vaddss	xmm3, xmm3, xmm0
	vunpckhps	xmm0, xmm1, xmm1
	vextractf128	xmm1, ymm1, 0x1
.LVL387:
	.loc 1 138 35 discriminator 3 view .LVU1133
	vaddss	xmm0, xmm0, xmm3
	vaddss	xmm0, xmm0, xmm2
.LVL388:
	.loc 1 138 5 is_stmt 1 discriminator 3 view .LVU1134
	.loc 1 138 23 discriminator 1 view .LVU1135
	.loc 1 138 23 is_stmt 0 discriminator 1 view .LVU1136
	vshufps	xmm2, xmm1, xmm1, 85
	vaddss	xmm0, xmm0, xmm1
.LVL389:
	.loc 1 138 23 discriminator 1 view .LVU1137
	vaddss	xmm2, xmm2, xmm0
	vunpckhps	xmm0, xmm1, xmm1
.LVL390:
	.loc 1 138 5 is_stmt 1 discriminator 3 view .LVU1138
	.loc 1 138 23 discriminator 1 view .LVU1139
	.loc 1 138 35 is_stmt 0 discriminator 3 view .LVU1140
	vshufps	xmm1, xmm1, xmm1, 255
	vaddss	xmm0, xmm0, xmm2
	vaddss	xmm0, xmm0, xmm1
	vzeroupper
.LVL391:
.LBE100:
	.loc 1 141 1 view .LVU1141
	vmovups	xmm6, XMMWORD PTR 400[rsp]
	vmovups	xmm7, XMMWORD PTR 416[rsp]
	vmovups	xmm8, XMMWORD PTR 432[rsp]
	vmovups	xmm9, XMMWORD PTR 448[rsp]
	vmovups	xmm10, XMMWORD PTR 464[rsp]
	vmovups	xmm11, XMMWORD PTR 480[rsp]
	vmovups	xmm12, XMMWORD PTR 496[rsp]
	vmovups	xmm13, XMMWORD PTR 512[rsp]
	vmovups	xmm14, XMMWORD PTR 528[rsp]
.LVL392:
	.loc 1 141 1 view .LVU1142
	add	rsp, 552
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
.LFE61:
	.seh_endproc
	.section	.text$_Z10peak_flopsIdET_yS0_S0_Pd,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z10peak_flopsIdET_yS0_S0_Pd
	.def	_Z10peak_flopsIdET_yS0_S0_Pd;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z10peak_flopsIdET_yS0_S0_Pd
_Z10peak_flopsIdET_yS0_S0_Pd:
.LVL393:
.LFB62:
	.loc 1 115 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 115 12 is_stmt 0 view .LVU1144
	sub	rsp, 552
	.seh_stackalloc	552
	.cfi_def_cfa_offset 560
	vmovups	XMMWORD PTR 400[rsp], xmm6
	.seh_savexmm	xmm6, 400
	vmovups	XMMWORD PTR 416[rsp], xmm7
	.seh_savexmm	xmm7, 416
	vmovups	XMMWORD PTR 432[rsp], xmm8
	.seh_savexmm	xmm8, 432
	vmovups	XMMWORD PTR 448[rsp], xmm9
	.seh_savexmm	xmm9, 448
	vmovups	XMMWORD PTR 464[rsp], xmm10
	.seh_savexmm	xmm10, 464
	vmovups	XMMWORD PTR 480[rsp], xmm11
	.seh_savexmm	xmm11, 480
	vmovups	XMMWORD PTR 496[rsp], xmm12
	.seh_savexmm	xmm12, 496
	vmovups	XMMWORD PTR 512[rsp], xmm13
	.seh_savexmm	xmm13, 512
	vmovups	XMMWORD PTR 528[rsp], xmm14
	.seh_savexmm	xmm14, 528
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
.LVL394:
.LBB101:
	.loc 1 125 23 is_stmt 1 discriminator 1 view .LVU1145
	.loc 1 125 5 discriminator 3 view .LVU1146
	.loc 1 125 23 discriminator 1 view .LVU1147
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1148
	vbroadcastsd	ymm13, QWORD PTR .LC50[rip]
	vbroadcastsd	ymm12, QWORD PTR .LC48[rip]
.LBE101:
	.loc 1 126 13 view .LVU1149
	vxorpd	xmm14, xmm14, xmm14
.LBB102:
	.loc 1 125 40 discriminator 3 view .LVU1150
	vbroadcastsd	ymm11, QWORD PTR .LC46[rip]
	vbroadcastsd	ymm10, QWORD PTR .LC44[rip]
	vbroadcastsd	ymm9, QWORD PTR .LC42[rip]
	vbroadcastsd	ymm8, QWORD PTR .LC40[rip]
	vbroadcastsd	ymm7, QWORD PTR .LC38[rip]
	vbroadcastsd	ymm6, QWORD PTR .LC36[rip]
	vbroadcastsd	ymm5, QWORD PTR .LC34[rip]
	vbroadcastsd	ymm4, QWORD PTR .LC32[rip]
	vbroadcastsd	ymm3, QWORD PTR .LC30[rip]
.LBE102:
	.loc 1 126 13 view .LVU1151
	vaddsd	xmm0, xmm1, xmm14
	.loc 1 126 27 view .LVU1152
	vaddsd	xmm1, xmm2, xmm14
.LVL395:
	.loc 1 115 12 view .LVU1153
	lea	rax, 31[rsp]
	and	rax, -32
.LBB103:
	.loc 1 127 28 discriminator 1 view .LVU1154
	vbroadcastsd	ymm2, QWORD PTR .LC52[rip]
.LVL396:
	.loc 1 127 28 discriminator 1 view .LVU1155
.LBE103:
.LBB106:
	.loc 1 125 40 discriminator 3 view .LVU1156
	vmovupd	YMMWORD PTR 32[rax], ymm13
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1157
.LVL397:
	.loc 1 125 23 discriminator 1 view .LVU1158
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1159
	vmovupd	YMMWORD PTR 64[rax], ymm12
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1160
.LVL398:
	.loc 1 125 23 discriminator 1 view .LVU1161
	.loc 1 125 23 is_stmt 0 discriminator 1 view .LVU1162
.LBE106:
	.loc 1 126 13 view .LVU1163
	vbroadcastsd	ymm0, xmm0
	.loc 1 126 27 view .LVU1164
	vbroadcastsd	ymm1, xmm1
.LBB107:
	.loc 1 125 40 discriminator 3 view .LVU1165
	vmovupd	YMMWORD PTR 96[rax], ymm11
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1166
.LVL399:
	.loc 1 125 23 discriminator 1 view .LVU1167
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1168
	vmovupd	YMMWORD PTR 128[rax], ymm10
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1169
.LVL400:
	.loc 1 125 23 discriminator 1 view .LVU1170
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1171
	vmovupd	YMMWORD PTR 160[rax], ymm9
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1172
.LVL401:
	.loc 1 125 23 discriminator 1 view .LVU1173
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1174
	vmovupd	YMMWORD PTR 192[rax], ymm8
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1175
.LVL402:
	.loc 1 125 23 discriminator 1 view .LVU1176
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1177
	vmovupd	YMMWORD PTR 224[rax], ymm7
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1178
.LVL403:
	.loc 1 125 23 discriminator 1 view .LVU1179
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1180
	vmovupd	YMMWORD PTR 256[rax], ymm6
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1181
.LVL404:
	.loc 1 125 23 discriminator 1 view .LVU1182
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1183
	vmovupd	YMMWORD PTR 288[rax], ymm5
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1184
.LVL405:
	.loc 1 125 23 discriminator 1 view .LVU1185
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1186
	vmovupd	YMMWORD PTR 320[rax], ymm4
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1187
.LVL406:
	.loc 1 125 23 discriminator 1 view .LVU1188
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1189
	vmovupd	YMMWORD PTR 352[rax], ymm3
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1190
.LVL407:
	.loc 1 125 23 discriminator 1 view .LVU1191
	.loc 1 125 23 is_stmt 0 discriminator 1 view .LVU1192
.LBE107:
.LBB108:
	.loc 1 127 28 is_stmt 1 discriminator 1 view .LVU1193
	test	rcx, rcx
	je	.L433
	.loc 1 127 17 is_stmt 0 view .LVU1194
	xor	edx, edx
.LVL408:
	.p2align 4
	.p2align 3
.L434:
.LBB104:
	.loc 1 129 23 is_stmt 1 discriminator 1 view .LVU1195
.LBE104:
	.loc 1 127 5 is_stmt 0 discriminator 2 view .LVU1196
	inc	rdx
.LVL409:
.LBB105:
	.loc 1 129 58 discriminator 3 view .LVU1197
	vfmadd132pd	ymm2, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1198
.LVL410:
	.loc 1 129 23 discriminator 1 view .LVU1199
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1200
	vfmadd132pd	ymm13, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1201
.LVL411:
	.loc 1 129 23 discriminator 1 view .LVU1202
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1203
	vfmadd132pd	ymm12, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1204
.LVL412:
	.loc 1 129 23 discriminator 1 view .LVU1205
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1206
	vfmadd132pd	ymm11, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1207
.LVL413:
	.loc 1 129 23 discriminator 1 view .LVU1208
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1209
	vfmadd132pd	ymm10, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1210
.LVL414:
	.loc 1 129 23 discriminator 1 view .LVU1211
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1212
	vfmadd132pd	ymm9, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1213
.LVL415:
	.loc 1 129 23 discriminator 1 view .LVU1214
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1215
	vfmadd132pd	ymm8, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1216
.LVL416:
	.loc 1 129 23 discriminator 1 view .LVU1217
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1218
	vfmadd132pd	ymm7, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1219
.LVL417:
	.loc 1 129 23 discriminator 1 view .LVU1220
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1221
	vfmadd132pd	ymm6, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1222
.LVL418:
	.loc 1 129 23 discriminator 1 view .LVU1223
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1224
	vfmadd132pd	ymm5, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1225
.LVL419:
	.loc 1 129 23 discriminator 1 view .LVU1226
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1227
	vfmadd132pd	ymm4, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1228
.LVL420:
	.loc 1 129 23 discriminator 1 view .LVU1229
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1230
	vfmadd132pd	ymm3, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1231
.LVL421:
	.loc 1 129 23 discriminator 1 view .LVU1232
.LBE105:
	.loc 1 127 5 discriminator 2 view .LVU1233
	.loc 1 127 28 discriminator 1 view .LVU1234
	cmp	rcx, rdx
	jne	.L434
	vmovupd	YMMWORD PTR 32[rax], ymm13
	vmovupd	YMMWORD PTR 64[rax], ymm12
	vmovupd	YMMWORD PTR 96[rax], ymm11
	vmovupd	YMMWORD PTR 128[rax], ymm10
	vmovupd	YMMWORD PTR 160[rax], ymm9
	vmovupd	YMMWORD PTR 192[rax], ymm8
	vmovupd	YMMWORD PTR 224[rax], ymm7
	vmovupd	YMMWORD PTR 256[rax], ymm6
	vmovupd	YMMWORD PTR 288[rax], ymm5
	vmovupd	YMMWORD PTR 320[rax], ymm4
	vmovupd	YMMWORD PTR 352[rax], ymm3
.LVL422:
.L433:
	.loc 1 127 28 is_stmt 0 discriminator 1 view .LVU1235
.LBE108:
.LBB109:
	.loc 1 132 23 is_stmt 1 discriminator 1 view .LVU1236
	.loc 1 132 5 discriminator 3 view .LVU1237
	.loc 1 132 23 discriminator 1 view .LVU1238
	.loc 1 132 5 discriminator 3 view .LVU1239
	.loc 1 132 23 discriminator 1 view .LVU1240
	.loc 1 132 5 discriminator 3 view .LVU1241
	.loc 1 132 23 discriminator 1 view .LVU1242
	.loc 1 132 5 discriminator 3 view .LVU1243
	.loc 1 132 23 discriminator 1 view .LVU1244
	.loc 1 132 5 discriminator 3 view .LVU1245
	.loc 1 132 23 discriminator 1 view .LVU1246
	.loc 1 132 5 discriminator 3 view .LVU1247
	.loc 1 132 23 discriminator 1 view .LVU1248
	.loc 1 132 5 discriminator 3 view .LVU1249
	.loc 1 132 23 discriminator 1 view .LVU1250
	.loc 1 132 5 discriminator 3 view .LVU1251
	.loc 1 132 23 discriminator 1 view .LVU1252
	.loc 1 132 5 discriminator 3 view .LVU1253
	.loc 1 132 23 discriminator 1 view .LVU1254
	.loc 1 132 5 discriminator 3 view .LVU1255
	.loc 1 132 23 discriminator 1 view .LVU1256
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU1257
	vaddpd	ymm0, ymm2, YMMWORD PTR 32[rax]
.LVL423:
	.loc 1 132 35 discriminator 3 view .LVU1258
.LBE109:
.LBB110:
	.loc 1 138 35 discriminator 3 view .LVU1259
	vxorpd	xmm3, xmm3, xmm3
.LBE110:
.LBB111:
	.loc 1 132 35 discriminator 3 view .LVU1260
	vaddpd	ymm0, ymm0, YMMWORD PTR 64[rax]
	vaddpd	ymm0, ymm0, YMMWORD PTR 96[rax]
	vaddpd	ymm0, ymm0, YMMWORD PTR 128[rax]
	vaddpd	ymm0, ymm0, YMMWORD PTR 160[rax]
	vaddpd	ymm0, ymm0, YMMWORD PTR 192[rax]
	vaddpd	ymm0, ymm0, YMMWORD PTR 224[rax]
	vaddpd	ymm0, ymm0, YMMWORD PTR 256[rax]
	vaddpd	ymm0, ymm0, YMMWORD PTR 288[rax]
	vaddpd	ymm0, ymm0, YMMWORD PTR 320[rax]
	vaddpd	ymm0, ymm0, YMMWORD PTR 352[rax]
.LVL424:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU1261
	.loc 1 132 23 discriminator 1 view .LVU1262
.LBE111:
	.loc 1 133 21 is_stmt 0 view .LVU1263
	mov	rax, QWORD PTR .LC53[rip]
	mov	QWORD PTR [r9], rax
.LVL425:
.LBB112:
	.loc 1 138 23 is_stmt 1 discriminator 1 view .LVU1264
	.loc 1 138 35 is_stmt 0 discriminator 3 view .LVU1265
	vaddsd	xmm2, xmm0, xmm3
.LVL426:
	.loc 1 138 5 is_stmt 1 discriminator 3 view .LVU1266
	.loc 1 138 23 discriminator 1 view .LVU1267
	.loc 1 138 39 is_stmt 0 discriminator 3 view .LVU1268
	vunpckhpd	xmm1, xmm0, xmm0
.LVL427:
	.loc 1 138 39 discriminator 3 view .LVU1269
	vextractf128	xmm0, ymm0, 0x1
.LVL428:
	.loc 1 138 35 discriminator 3 view .LVU1270
	vaddsd	xmm1, xmm1, xmm2
.LVL429:
	.loc 1 138 5 is_stmt 1 discriminator 3 view .LVU1271
	.loc 1 138 23 discriminator 1 view .LVU1272
	.loc 1 138 35 is_stmt 0 discriminator 3 view .LVU1273
	vaddsd	xmm1, xmm0, xmm1
.LVL430:
	.loc 1 138 5 is_stmt 1 discriminator 3 view .LVU1274
	.loc 1 138 23 discriminator 1 view .LVU1275
	.loc 1 138 5 discriminator 3 view .LVU1276
	.loc 1 138 23 discriminator 1 view .LVU1277
	.loc 1 138 39 is_stmt 0 discriminator 3 view .LVU1278
	vunpckhpd	xmm0, xmm0, xmm0
	.loc 1 138 35 discriminator 3 view .LVU1279
	vaddsd	xmm0, xmm0, xmm1
	vzeroupper
.LVL431:
.LBE112:
	.loc 1 141 1 view .LVU1280
	vmovups	xmm6, XMMWORD PTR 400[rsp]
	vmovups	xmm7, XMMWORD PTR 416[rsp]
	vmovups	xmm8, XMMWORD PTR 432[rsp]
	vmovups	xmm9, XMMWORD PTR 448[rsp]
	vmovups	xmm10, XMMWORD PTR 464[rsp]
	vmovups	xmm11, XMMWORD PTR 480[rsp]
	vmovups	xmm12, XMMWORD PTR 496[rsp]
	vmovups	xmm13, XMMWORD PTR 512[rsp]
	vmovups	xmm14, XMMWORD PTR 528[rsp]
.LVL432:
	.loc 1 141 1 view .LVU1281
	add	rsp, 552
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
	.long	1080557568
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
	.long	1079508992
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
	.long	0x248a
	.word	0x5
	.byte	0x1
	.byte	0x8
	.secrel32	.Ldebug_abbrev0
	.uleb128 0x1b
	.ascii "GNU C++17 13.1.0 -march=znver1 -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -msse4a -mno-fma4 -mno-xop -mfma -mno-avx512f -mbmi -mbmi2 -maes -mpclmul -mno-avx512vl -mno-avx512bw -mno-avx512dq -mno-avx512cd -mno-avx512er -mno-avx512pf -mno-avx512vbmi -mno-avx512ifma -mno-avx5124vnniw -mno-avx5124fmaps -mno-avx512vpopcntdq -mno-avx512vbmi2 -mno-gfni -mno-vpclmulqdq -mno-avx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mno-clwb -mclzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mno-movdir64b -mno-movdiri -mmwaitx -mno-pconfig -mno-pku -mno-prefetchwt1 -mprfchw -mno-ptwrite -mno-rdpid -mrdrnd -mrdseed -mno-rtm -mno-serialize -mno-sgx -msha -mno-shstk -mno-tbm -mno-tsxldtrk -mno-vaes -mno-waitpkg -mno-wbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -mno-uintr -mno-hreset -mno-kl -mno-widekl -mno-avxvnni -mno-avx512fp16 -mno-avxifma -mno-avxvnniint8 -mno-avxneconvert -mno-cmpccxadd -mno-amx-fp16 -mno-prefetchi -mno-raoint -mno-amx-complex --param=l1-cache-size=32 --param=l1-cache-line-size=64 --param=l2-cache-size=512 -mtune=znver1 -masm=intel -g -O3 -std=c++17 -fopenmp-simd\0"
	.byte	0x21
	.secrel32	.LASF0
	.secrel32	.LASF1
	.secrel32	.LLRL141
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
	.long	0x551
	.uleb128 0x5
	.ascii "uintptr_t\0"
	.byte	0x2
	.byte	0x4b
	.byte	0x2c
	.long	0x537
	.uleb128 0x9
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x13
	.long	0x59b
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x1c
	.byte	0x20
	.byte	0x10
	.byte	0x3
	.word	0x1a8
	.byte	0x10
	.ascii "11max_align_t\0"
	.long	0x60f
	.uleb128 0x17
	.ascii "__max_align_ll\0"
	.word	0x1a9
	.byte	0xd
	.long	0x551
	.byte	0x8
	.byte	0
	.uleb128 0x17
	.ascii "__max_align_ld\0"
	.word	0x1aa
	.byte	0xf
	.long	0x60f
	.byte	0x10
	.byte	0x10
	.byte	0
	.uleb128 0x9
	.byte	0x10
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0x1d
	.ascii "max_align_t\0"
	.byte	0x3
	.word	0x1ab
	.byte	0x3
	.long	0x5c3
	.byte	0x10
	.uleb128 0x1e
	.ascii "std\0"
	.byte	0x6
	.word	0x132
	.byte	0xb
	.long	0x73f
	.uleb128 0x6
	.byte	0x4
	.byte	0x3a
	.byte	0xb
	.long	0x61e
	.uleb128 0x6
	.byte	0x5
	.byte	0x33
	.byte	0xb
	.long	0x750
	.uleb128 0x6
	.byte	0x5
	.byte	0x34
	.byte	0xb
	.long	0x77e
	.uleb128 0x6
	.byte	0x5
	.byte	0x35
	.byte	0xb
	.long	0x7ac
	.uleb128 0x6
	.byte	0x5
	.byte	0x36
	.byte	0xb
	.long	0x7d2
	.uleb128 0x6
	.byte	0x5
	.byte	0x38
	.byte	0xb
	.long	0x8a5
	.uleb128 0x6
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.long	0x8ce
	.uleb128 0x6
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.long	0x8f9
	.uleb128 0x6
	.byte	0x5
	.byte	0x3b
	.byte	0xb
	.long	0x924
	.uleb128 0x6
	.byte	0x5
	.byte	0x3d
	.byte	0xb
	.long	0x7f3
	.uleb128 0x6
	.byte	0x5
	.byte	0x3e
	.byte	0xb
	.long	0x81e
	.uleb128 0x6
	.byte	0x5
	.byte	0x3f
	.byte	0xb
	.long	0x84b
	.uleb128 0x6
	.byte	0x5
	.byte	0x40
	.byte	0xb
	.long	0x878
	.uleb128 0x6
	.byte	0x5
	.byte	0x42
	.byte	0xb
	.long	0x94f
	.uleb128 0x6
	.byte	0x5
	.byte	0x43
	.byte	0xb
	.long	0x562
	.uleb128 0x6
	.byte	0x5
	.byte	0x45
	.byte	0xb
	.long	0x76e
	.uleb128 0x6
	.byte	0x5
	.byte	0x46
	.byte	0xb
	.long	0x79b
	.uleb128 0x6
	.byte	0x5
	.byte	0x47
	.byte	0xb
	.long	0x7c1
	.uleb128 0x6
	.byte	0x5
	.byte	0x48
	.byte	0xb
	.long	0x7e2
	.uleb128 0x6
	.byte	0x5
	.byte	0x4a
	.byte	0xb
	.long	0x8b9
	.uleb128 0x6
	.byte	0x5
	.byte	0x4b
	.byte	0xb
	.long	0x8e3
	.uleb128 0x6
	.byte	0x5
	.byte	0x4c
	.byte	0xb
	.long	0x90e
	.uleb128 0x6
	.byte	0x5
	.byte	0x4d
	.byte	0xb
	.long	0x939
	.uleb128 0x6
	.byte	0x5
	.byte	0x4f
	.byte	0xb
	.long	0x808
	.uleb128 0x6
	.byte	0x5
	.byte	0x50
	.byte	0xb
	.long	0x834
	.uleb128 0x6
	.byte	0x5
	.byte	0x51
	.byte	0xb
	.long	0x861
	.uleb128 0x6
	.byte	0x5
	.byte	0x52
	.byte	0xb
	.long	0x88e
	.uleb128 0x6
	.byte	0x5
	.byte	0x54
	.byte	0xb
	.long	0x960
	.uleb128 0x6
	.byte	0x5
	.byte	0x55
	.byte	0xb
	.long	0x573
	.uleb128 0x1f
	.ascii "size_t\0"
	.byte	0x6
	.word	0x134
	.byte	0x1a
	.long	0x537
	.uleb128 0x13
	.long	0x729
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
	.long	0x75f
	.uleb128 0x9
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x5
	.ascii "uint8_t\0"
	.byte	0x7
	.byte	0x24
	.byte	0x19
	.long	0x73f
	.uleb128 0x5
	.ascii "int16_t\0"
	.byte	0x7
	.byte	0x25
	.byte	0x10
	.long	0x78e
	.uleb128 0x9
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x5
	.ascii "uint16_t\0"
	.byte	0x7
	.byte	0x26
	.byte	0x19
	.long	0x585
	.uleb128 0x5
	.ascii "int32_t\0"
	.byte	0x7
	.byte	0x27
	.byte	0xe
	.long	0x59b
	.uleb128 0x13
	.long	0x7ac
	.uleb128 0x5
	.ascii "uint32_t\0"
	.byte	0x7
	.byte	0x28
	.byte	0x14
	.long	0x5b3
	.uleb128 0x5
	.ascii "int64_t\0"
	.byte	0x7
	.byte	0x29
	.byte	0x26
	.long	0x551
	.uleb128 0x5
	.ascii "uint64_t\0"
	.byte	0x7
	.byte	0x2a
	.byte	0x30
	.long	0x537
	.uleb128 0x5
	.ascii "int_least8_t\0"
	.byte	0x7
	.byte	0x2d
	.byte	0x15
	.long	0x75f
	.uleb128 0x5
	.ascii "uint_least8_t\0"
	.byte	0x7
	.byte	0x2e
	.byte	0x19
	.long	0x73f
	.uleb128 0x5
	.ascii "int_least16_t\0"
	.byte	0x7
	.byte	0x2f
	.byte	0x10
	.long	0x78e
	.uleb128 0x5
	.ascii "uint_least16_t\0"
	.byte	0x7
	.byte	0x30
	.byte	0x19
	.long	0x585
	.uleb128 0x5
	.ascii "int_least32_t\0"
	.byte	0x7
	.byte	0x31
	.byte	0xe
	.long	0x59b
	.uleb128 0x5
	.ascii "uint_least32_t\0"
	.byte	0x7
	.byte	0x32
	.byte	0x14
	.long	0x5b3
	.uleb128 0x5
	.ascii "int_least64_t\0"
	.byte	0x7
	.byte	0x33
	.byte	0x26
	.long	0x551
	.uleb128 0x5
	.ascii "uint_least64_t\0"
	.byte	0x7
	.byte	0x34
	.byte	0x30
	.long	0x537
	.uleb128 0x5
	.ascii "int_fast8_t\0"
	.byte	0x7
	.byte	0x3a
	.byte	0x15
	.long	0x75f
	.uleb128 0x5
	.ascii "uint_fast8_t\0"
	.byte	0x7
	.byte	0x3b
	.byte	0x17
	.long	0x73f
	.uleb128 0x5
	.ascii "int_fast16_t\0"
	.byte	0x7
	.byte	0x3c
	.byte	0x10
	.long	0x78e
	.uleb128 0x5
	.ascii "uint_fast16_t\0"
	.byte	0x7
	.byte	0x3d
	.byte	0x19
	.long	0x585
	.uleb128 0x5
	.ascii "int_fast32_t\0"
	.byte	0x7
	.byte	0x3e
	.byte	0xe
	.long	0x59b
	.uleb128 0x5
	.ascii "uint_fast32_t\0"
	.byte	0x7
	.byte	0x3f
	.byte	0x18
	.long	0x5b3
	.uleb128 0x5
	.ascii "int_fast64_t\0"
	.byte	0x7
	.byte	0x40
	.byte	0x26
	.long	0x551
	.uleb128 0x5
	.ascii "uint_fast64_t\0"
	.byte	0x7
	.byte	0x41
	.byte	0x30
	.long	0x537
	.uleb128 0x5
	.ascii "intmax_t\0"
	.byte	0x7
	.byte	0x44
	.byte	0x26
	.long	0x551
	.uleb128 0x5
	.ascii "uintmax_t\0"
	.byte	0x7
	.byte	0x45
	.byte	0x30
	.long	0x537
	.uleb128 0x6
	.byte	0x1
	.byte	0x3
	.byte	0xc
	.long	0x729
	.uleb128 0x8
	.ascii "peak_flops<double>\0"
	.byte	0x73
	.byte	0xc
	.ascii "_Z10peak_flopsIdET_yS0_S0_Pd\0"
	.long	0x51c
	.quad	.LFB62
	.quad	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.long	0xb21
	.uleb128 0x4
	.ascii "T\0"
	.long	0x51c
	.uleb128 0x1
	.ascii "iters\0"
	.byte	0x73
	.byte	0x1e
	.long	0x729
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.ascii "m\0"
	.byte	0x73
	.byte	0x27
	.long	0x51c
	.secrel32	.LLST125
	.secrel32	.LVUS125
	.uleb128 0x3
	.ascii "c\0"
	.byte	0x73
	.byte	0x2c
	.long	0x51c
	.secrel32	.LLST126
	.secrel32	.LVUS126
	.uleb128 0x18
	.secrel32	.LASF2
	.byte	0x73
	.long	0xb26
	.uleb128 0x1
	.byte	0x59
	.uleb128 0xd
	.ascii "K\0"
	.byte	0x74
	.byte	0x13
	.long	0x5a2
	.byte	0xc
	.uleb128 0x5
	.ascii "V\0"
	.byte	0x1
	.byte	0x79
	.byte	0xf
	.long	0xb30
	.uleb128 0x13
	.long	0xa15
	.uleb128 0xd
	.ascii "L\0"
	.byte	0x7a
	.byte	0x13
	.long	0x5a2
	.byte	0x4
	.uleb128 0xf
	.long	0xa15
	.long	0xa3e
	.uleb128 0x10
	.long	0x537
	.byte	0xb
	.byte	0
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x7c
	.long	0xa2e
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.uleb128 0x2
	.ascii "vm\0"
	.byte	0x7e
	.byte	0xd
	.long	0xa1f
	.secrel32	.LLST127
	.secrel32	.LVUS127
	.uleb128 0x2
	.ascii "vc\0"
	.byte	0x7e
	.byte	0x1b
	.long	0xa1f
	.secrel32	.LLST128
	.secrel32	.LVUS128
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x83
	.byte	0x7
	.long	0xa15
	.secrel32	.LLST129
	.secrel32	.LVUS129
	.uleb128 0x2
	.ascii "r\0"
	.byte	0x89
	.byte	0x7
	.long	0x51c
	.secrel32	.LLST130
	.secrel32	.LVUS130
	.uleb128 0xe
	.secrel32	.LLRL131
	.long	0xaac
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x7d
	.byte	0xe
	.long	0x59b
	.secrel32	.LLST132
	.secrel32	.LVUS132
	.byte	0
	.uleb128 0xe
	.secrel32	.LLRL133
	.long	0xadf
	.uleb128 0x2
	.ascii "it\0"
	.byte	0x7f
	.byte	0x11
	.long	0x729
	.secrel32	.LLST134
	.secrel32	.LVUS134
	.uleb128 0x7
	.secrel32	.LLRL135
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x81
	.byte	0x12
	.long	0x59b
	.secrel32	.LLST136
	.secrel32	.LVUS136
	.byte	0
	.byte	0
	.uleb128 0xe
	.secrel32	.LLRL137
	.long	0xafa
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x84
	.byte	0xe
	.long	0x59b
	.secrel32	.LLST138
	.secrel32	.LVUS138
	.byte	0
	.uleb128 0xe
	.secrel32	.LLRL139
	.long	0xb15
	.uleb128 0x2
	.ascii "l\0"
	.byte	0x8a
	.byte	0xe
	.long	0x59b
	.secrel32	.LLST140
	.secrel32	.LVUS140
	.byte	0
	.uleb128 0x12
	.quad	.LVL431
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x13
	.long	0x51c
	.uleb128 0x14
	.long	0x51c
	.uleb128 0x15
	.long	0xb26
	.uleb128 0x19
	.long	0x51c
	.long	0xb3c
	.uleb128 0x1a
	.byte	0x3
	.byte	0
	.uleb128 0x8
	.ascii "peak_flops<float>\0"
	.byte	0x73
	.byte	0xc
	.ascii "_Z10peak_flopsIfET_yS0_S0_Pd\0"
	.long	0x526
	.quad	.LFB61
	.quad	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.long	0xcfa
	.uleb128 0x4
	.ascii "T\0"
	.long	0x526
	.uleb128 0x1
	.ascii "iters\0"
	.byte	0x73
	.byte	0x1e
	.long	0x729
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.ascii "m\0"
	.byte	0x73
	.byte	0x27
	.long	0x526
	.secrel32	.LLST111
	.secrel32	.LVUS111
	.uleb128 0x3
	.ascii "c\0"
	.byte	0x73
	.byte	0x2c
	.long	0x526
	.secrel32	.LLST112
	.secrel32	.LVUS112
	.uleb128 0x18
	.secrel32	.LASF2
	.byte	0x73
	.long	0xb26
	.uleb128 0x1
	.byte	0x59
	.uleb128 0xd
	.ascii "K\0"
	.byte	0x74
	.byte	0x13
	.long	0x5a2
	.byte	0xc
	.uleb128 0x5
	.ascii "V\0"
	.byte	0x1
	.byte	0x79
	.byte	0xf
	.long	0xcff
	.uleb128 0x13
	.long	0xbd6
	.uleb128 0xd
	.ascii "L\0"
	.byte	0x7a
	.byte	0x13
	.long	0x5a2
	.byte	0x8
	.uleb128 0xf
	.long	0xbd6
	.long	0xbff
	.uleb128 0x10
	.long	0x537
	.byte	0xb
	.byte	0
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x7c
	.long	0xbef
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.uleb128 0x2
	.ascii "vm\0"
	.byte	0x7e
	.byte	0xd
	.long	0xbe0
	.secrel32	.LLST113
	.secrel32	.LVUS113
	.uleb128 0x2
	.ascii "vc\0"
	.byte	0x7e
	.byte	0x1b
	.long	0xbe0
	.secrel32	.LLST114
	.secrel32	.LVUS114
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x83
	.byte	0x7
	.long	0xbd6
	.secrel32	.LLST115
	.secrel32	.LVUS115
	.uleb128 0x2
	.ascii "r\0"
	.byte	0x89
	.byte	0x7
	.long	0x526
	.secrel32	.LLST116
	.secrel32	.LVUS116
	.uleb128 0xe
	.secrel32	.LLRL117
	.long	0xc6d
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x7d
	.byte	0xe
	.long	0x59b
	.secrel32	.LLST118
	.secrel32	.LVUS118
	.byte	0
	.uleb128 0xe
	.secrel32	.LLRL119
	.long	0xca0
	.uleb128 0x2
	.ascii "it\0"
	.byte	0x7f
	.byte	0x11
	.long	0x729
	.secrel32	.LLST120
	.secrel32	.LVUS120
	.uleb128 0x7
	.secrel32	.LLRL121
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x81
	.byte	0x12
	.long	0x59b
	.secrel32	.LLST122
	.secrel32	.LVUS122
	.byte	0
	.byte	0
	.uleb128 0xc
	.quad	.LBB99
	.quad	.LBE99-.LBB99
	.long	0xcc7
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x84
	.byte	0xe
	.long	0x59b
	.secrel32	.LLST123
	.secrel32	.LVUS123
	.byte	0
	.uleb128 0xc
	.quad	.LBB100
	.quad	.LBE100-.LBB100
	.long	0xcee
	.uleb128 0x2
	.ascii "l\0"
	.byte	0x8a
	.byte	0xe
	.long	0x59b
	.secrel32	.LLST124
	.secrel32	.LVUS124
	.byte	0
	.uleb128 0x12
	.quad	.LVL391
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x13
	.long	0x526
	.uleb128 0x19
	.long	0x526
	.long	0xd0b
	.uleb128 0x1a
	.byte	0x7
	.byte	0
	.uleb128 0x8
	.ascii "vmul_ref_elem<int>\0"
	.byte	0x9d
	.byte	0xd
	.ascii "_Z13vmul_ref_elemIiEeT_S0_\0"
	.long	0x60f
	.quad	.LFB60
	.quad	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.long	0xd74
	.uleb128 0x4
	.ascii "T\0"
	.long	0x59b
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9d
	.byte	0x1d
	.long	0x59b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9d
	.byte	0x22
	.long	0x59b
	.uleb128 0x1
	.byte	0x58
	.byte	0
	.uleb128 0x8
	.ascii "saxpy_ref_elem<int>\0"
	.byte	0x9a
	.byte	0xd
	.ascii "_Z14saxpy_ref_elemIiEeT_S0_S0_\0"
	.long	0x60f
	.quad	.LFB59
	.quad	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.long	0xded
	.uleb128 0x4
	.ascii "T\0"
	.long	0x59b
	.uleb128 0x1
	.ascii "a\0"
	.byte	0x9a
	.byte	0x1e
	.long	0x59b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9a
	.byte	0x23
	.long	0x59b
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9a
	.byte	0x28
	.long	0x59b
	.uleb128 0x1
	.byte	0x59
	.byte	0
	.uleb128 0x8
	.ascii "dot_ref<int>\0"
	.byte	0x93
	.byte	0xd
	.ascii "_Z7dot_refIiEePKT_S2_y\0"
	.long	0x60f
	.quad	.LFB58
	.quad	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.long	0xe8b
	.uleb128 0x4
	.ascii "T\0"
	.long	0x59b
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x93
	.byte	0x1e
	.long	0xe8b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x93
	.byte	0x2a
	.long	0xe8b
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x93
	.byte	0x34
	.long	0x729
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x94
	.byte	0x11
	.long	0x60f
	.secrel32	.LLST109
	.secrel32	.LVUS109
	.uleb128 0x16
	.quad	.LBB90
	.quad	.LBE90-.LBB90
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x95
	.byte	0x11
	.long	0x729
	.secrel32	.LLST110
	.secrel32	.LVUS110
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	0x5a2
	.uleb128 0x15
	.long	0xe8b
	.uleb128 0xa
	.ascii "vmul<int>\0"
	.byte	0x5f
	.ascii "_Z4vmulIiEvPKT_S2_PS0_y\0"
	.quad	.LFB57
	.quad	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.long	0xf20
	.uleb128 0x4
	.ascii "T\0"
	.long	0x59b
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x5f
	.byte	0x2a
	.long	0xe90
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.ascii "y\0"
	.byte	0x5f
	.byte	0x43
	.long	0xe90
	.secrel32	.LLST106
	.secrel32	.LVUS106
	.uleb128 0x1
	.ascii "z\0"
	.byte	0x5f
	.byte	0x56
	.long	0xf25
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x5f
	.byte	0x60
	.long	0x729
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x7
	.secrel32	.LLRL107
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x60
	.byte	0x11
	.long	0x729
	.secrel32	.LLST108
	.secrel32	.LVUS108
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	0x59b
	.uleb128 0x15
	.long	0xf20
	.uleb128 0xa
	.ascii "saxpy_gather<int>\0"
	.byte	0x56
	.ascii "_Z12saxpy_gatherIiEvT_PKS0_PS0_PKiy\0"
	.quad	.LFB56
	.quad	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.long	0xfdc
	.uleb128 0x4
	.ascii "T\0"
	.long	0x59b
	.uleb128 0x3
	.ascii "a\0"
	.byte	0x56
	.byte	0x1e
	.long	0x59b
	.secrel32	.LLST102
	.secrel32	.LVUS102
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x56
	.byte	0x37
	.long	0xe90
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x56
	.byte	0x4a
	.long	0xf25
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "idx\0"
	.byte	0x57
	.byte	0x3d
	.long	0xfe1
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x57
	.byte	0x49
	.long	0x729
	.secrel32	.LLST103
	.secrel32	.LVUS103
	.uleb128 0x7
	.secrel32	.LLRL104
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x58
	.byte	0x11
	.long	0x729
	.secrel32	.LLST105
	.secrel32	.LVUS105
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	0x7bc
	.uleb128 0x15
	.long	0xfdc
	.uleb128 0xa
	.ascii "saxpy_stride<int>\0"
	.byte	0x51
	.ascii "_Z12saxpy_strideIiEvT_PKS0_PS0_yy\0"
	.quad	.LFB55
	.quad	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.long	0x108f
	.uleb128 0x4
	.ascii "T\0"
	.long	0x59b
	.uleb128 0x3
	.ascii "a\0"
	.byte	0x51
	.byte	0x1e
	.long	0x59b
	.secrel32	.LLST99
	.secrel32	.LVUS99
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x51
	.byte	0x37
	.long	0xe90
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x51
	.byte	0x4a
	.long	0xf25
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x51
	.byte	0x54
	.long	0x729
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x1
	.ascii "s\0"
	.byte	0x51
	.byte	0x5e
	.long	0x729
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x7
	.secrel32	.LLRL100
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x52
	.byte	0x11
	.long	0x729
	.secrel32	.LLST101
	.secrel32	.LVUS101
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
	.long	0x1122
	.uleb128 0x4
	.ascii "T\0"
	.long	0x59b
	.uleb128 0x3
	.ascii "a\0"
	.byte	0x4c
	.byte	0x17
	.long	0x59b
	.secrel32	.LLST95
	.secrel32	.LVUS95
	.uleb128 0x3
	.ascii "x\0"
	.byte	0x4c
	.byte	0x30
	.long	0xe90
	.secrel32	.LLST96
	.secrel32	.LVUS96
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x4c
	.byte	0x43
	.long	0xf25
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x4c
	.byte	0x4d
	.long	0x729
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x7
	.secrel32	.LLRL97
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x4d
	.byte	0x11
	.long	0x729
	.secrel32	.LLST98
	.secrel32	.LVUS98
	.byte	0
	.byte	0
	.uleb128 0x8
	.ascii "dot_simd_acc<int>\0"
	.byte	0x3a
	.byte	0xc
	.ascii "_Z12dot_simd_accIiET_PKS0_S2_y\0"
	.long	0x59b
	.quad	.LFB53
	.quad	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.long	0x1233
	.uleb128 0x4
	.ascii "T\0"
	.long	0x59b
	.uleb128 0x3
	.ascii "x\0"
	.byte	0x3a
	.byte	0x2f
	.long	0xe90
	.secrel32	.LLST89
	.secrel32	.LVUS89
	.uleb128 0x3
	.ascii "y\0"
	.byte	0x3a
	.byte	0x48
	.long	0xe90
	.secrel32	.LLST90
	.secrel32	.LVUS90
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x3a
	.byte	0x52
	.long	0x729
	.uleb128 0x1
	.byte	0x58
	.uleb128 0xd
	.ascii "W\0"
	.byte	0x3b
	.byte	0x16
	.long	0x739
	.byte	0x20
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x3c
	.long	0x1233
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x3d
	.byte	0xc
	.long	0x729
	.secrel32	.LLST91
	.secrel32	.LVUS91
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x42
	.byte	0x7
	.long	0x59b
	.secrel32	.LLST92
	.secrel32	.LVUS92
	.uleb128 0xe
	.secrel32	.LLRL93
	.long	0x1200
	.uleb128 0xb
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x729
	.uleb128 0x7
	.secrel32	.LLRL93
	.uleb128 0xb
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x729
	.byte	0
	.byte	0
	.uleb128 0xc
	.quad	.LBB78
	.quad	.LBE78-.LBB78
	.long	0x1227
	.uleb128 0x2
	.ascii "j\0"
	.byte	0x43
	.byte	0x11
	.long	0x729
	.secrel32	.LLST94
	.secrel32	.LVUS94
	.byte	0
	.uleb128 0x12
	.quad	.LVL307
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xf
	.long	0x59b
	.long	0x1243
	.uleb128 0x10
	.long	0x537
	.byte	0x1f
	.byte	0
	.uleb128 0x8
	.ascii "dot_simd<int>\0"
	.byte	0x2d
	.byte	0xc
	.ascii "_Z8dot_simdIiET_PKS0_S2_y\0"
	.long	0x59b
	.quad	.LFB52
	.quad	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.long	0x12f7
	.uleb128 0x4
	.ascii "T\0"
	.long	0x59b
	.uleb128 0x3
	.ascii "x\0"
	.byte	0x2d
	.byte	0x2b
	.long	0xe90
	.secrel32	.LLST85
	.secrel32	.LVUS85
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x2d
	.byte	0x44
	.long	0xe90
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x2d
	.byte	0x4e
	.long	0x729
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0x59b
	.secrel32	.LLST86
	.secrel32	.LVUS86
	.uleb128 0x7
	.secrel32	.LLRL87
	.uleb128 0xb
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x729
	.uleb128 0x7
	.secrel32	.LLRL87
	.uleb128 0xb
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0x59b
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x729
	.secrel32	.LLST88
	.secrel32	.LVUS88
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
	.ascii "dot_multiacc<int>\0"
	.byte	0x1a
	.byte	0xc
	.ascii "_Z12dot_multiaccIiET_PKS0_S2_y\0"
	.long	0x59b
	.quad	.LFB51
	.quad	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.long	0x140c
	.uleb128 0x4
	.ascii "T\0"
	.long	0x59b
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x1a
	.byte	0x2f
	.long	0xe90
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.ascii "y\0"
	.byte	0x1a
	.byte	0x48
	.long	0xe90
	.secrel32	.LLST79
	.secrel32	.LVUS79
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x1a
	.byte	0x52
	.long	0x729
	.secrel32	.LLST80
	.secrel32	.LVUS80
	.uleb128 0xd
	.ascii "K\0"
	.byte	0x1b
	.byte	0x16
	.long	0x739
	.byte	0x8
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x1c
	.long	0x140c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x1d
	.byte	0xc
	.long	0x729
	.secrel32	.LLST81
	.secrel32	.LVUS81
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x21
	.byte	0x7
	.long	0x59b
	.secrel32	.LLST82
	.secrel32	.LVUS82
	.uleb128 0xc
	.quad	.LBB64
	.quad	.LBE64-.LBB64
	.long	0x13d9
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x1f
	.byte	0x15
	.long	0x729
	.secrel32	.LLST83
	.secrel32	.LVUS83
	.byte	0
	.uleb128 0xc
	.quad	.LBB66
	.quad	.LBE66-.LBB66
	.long	0x1400
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x22
	.byte	0x11
	.long	0x729
	.secrel32	.LLST84
	.secrel32	.LVUS84
	.byte	0
	.uleb128 0x12
	.quad	.LVL274
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xf
	.long	0x59b
	.long	0x141c
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0
	.uleb128 0x8
	.ascii "dot_strict<int>\0"
	.byte	0xe
	.byte	0xc
	.ascii "_Z10dot_strictIiET_PKS0_S2_y\0"
	.long	0x59b
	.quad	.LFB50
	.quad	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.long	0x14bd
	.uleb128 0x4
	.ascii "T\0"
	.long	0x59b
	.uleb128 0x1
	.ascii "x\0"
	.byte	0xe
	.byte	0x2d
	.long	0xe90
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.ascii "y\0"
	.byte	0xe
	.byte	0x46
	.long	0xe90
	.secrel32	.LLST75
	.secrel32	.LVUS75
	.uleb128 0x1
	.ascii "n\0"
	.byte	0xe
	.byte	0x50
	.long	0x729
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.ascii "s\0"
	.byte	0xf
	.byte	0x7
	.long	0x59b
	.secrel32	.LLST76
	.secrel32	.LVUS76
	.uleb128 0x7
	.secrel32	.LLRL77
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x10
	.byte	0x11
	.long	0x729
	.secrel32	.LLST78
	.secrel32	.LVUS78
	.byte	0
	.byte	0
	.uleb128 0x8
	.ascii "vmul_ref_elem<double>\0"
	.byte	0x9d
	.byte	0xd
	.ascii "_Z13vmul_ref_elemIdEeT_S0_\0"
	.long	0x60f
	.quad	.LFB49
	.quad	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.long	0x1529
	.uleb128 0x4
	.ascii "T\0"
	.long	0x51c
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9d
	.byte	0x1d
	.long	0x51c
	.uleb128 0x1
	.byte	0x62
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9d
	.byte	0x22
	.long	0x51c
	.uleb128 0x1
	.byte	0x63
	.byte	0
	.uleb128 0x8
	.ascii "saxpy_ref_elem<double>\0"
	.byte	0x9a
	.byte	0xd
	.ascii "_Z14saxpy_ref_elemIdEeT_S0_S0_\0"
	.long	0x60f
	.quad	.LFB48
	.quad	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.long	0x15a5
	.uleb128 0x4
	.ascii "T\0"
	.long	0x51c
	.uleb128 0x1
	.ascii "a\0"
	.byte	0x9a
	.byte	0x1e
	.long	0x51c
	.uleb128 0x1
	.byte	0x62
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9a
	.byte	0x23
	.long	0x51c
	.uleb128 0x1
	.byte	0x63
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9a
	.byte	0x28
	.long	0x51c
	.uleb128 0x1
	.byte	0x64
	.byte	0
	.uleb128 0x8
	.ascii "dot_ref<double>\0"
	.byte	0x93
	.byte	0xd
	.ascii "_Z7dot_refIdEePKT_S2_y\0"
	.long	0x60f
	.quad	.LFB47
	.quad	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.long	0x1646
	.uleb128 0x4
	.ascii "T\0"
	.long	0x51c
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x93
	.byte	0x1e
	.long	0x1646
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x93
	.byte	0x2a
	.long	0x1646
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x93
	.byte	0x34
	.long	0x729
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x94
	.byte	0x11
	.long	0x60f
	.secrel32	.LLST73
	.secrel32	.LVUS73
	.uleb128 0x16
	.quad	.LBB60
	.quad	.LBE60-.LBB60
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x95
	.byte	0x11
	.long	0x729
	.secrel32	.LLST74
	.secrel32	.LVUS74
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	0xb21
	.uleb128 0x15
	.long	0x1646
	.uleb128 0xa
	.ascii "vmul<double>\0"
	.byte	0x5f
	.ascii "_Z4vmulIdEvPKT_S2_PS0_y\0"
	.quad	.LFB46
	.quad	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.long	0x16de
	.uleb128 0x4
	.ascii "T\0"
	.long	0x51c
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x5f
	.byte	0x2a
	.long	0x164b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x5f
	.byte	0x43
	.long	0x164b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "z\0"
	.byte	0x5f
	.byte	0x56
	.long	0xb2b
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x5f
	.byte	0x60
	.long	0x729
	.secrel32	.LLST70
	.secrel32	.LVUS70
	.uleb128 0x7
	.secrel32	.LLRL71
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x60
	.byte	0x11
	.long	0x729
	.secrel32	.LLST72
	.secrel32	.LVUS72
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
	.long	0x1799
	.uleb128 0x4
	.ascii "T\0"
	.long	0x51c
	.uleb128 0x3
	.ascii "a\0"
	.byte	0x56
	.byte	0x1e
	.long	0x51c
	.secrel32	.LLST65
	.secrel32	.LVUS65
	.uleb128 0x3
	.ascii "x\0"
	.byte	0x56
	.byte	0x37
	.long	0x164b
	.secrel32	.LLST66
	.secrel32	.LVUS66
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x56
	.byte	0x4a
	.long	0xb2b
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "idx\0"
	.byte	0x57
	.byte	0x3d
	.long	0xfe1
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x57
	.byte	0x49
	.long	0x729
	.secrel32	.LLST67
	.secrel32	.LVUS67
	.uleb128 0x7
	.secrel32	.LLRL68
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x58
	.byte	0x11
	.long	0x729
	.secrel32	.LLST69
	.secrel32	.LVUS69
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
	.long	0x1851
	.uleb128 0x4
	.ascii "T\0"
	.long	0x51c
	.uleb128 0x3
	.ascii "a\0"
	.byte	0x51
	.byte	0x1e
	.long	0x51c
	.secrel32	.LLST60
	.secrel32	.LVUS60
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x51
	.byte	0x37
	.long	0x164b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.ascii "y\0"
	.byte	0x51
	.byte	0x4a
	.long	0xb2b
	.secrel32	.LLST61
	.secrel32	.LVUS61
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x51
	.byte	0x54
	.long	0x729
	.secrel32	.LLST62
	.secrel32	.LVUS62
	.uleb128 0x1
	.ascii "s\0"
	.byte	0x51
	.byte	0x5e
	.long	0x729
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x7
	.secrel32	.LLRL63
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x52
	.byte	0x11
	.long	0x729
	.secrel32	.LLST64
	.secrel32	.LVUS64
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
	.long	0x18ed
	.uleb128 0x4
	.ascii "T\0"
	.long	0x51c
	.uleb128 0x3
	.ascii "a\0"
	.byte	0x4c
	.byte	0x17
	.long	0x51c
	.secrel32	.LLST55
	.secrel32	.LVUS55
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x4c
	.byte	0x30
	.long	0x164b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.ascii "y\0"
	.byte	0x4c
	.byte	0x43
	.long	0xb2b
	.secrel32	.LLST56
	.secrel32	.LVUS56
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x4c
	.byte	0x4d
	.long	0x729
	.secrel32	.LLST57
	.secrel32	.LVUS57
	.uleb128 0x7
	.secrel32	.LLRL58
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x4d
	.byte	0x11
	.long	0x729
	.secrel32	.LLST59
	.secrel32	.LVUS59
	.byte	0
	.byte	0
	.uleb128 0x8
	.ascii "dot_simd_acc<double>\0"
	.byte	0x3a
	.byte	0xc
	.ascii "_Z12dot_simd_accIdET_PKS0_S2_y\0"
	.long	0x51c
	.quad	.LFB42
	.quad	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.long	0x1a01
	.uleb128 0x4
	.ascii "T\0"
	.long	0x51c
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x3a
	.byte	0x2f
	.long	0x164b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.ascii "y\0"
	.byte	0x3a
	.byte	0x48
	.long	0x164b
	.secrel32	.LLST49
	.secrel32	.LVUS49
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x3a
	.byte	0x52
	.long	0x729
	.secrel32	.LLST50
	.secrel32	.LVUS50
	.uleb128 0xd
	.ascii "W\0"
	.byte	0x3b
	.byte	0x16
	.long	0x739
	.byte	0x20
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x3c
	.long	0x1a01
	.uleb128 0x3
	.byte	0x91
	.sleb128 -432
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x3d
	.byte	0xc
	.long	0x729
	.secrel32	.LLST51
	.secrel32	.LVUS51
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x42
	.byte	0x7
	.long	0x51c
	.secrel32	.LLST52
	.secrel32	.LVUS52
	.uleb128 0xe
	.secrel32	.LLRL53
	.long	0x19ce
	.uleb128 0xb
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x729
	.uleb128 0x7
	.secrel32	.LLRL53
	.uleb128 0xb
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x729
	.byte	0
	.byte	0
	.uleb128 0xc
	.quad	.LBB49
	.quad	.LBE49-.LBB49
	.long	0x19f5
	.uleb128 0x2
	.ascii "j\0"
	.byte	0x43
	.byte	0x11
	.long	0x729
	.secrel32	.LLST54
	.secrel32	.LVUS54
	.byte	0
	.uleb128 0x12
	.quad	.LVL199
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xf
	.long	0x51c
	.long	0x1a11
	.uleb128 0x10
	.long	0x537
	.byte	0x1f
	.byte	0
	.uleb128 0x8
	.ascii "dot_simd<double>\0"
	.byte	0x2d
	.byte	0xc
	.ascii "_Z8dot_simdIdET_PKS0_S2_y\0"
	.long	0x51c
	.quad	.LFB41
	.quad	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.long	0x1ac8
	.uleb128 0x4
	.ascii "T\0"
	.long	0x51c
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x2d
	.byte	0x2b
	.long	0x164b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x2d
	.byte	0x44
	.long	0x164b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x2d
	.byte	0x4e
	.long	0x729
	.secrel32	.LLST45
	.secrel32	.LVUS45
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0x51c
	.secrel32	.LLST46
	.secrel32	.LVUS46
	.uleb128 0x7
	.secrel32	.LLRL47
	.uleb128 0xb
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x729
	.uleb128 0x7
	.secrel32	.LLRL47
	.uleb128 0xb
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0x51c
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x729
	.secrel32	.LLST48
	.secrel32	.LVUS48
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
	.ascii "dot_multiacc<double>\0"
	.byte	0x1a
	.byte	0xc
	.ascii "_Z12dot_multiaccIdET_PKS0_S2_y\0"
	.long	0x51c
	.quad	.LFB40
	.quad	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.long	0x1be1
	.uleb128 0x4
	.ascii "T\0"
	.long	0x51c
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x1a
	.byte	0x2f
	.long	0x164b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.ascii "y\0"
	.byte	0x1a
	.byte	0x48
	.long	0x164b
	.secrel32	.LLST39
	.secrel32	.LVUS39
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x1a
	.byte	0x52
	.long	0x729
	.secrel32	.LLST40
	.secrel32	.LVUS40
	.uleb128 0xd
	.ascii "K\0"
	.byte	0x1b
	.byte	0x16
	.long	0x739
	.byte	0x8
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x1c
	.long	0x1be1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x1d
	.byte	0xc
	.long	0x729
	.secrel32	.LLST41
	.secrel32	.LVUS41
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x21
	.byte	0x7
	.long	0x51c
	.secrel32	.LLST42
	.secrel32	.LVUS42
	.uleb128 0xc
	.quad	.LBB36
	.quad	.LBE36-.LBB36
	.long	0x1bae
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x1f
	.byte	0x15
	.long	0x729
	.secrel32	.LLST43
	.secrel32	.LVUS43
	.byte	0
	.uleb128 0xc
	.quad	.LBB37
	.quad	.LBE37-.LBB37
	.long	0x1bd5
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x22
	.byte	0x11
	.long	0x729
	.secrel32	.LLST44
	.secrel32	.LVUS44
	.byte	0
	.uleb128 0x12
	.quad	.LVL144
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xf
	.long	0x51c
	.long	0x1bf1
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0
	.uleb128 0x8
	.ascii "dot_strict<double>\0"
	.byte	0xe
	.byte	0xc
	.ascii "_Z10dot_strictIdET_PKS0_S2_y\0"
	.long	0x51c
	.quad	.LFB39
	.quad	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.long	0x1c95
	.uleb128 0x4
	.ascii "T\0"
	.long	0x51c
	.uleb128 0x1
	.ascii "x\0"
	.byte	0xe
	.byte	0x2d
	.long	0x164b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0xe
	.byte	0x46
	.long	0x164b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.ascii "n\0"
	.byte	0xe
	.byte	0x50
	.long	0x729
	.secrel32	.LLST35
	.secrel32	.LVUS35
	.uleb128 0x2
	.ascii "s\0"
	.byte	0xf
	.byte	0x7
	.long	0x51c
	.secrel32	.LLST36
	.secrel32	.LVUS36
	.uleb128 0x7
	.secrel32	.LLRL37
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x10
	.byte	0x11
	.long	0x729
	.secrel32	.LLST38
	.secrel32	.LVUS38
	.byte	0
	.byte	0
	.uleb128 0x8
	.ascii "vmul_ref_elem<float>\0"
	.byte	0x9d
	.byte	0xd
	.ascii "_Z13vmul_ref_elemIfEeT_S0_\0"
	.long	0x60f
	.quad	.LFB38
	.quad	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.long	0x1d00
	.uleb128 0x4
	.ascii "T\0"
	.long	0x526
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9d
	.byte	0x1d
	.long	0x526
	.uleb128 0x1
	.byte	0x62
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9d
	.byte	0x22
	.long	0x526
	.uleb128 0x1
	.byte	0x63
	.byte	0
	.uleb128 0x8
	.ascii "saxpy_ref_elem<float>\0"
	.byte	0x9a
	.byte	0xd
	.ascii "_Z14saxpy_ref_elemIfEeT_S0_S0_\0"
	.long	0x60f
	.quad	.LFB37
	.quad	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.long	0x1d7b
	.uleb128 0x4
	.ascii "T\0"
	.long	0x526
	.uleb128 0x1
	.ascii "a\0"
	.byte	0x9a
	.byte	0x1e
	.long	0x526
	.uleb128 0x1
	.byte	0x62
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9a
	.byte	0x23
	.long	0x526
	.uleb128 0x1
	.byte	0x63
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9a
	.byte	0x28
	.long	0x526
	.uleb128 0x1
	.byte	0x64
	.byte	0
	.uleb128 0x8
	.ascii "dot_ref<float>\0"
	.byte	0x93
	.byte	0xd
	.ascii "_Z7dot_refIfEePKT_S2_y\0"
	.long	0x60f
	.quad	.LFB36
	.quad	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.long	0x1e1b
	.uleb128 0x4
	.ascii "T\0"
	.long	0x526
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x93
	.byte	0x1e
	.long	0x1e1b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x93
	.byte	0x2a
	.long	0x1e1b
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x93
	.byte	0x34
	.long	0x729
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x94
	.byte	0x11
	.long	0x60f
	.secrel32	.LLST33
	.secrel32	.LVUS33
	.uleb128 0x16
	.quad	.LBB31
	.quad	.LBE31-.LBB31
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x95
	.byte	0x11
	.long	0x729
	.secrel32	.LLST34
	.secrel32	.LVUS34
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	0xcfa
	.uleb128 0x15
	.long	0x1e1b
	.uleb128 0xa
	.ascii "vmul<float>\0"
	.byte	0x5f
	.ascii "_Z4vmulIfEvPKT_S2_PS0_y\0"
	.quad	.LFB35
	.quad	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.long	0x1eb2
	.uleb128 0x4
	.ascii "T\0"
	.long	0x526
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x5f
	.byte	0x2a
	.long	0x1e20
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x5f
	.byte	0x43
	.long	0x1e20
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "z\0"
	.byte	0x5f
	.byte	0x56
	.long	0x1eb7
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x5f
	.byte	0x60
	.long	0x729
	.secrel32	.LLST30
	.secrel32	.LVUS30
	.uleb128 0x7
	.secrel32	.LLRL31
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x60
	.byte	0x11
	.long	0x729
	.secrel32	.LLST32
	.secrel32	.LVUS32
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	0x526
	.uleb128 0x15
	.long	0x1eb2
	.uleb128 0xa
	.ascii "saxpy_gather<float>\0"
	.byte	0x56
	.ascii "_Z12saxpy_gatherIfEvT_PKS0_PS0_PKiy\0"
	.quad	.LFB34
	.quad	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.long	0x1f76
	.uleb128 0x4
	.ascii "T\0"
	.long	0x526
	.uleb128 0x3
	.ascii "a\0"
	.byte	0x56
	.byte	0x1e
	.long	0x526
	.secrel32	.LLST25
	.secrel32	.LVUS25
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x56
	.byte	0x37
	.long	0x1e20
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.ascii "y\0"
	.byte	0x56
	.byte	0x4a
	.long	0x1eb7
	.secrel32	.LLST26
	.secrel32	.LVUS26
	.uleb128 0x1
	.ascii "idx\0"
	.byte	0x57
	.byte	0x3d
	.long	0xfe1
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x57
	.byte	0x49
	.long	0x729
	.secrel32	.LLST27
	.secrel32	.LVUS27
	.uleb128 0x7
	.secrel32	.LLRL28
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x58
	.byte	0x11
	.long	0x729
	.secrel32	.LLST29
	.secrel32	.LVUS29
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
	.long	0x202d
	.uleb128 0x4
	.ascii "T\0"
	.long	0x526
	.uleb128 0x3
	.ascii "a\0"
	.byte	0x51
	.byte	0x1e
	.long	0x526
	.secrel32	.LLST20
	.secrel32	.LVUS20
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x51
	.byte	0x37
	.long	0x1e20
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.ascii "y\0"
	.byte	0x51
	.byte	0x4a
	.long	0x1eb7
	.secrel32	.LLST21
	.secrel32	.LVUS21
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x51
	.byte	0x54
	.long	0x729
	.secrel32	.LLST22
	.secrel32	.LVUS22
	.uleb128 0x1
	.ascii "s\0"
	.byte	0x51
	.byte	0x5e
	.long	0x729
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x7
	.secrel32	.LLRL23
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x52
	.byte	0x11
	.long	0x729
	.secrel32	.LLST24
	.secrel32	.LVUS24
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
	.long	0x20c8
	.uleb128 0x4
	.ascii "T\0"
	.long	0x526
	.uleb128 0x3
	.ascii "a\0"
	.byte	0x4c
	.byte	0x17
	.long	0x526
	.secrel32	.LLST15
	.secrel32	.LVUS15
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x4c
	.byte	0x30
	.long	0x1e20
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.ascii "y\0"
	.byte	0x4c
	.byte	0x43
	.long	0x1eb7
	.secrel32	.LLST16
	.secrel32	.LVUS16
	.uleb128 0x3
	.ascii "n\0"
	.byte	0x4c
	.byte	0x4d
	.long	0x729
	.secrel32	.LLST17
	.secrel32	.LVUS17
	.uleb128 0x7
	.secrel32	.LLRL18
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x4d
	.byte	0x11
	.long	0x729
	.secrel32	.LLST19
	.secrel32	.LVUS19
	.byte	0
	.byte	0
	.uleb128 0x8
	.ascii "dot_simd_acc<float>\0"
	.byte	0x3a
	.byte	0xc
	.ascii "_Z12dot_simd_accIfET_PKS0_S2_y\0"
	.long	0x526
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0x21cf
	.uleb128 0x4
	.ascii "T\0"
	.long	0x526
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x3a
	.byte	0x2f
	.long	0x1e20
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x3a
	.byte	0x48
	.long	0x1e20
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x3a
	.byte	0x52
	.long	0x729
	.uleb128 0x1
	.byte	0x58
	.uleb128 0xd
	.ascii "W\0"
	.byte	0x3b
	.byte	0x16
	.long	0x739
	.byte	0x20
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x3c
	.long	0x21cf
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x3d
	.byte	0xc
	.long	0x729
	.secrel32	.LLST11
	.secrel32	.LVUS11
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x42
	.byte	0x7
	.long	0x526
	.secrel32	.LLST12
	.secrel32	.LVUS12
	.uleb128 0xe
	.secrel32	.LLRL13
	.long	0x219c
	.uleb128 0xb
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x729
	.uleb128 0x7
	.secrel32	.LLRL13
	.uleb128 0xb
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x729
	.byte	0
	.byte	0
	.uleb128 0xc
	.quad	.LBB20
	.quad	.LBE20-.LBB20
	.long	0x21c3
	.uleb128 0x2
	.ascii "j\0"
	.byte	0x43
	.byte	0x11
	.long	0x729
	.secrel32	.LLST14
	.secrel32	.LVUS14
	.byte	0
	.uleb128 0x12
	.quad	.LVL66
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xf
	.long	0x526
	.long	0x21df
	.uleb128 0x10
	.long	0x537
	.byte	0x1f
	.byte	0
	.uleb128 0x8
	.ascii "dot_simd<float>\0"
	.byte	0x2d
	.byte	0xc
	.ascii "_Z8dot_simdIfET_PKS0_S2_y\0"
	.long	0x526
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.long	0x228f
	.uleb128 0x4
	.ascii "T\0"
	.long	0x526
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x2d
	.byte	0x2b
	.long	0x1e20
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x2d
	.byte	0x44
	.long	0x1e20
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x2d
	.byte	0x4e
	.long	0x729
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0x526
	.secrel32	.LLST8
	.secrel32	.LVUS8
	.uleb128 0x7
	.secrel32	.LLRL9
	.uleb128 0xb
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x729
	.uleb128 0x7
	.secrel32	.LLRL9
	.uleb128 0xb
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0x526
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x729
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
	.long	0x526
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0x23a0
	.uleb128 0x4
	.ascii "T\0"
	.long	0x526
	.uleb128 0x3
	.ascii "x\0"
	.byte	0x1a
	.byte	0x2f
	.long	0x1e20
	.secrel32	.LLST3
	.secrel32	.LVUS3
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x1a
	.byte	0x48
	.long	0x1e20
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x1a
	.byte	0x52
	.long	0x729
	.uleb128 0x1
	.byte	0x58
	.uleb128 0xd
	.ascii "K\0"
	.byte	0x1b
	.byte	0x16
	.long	0x739
	.byte	0x8
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x1c
	.long	0x23a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x1d
	.byte	0xc
	.long	0x729
	.secrel32	.LLST4
	.secrel32	.LVUS4
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x21
	.byte	0x7
	.long	0x526
	.secrel32	.LLST5
	.secrel32	.LVUS5
	.uleb128 0xc
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.long	0x236d
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x1f
	.byte	0x15
	.long	0x729
	.secrel32	.LLST6
	.secrel32	.LVUS6
	.byte	0
	.uleb128 0xc
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.long	0x2394
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x22
	.byte	0x11
	.long	0x729
	.secrel32	.LLST7
	.secrel32	.LVUS7
	.byte	0
	.uleb128 0x12
	.quad	.LVL27
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xf
	.long	0x526
	.long	0x23b0
	.uleb128 0x10
	.long	0x537
	.byte	0x7
	.byte	0
	.uleb128 0x8
	.ascii "dot_strict<float>\0"
	.byte	0xe
	.byte	0xc
	.ascii "_Z10dot_strictIfET_PKS0_S2_y\0"
	.long	0x526
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0x244d
	.uleb128 0x4
	.ascii "T\0"
	.long	0x526
	.uleb128 0x1
	.ascii "x\0"
	.byte	0xe
	.byte	0x2d
	.long	0x1e20
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0xe
	.byte	0x46
	.long	0x1e20
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0xe
	.byte	0x50
	.long	0x729
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.ascii "s\0"
	.byte	0xf
	.byte	0x7
	.long	0x526
	.secrel32	.LLST0
	.secrel32	.LVUS0
	.uleb128 0x7
	.secrel32	.LLRL1
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x10
	.byte	0x11
	.long	0x729
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x83
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0x21
	.byte	0
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
.LVUS125:
	.uleb128 0
	.uleb128 .LVU1153
	.uleb128 .LVU1153
	.uleb128 0
.LLST125:
	.byte	0x6
	.quad	.LVL393
	.byte	0x4
	.uleb128 .LVL393-.LVL393
	.uleb128 .LVL395-.LVL393
	.uleb128 0x1
	.byte	0x62
	.byte	0x4
	.uleb128 .LVL395-.LVL393
	.uleb128 .LFE62-.LVL393
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x12
	.uleb128 0x51c
	.byte	0x9f
	.byte	0
.LVUS126:
	.uleb128 0
	.uleb128 .LVU1155
	.uleb128 .LVU1155
	.uleb128 0
.LLST126:
	.byte	0x6
	.quad	.LVL393
	.byte	0x4
	.uleb128 .LVL393-.LVL393
	.uleb128 .LVL396-.LVL393
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL396-.LVL393
	.uleb128 .LFE62-.LVL393
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x13
	.uleb128 0x51c
	.byte	0x9f
	.byte	0
.LVUS127:
	.uleb128 .LVU1192
	.uleb128 .LVU1258
.LLST127:
	.byte	0x8
	.quad	.LVL407
	.uleb128 .LVL423-.LVL407
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS128:
	.uleb128 .LVU1192
	.uleb128 .LVU1269
.LLST128:
	.byte	0x8
	.quad	.LVL407
	.uleb128 .LVL427-.LVL407
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LVUS129:
	.uleb128 .LVU1235
	.uleb128 .LVU1237
	.uleb128 .LVU1261
	.uleb128 .LVU1270
.LLST129:
	.byte	0x6
	.quad	.LVL422
	.byte	0x4
	.uleb128 .LVL422-.LVL422
	.uleb128 .LVL422-.LVL422
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL424-.LVL422
	.uleb128 .LVL428-.LVL422
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS130:
	.uleb128 .LVU1264
	.uleb128 .LVU1266
	.uleb128 .LVU1266
	.uleb128 .LVU1271
	.uleb128 .LVU1271
	.uleb128 .LVU1276
.LLST130:
	.byte	0x6
	.quad	.LVL425
	.byte	0x4
	.uleb128 .LVL425-.LVL425
	.uleb128 .LVL426-.LVL425
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0x4
	.uleb128 .LVL426-.LVL425
	.uleb128 .LVL429-.LVL425
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL429-.LVL425
	.uleb128 .LVL430-.LVL425
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LVUS132:
	.uleb128 .LVU1145
	.uleb128 .LVU1147
	.uleb128 .LVU1147
	.uleb128 .LVU1158
	.uleb128 .LVU1158
	.uleb128 .LVU1161
	.uleb128 .LVU1161
	.uleb128 .LVU1167
	.uleb128 .LVU1167
	.uleb128 .LVU1170
	.uleb128 .LVU1170
	.uleb128 .LVU1173
	.uleb128 .LVU1173
	.uleb128 .LVU1176
	.uleb128 .LVU1176
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
	.uleb128 0
.LLST132:
	.byte	0x6
	.quad	.LVL394
	.byte	0x4
	.uleb128 .LVL394-.LVL394
	.uleb128 .LVL394-.LVL394
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL394-.LVL394
	.uleb128 .LVL397-.LVL394
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL397-.LVL394
	.uleb128 .LVL398-.LVL394
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL398-.LVL394
	.uleb128 .LVL399-.LVL394
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL399-.LVL394
	.uleb128 .LVL400-.LVL394
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL400-.LVL394
	.uleb128 .LVL401-.LVL394
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL401-.LVL394
	.uleb128 .LVL402-.LVL394
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL402-.LVL394
	.uleb128 .LVL403-.LVL394
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL403-.LVL394
	.uleb128 .LVL404-.LVL394
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL404-.LVL394
	.uleb128 .LVL405-.LVL394
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL405-.LVL394
	.uleb128 .LVL406-.LVL394
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL406-.LVL394
	.uleb128 .LVL407-.LVL394
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL407-.LVL394
	.uleb128 .LFE62-.LVL394
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS134:
	.uleb128 .LVU1192
	.uleb128 .LVU1195
	.uleb128 .LVU1195
	.uleb128 .LVU1197
	.uleb128 .LVU1197
	.uleb128 .LVU1234
	.uleb128 .LVU1234
	.uleb128 .LVU1235
.LLST134:
	.byte	0x6
	.quad	.LVL407
	.byte	0x4
	.uleb128 .LVL407-.LVL407
	.uleb128 .LVL408-.LVL407
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL408-.LVL407
	.uleb128 .LVL409-.LVL407
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL409-.LVL407
	.uleb128 .LVL421-.LVL407
	.uleb128 0x3
	.byte	0x71
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL421-.LVL407
	.uleb128 .LVL422-.LVL407
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS136:
	.uleb128 .LVU1195
	.uleb128 .LVU1199
	.uleb128 .LVU1199
	.uleb128 .LVU1202
	.uleb128 .LVU1202
	.uleb128 .LVU1205
	.uleb128 .LVU1205
	.uleb128 .LVU1208
	.uleb128 .LVU1208
	.uleb128 .LVU1211
	.uleb128 .LVU1211
	.uleb128 .LVU1214
	.uleb128 .LVU1214
	.uleb128 .LVU1217
	.uleb128 .LVU1217
	.uleb128 .LVU1220
	.uleb128 .LVU1220
	.uleb128 .LVU1223
	.uleb128 .LVU1223
	.uleb128 .LVU1226
	.uleb128 .LVU1226
	.uleb128 .LVU1229
	.uleb128 .LVU1229
	.uleb128 .LVU1232
	.uleb128 .LVU1232
	.uleb128 .LVU1235
.LLST136:
	.byte	0x6
	.quad	.LVL408
	.byte	0x4
	.uleb128 .LVL408-.LVL408
	.uleb128 .LVL410-.LVL408
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL410-.LVL408
	.uleb128 .LVL411-.LVL408
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL411-.LVL408
	.uleb128 .LVL412-.LVL408
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL412-.LVL408
	.uleb128 .LVL413-.LVL408
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL413-.LVL408
	.uleb128 .LVL414-.LVL408
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL414-.LVL408
	.uleb128 .LVL415-.LVL408
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL415-.LVL408
	.uleb128 .LVL416-.LVL408
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL416-.LVL408
	.uleb128 .LVL417-.LVL408
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL417-.LVL408
	.uleb128 .LVL418-.LVL408
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL418-.LVL408
	.uleb128 .LVL419-.LVL408
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL419-.LVL408
	.uleb128 .LVL420-.LVL408
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL420-.LVL408
	.uleb128 .LVL421-.LVL408
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL421-.LVL408
	.uleb128 .LVL422-.LVL408
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS138:
	.uleb128 .LVU1235
	.uleb128 .LVU1238
	.uleb128 .LVU1238
	.uleb128 .LVU1240
	.uleb128 .LVU1240
	.uleb128 .LVU1242
	.uleb128 .LVU1242
	.uleb128 .LVU1244
	.uleb128 .LVU1244
	.uleb128 .LVU1246
	.uleb128 .LVU1246
	.uleb128 .LVU1248
	.uleb128 .LVU1248
	.uleb128 .LVU1250
	.uleb128 .LVU1250
	.uleb128 .LVU1252
	.uleb128 .LVU1252
	.uleb128 .LVU1254
	.uleb128 .LVU1254
	.uleb128 .LVU1256
	.uleb128 .LVU1256
	.uleb128 .LVU1262
	.uleb128 .LVU1262
	.uleb128 0
.LLST138:
	.byte	0x6
	.quad	.LVL422
	.byte	0x4
	.uleb128 .LVL422-.LVL422
	.uleb128 .LVL422-.LVL422
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL422-.LVL422
	.uleb128 .LVL422-.LVL422
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL422-.LVL422
	.uleb128 .LVL422-.LVL422
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL422-.LVL422
	.uleb128 .LVL422-.LVL422
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL422-.LVL422
	.uleb128 .LVL422-.LVL422
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL422-.LVL422
	.uleb128 .LVL422-.LVL422
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL422-.LVL422
	.uleb128 .LVL422-.LVL422
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL422-.LVL422
	.uleb128 .LVL422-.LVL422
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL422-.LVL422
	.uleb128 .LVL422-.LVL422
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL422-.LVL422
	.uleb128 .LVL422-.LVL422
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL422-.LVL422
	.uleb128 .LVL424-.LVL422
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL424-.LVL422
	.uleb128 .LFE62-.LVL422
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS140:
	.uleb128 .LVU1264
	.uleb128 .LVU1267
	.uleb128 .LVU1267
	.uleb128 .LVU1272
	.uleb128 .LVU1272
	.uleb128 .LVU1275
	.uleb128 .LVU1275
	.uleb128 .LVU1277
	.uleb128 .LVU1277
	.uleb128 0
.LLST140:
	.byte	0x6
	.quad	.LVL425
	.byte	0x4
	.uleb128 .LVL425-.LVL425
	.uleb128 .LVL426-.LVL425
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL426-.LVL425
	.uleb128 .LVL429-.LVL425
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL429-.LVL425
	.uleb128 .LVL430-.LVL425
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL430-.LVL425
	.uleb128 .LVL430-.LVL425
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL430-.LVL425
	.uleb128 .LFE62-.LVL425
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0
.LVUS111:
	.uleb128 0
	.uleb128 .LVU1019
	.uleb128 .LVU1019
	.uleb128 0
.LLST111:
	.byte	0x6
	.quad	.LVL353
	.byte	0x4
	.uleb128 .LVL353-.LVL353
	.uleb128 .LVL355-.LVL353
	.uleb128 0x1
	.byte	0x62
	.byte	0x4
	.uleb128 .LVL355-.LVL353
	.uleb128 .LFE61-.LVL353
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x12
	.uleb128 0x526
	.byte	0x9f
	.byte	0
.LVUS112:
	.uleb128 0
	.uleb128 .LVU1021
	.uleb128 .LVU1021
	.uleb128 0
.LLST112:
	.byte	0x6
	.quad	.LVL353
	.byte	0x4
	.uleb128 .LVL353-.LVL353
	.uleb128 .LVL356-.LVL353
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL356-.LVL353
	.uleb128 .LFE61-.LVL353
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x13
	.uleb128 0x526
	.byte	0x9f
	.byte	0
.LVUS113:
	.uleb128 .LVU1058
	.uleb128 .LVU1131
.LLST113:
	.byte	0x8
	.quad	.LVL367
	.uleb128 .LVL386-.LVL367
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS114:
	.uleb128 .LVU1058
	.uleb128 .LVU1124
.LLST114:
	.byte	0x8
	.quad	.LVL367
	.uleb128 .LVL383-.LVL367
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LVUS115:
	.uleb128 .LVU1127
	.uleb128 .LVU1133
.LLST115:
	.byte	0x8
	.quad	.LVL384
	.uleb128 .LVL387-.LVL384
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LVUS116:
	.uleb128 .LVU1129
	.uleb128 .LVU1134
	.uleb128 .LVU1134
	.uleb128 .LVU1137
.LLST116:
	.byte	0x6
	.quad	.LVL385
	.byte	0x4
	.uleb128 .LVL385-.LVL385
	.uleb128 .LVL388-.LVL385
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x4
	.uleb128 .LVL388-.LVL385
	.uleb128 .LVL389-.LVL385
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS118:
	.uleb128 .LVU1011
	.uleb128 .LVU1013
	.uleb128 .LVU1013
	.uleb128 .LVU1024
	.uleb128 .LVU1024
	.uleb128 .LVU1027
	.uleb128 .LVU1027
	.uleb128 .LVU1033
	.uleb128 .LVU1033
	.uleb128 .LVU1036
	.uleb128 .LVU1036
	.uleb128 .LVU1039
	.uleb128 .LVU1039
	.uleb128 .LVU1042
	.uleb128 .LVU1042
	.uleb128 .LVU1045
	.uleb128 .LVU1045
	.uleb128 .LVU1048
	.uleb128 .LVU1048
	.uleb128 .LVU1051
	.uleb128 .LVU1051
	.uleb128 .LVU1054
	.uleb128 .LVU1054
	.uleb128 .LVU1057
	.uleb128 .LVU1057
	.uleb128 0
.LLST118:
	.byte	0x6
	.quad	.LVL354
	.byte	0x4
	.uleb128 .LVL354-.LVL354
	.uleb128 .LVL354-.LVL354
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL354-.LVL354
	.uleb128 .LVL357-.LVL354
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL357-.LVL354
	.uleb128 .LVL358-.LVL354
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL358-.LVL354
	.uleb128 .LVL359-.LVL354
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL359-.LVL354
	.uleb128 .LVL360-.LVL354
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL360-.LVL354
	.uleb128 .LVL361-.LVL354
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL361-.LVL354
	.uleb128 .LVL362-.LVL354
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL362-.LVL354
	.uleb128 .LVL363-.LVL354
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL363-.LVL354
	.uleb128 .LVL364-.LVL354
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL364-.LVL354
	.uleb128 .LVL365-.LVL354
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL365-.LVL354
	.uleb128 .LVL366-.LVL354
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL366-.LVL354
	.uleb128 .LVL367-.LVL354
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL367-.LVL354
	.uleb128 .LFE61-.LVL354
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS120:
	.uleb128 .LVU1058
	.uleb128 .LVU1061
	.uleb128 .LVU1061
	.uleb128 .LVU1063
	.uleb128 .LVU1063
	.uleb128 .LVU1100
	.uleb128 .LVU1100
	.uleb128 .LVU1101
.LLST120:
	.byte	0x6
	.quad	.LVL367
	.byte	0x4
	.uleb128 .LVL367-.LVL367
	.uleb128 .LVL368-.LVL367
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL368-.LVL367
	.uleb128 .LVL369-.LVL367
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL369-.LVL367
	.uleb128 .LVL381-.LVL367
	.uleb128 0x3
	.byte	0x71
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL381-.LVL367
	.uleb128 .LVL382-.LVL367
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS122:
	.uleb128 .LVU1061
	.uleb128 .LVU1065
	.uleb128 .LVU1065
	.uleb128 .LVU1068
	.uleb128 .LVU1068
	.uleb128 .LVU1071
	.uleb128 .LVU1071
	.uleb128 .LVU1074
	.uleb128 .LVU1074
	.uleb128 .LVU1077
	.uleb128 .LVU1077
	.uleb128 .LVU1080
	.uleb128 .LVU1080
	.uleb128 .LVU1083
	.uleb128 .LVU1083
	.uleb128 .LVU1086
	.uleb128 .LVU1086
	.uleb128 .LVU1089
	.uleb128 .LVU1089
	.uleb128 .LVU1092
	.uleb128 .LVU1092
	.uleb128 .LVU1095
	.uleb128 .LVU1095
	.uleb128 .LVU1098
	.uleb128 .LVU1098
	.uleb128 .LVU1101
.LLST122:
	.byte	0x6
	.quad	.LVL368
	.byte	0x4
	.uleb128 .LVL368-.LVL368
	.uleb128 .LVL370-.LVL368
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL370-.LVL368
	.uleb128 .LVL371-.LVL368
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL371-.LVL368
	.uleb128 .LVL372-.LVL368
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL372-.LVL368
	.uleb128 .LVL373-.LVL368
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL373-.LVL368
	.uleb128 .LVL374-.LVL368
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL374-.LVL368
	.uleb128 .LVL375-.LVL368
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL375-.LVL368
	.uleb128 .LVL376-.LVL368
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL376-.LVL368
	.uleb128 .LVL377-.LVL368
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL377-.LVL368
	.uleb128 .LVL378-.LVL368
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL378-.LVL368
	.uleb128 .LVL379-.LVL368
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL379-.LVL368
	.uleb128 .LVL380-.LVL368
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL380-.LVL368
	.uleb128 .LVL381-.LVL368
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL381-.LVL368
	.uleb128 .LVL382-.LVL368
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS123:
	.uleb128 .LVU1101
	.uleb128 .LVU1104
	.uleb128 .LVU1104
	.uleb128 .LVU1106
	.uleb128 .LVU1106
	.uleb128 .LVU1108
	.uleb128 .LVU1108
	.uleb128 .LVU1110
	.uleb128 .LVU1110
	.uleb128 .LVU1112
	.uleb128 .LVU1112
	.uleb128 .LVU1114
	.uleb128 .LVU1114
	.uleb128 .LVU1116
	.uleb128 .LVU1116
	.uleb128 .LVU1118
	.uleb128 .LVU1118
	.uleb128 .LVU1120
	.uleb128 .LVU1120
	.uleb128 .LVU1122
	.uleb128 .LVU1122
	.uleb128 .LVU1126
	.uleb128 .LVU1126
	.uleb128 0
.LLST123:
	.byte	0x6
	.quad	.LVL382
	.byte	0x4
	.uleb128 .LVL382-.LVL382
	.uleb128 .LVL382-.LVL382
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL382-.LVL382
	.uleb128 .LVL382-.LVL382
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL382-.LVL382
	.uleb128 .LVL382-.LVL382
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL382-.LVL382
	.uleb128 .LVL382-.LVL382
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL382-.LVL382
	.uleb128 .LVL382-.LVL382
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL382-.LVL382
	.uleb128 .LVL382-.LVL382
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL382-.LVL382
	.uleb128 .LVL382-.LVL382
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL382-.LVL382
	.uleb128 .LVL382-.LVL382
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL382-.LVL382
	.uleb128 .LVL382-.LVL382
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL382-.LVL382
	.uleb128 .LVL382-.LVL382
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL382-.LVL382
	.uleb128 .LVL384-.LVL382
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL384-.LVL382
	.uleb128 .LFE61-.LVL382
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS124:
	.uleb128 .LVU1129
	.uleb128 .LVU1130
.LLST124:
	.byte	0x8
	.quad	.LVL385
	.uleb128 .LVL385-.LVL385
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS109:
	.uleb128 0
	.uleb128 .LVU986
	.uleb128 .LVU986
	.uleb128 0
.LLST109:
	.byte	0x6
	.quad	.LVL344
	.byte	0x4
	.uleb128 .LVL344-.LVL344
	.uleb128 .LVL349-.LVL344
	.uleb128 0x2
	.byte	0x72
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL349-.LVL344
	.uleb128 .LFE58-.LVL344
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.byte	0
.LVUS110:
	.uleb128 .LVU976
	.uleb128 .LVU978
	.uleb128 .LVU978
	.uleb128 .LVU981
	.uleb128 .LVU981
	.uleb128 .LVU984
	.uleb128 .LVU984
	.uleb128 .LVU986
	.uleb128 .LVU986
	.uleb128 .LVU987
.LLST110:
	.byte	0x6
	.quad	.LVL345
	.byte	0x4
	.uleb128 .LVL345-.LVL345
	.uleb128 .LVL346-.LVL345
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL346-.LVL345
	.uleb128 .LVL347-.LVL345
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL347-.LVL345
	.uleb128 .LVL348-.LVL345
	.uleb128 0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL348-.LVL345
	.uleb128 .LVL349-.LVL345
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL349-.LVL345
	.uleb128 .LVL350-.LVL345
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS106:
	.uleb128 0
	.uleb128 .LVU964
	.uleb128 .LVU964
	.uleb128 .LVU970
	.uleb128 .LVU970
	.uleb128 0
.LLST106:
	.byte	0x6
	.quad	.LVL337
	.byte	0x4
	.uleb128 .LVL337-.LVL337
	.uleb128 .LVL341-.LVL337
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL341-.LVL337
	.uleb128 .LVL343-.LVL337
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL343-.LVL337
	.uleb128 .LFE57-.LVL337
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS108:
	.uleb128 .LVU946
	.uleb128 .LVU947
	.uleb128 .LVU970
	.uleb128 0
.LLST108:
	.byte	0x6
	.quad	.LVL338
	.byte	0x4
	.uleb128 .LVL338-.LVL338
	.uleb128 .LVL339-.LVL338
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL343-.LVL338
	.uleb128 .LFE57-.LVL338
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS102:
	.uleb128 0
	.uleb128 .LVU915
	.uleb128 .LVU915
	.uleb128 .LVU937
	.uleb128 .LVU937
	.uleb128 .LVU943
	.uleb128 .LVU943
	.uleb128 0
.LLST102:
	.byte	0x6
	.quad	.LVL329
	.byte	0x4
	.uleb128 .LVL329-.LVL329
	.uleb128 .LVL331-.LVL329
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL331-.LVL329
	.uleb128 .LVL333-.LVL329
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL333-.LVL329
	.uleb128 .LVL336-.LVL329
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL336-.LVL329
	.uleb128 .LFE56-.LVL329
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS103:
	.uleb128 0
	.uleb128 .LVU922
	.uleb128 .LVU922
	.uleb128 .LVU942
	.uleb128 .LVU942
	.uleb128 .LVU943
	.uleb128 .LVU943
	.uleb128 0
.LLST103:
	.byte	0x6
	.quad	.LVL329
	.byte	0x4
	.uleb128 .LVL329-.LVL329
	.uleb128 .LVL332-.LVL329
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.byte	0x4
	.uleb128 .LVL332-.LVL329
	.uleb128 .LVL335-.LVL329
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL335-.LVL329
	.uleb128 .LVL336-.LVL329
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.byte	0x4
	.uleb128 .LVL336-.LVL329
	.uleb128 .LFE56-.LVL329
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LVUS105:
	.uleb128 .LVU912
	.uleb128 .LVU915
	.uleb128 .LVU943
	.uleb128 0
.LLST105:
	.byte	0x6
	.quad	.LVL330
	.byte	0x4
	.uleb128 .LVL330-.LVL330
	.uleb128 .LVL331-.LVL330
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL336-.LVL330
	.uleb128 .LFE56-.LVL330
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS99:
	.uleb128 0
	.uleb128 .LVU894
	.uleb128 .LVU894
	.uleb128 .LVU899
	.uleb128 .LVU899
	.uleb128 0
.LLST99:
	.byte	0x6
	.quad	.LVL318
	.byte	0x4
	.uleb128 .LVL318-.LVL318
	.uleb128 .LVL322-.LVL318
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL322-.LVL318
	.uleb128 .LVL324-.LVL318
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL324-.LVL318
	.uleb128 .LFE55-.LVL318
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS101:
	.uleb128 .LVU873
	.uleb128 .LVU874
	.uleb128 .LVU899
	.uleb128 .LVU902
	.uleb128 .LVU902
	.uleb128 .LVU904
	.uleb128 .LVU904
	.uleb128 .LVU907
	.uleb128 .LVU907
	.uleb128 .LVU909
	.uleb128 .LVU909
	.uleb128 0
.LLST101:
	.byte	0x6
	.quad	.LVL319
	.byte	0x4
	.uleb128 .LVL319-.LVL319
	.uleb128 .LVL320-.LVL319
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL324-.LVL319
	.uleb128 .LVL325-.LVL319
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL325-.LVL319
	.uleb128 .LVL326-.LVL319
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL326-.LVL319
	.uleb128 .LVL327-.LVL319
	.uleb128 0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL327-.LVL319
	.uleb128 .LVL328-.LVL319
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL328-.LVL319
	.uleb128 .LFE55-.LVL319
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS95:
	.uleb128 0
	.uleb128 .LVU843
	.uleb128 .LVU843
	.uleb128 0
.LLST95:
	.byte	0x6
	.quad	.LVL310
	.byte	0x4
	.uleb128 .LVL310-.LVL310
	.uleb128 .LVL312-.LVL310
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL312-.LVL310
	.uleb128 .LFE54-.LVL310
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LVUS96:
	.uleb128 0
	.uleb128 .LVU844
	.uleb128 .LVU844
	.uleb128 .LVU870
	.uleb128 .LVU870
	.uleb128 0
.LLST96:
	.byte	0x6
	.quad	.LVL310
	.byte	0x4
	.uleb128 .LVL310-.LVL310
	.uleb128 .LVL313-.LVL310
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL313-.LVL310
	.uleb128 .LVL317-.LVL310
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL317-.LVL310
	.uleb128 .LFE54-.LVL310
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS98:
	.uleb128 .LVU841
	.uleb128 .LVU845
	.uleb128 .LVU870
	.uleb128 0
.LLST98:
	.byte	0x6
	.quad	.LVL311
	.byte	0x4
	.uleb128 .LVL311-.LVL311
	.uleb128 .LVL314-.LVL311
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL317-.LVL311
	.uleb128 .LFE54-.LVL311
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS89:
	.uleb128 0
	.uleb128 .LVU763
	.uleb128 .LVU763
	.uleb128 .LVU764
	.uleb128 .LVU764
	.uleb128 .LVU837
	.uleb128 .LVU837
	.uleb128 0
.LLST89:
	.byte	0x6
	.quad	.LVL284
	.byte	0x4
	.uleb128 .LVL284-.LVL284
	.uleb128 .LVL288-.LVL284
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL288-.LVL284
	.uleb128 .LVL289-.LVL284
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL289-.LVL284
	.uleb128 .LVL309-.LVL284
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL309-.LVL284
	.uleb128 .LFE53-.LVL284
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS90:
	.uleb128 0
	.uleb128 .LVU762
	.uleb128 .LVU762
	.uleb128 .LVU836
	.uleb128 .LVU836
	.uleb128 .LVU837
	.uleb128 .LVU837
	.uleb128 0
.LLST90:
	.byte	0x6
	.quad	.LVL284
	.byte	0x4
	.uleb128 .LVL284-.LVL284
	.uleb128 .LVL287-.LVL284
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL287-.LVL284
	.uleb128 .LVL308-.LVL284
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL308-.LVL284
	.uleb128 .LVL309-.LVL284
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL309-.LVL284
	.uleb128 .LFE53-.LVL284
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS91:
	.uleb128 .LVU761
	.uleb128 .LVU764
	.uleb128 .LVU764
	.uleb128 .LVU766
	.uleb128 .LVU766
	.uleb128 .LVU784
	.uleb128 .LVU837
	.uleb128 0
.LLST91:
	.byte	0x6
	.quad	.LVL286
	.byte	0x4
	.uleb128 .LVL286-.LVL286
	.uleb128 .LVL289-.LVL286
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL289-.LVL286
	.uleb128 .LVL290-.LVL286
	.uleb128 0x3
	.byte	0x72
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL290-.LVL286
	.uleb128 .LVL291-.LVL286
	.uleb128 0x3
	.byte	0x79
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL309-.LVL286
	.uleb128 .LFE53-.LVL286
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS92:
	.uleb128 .LVU786
	.uleb128 .LVU788
	.uleb128 .LVU811
	.uleb128 .LVU813
	.uleb128 .LVU817
	.uleb128 .LVU834
.LLST92:
	.byte	0x6
	.quad	.LVL292
	.byte	0x4
	.uleb128 .LVL292-.LVL292
	.uleb128 .LVL292-.LVL292
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL300-.LVL292
	.uleb128 .LVL301-.LVL292
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL303-.LVL292
	.uleb128 .LVL306-.LVL292
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS94:
	.uleb128 .LVU786
	.uleb128 .LVU788
.LLST94:
	.byte	0x8
	.quad	.LVL292
	.uleb128 .LVL292-.LVL292
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS85:
	.uleb128 0
	.uleb128 .LVU750
	.uleb128 .LVU750
	.uleb128 .LVU755
	.uleb128 .LVU755
	.uleb128 0
.LLST85:
	.byte	0x6
	.quad	.LVL276
	.byte	0x4
	.uleb128 .LVL276-.LVL276
	.uleb128 .LVL281-.LVL276
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL281-.LVL276
	.uleb128 .LVL283-.LVL276
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL283-.LVL276
	.uleb128 .LFE52-.LVL276
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS86:
	.uleb128 .LVU738
	.uleb128 .LVU752
	.uleb128 .LVU755
	.uleb128 0
.LLST86:
	.byte	0x6
	.quad	.LVL277
	.byte	0x4
	.uleb128 .LVL277-.LVL277
	.uleb128 .LVL282-.LVL277
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL283-.LVL277
	.uleb128 .LFE52-.LVL277
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS88:
	.uleb128 .LVU739
	.uleb128 .LVU740
	.uleb128 .LVU755
	.uleb128 0
.LLST88:
	.byte	0x6
	.quad	.LVL278
	.byte	0x4
	.uleb128 .LVL278-.LVL278
	.uleb128 .LVL279-.LVL278
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL283-.LVL278
	.uleb128 .LFE52-.LVL278
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS79:
	.uleb128 0
	.uleb128 .LVU680
	.uleb128 .LVU680
	.uleb128 .LVU734
	.uleb128 .LVU734
	.uleb128 0
.LLST79:
	.byte	0x6
	.quad	.LVL258
	.byte	0x4
	.uleb128 .LVL258-.LVL258
	.uleb128 .LVL261-.LVL258
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL261-.LVL258
	.uleb128 .LVL275-.LVL258
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL275-.LVL258
	.uleb128 .LFE51-.LVL258
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS80:
	.uleb128 0
	.uleb128 .LVU729
	.uleb128 .LVU729
	.uleb128 .LVU734
	.uleb128 .LVU734
	.uleb128 0
.LLST80:
	.byte	0x6
	.quad	.LVL258
	.byte	0x4
	.uleb128 .LVL258-.LVL258
	.uleb128 .LVL272-.LVL258
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL272-.LVL258
	.uleb128 .LVL275-.LVL258
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL275-.LVL258
	.uleb128 .LFE51-.LVL258
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LVUS81:
	.uleb128 .LVU676
	.uleb128 .LVU681
	.uleb128 .LVU734
	.uleb128 0
.LLST81:
	.byte	0x6
	.quad	.LVL260
	.byte	0x4
	.uleb128 .LVL260-.LVL260
	.uleb128 .LVL262-.LVL260
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL275-.LVL260
	.uleb128 .LFE51-.LVL260
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS82:
	.uleb128 .LVU703
	.uleb128 .LVU705
	.uleb128 .LVU710
	.uleb128 .LVU712
	.uleb128 .LVU716
	.uleb128 .LVU733
.LLST82:
	.byte	0x6
	.quad	.LVL264
	.byte	0x4
	.uleb128 .LVL264-.LVL264
	.uleb128 .LVL264-.LVL264
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL266-.LVL264
	.uleb128 .LVL267-.LVL264
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL269-.LVL264
	.uleb128 .LVL273-.LVL264
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS83:
	.uleb128 .LVU681
	.uleb128 .LVU687
	.uleb128 .LVU687
	.uleb128 .LVU689
	.uleb128 .LVU689
	.uleb128 .LVU691
	.uleb128 .LVU691
	.uleb128 .LVU693
	.uleb128 .LVU693
	.uleb128 .LVU695
	.uleb128 .LVU695
	.uleb128 .LVU697
	.uleb128 .LVU697
	.uleb128 .LVU699
	.uleb128 .LVU699
	.uleb128 .LVU701
	.uleb128 .LVU701
	.uleb128 .LVU703
.LLST83:
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
	.uleb128 .LVL263-.LVL262
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL263-.LVL262
	.uleb128 .LVL263-.LVL262
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL263-.LVL262
	.uleb128 .LVL263-.LVL262
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL263-.LVL262
	.uleb128 .LVL263-.LVL262
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL263-.LVL262
	.uleb128 .LVL263-.LVL262
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL263-.LVL262
	.uleb128 .LVL263-.LVL262
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL263-.LVL262
	.uleb128 .LVL263-.LVL262
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL263-.LVL262
	.uleb128 .LVL264-.LVL262
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0
.LVUS84:
	.uleb128 .LVU703
	.uleb128 .LVU705
.LLST84:
	.byte	0x8
	.quad	.LVL264
	.uleb128 .LVL264-.LVL264
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS75:
	.uleb128 0
	.uleb128 .LVU663
	.uleb128 .LVU663
	.uleb128 .LVU669
	.uleb128 .LVU669
	.uleb128 0
.LLST75:
	.byte	0x6
	.quad	.LVL248
	.byte	0x4
	.uleb128 .LVL248-.LVL248
	.uleb128 .LVL255-.LVL248
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL255-.LVL248
	.uleb128 .LVL257-.LVL248
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL257-.LVL248
	.uleb128 .LFE50-.LVL248
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS76:
	.uleb128 .LVU645
	.uleb128 .LVU646
	.uleb128 .LVU650
	.uleb128 .LVU667
	.uleb128 .LVU669
	.uleb128 0
.LLST76:
	.byte	0x6
	.quad	.LVL249
	.byte	0x4
	.uleb128 .LVL249-.LVL249
	.uleb128 .LVL250-.LVL249
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL252-.LVL249
	.uleb128 .LVL256-.LVL249
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL257-.LVL249
	.uleb128 .LFE50-.LVL249
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS78:
	.uleb128 .LVU645
	.uleb128 .LVU646
	.uleb128 .LVU669
	.uleb128 0
.LLST78:
	.byte	0x6
	.quad	.LVL249
	.byte	0x4
	.uleb128 .LVL249-.LVL249
	.uleb128 .LVL250-.LVL249
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL257-.LVL249
	.uleb128 .LFE50-.LVL249
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS73:
	.uleb128 0
	.uleb128 .LVU624
	.uleb128 .LVU624
	.uleb128 0
.LLST73:
	.byte	0x6
	.quad	.LVL239
	.byte	0x4
	.uleb128 .LVL239-.LVL239
	.uleb128 .LVL244-.LVL239
	.uleb128 0x2
	.byte	0x72
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL244-.LVL239
	.uleb128 .LFE47-.LVL239
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.byte	0
.LVUS74:
	.uleb128 .LVU615
	.uleb128 .LVU617
	.uleb128 .LVU617
	.uleb128 .LVU620
	.uleb128 .LVU620
	.uleb128 .LVU622
	.uleb128 .LVU622
	.uleb128 .LVU624
	.uleb128 .LVU624
	.uleb128 .LVU625
.LLST74:
	.byte	0x6
	.quad	.LVL240
	.byte	0x4
	.uleb128 .LVL240-.LVL240
	.uleb128 .LVL241-.LVL240
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL241-.LVL240
	.uleb128 .LVL242-.LVL240
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL242-.LVL240
	.uleb128 .LVL243-.LVL240
	.uleb128 0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL243-.LVL240
	.uleb128 .LVL244-.LVL240
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL244-.LVL240
	.uleb128 .LVL245-.LVL240
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS70:
	.uleb128 0
	.uleb128 .LVU601
	.uleb128 .LVU601
	.uleb128 .LVU608
	.uleb128 .LVU608
	.uleb128 .LVU609
	.uleb128 .LVU609
	.uleb128 0
.LLST70:
	.byte	0x6
	.quad	.LVL232
	.byte	0x4
	.uleb128 .LVL232-.LVL232
	.uleb128 .LVL235-.LVL232
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL235-.LVL232
	.uleb128 .LVL237-.LVL232
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL237-.LVL232
	.uleb128 .LVL238-.LVL232
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL238-.LVL232
	.uleb128 .LFE46-.LVL232
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0
.LVUS72:
	.uleb128 .LVU596
	.uleb128 .LVU597
	.uleb128 .LVU608
	.uleb128 0
.LLST72:
	.byte	0x6
	.quad	.LVL233
	.byte	0x4
	.uleb128 .LVL233-.LVL233
	.uleb128 .LVL234-.LVL233
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL237-.LVL233
	.uleb128 .LFE46-.LVL233
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS65:
	.uleb128 0
	.uleb128 .LVU587
	.uleb128 .LVU587
	.uleb128 .LVU593
	.uleb128 .LVU593
	.uleb128 0
.LLST65:
	.byte	0x6
	.quad	.LVL223
	.byte	0x4
	.uleb128 .LVL223-.LVL223
	.uleb128 .LVL228-.LVL223
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL228-.LVL223
	.uleb128 .LVL231-.LVL223
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x11
	.uleb128 0x51c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL231-.LVL223
	.uleb128 .LFE45-.LVL223
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS66:
	.uleb128 0
	.uleb128 .LVU558
	.uleb128 .LVU558
	.uleb128 .LVU593
	.uleb128 .LVU593
	.uleb128 0
.LLST66:
	.byte	0x6
	.quad	.LVL223
	.byte	0x4
	.uleb128 .LVL223-.LVL223
	.uleb128 .LVL225-.LVL223
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL225-.LVL223
	.uleb128 .LVL231-.LVL223
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL231-.LVL223
	.uleb128 .LFE45-.LVL223
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS67:
	.uleb128 0
	.uleb128 .LVU567
	.uleb128 .LVU567
	.uleb128 .LVU592
	.uleb128 .LVU592
	.uleb128 .LVU593
	.uleb128 .LVU593
	.uleb128 0
.LLST67:
	.byte	0x6
	.quad	.LVL223
	.byte	0x4
	.uleb128 .LVL223-.LVL223
	.uleb128 .LVL227-.LVL223
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.byte	0x4
	.uleb128 .LVL227-.LVL223
	.uleb128 .LVL230-.LVL223
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL230-.LVL223
	.uleb128 .LVL231-.LVL223
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.byte	0x4
	.uleb128 .LVL231-.LVL223
	.uleb128 .LFE45-.LVL223
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LVUS69:
	.uleb128 .LVU555
	.uleb128 .LVU559
	.uleb128 .LVU593
	.uleb128 0
.LLST69:
	.byte	0x6
	.quad	.LVL224
	.byte	0x4
	.uleb128 .LVL224-.LVL224
	.uleb128 .LVL226-.LVL224
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL231-.LVL224
	.uleb128 .LFE45-.LVL224
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS60:
	.uleb128 0
	.uleb128 .LVU536
	.uleb128 .LVU536
	.uleb128 .LVU541
	.uleb128 .LVU541
	.uleb128 0
.LLST60:
	.byte	0x6
	.quad	.LVL210
	.byte	0x4
	.uleb128 .LVL210-.LVL210
	.uleb128 .LVL215-.LVL210
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL215-.LVL210
	.uleb128 .LVL217-.LVL210
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x11
	.uleb128 0x51c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL217-.LVL210
	.uleb128 .LFE44-.LVL210
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS61:
	.uleb128 0
	.uleb128 .LVU535
	.uleb128 .LVU535
	.uleb128 .LVU541
	.uleb128 .LVU541
	.uleb128 0
.LLST61:
	.byte	0x6
	.quad	.LVL210
	.byte	0x4
	.uleb128 .LVL210-.LVL210
	.uleb128 .LVL214-.LVL210
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL214-.LVL210
	.uleb128 .LVL217-.LVL210
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL217-.LVL210
	.uleb128 .LFE44-.LVL210
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LVUS62:
	.uleb128 0
	.uleb128 .LVU533
	.uleb128 .LVU533
	.uleb128 .LVU541
	.uleb128 .LVU541
	.uleb128 .LVU552
	.uleb128 .LVU552
	.uleb128 0
.LLST62:
	.byte	0x6
	.quad	.LVL210
	.byte	0x4
	.uleb128 .LVL210-.LVL210
	.uleb128 .LVL213-.LVL210
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL213-.LVL210
	.uleb128 .LVL217-.LVL210
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL217-.LVL210
	.uleb128 .LVL222-.LVL210
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL222-.LVL210
	.uleb128 .LFE44-.LVL210
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0
.LVUS64:
	.uleb128 .LVU528
	.uleb128 .LVU529
	.uleb128 .LVU541
	.uleb128 .LVU544
	.uleb128 .LVU544
	.uleb128 .LVU546
	.uleb128 .LVU546
	.uleb128 .LVU549
	.uleb128 .LVU549
	.uleb128 .LVU551
	.uleb128 .LVU551
	.uleb128 0
.LLST64:
	.byte	0x6
	.quad	.LVL211
	.byte	0x4
	.uleb128 .LVL211-.LVL211
	.uleb128 .LVL212-.LVL211
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL217-.LVL211
	.uleb128 .LVL218-.LVL211
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL218-.LVL211
	.uleb128 .LVL219-.LVL211
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL219-.LVL211
	.uleb128 .LVL220-.LVL211
	.uleb128 0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL220-.LVL211
	.uleb128 .LVL221-.LVL211
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL221-.LVL211
	.uleb128 .LFE44-.LVL211
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS55:
	.uleb128 0
	.uleb128 .LVU519
	.uleb128 .LVU519
	.uleb128 .LVU524
	.uleb128 .LVU524
	.uleb128 0
.LLST55:
	.byte	0x6
	.quad	.LVL201
	.byte	0x4
	.uleb128 .LVL201-.LVL201
	.uleb128 .LVL206-.LVL201
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL206-.LVL201
	.uleb128 .LVL208-.LVL201
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x11
	.uleb128 0x51c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL208-.LVL201
	.uleb128 .LFE43-.LVL201
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS56:
	.uleb128 0
	.uleb128 .LVU518
	.uleb128 .LVU518
	.uleb128 .LVU524
	.uleb128 .LVU524
	.uleb128 0
.LLST56:
	.byte	0x6
	.quad	.LVL201
	.byte	0x4
	.uleb128 .LVL201-.LVL201
	.uleb128 .LVL205-.LVL201
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL205-.LVL201
	.uleb128 .LVL208-.LVL201
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL208-.LVL201
	.uleb128 .LFE43-.LVL201
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LVUS57:
	.uleb128 0
	.uleb128 .LVU516
	.uleb128 .LVU516
	.uleb128 .LVU524
	.uleb128 .LVU524
	.uleb128 .LVU525
	.uleb128 .LVU525
	.uleb128 0
.LLST57:
	.byte	0x6
	.quad	.LVL201
	.byte	0x4
	.uleb128 .LVL201-.LVL201
	.uleb128 .LVL204-.LVL201
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL204-.LVL201
	.uleb128 .LVL208-.LVL201
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL208-.LVL201
	.uleb128 .LVL209-.LVL201
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL209-.LVL201
	.uleb128 .LFE43-.LVL201
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0
.LVUS59:
	.uleb128 .LVU511
	.uleb128 .LVU512
	.uleb128 .LVU524
	.uleb128 0
.LLST59:
	.byte	0x6
	.quad	.LVL202
	.byte	0x4
	.uleb128 .LVL202-.LVL202
	.uleb128 .LVL203-.LVL202
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL208-.LVL202
	.uleb128 .LFE43-.LVL202
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS49:
	.uleb128 0
	.uleb128 .LVU422
	.uleb128 .LVU422
	.uleb128 .LVU508
	.uleb128 .LVU508
	.uleb128 0
.LLST49:
	.byte	0x6
	.quad	.LVL154
	.byte	0x4
	.uleb128 .LVL154-.LVL154
	.uleb128 .LVL157-.LVL154
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL157-.LVL154
	.uleb128 .LVL200-.LVL154
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL200-.LVL154
	.uleb128 .LFE42-.LVL154
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS50:
	.uleb128 0
	.uleb128 .LVU498
	.uleb128 .LVU498
	.uleb128 .LVU508
	.uleb128 .LVU508
	.uleb128 0
.LLST50:
	.byte	0x6
	.quad	.LVL154
	.byte	0x4
	.uleb128 .LVL154-.LVL154
	.uleb128 .LVL193-.LVL154
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL193-.LVL154
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
	.uleb128 .LVU421
	.uleb128 .LVU423
	.uleb128 .LVU423
	.uleb128 .LVU425
	.uleb128 .LVU425
	.uleb128 .LVU429
	.uleb128 .LVU508
	.uleb128 0
.LLST51:
	.byte	0x6
	.quad	.LVL156
	.byte	0x4
	.uleb128 .LVL156-.LVL156
	.uleb128 .LVL158-.LVL156
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL158-.LVL156
	.uleb128 .LVL159-.LVL156
	.uleb128 0x3
	.byte	0x7b
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL159-.LVL156
	.uleb128 .LVL160-.LVL156
	.uleb128 0x3
	.byte	0x7a
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL200-.LVL156
	.uleb128 .LFE42-.LVL156
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS52:
	.uleb128 .LVU431
	.uleb128 .LVU434
	.uleb128 .LVU434
	.uleb128 .LVU437
	.uleb128 .LVU437
	.uleb128 .LVU438
	.uleb128 .LVU438
	.uleb128 .LVU441
	.uleb128 .LVU441
	.uleb128 .LVU442
	.uleb128 .LVU442
	.uleb128 .LVU445
	.uleb128 .LVU445
	.uleb128 .LVU446
	.uleb128 .LVU446
	.uleb128 .LVU449
	.uleb128 .LVU449
	.uleb128 .LVU450
	.uleb128 .LVU450
	.uleb128 .LVU453
	.uleb128 .LVU453
	.uleb128 .LVU454
	.uleb128 .LVU454
	.uleb128 .LVU457
	.uleb128 .LVU458
	.uleb128 .LVU461
	.uleb128 .LVU462
	.uleb128 .LVU465
	.uleb128 .LVU466
	.uleb128 .LVU469
	.uleb128 .LVU470
	.uleb128 .LVU473
	.uleb128 .LVU474
	.uleb128 .LVU477
	.uleb128 .LVU478
	.uleb128 .LVU481
	.uleb128 .LVU482
	.uleb128 .LVU485
	.uleb128 .LVU486
	.uleb128 .LVU489
	.uleb128 .LVU490
	.uleb128 .LVU493
	.uleb128 .LVU494
	.uleb128 .LVU500
	.uleb128 .LVU501
	.uleb128 .LVU508
.LLST52:
	.byte	0x6
	.quad	.LVL161
	.byte	0x4
	.uleb128 .LVL161-.LVL161
	.uleb128 .LVL162-.LVL161
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0x4
	.uleb128 .LVL162-.LVL161
	.uleb128 .LVL163-.LVL161
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL163-.LVL161
	.uleb128 .LVL164-.LVL161
	.uleb128 0x1d
	.byte	0x91
	.sleb128 -432
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0xa4
	.uleb128 0x51c
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -424
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL164-.LVL161
	.uleb128 .LVL165-.LVL161
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL165-.LVL161
	.uleb128 .LVL166-.LVL161
	.uleb128 0x2d
	.byte	0x91
	.sleb128 -432
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0xa4
	.uleb128 0x51c
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -424
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -416
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -408
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL166-.LVL161
	.uleb128 .LVL167-.LVL161
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL167-.LVL161
	.uleb128 .LVL168-.LVL161
	.uleb128 0x3d
	.byte	0x91
	.sleb128 -432
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0xa4
	.uleb128 0x51c
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -424
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -416
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -408
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -400
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -392
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL168-.LVL161
	.uleb128 .LVL169-.LVL161
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL169-.LVL161
	.uleb128 .LVL170-.LVL161
	.uleb128 0x4d
	.byte	0x91
	.sleb128 -432
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0xa4
	.uleb128 0x51c
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -424
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -416
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -408
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -400
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -392
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -384
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -376
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL170-.LVL161
	.uleb128 .LVL171-.LVL161
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL171-.LVL161
	.uleb128 .LVL172-.LVL161
	.uleb128 0x5d
	.byte	0x91
	.sleb128 -432
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0xa4
	.uleb128 0x51c
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -424
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -416
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -408
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -400
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -392
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -384
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -376
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -368
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -360
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL172-.LVL161
	.uleb128 .LVL173-.LVL161
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL174-.LVL161
	.uleb128 .LVL175-.LVL161
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL176-.LVL161
	.uleb128 .LVL177-.LVL161
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL178-.LVL161
	.uleb128 .LVL179-.LVL161
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL180-.LVL161
	.uleb128 .LVL181-.LVL161
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL182-.LVL161
	.uleb128 .LVL183-.LVL161
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL184-.LVL161
	.uleb128 .LVL185-.LVL161
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL186-.LVL161
	.uleb128 .LVL187-.LVL161
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL188-.LVL161
	.uleb128 .LVL189-.LVL161
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL190-.LVL161
	.uleb128 .LVL191-.LVL161
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL192-.LVL161
	.uleb128 .LVL195-.LVL161
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL196-.LVL161
	.uleb128 .LVL200-.LVL161
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS54:
	.uleb128 .LVU431
	.uleb128 .LVU433
.LLST54:
	.byte	0x8
	.quad	.LVL161
	.uleb128 .LVL161-.LVL161
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS45:
	.uleb128 0
	.uleb128 .LVU411
	.uleb128 .LVU411
	.uleb128 .LVU414
	.uleb128 .LVU414
	.uleb128 .LVU415
	.uleb128 .LVU415
	.uleb128 0
.LLST45:
	.byte	0x6
	.quad	.LVL146
	.byte	0x4
	.uleb128 .LVL146-.LVL146
	.uleb128 .LVL150-.LVL146
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL150-.LVL146
	.uleb128 .LVL152-.LVL146
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL152-.LVL146
	.uleb128 .LVL153-.LVL146
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL153-.LVL146
	.uleb128 .LFE41-.LVL146
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0
.LVUS46:
	.uleb128 .LVU407
	.uleb128 .LVU412
	.uleb128 .LVU414
	.uleb128 0
.LLST46:
	.byte	0x6
	.quad	.LVL147
	.byte	0x4
	.uleb128 .LVL147-.LVL147
	.uleb128 .LVL151-.LVL147
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0x4
	.uleb128 .LVL152-.LVL147
	.uleb128 .LFE41-.LVL147
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0
.LVUS48:
	.uleb128 .LVU408
	.uleb128 .LVU409
	.uleb128 .LVU414
	.uleb128 0
.LLST48:
	.byte	0x6
	.quad	.LVL148
	.byte	0x4
	.uleb128 .LVL148-.LVL148
	.uleb128 .LVL149-.LVL148
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL152-.LVL148
	.uleb128 .LFE41-.LVL148
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS39:
	.uleb128 0
	.uleb128 .LVU356
	.uleb128 .LVU356
	.uleb128 .LVU404
	.uleb128 .LVU404
	.uleb128 0
.LLST39:
	.byte	0x6
	.quad	.LVL125
	.byte	0x4
	.uleb128 .LVL125-.LVL125
	.uleb128 .LVL128-.LVL125
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL128-.LVL125
	.uleb128 .LVL145-.LVL125
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL145-.LVL125
	.uleb128 .LFE40-.LVL125
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS40:
	.uleb128 0
	.uleb128 .LVU394
	.uleb128 .LVU394
	.uleb128 .LVU404
	.uleb128 .LVU404
	.uleb128 0
.LLST40:
	.byte	0x6
	.quad	.LVL125
	.byte	0x4
	.uleb128 .LVL125-.LVL125
	.uleb128 .LVL138-.LVL125
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL138-.LVL125
	.uleb128 .LVL145-.LVL125
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL145-.LVL125
	.uleb128 .LFE40-.LVL125
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LVUS41:
	.uleb128 .LVU355
	.uleb128 .LVU356
	.uleb128 .LVU404
	.uleb128 0
.LLST41:
	.byte	0x6
	.quad	.LVL127
	.byte	0x4
	.uleb128 .LVL127-.LVL127
	.uleb128 .LVL128-.LVL127
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL145-.LVL127
	.uleb128 .LFE40-.LVL127
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS42:
	.uleb128 .LVU375
	.uleb128 .LVU378
	.uleb128 .LVU378
	.uleb128 .LVU381
	.uleb128 .LVU381
	.uleb128 .LVU382
	.uleb128 .LVU382
	.uleb128 .LVU385
	.uleb128 .LVU385
	.uleb128 .LVU386
	.uleb128 .LVU386
	.uleb128 .LVU389
	.uleb128 .LVU389
	.uleb128 .LVU390
	.uleb128 .LVU390
	.uleb128 .LVU396
	.uleb128 .LVU397
	.uleb128 .LVU404
.LLST42:
	.byte	0x6
	.quad	.LVL130
	.byte	0x4
	.uleb128 .LVL130-.LVL130
	.uleb128 .LVL131-.LVL130
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0x4
	.uleb128 .LVL131-.LVL130
	.uleb128 .LVL132-.LVL130
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL132-.LVL130
	.uleb128 .LVL133-.LVL130
	.uleb128 0x1d
	.byte	0x91
	.sleb128 -80
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0xa4
	.uleb128 0x51c
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -72
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL133-.LVL130
	.uleb128 .LVL134-.LVL130
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL134-.LVL130
	.uleb128 .LVL135-.LVL130
	.uleb128 0x2b
	.byte	0x91
	.sleb128 -80
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0xa4
	.uleb128 0x51c
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -72
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -64
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -56
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL135-.LVL130
	.uleb128 .LVL136-.LVL130
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL136-.LVL130
	.uleb128 .LVL137-.LVL130
	.uleb128 0x39
	.byte	0x91
	.sleb128 -80
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0xa4
	.uleb128 0x51c
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -72
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -64
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -56
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -48
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x91
	.sleb128 -40
	.byte	0xa6
	.byte	0x8
	.uleb128 0x51c
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL137-.LVL130
	.uleb128 .LVL140-.LVL130
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL141-.LVL130
	.uleb128 .LVL145-.LVL130
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS43:
	.uleb128 .LVU356
	.uleb128 .LVU359
	.uleb128 .LVU359
	.uleb128 .LVU361
	.uleb128 .LVU361
	.uleb128 .LVU363
	.uleb128 .LVU363
	.uleb128 .LVU365
	.uleb128 .LVU365
	.uleb128 .LVU367
	.uleb128 .LVU367
	.uleb128 .LVU369
	.uleb128 .LVU369
	.uleb128 .LVU371
	.uleb128 .LVU371
	.uleb128 .LVU373
	.uleb128 .LVU373
	.uleb128 .LVU375
.LLST43:
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
	.uleb128 .LVL129-.LVL128
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL129-.LVL128
	.uleb128 .LVL129-.LVL128
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL129-.LVL128
	.uleb128 .LVL129-.LVL128
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL129-.LVL128
	.uleb128 .LVL129-.LVL128
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL129-.LVL128
	.uleb128 .LVL129-.LVL128
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL129-.LVL128
	.uleb128 .LVL129-.LVL128
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL129-.LVL128
	.uleb128 .LVL129-.LVL128
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL129-.LVL128
	.uleb128 .LVL130-.LVL128
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0
.LVUS44:
	.uleb128 .LVU375
	.uleb128 .LVU377
.LLST44:
	.byte	0x8
	.quad	.LVL130
	.uleb128 .LVL130-.LVL130
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS35:
	.uleb128 0
	.uleb128 .LVU340
	.uleb128 .LVU340
	.uleb128 .LVU345
	.uleb128 .LVU345
	.uleb128 .LVU348
	.uleb128 .LVU348
	.uleb128 0
.LLST35:
	.byte	0x6
	.quad	.LVL116
	.byte	0x4
	.uleb128 .LVL116-.LVL116
	.uleb128 .LVL121-.LVL116
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL121-.LVL116
	.uleb128 .LVL123-.LVL116
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL123-.LVL116
	.uleb128 .LVL124-.LVL116
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL124-.LVL116
	.uleb128 .LFE39-.LVL116
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0
.LVUS36:
	.uleb128 .LVU334
	.uleb128 .LVU336
	.uleb128 .LVU336
	.uleb128 .LVU337
	.uleb128 .LVU338
	.uleb128 .LVU345
	.uleb128 .LVU345
	.uleb128 0
.LLST36:
	.byte	0x6
	.quad	.LVL117
	.byte	0x4
	.uleb128 .LVL117-.LVL117
	.uleb128 .LVL118-.LVL117
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0x4
	.uleb128 .LVL118-.LVL117
	.uleb128 .LVL119-.LVL117
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL120-.LVL117
	.uleb128 .LVL123-.LVL117
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL123-.LVL117
	.uleb128 .LFE39-.LVL117
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0
.LVUS38:
	.uleb128 .LVU334
	.uleb128 .LVU336
	.uleb128 .LVU345
	.uleb128 0
.LLST38:
	.byte	0x6
	.quad	.LVL117
	.byte	0x4
	.uleb128 .LVL117-.LVL117
	.uleb128 .LVL118-.LVL117
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL123-.LVL117
	.uleb128 .LFE39-.LVL117
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS33:
	.uleb128 0
	.uleb128 .LVU313
	.uleb128 .LVU313
	.uleb128 0
.LLST33:
	.byte	0x6
	.quad	.LVL107
	.byte	0x4
	.uleb128 .LVL107-.LVL107
	.uleb128 .LVL112-.LVL107
	.uleb128 0x2
	.byte	0x72
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL112-.LVL107
	.uleb128 .LFE36-.LVL107
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.byte	0
.LVUS34:
	.uleb128 .LVU304
	.uleb128 .LVU306
	.uleb128 .LVU306
	.uleb128 .LVU309
	.uleb128 .LVU309
	.uleb128 .LVU311
	.uleb128 .LVU311
	.uleb128 .LVU313
	.uleb128 .LVU313
	.uleb128 .LVU314
.LLST34:
	.byte	0x6
	.quad	.LVL108
	.byte	0x4
	.uleb128 .LVL108-.LVL108
	.uleb128 .LVL109-.LVL108
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL109-.LVL108
	.uleb128 .LVL110-.LVL108
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL110-.LVL108
	.uleb128 .LVL111-.LVL108
	.uleb128 0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL111-.LVL108
	.uleb128 .LVL112-.LVL108
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL112-.LVL108
	.uleb128 .LVL113-.LVL108
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS30:
	.uleb128 0
	.uleb128 .LVU284
	.uleb128 .LVU284
	.uleb128 .LVU298
	.uleb128 .LVU298
	.uleb128 0
.LLST30:
	.byte	0x6
	.quad	.LVL100
	.byte	0x4
	.uleb128 .LVL100-.LVL100
	.uleb128 .LVL103-.LVL100
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL103-.LVL100
	.uleb128 .LVL106-.LVL100
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL106-.LVL100
	.uleb128 .LFE35-.LVL100
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LVUS32:
	.uleb128 .LVU278
	.uleb128 .LVU279
	.uleb128 .LVU298
	.uleb128 0
.LLST32:
	.byte	0x6
	.quad	.LVL101
	.byte	0x4
	.uleb128 .LVL101-.LVL101
	.uleb128 .LVL102-.LVL101
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL106-.LVL101
	.uleb128 .LFE35-.LVL101
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS25:
	.uleb128 0
	.uleb128 .LVU270
	.uleb128 .LVU270
	.uleb128 .LVU275
	.uleb128 .LVU275
	.uleb128 0
.LLST25:
	.byte	0x6
	.quad	.LVL90
	.byte	0x4
	.uleb128 .LVL90-.LVL90
	.uleb128 .LVL97-.LVL90
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL97-.LVL90
	.uleb128 .LVL99-.LVL90
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x11
	.uleb128 0x526
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL99-.LVL90
	.uleb128 .LFE34-.LVL90
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS26:
	.uleb128 0
	.uleb128 .LVU268
	.uleb128 .LVU268
	.uleb128 .LVU275
	.uleb128 .LVU275
	.uleb128 0
.LLST26:
	.byte	0x6
	.quad	.LVL90
	.byte	0x4
	.uleb128 .LVL90-.LVL90
	.uleb128 .LVL96-.LVL90
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL96-.LVL90
	.uleb128 .LVL99-.LVL90
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL99-.LVL90
	.uleb128 .LFE34-.LVL90
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LVUS27:
	.uleb128 0
	.uleb128 .LVU256
	.uleb128 .LVU256
	.uleb128 .LVU257
	.uleb128 .LVU257
	.uleb128 .LVU275
	.uleb128 .LVU275
	.uleb128 0
.LLST27:
	.byte	0x6
	.quad	.LVL90
	.byte	0x4
	.uleb128 .LVL90-.LVL90
	.uleb128 .LVL93-.LVL90
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.byte	0x4
	.uleb128 .LVL93-.LVL90
	.uleb128 .LVL94-.LVL90
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL94-.LVL90
	.uleb128 .LVL99-.LVL90
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.byte	0x4
	.uleb128 .LVL99-.LVL90
	.uleb128 .LFE34-.LVL90
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LVUS29:
	.uleb128 .LVU247
	.uleb128 .LVU250
	.uleb128 .LVU275
	.uleb128 0
.LLST29:
	.byte	0x6
	.quad	.LVL91
	.byte	0x4
	.uleb128 .LVL91-.LVL91
	.uleb128 .LVL92-.LVL91
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL99-.LVL91
	.uleb128 .LFE34-.LVL91
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS20:
	.uleb128 0
	.uleb128 .LVU229
	.uleb128 .LVU229
	.uleb128 .LVU234
	.uleb128 .LVU234
	.uleb128 0
.LLST20:
	.byte	0x6
	.quad	.LVL77
	.byte	0x4
	.uleb128 .LVL77-.LVL77
	.uleb128 .LVL83-.LVL77
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL83-.LVL77
	.uleb128 .LVL85-.LVL77
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x11
	.uleb128 0x526
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL85-.LVL77
	.uleb128 .LFE33-.LVL77
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS21:
	.uleb128 0
	.uleb128 .LVU228
	.uleb128 .LVU228
	.uleb128 .LVU234
	.uleb128 .LVU234
	.uleb128 0
.LLST21:
	.byte	0x6
	.quad	.LVL77
	.byte	0x4
	.uleb128 .LVL77-.LVL77
	.uleb128 .LVL82-.LVL77
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL82-.LVL77
	.uleb128 .LVL85-.LVL77
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL85-.LVL77
	.uleb128 .LFE33-.LVL77
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LVUS22:
	.uleb128 0
	.uleb128 .LVU218
	.uleb128 .LVU218
	.uleb128 .LVU234
	.uleb128 .LVU234
	.uleb128 0
.LLST22:
	.byte	0x6
	.quad	.LVL77
	.byte	0x4
	.uleb128 .LVL77-.LVL77
	.uleb128 .LVL80-.LVL77
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL80-.LVL77
	.uleb128 .LVL85-.LVL77
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL85-.LVL77
	.uleb128 .LFE33-.LVL77
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LVUS24:
	.uleb128 .LVU212
	.uleb128 .LVU213
	.uleb128 .LVU234
	.uleb128 .LVU237
	.uleb128 .LVU237
	.uleb128 .LVU239
	.uleb128 .LVU239
	.uleb128 .LVU242
	.uleb128 .LVU242
	.uleb128 .LVU244
	.uleb128 .LVU244
	.uleb128 0
.LLST24:
	.byte	0x6
	.quad	.LVL78
	.byte	0x4
	.uleb128 .LVL78-.LVL78
	.uleb128 .LVL79-.LVL78
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL85-.LVL78
	.uleb128 .LVL86-.LVL78
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL86-.LVL78
	.uleb128 .LVL87-.LVL78
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL87-.LVL78
	.uleb128 .LVL88-.LVL78
	.uleb128 0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL88-.LVL78
	.uleb128 .LVL89-.LVL78
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL89-.LVL78
	.uleb128 .LFE33-.LVL78
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS15:
	.uleb128 0
	.uleb128 .LVU204
	.uleb128 .LVU204
	.uleb128 .LVU209
	.uleb128 .LVU209
	.uleb128 0
.LLST15:
	.byte	0x6
	.quad	.LVL68
	.byte	0x4
	.uleb128 .LVL68-.LVL68
	.uleb128 .LVL74-.LVL68
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL74-.LVL68
	.uleb128 .LVL76-.LVL68
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x11
	.uleb128 0x526
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL76-.LVL68
	.uleb128 .LFE32-.LVL68
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS16:
	.uleb128 0
	.uleb128 .LVU203
	.uleb128 .LVU203
	.uleb128 .LVU209
	.uleb128 .LVU209
	.uleb128 0
.LLST16:
	.byte	0x6
	.quad	.LVL68
	.byte	0x4
	.uleb128 .LVL68-.LVL68
	.uleb128 .LVL73-.LVL68
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL73-.LVL68
	.uleb128 .LVL76-.LVL68
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL76-.LVL68
	.uleb128 .LFE32-.LVL68
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LVUS17:
	.uleb128 0
	.uleb128 .LVU193
	.uleb128 .LVU193
	.uleb128 .LVU209
	.uleb128 .LVU209
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
	.uleb128 .LVL76-.LVL68
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL76-.LVL68
	.uleb128 .LFE32-.LVL68
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LVUS19:
	.uleb128 .LVU187
	.uleb128 .LVU188
	.uleb128 .LVU209
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
	.uleb128 .LVL76-.LVL69
	.uleb128 .LFE32-.LVL69
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS11:
	.uleb128 .LVU111
	.uleb128 .LVU112
	.uleb128 .LVU112
	.uleb128 .LVU114
	.uleb128 .LVU114
	.uleb128 .LVU118
	.uleb128 .LVU184
	.uleb128 0
.LLST11:
	.byte	0x6
	.quad	.LVL39
	.byte	0x4
	.uleb128 .LVL39-.LVL39
	.uleb128 .LVL40-.LVL39
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL40-.LVL39
	.uleb128 .LVL41-.LVL39
	.uleb128 0x3
	.byte	0x7b
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL41-.LVL39
	.uleb128 .LVL42-.LVL39
	.uleb128 0x3
	.byte	0x70
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL67-.LVL39
	.uleb128 .LFE31-.LVL39
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS12:
	.uleb128 .LVU120
	.uleb128 .LVU124
	.uleb128 .LVU124
	.uleb128 .LVU127
	.uleb128 .LVU127
	.uleb128 .LVU129
	.uleb128 .LVU129
	.uleb128 .LVU132
	.uleb128 .LVU132
	.uleb128 .LVU134
	.uleb128 .LVU134
	.uleb128 .LVU137
	.uleb128 .LVU139
	.uleb128 .LVU142
	.uleb128 .LVU144
	.uleb128 .LVU147
	.uleb128 .LVU149
	.uleb128 .LVU152
	.uleb128 .LVU154
	.uleb128 .LVU157
	.uleb128 .LVU159
	.uleb128 .LVU164
	.uleb128 .LVU166
	.uleb128 .LVU184
.LLST12:
	.byte	0x6
	.quad	.LVL43
	.byte	0x4
	.uleb128 .LVL43-.LVL43
	.uleb128 .LVL44-.LVL43
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x4
	.uleb128 .LVL44-.LVL43
	.uleb128 .LVL45-.LVL43
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL45-.LVL43
	.uleb128 .LVL46-.LVL43
	.uleb128 0x29
	.byte	0x91
	.sleb128 -208
	.byte	0xa6
	.byte	0x4
	.uleb128 0x526
	.byte	0xa4
	.uleb128 0x526
	.byte	0x4
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -204
	.byte	0xa6
	.byte	0x4
	.uleb128 0x526
	.byte	0x22
	.byte	0x91
	.sleb128 -200
	.byte	0xa6
	.byte	0x4
	.uleb128 0x526
	.byte	0x22
	.byte	0x91
	.sleb128 -196
	.byte	0xa6
	.byte	0x4
	.uleb128 0x526
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL46-.LVL43
	.uleb128 .LVL47-.LVL43
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL47-.LVL43
	.uleb128 .LVL48-.LVL43
	.uleb128 0x49
	.byte	0x91
	.sleb128 -208
	.byte	0xa6
	.byte	0x4
	.uleb128 0x526
	.byte	0xa4
	.uleb128 0x526
	.byte	0x4
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -204
	.byte	0xa6
	.byte	0x4
	.uleb128 0x526
	.byte	0x22
	.byte	0x91
	.sleb128 -200
	.byte	0xa6
	.byte	0x4
	.uleb128 0x526
	.byte	0x22
	.byte	0x91
	.sleb128 -196
	.byte	0xa6
	.byte	0x4
	.uleb128 0x526
	.byte	0x22
	.byte	0x91
	.sleb128 -192
	.byte	0xa6
	.byte	0x4
	.uleb128 0x526
	.byte	0x22
	.byte	0x91
	.sleb128 -188
	.byte	0xa6
	.byte	0x4
	.uleb128 0x526
	.byte	0x22
	.byte	0x91
	.sleb128 -184
	.byte	0xa6
	.byte	0x4
	.uleb128 0x526
	.byte	0x22
	.byte	0x91
	.sleb128 -180
	.byte	0xa6
	.byte	0x4
	.uleb128 0x526
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL48-.LVL43
	.uleb128 .LVL49-.LVL43
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL50-.LVL43
	.uleb128 .LVL51-.LVL43
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL52-.LVL43
	.uleb128 .LVL53-.LVL43
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL54-.LVL43
	.uleb128 .LVL55-.LVL43
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL56-.LVL43
	.uleb128 .LVL57-.LVL43
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL58-.LVL43
	.uleb128 .LVL60-.LVL43
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL61-.LVL43
	.uleb128 .LVL67-.LVL43
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS14:
	.uleb128 .LVU120
	.uleb128 .LVU122
.LLST14:
	.byte	0x8
	.quad	.LVL43
	.uleb128 .LVL43-.LVL43
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS8:
	.uleb128 .LVU93
	.uleb128 .LVU105
	.uleb128 .LVU107
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
	.uleb128 .LVU94
	.uleb128 .LVU95
	.uleb128 .LVU107
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
	.uleb128 0
.LLST3:
	.byte	0x6
	.quad	.LVL10
	.byte	0x4
	.uleb128 .LVL10-.LVL10
	.uleb128 .LVL13-.LVL10
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL13-.LVL10
	.uleb128 .LFE29-.LVL10
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS4:
	.uleb128 .LVU32
	.uleb128 .LVU37
	.uleb128 .LVU90
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
	.uleb128 .LVL28-.LVL12
	.uleb128 .LFE29-.LVL12
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS5:
	.uleb128 .LVU56
	.uleb128 .LVU60
	.uleb128 .LVU60
	.uleb128 .LVU63
	.uleb128 .LVU63
	.uleb128 .LVU65
	.uleb128 .LVU65
	.uleb128 .LVU70
	.uleb128 .LVU72
	.uleb128 .LVU90
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
	.uleb128 0x526
	.byte	0xa4
	.uleb128 0x526
	.byte	0x4
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -60
	.byte	0xa6
	.byte	0x4
	.uleb128 0x526
	.byte	0x22
	.byte	0x91
	.sleb128 -56
	.byte	0xa6
	.byte	0x4
	.uleb128 0x526
	.byte	0x22
	.byte	0x91
	.sleb128 -52
	.byte	0xa6
	.byte	0x4
	.uleb128 0x526
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL19-.LVL16
	.uleb128 .LVL21-.LVL16
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL22-.LVL16
	.uleb128 .LVL28-.LVL16
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS6:
	.uleb128 .LVU37
	.uleb128 .LVU40
	.uleb128 .LVU40
	.uleb128 .LVU42
	.uleb128 .LVU42
	.uleb128 .LVU44
	.uleb128 .LVU44
	.uleb128 .LVU46
	.uleb128 .LVU46
	.uleb128 .LVU48
	.uleb128 .LVU48
	.uleb128 .LVU50
	.uleb128 .LVU50
	.uleb128 .LVU52
	.uleb128 .LVU52
	.uleb128 .LVU54
	.uleb128 .LVU54
	.uleb128 .LVU56
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
	.uleb128 .LVU56
	.uleb128 .LVU58
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
	.uleb128 .LVU25
	.uleb128 .LVU25
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
	.uleb128 .LVU25
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
	.quad	.LBB9
	.byte	0x4
	.uleb128 .LBB9-.LBB9
	.uleb128 .LBE9-.LBB9
	.byte	0x4
	.uleb128 .LBB12-.LBB9
	.uleb128 .LBE12-.LBB9
	.byte	0
.LLRL13:
	.byte	0x5
	.quad	.LBB14
	.byte	0x4
	.uleb128 .LBB14-.LBB14
	.uleb128 .LBE14-.LBB14
	.byte	0x4
	.uleb128 .LBB18-.LBB14
	.uleb128 .LBE18-.LBB14
	.byte	0x4
	.uleb128 .LBB19-.LBB14
	.uleb128 .LBE19-.LBB14
	.byte	0
.LLRL18:
	.byte	0x5
	.quad	.LBB21
	.byte	0x4
	.uleb128 .LBB21-.LBB21
	.uleb128 .LBE21-.LBB21
	.byte	0x4
	.uleb128 .LBB22-.LBB21
	.uleb128 .LBE22-.LBB21
	.byte	0
.LLRL23:
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
.LLRL28:
	.byte	0x5
	.quad	.LBB26
	.byte	0x4
	.uleb128 .LBB26-.LBB26
	.uleb128 .LBE26-.LBB26
	.byte	0x4
	.uleb128 .LBB27-.LBB26
	.uleb128 .LBE27-.LBB26
	.byte	0x4
	.uleb128 .LBB28-.LBB26
	.uleb128 .LBE28-.LBB26
	.byte	0
.LLRL31:
	.byte	0x5
	.quad	.LBB29
	.byte	0x4
	.uleb128 .LBB29-.LBB29
	.uleb128 .LBE29-.LBB29
	.byte	0x4
	.uleb128 .LBB30-.LBB29
	.uleb128 .LBE30-.LBB29
	.byte	0
.LLRL37:
	.byte	0x5
	.quad	.LBB32
	.byte	0x4
	.uleb128 .LBB32-.LBB32
	.uleb128 .LBE32-.LBB32
	.byte	0x4
	.uleb128 .LBB33-.LBB32
	.uleb128 .LBE33-.LBB32
	.byte	0x4
	.uleb128 .LBB34-.LBB32
	.uleb128 .LBE34-.LBB32
	.byte	0
.LLRL47:
	.byte	0x5
	.quad	.LBB38
	.byte	0x4
	.uleb128 .LBB38-.LBB38
	.uleb128 .LBE38-.LBB38
	.byte	0x4
	.uleb128 .LBB41-.LBB38
	.uleb128 .LBE41-.LBB38
	.byte	0
.LLRL53:
	.byte	0x5
	.quad	.LBB43
	.byte	0x4
	.uleb128 .LBB43-.LBB43
	.uleb128 .LBE43-.LBB43
	.byte	0x4
	.uleb128 .LBB47-.LBB43
	.uleb128 .LBE47-.LBB43
	.byte	0x4
	.uleb128 .LBB48-.LBB43
	.uleb128 .LBE48-.LBB43
	.byte	0
.LLRL58:
	.byte	0x5
	.quad	.LBB50
	.byte	0x4
	.uleb128 .LBB50-.LBB50
	.uleb128 .LBE50-.LBB50
	.byte	0x4
	.uleb128 .LBB51-.LBB50
	.uleb128 .LBE51-.LBB50
	.byte	0
.LLRL63:
	.byte	0x5
	.quad	.LBB52
	.byte	0x4
	.uleb128 .LBB52-.LBB52
	.uleb128 .LBE52-.LBB52
	.byte	0x4
	.uleb128 .LBB53-.LBB52
	.uleb128 .LBE53-.LBB52
	.byte	0x4
	.uleb128 .LBB54-.LBB52
	.uleb128 .LBE54-.LBB52
	.byte	0
.LLRL68:
	.byte	0x5
	.quad	.LBB55
	.byte	0x4
	.uleb128 .LBB55-.LBB55
	.uleb128 .LBE55-.LBB55
	.byte	0x4
	.uleb128 .LBB56-.LBB55
	.uleb128 .LBE56-.LBB55
	.byte	0x4
	.uleb128 .LBB57-.LBB55
	.uleb128 .LBE57-.LBB55
	.byte	0
.LLRL71:
	.byte	0x5
	.quad	.LBB58
	.byte	0x4
	.uleb128 .LBB58-.LBB58
	.uleb128 .LBE58-.LBB58
	.byte	0x4
	.uleb128 .LBB59-.LBB58
	.uleb128 .LBE59-.LBB58
	.byte	0
.LLRL77:
	.byte	0x5
	.quad	.LBB61
	.byte	0x4
	.uleb128 .LBB61-.LBB61
	.uleb128 .LBE61-.LBB61
	.byte	0x4
	.uleb128 .LBB62-.LBB61
	.uleb128 .LBE62-.LBB61
	.byte	0
.LLRL87:
	.byte	0x5
	.quad	.LBB67
	.byte	0x4
	.uleb128 .LBB67-.LBB67
	.uleb128 .LBE67-.LBB67
	.byte	0x4
	.uleb128 .LBB70-.LBB67
	.uleb128 .LBE70-.LBB67
	.byte	0
.LLRL93:
	.byte	0x5
	.quad	.LBB72
	.byte	0x4
	.uleb128 .LBB72-.LBB72
	.uleb128 .LBE72-.LBB72
	.byte	0x4
	.uleb128 .LBB76-.LBB72
	.uleb128 .LBE76-.LBB72
	.byte	0x4
	.uleb128 .LBB77-.LBB72
	.uleb128 .LBE77-.LBB72
	.byte	0
.LLRL97:
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
.LLRL100:
	.byte	0x5
	.quad	.LBB82
	.byte	0x4
	.uleb128 .LBB82-.LBB82
	.uleb128 .LBE82-.LBB82
	.byte	0x4
	.uleb128 .LBB83-.LBB82
	.uleb128 .LBE83-.LBB82
	.byte	0x4
	.uleb128 .LBB84-.LBB82
	.uleb128 .LBE84-.LBB82
	.byte	0
.LLRL104:
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
	.byte	0
.LLRL107:
	.byte	0x5
	.quad	.LBB88
	.byte	0x4
	.uleb128 .LBB88-.LBB88
	.uleb128 .LBE88-.LBB88
	.byte	0x4
	.uleb128 .LBB89-.LBB88
	.uleb128 .LBE89-.LBB88
	.byte	0
.LLRL117:
	.byte	0x5
	.quad	.LBB91
	.byte	0x4
	.uleb128 .LBB91-.LBB91
	.uleb128 .LBE91-.LBB91
	.byte	0x4
	.uleb128 .LBB92-.LBB91
	.uleb128 .LBE92-.LBB91
	.byte	0x4
	.uleb128 .LBB96-.LBB91
	.uleb128 .LBE96-.LBB91
	.byte	0x4
	.uleb128 .LBB97-.LBB91
	.uleb128 .LBE97-.LBB91
	.byte	0
.LLRL119:
	.byte	0x5
	.quad	.LBB93
	.byte	0x4
	.uleb128 .LBB93-.LBB93
	.uleb128 .LBE93-.LBB93
	.byte	0x4
	.uleb128 .LBB98-.LBB93
	.uleb128 .LBE98-.LBB93
	.byte	0
.LLRL121:
	.byte	0x5
	.quad	.LBB94
	.byte	0x4
	.uleb128 .LBB94-.LBB94
	.uleb128 .LBE94-.LBB94
	.byte	0x4
	.uleb128 .LBB95-.LBB94
	.uleb128 .LBE95-.LBB94
	.byte	0
.LLRL131:
	.byte	0x5
	.quad	.LBB101
	.byte	0x4
	.uleb128 .LBB101-.LBB101
	.uleb128 .LBE101-.LBB101
	.byte	0x4
	.uleb128 .LBB102-.LBB101
	.uleb128 .LBE102-.LBB101
	.byte	0x4
	.uleb128 .LBB106-.LBB101
	.uleb128 .LBE106-.LBB101
	.byte	0x4
	.uleb128 .LBB107-.LBB101
	.uleb128 .LBE107-.LBB101
	.byte	0
.LLRL133:
	.byte	0x5
	.quad	.LBB103
	.byte	0x4
	.uleb128 .LBB103-.LBB103
	.uleb128 .LBE103-.LBB103
	.byte	0x4
	.uleb128 .LBB108-.LBB103
	.uleb128 .LBE108-.LBB103
	.byte	0
.LLRL135:
	.byte	0x5
	.quad	.LBB104
	.byte	0x4
	.uleb128 .LBB104-.LBB104
	.uleb128 .LBE104-.LBB104
	.byte	0x4
	.uleb128 .LBB105-.LBB104
	.uleb128 .LBE105-.LBB104
	.byte	0
.LLRL137:
	.byte	0x5
	.quad	.LBB109
	.byte	0x4
	.uleb128 .LBB109-.LBB109
	.uleb128 .LBE109-.LBB109
	.byte	0x4
	.uleb128 .LBB111-.LBB109
	.uleb128 .LBE111-.LBB109
	.byte	0
.LLRL139:
	.byte	0x5
	.quad	.LBB110
	.byte	0x4
	.uleb128 .LBB110-.LBB110
	.uleb128 .LBE110-.LBB110
	.byte	0x4
	.uleb128 .LBB112-.LBB110
	.uleb128 .LBE112-.LBB110
	.byte	0
.LLRL141:
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
