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
.LBE2:
	.loc 1 14 12 is_stmt 0 view .LVU3
	mov	rax, rcx
.LBB3:
	.loc 1 16 26 discriminator 1 view .LVU4
	test	r8, r8
	je	.L9
	lea	rcx, -1[r8]
.LVL2:
	.loc 1 16 26 discriminator 1 view .LVU5
	cmp	rcx, 6
	jbe	.L10
	mov	r9, r8
	xor	ecx, ecx
.LBE3:
	.loc 1 15 7 view .LVU6
	vxorps	xmm0, xmm0, xmm0
	shr	r9, 3
	sal	r9, 5
.LVL3:
	.p2align 4
	.p2align 3
.L4:
.LBB4:
	.loc 1 16 46 discriminator 3 view .LVU7
	vmovups	ymm4, YMMWORD PTR [rax+rcx]
	vmulps	ymm1, ymm4, YMMWORD PTR [rdx+rcx]
	add	rcx, 32
	vshufps	xmm3, xmm1, xmm1, 85
	vshufps	xmm2, xmm1, xmm1, 255
	vaddss	xmm0, xmm0, xmm1
.LVL4:
	.loc 1 16 46 discriminator 3 view .LVU8
	vaddss	xmm0, xmm0, xmm3
	vunpckhps	xmm3, xmm1, xmm1
	vextractf128	xmm1, ymm1, 0x1
	vaddss	xmm0, xmm0, xmm3
	vaddss	xmm0, xmm0, xmm2
	vshufps	xmm2, xmm1, xmm1, 85
	vaddss	xmm0, xmm0, xmm1
	vaddss	xmm0, xmm0, xmm2
	vunpckhps	xmm2, xmm1, xmm1
	.loc 1 16 38 discriminator 3 view .LVU9
	vshufps	xmm1, xmm1, xmm1, 255
	vaddss	xmm0, xmm0, xmm2
	vaddss	xmm0, xmm0, xmm1
.LVL5:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU10
	.loc 1 16 26 discriminator 1 view .LVU11
	cmp	r9, rcx
	jne	.L4
	mov	rcx, r8
	and	rcx, -8
	test	r8b, 7
	je	.L20
	vzeroupper
.LVL6:
.L3:
	.loc 1 16 26 is_stmt 0 discriminator 1 view .LVU12
	mov	r9, r8
	sub	r9, rcx
	lea	r10, -1[r9]
	cmp	r10, 2
	jbe	.L7
.LVL7:
	.loc 1 16 46 discriminator 3 view .LVU13
	vmovups	xmm5, XMMWORD PTR [rax+rcx*4]
	mov	r10, r9
	vmulps	xmm1, xmm5, XMMWORD PTR [rdx+rcx*4]
	and	r10, -4
	add	rcx, r10
	and	r9d, 3
	vaddss	xmm0, xmm0, xmm1
.LVL8:
	.loc 1 16 46 discriminator 3 view .LVU14
	vshufps	xmm2, xmm1, xmm1, 85
	vaddss	xmm0, xmm0, xmm2
	vunpckhps	xmm2, xmm1, xmm1
	.loc 1 16 38 discriminator 3 view .LVU15
	vshufps	xmm1, xmm1, xmm1, 255
	vaddss	xmm0, xmm0, xmm2
	vaddss	xmm0, xmm0, xmm1
.LVL9:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU16
	.loc 1 16 26 discriminator 1 view .LVU17
	je	.L1
.LVL10:
.L7:
	.loc 1 16 38 is_stmt 0 discriminator 3 view .LVU18
	vmovss	xmm5, DWORD PTR [rax+rcx*4]
	.loc 1 16 5 discriminator 3 view .LVU19
	lea	r10, 1[rcx]
	.loc 1 16 42 discriminator 3 view .LVU20
	lea	r9, 0[0+rcx*4]
	.loc 1 16 38 discriminator 3 view .LVU21
	vfmadd231ss	xmm0, xmm5, DWORD PTR [rdx+rcx*4]
.LVL11:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU22
	.loc 1 16 26 discriminator 1 view .LVU23
	cmp	r10, r8
	jnb	.L1
	.loc 1 16 38 is_stmt 0 discriminator 3 view .LVU24
	vmovss	xmm5, DWORD PTR 4[rax+r9]
	.loc 1 16 5 discriminator 3 view .LVU25
	add	rcx, 2
	.loc 1 16 38 discriminator 3 view .LVU26
	vfmadd231ss	xmm0, xmm5, DWORD PTR 4[rdx+r9]
.LVL12:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU27
	.loc 1 16 26 discriminator 1 view .LVU28
	cmp	rcx, r8
	jnb	.L1
	.loc 1 16 38 is_stmt 0 discriminator 3 view .LVU29
	vmovss	xmm5, DWORD PTR 8[rax+r9]
	vfmadd231ss	xmm0, xmm5, DWORD PTR 8[rdx+r9]
.LVL13:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU30
	.loc 1 16 26 discriminator 1 view .LVU31
.L1:
	.loc 1 16 26 is_stmt 0 discriminator 1 view .LVU32
.LBE4:
	.loc 1 18 1 view .LVU33
	ret
.LVL14:
	.p2align 4
	.p2align 3
.L9:
	.loc 1 15 7 view .LVU34
	vxorps	xmm0, xmm0, xmm0
	.loc 1 18 1 view .LVU35
	ret
.LVL15:
	.p2align 4
	.p2align 3
.L20:
	.loc 1 18 1 view .LVU36
	vzeroupper
.LVL16:
	ret
.LVL17:
.L10:
.LBB5:
	.loc 1 16 17 view .LVU37
	xor	ecx, ecx
.LBE5:
	.loc 1 15 7 view .LVU38
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
.LVL18:
.LFB29:
	.loc 1 26 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 26 12 is_stmt 0 view .LVU40
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
.LVL19:
	.loc 1 28 7 view .LVU41
	vpxor	xmm0, xmm0, xmm0
	vextracti128	XMMWORD PTR 16[rsp], ymm0, 0x1
.LVL20:
.LBB6:
	.loc 1 30 18 is_stmt 1 discriminator 1 view .LVU42
.LBE6:
	.loc 1 26 12 is_stmt 0 view .LVU43
	mov	rax, rcx
	.loc 1 28 7 view .LVU44
	vmovdqu	XMMWORD PTR [rsp], xmm0
.LBB9:
	.loc 1 30 18 discriminator 1 view .LVU45
	cmp	r8, 7
	jbe	.L41
	lea	rcx, -8[r8]
.LVL21:
	.loc 1 30 18 discriminator 1 view .LVU46
	xor	r9d, r9d
	xor	r10d, r10d
	vxorps	xmm0, xmm0, xmm0
	mov	r11, rcx
	shr	r11, 3
	inc	r11
.LVL22:
	.p2align 4
	.p2align 3
.L25:
.LBB7:
	.loc 1 31 30 is_stmt 1 discriminator 1 view .LVU47
	.loc 1 31 47 is_stmt 0 discriminator 3 view .LVU48
	vmovups	ymm4, YMMWORD PTR [rdx+r9]
.LBE7:
	.loc 1 30 18 discriminator 1 view .LVU49
	inc	r10
.LBB8:
	.loc 1 31 47 discriminator 3 view .LVU50
	vfmadd231ps	ymm0, ymm4, YMMWORD PTR [rax+r9]
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU51
.LVL23:
	.loc 1 31 30 discriminator 1 view .LVU52
	.loc 1 31 9 discriminator 3 view .LVU53
	.loc 1 31 30 discriminator 1 view .LVU54
	.loc 1 31 9 discriminator 3 view .LVU55
	.loc 1 31 30 discriminator 1 view .LVU56
	.loc 1 31 9 discriminator 3 view .LVU57
	.loc 1 31 30 discriminator 1 view .LVU58
	.loc 1 31 9 discriminator 3 view .LVU59
	.loc 1 31 30 discriminator 1 view .LVU60
	.loc 1 31 9 discriminator 3 view .LVU61
	.loc 1 31 30 discriminator 1 view .LVU62
	.loc 1 31 9 discriminator 3 view .LVU63
	.loc 1 31 30 discriminator 1 view .LVU64
	.loc 1 31 9 discriminator 3 view .LVU65
	.loc 1 31 30 discriminator 1 view .LVU66
.LBE8:
	.loc 1 30 18 discriminator 1 view .LVU67
	add	r9, 32
	cmp	r10, r11
	jb	.L25
	vextractf128	XMMWORD PTR 16[rsp], ymm0, 0x1
	and	rcx, -8
	vmovups	XMMWORD PTR [rsp], xmm0
	add	rcx, 8
.LVL24:
.L26:
	.loc 1 30 18 is_stmt 0 discriminator 1 view .LVU68
.LBE9:
.LBB10:
	.loc 1 34 26 is_stmt 1 discriminator 1 view .LVU69
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU70
	vxorps	xmm0, xmm0, xmm0
	vaddss	xmm0, xmm0, DWORD PTR [rsp]
	vaddss	xmm0, xmm0, DWORD PTR 4[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 8[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 12[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 16[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 20[rsp]
	.loc 1 34 38 discriminator 3 view .LVU71
	vaddss	xmm0, xmm0, DWORD PTR 24[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 28[rsp]
.LVL25:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU72
	.loc 1 34 26 discriminator 1 view .LVU73
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU74
.LBE10:
	.loc 1 35 14 is_stmt 1 discriminator 1 view .LVU75
	cmp	rcx, r8
	jnb	.L21
	mov	r10, r8
	sub	r10, rcx
	lea	r9, -1[r10]
	cmp	r9, 6
	jbe	.L32
	mov	rbx, r10
	lea	r11, 0[0+rcx*4]
	xor	r9d, r9d
	shr	rbx, 3
	lea	rsi, [rax+r11]
	add	r11, rdx
	sal	rbx, 5
.LVL26:
	.p2align 4
	.p2align 3
.L28:
	.loc 1 35 34 is_stmt 0 discriminator 2 view .LVU76
	vmovups	ymm5, YMMWORD PTR [r11+r9]
	vmulps	ymm1, ymm5, YMMWORD PTR [rsi+r9]
	add	r9, 32
	vshufps	xmm3, xmm1, xmm1, 85
	vshufps	xmm2, xmm1, xmm1, 255
	vaddss	xmm0, xmm0, xmm1
.LVL27:
	.loc 1 35 34 discriminator 2 view .LVU77
	vaddss	xmm3, xmm3, xmm0
	vunpckhps	xmm0, xmm1, xmm1
	vextractf128	xmm1, ymm1, 0x1
	vaddss	xmm0, xmm0, xmm3
	vaddss	xmm2, xmm2, xmm0
	vaddss	xmm0, xmm1, xmm2
	vshufps	xmm2, xmm1, xmm1, 85
	vaddss	xmm2, xmm2, xmm0
	vunpckhps	xmm0, xmm1, xmm1
	.loc 1 35 26 discriminator 2 view .LVU78
	vshufps	xmm1, xmm1, xmm1, 255
	vaddss	xmm0, xmm0, xmm2
	vaddss	xmm0, xmm0, xmm1
.LVL28:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU79
	.loc 1 35 14 discriminator 1 view .LVU80
	cmp	rbx, r9
	jne	.L28
	mov	r11, r10
	and	r11, -8
	lea	r9, [rcx+r11]
	test	r10b, 7
	je	.L21
.L27:
	.loc 1 35 14 is_stmt 0 discriminator 1 view .LVU81
	sub	r10, r11
	lea	rbx, -1[r10]
	cmp	rbx, 2
	jbe	.L30
	.loc 1 35 14 discriminator 1 view .LVU82
	add	rcx, r11
	.loc 1 35 34 discriminator 2 view .LVU83
	vmovups	xmm5, XMMWORD PTR [rdx+rcx*4]
	vmulps	xmm1, xmm5, XMMWORD PTR [rax+rcx*4]
	mov	rcx, r10
	and	rcx, -4
	add	r9, rcx
	and	r10d, 3
	vaddss	xmm0, xmm1, xmm0
.LVL29:
	.loc 1 35 34 discriminator 2 view .LVU84
	vshufps	xmm2, xmm1, xmm1, 85
	vaddss	xmm2, xmm2, xmm0
	vunpckhps	xmm0, xmm1, xmm1
	.loc 1 35 26 discriminator 2 view .LVU85
	vshufps	xmm1, xmm1, xmm1, 255
	vaddss	xmm0, xmm0, xmm2
	vaddss	xmm0, xmm0, xmm1
.LVL30:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU86
	.loc 1 35 14 discriminator 1 view .LVU87
	je	.L21
.L30:
.LVL31:
	.loc 1 35 26 is_stmt 0 discriminator 2 view .LVU88
	vmovss	xmm5, DWORD PTR [rdx+r9*4]
	.loc 1 35 5 discriminator 2 view .LVU89
	lea	r10, 1[r9]
	.loc 1 35 30 discriminator 2 view .LVU90
	lea	rcx, 0[0+r9*4]
	.loc 1 35 26 discriminator 2 view .LVU91
	vfmadd231ss	xmm0, xmm5, DWORD PTR [rax+r9*4]
.LVL32:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU92
	.loc 1 35 14 discriminator 1 view .LVU93
	cmp	r10, r8
	jnb	.L21
	.loc 1 35 26 is_stmt 0 discriminator 2 view .LVU94
	vmovss	xmm5, DWORD PTR 4[rax+rcx]
	.loc 1 35 5 discriminator 2 view .LVU95
	add	r9, 2
	.loc 1 35 26 discriminator 2 view .LVU96
	vfmadd231ss	xmm0, xmm5, DWORD PTR 4[rdx+rcx]
.LVL33:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU97
	.loc 1 35 14 discriminator 1 view .LVU98
	cmp	r9, r8
	jnb	.L21
	.loc 1 35 26 is_stmt 0 discriminator 2 view .LVU99
	vmovss	xmm5, DWORD PTR 8[rdx+rcx]
	vfmadd231ss	xmm0, xmm5, DWORD PTR 8[rax+rcx]
.LVL34:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU100
	.loc 1 35 14 discriminator 1 view .LVU101
.L21:
	.loc 1 35 14 is_stmt 0 discriminator 1 view .LVU102
	vzeroupper
.LVL35:
	.loc 1 37 1 view .LVU103
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
.LVL36:
.L41:
	.cfi_restore_state
	.loc 1 29 12 view .LVU104
	xor	ecx, ecx
	jmp	.L26
.LVL37:
.L32:
	.loc 1 35 14 discriminator 1 view .LVU105
	mov	r9, rcx
	xor	r11d, r11d
	jmp	.L27
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
.LVL38:
.LFB30:
	.loc 1 45 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 45 12 is_stmt 0 view .LVU107
	sub	rsp, 40
	.seh_stackalloc	40
	.cfi_def_cfa_offset 48
	.seh_endprologue
.LVL39:
.LBB11:
.LBB12:
	.loc 1 47 9 view .LVU108
	vpxor	xmm0, xmm0, xmm0
	vextracti128	XMMWORD PTR 16[rsp], ymm0, 0x1
.LVL40:
	.loc 1 47 9 view .LVU109
	vmovdqu	XMMWORD PTR [rsp], xmm0
	test	r8, r8
	je	.L43
	cmp	r8, 7
	jbe	.L48
	mov	r9, r8
	xor	eax, eax
	vxorps	xmm0, xmm0, xmm0
	shr	r9, 3
	sal	r9, 5
.LVL41:
	.p2align 4
	.p2align 3
.L45:
	.loc 1 48 38 view .LVU110
	vmovups	ymm1, YMMWORD PTR [rcx+rax]
	vfmadd231ps	ymm0, ymm1, YMMWORD PTR [rdx+rax]
	add	rax, 32
	cmp	r9, rax
	jne	.L45
	mov	rax, r8
	vextractf128	XMMWORD PTR 16[rsp], ymm0, 0x1
	vmovups	XMMWORD PTR [rsp], xmm0
	and	rax, -8
	test	r8b, 7
	je	.L43
.L44:
.LVL42:
	.loc 1 48 38 view .LVU111
	vmovss	xmm2, DWORD PTR [rsp]
	vmovss	xmm0, DWORD PTR [rcx+rax*4]
	lea	r10, 1[rax]
	.loc 1 48 42 view .LVU112
	lea	r9, 0[0+rax*4]
	.loc 1 48 38 view .LVU113
	vfmadd132ss	xmm0, xmm2, DWORD PTR [rdx+rax*4]
	vmovss	DWORD PTR [rsp], xmm0
	.loc 1 48 38 view .LVU114
	cmp	r10, r8
	jnb	.L43
	.loc 1 48 38 view .LVU115
	vmovss	xmm3, DWORD PTR 4[rcx+r9]
	lea	r10, 2[rax]
	vfmadd231ss	xmm0, xmm3, DWORD PTR 4[rdx+r9]
	vmovss	DWORD PTR [rsp], xmm0
	.loc 1 48 38 view .LVU116
	cmp	r10, r8
	jnb	.L43
	.loc 1 48 38 view .LVU117
	vmovss	xmm4, DWORD PTR 8[rcx+r9]
	lea	r10, 3[rax]
	vfmadd231ss	xmm0, xmm4, DWORD PTR 8[rdx+r9]
	vmovss	DWORD PTR [rsp], xmm0
	.loc 1 48 38 view .LVU118
	cmp	r10, r8
	jnb	.L43
	.loc 1 48 38 view .LVU119
	vmovss	xmm5, DWORD PTR 12[rcx+r9]
	lea	r10, 4[rax]
	vfmadd231ss	xmm0, xmm5, DWORD PTR 12[rdx+r9]
	vmovss	DWORD PTR [rsp], xmm0
	.loc 1 48 38 view .LVU120
	cmp	r10, r8
	jnb	.L43
	.loc 1 48 38 view .LVU121
	vmovss	xmm5, DWORD PTR 16[rcx+r9]
	lea	r10, 5[rax]
	vfmadd231ss	xmm0, xmm5, DWORD PTR 16[rdx+r9]
	vmovss	DWORD PTR [rsp], xmm0
	.loc 1 48 38 view .LVU122
	cmp	r10, r8
	jnb	.L43
	.loc 1 48 38 view .LVU123
	vmovss	xmm4, DWORD PTR 20[rcx+r9]
	add	rax, 6
	vfmadd231ss	xmm0, xmm4, DWORD PTR 20[rdx+r9]
	vmovss	DWORD PTR [rsp], xmm0
	.loc 1 48 38 view .LVU124
	cmp	rax, r8
	jnb	.L43
	.loc 1 48 38 view .LVU125
	vmovss	xmm3, DWORD PTR 24[rcx+r9]
	vfmadd231ss	xmm0, xmm3, DWORD PTR 24[rdx+r9]
	vmovss	DWORD PTR [rsp], xmm0
.LVL43:
.L43:
	.loc 1 48 38 view .LVU126
	vxorps	xmm0, xmm0, xmm0
	vaddss	xmm0, xmm0, DWORD PTR [rsp]
	vaddss	xmm0, xmm0, DWORD PTR 4[rsp]
	.loc 1 47 9 view .LVU127
	vaddss	xmm0, xmm0, DWORD PTR 8[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 12[rsp]
.LVL44:
	.loc 1 47 9 view .LVU128
	vaddss	xmm0, xmm0, DWORD PTR 16[rsp]
.LVL45:
	.loc 1 47 9 view .LVU129
	vaddss	xmm0, xmm0, DWORD PTR 20[rsp]
.LVL46:
	.loc 1 47 9 view .LVU130
	vaddss	xmm0, xmm0, DWORD PTR 24[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 28[rsp]
	vzeroupper
.LVL47:
.LBE12:
.LBE11:
	.loc 1 50 1 view .LVU131
	add	rsp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL48:
.L48:
	.cfi_restore_state
.LBB14:
.LBB13:
	.loc 1 47 9 view .LVU132
	xor	eax, eax
	jmp	.L44
.LBE13:
.LBE14:
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
.LVL49:
.LFB31:
	.loc 1 58 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 58 12 is_stmt 0 view .LVU134
	push	rsi
	.seh_pushreg	rsi
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 136
	.seh_stackalloc	136
	.cfi_def_cfa_offset 160
	.seh_endprologue
.LVL50:
	.loc 1 60 7 view .LVU135
	vpxor	xmm0, xmm0, xmm0
	.loc 1 58 12 view .LVU136
	mov	rax, rcx
	.loc 1 60 7 view .LVU137
	vextracti128	XMMWORD PTR 16[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 32[rsp], ymm0, 0x1
	vmovdqu	XMMWORD PTR [rsp], xmm0
	vextracti128	XMMWORD PTR 48[rsp], ymm0, 0x1
	.loc 1 61 12 view .LVU138
	xor	ecx, ecx
.LVL51:
	.loc 1 60 7 view .LVU139
	vextracti128	XMMWORD PTR 64[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 80[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 96[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 112[rsp], ymm0, 0x1
.LVL52:
.LBB15:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU140
	cmp	r8, 31
	jbe	.L59
	mov	r9d, 32
	vxorps	xmm0, xmm0, xmm0
	vmovaps	ymm3, ymm0
	vmovaps	ymm2, ymm0
	vmovaps	ymm1, ymm0
.LVL53:
	.p2align 4
	.p2align 3
.L58:
.LBB16:
.LBB17:
	.loc 1 64 47 is_stmt 0 view .LVU141
	vmovups	ymm4, YMMWORD PTR -128[rax+r9*4]
	vmovups	ymm5, YMMWORD PTR -96[rax+r9*4]
	mov	rcx, r9
	vfmadd231ps	ymm1, ymm4, YMMWORD PTR -128[rdx+r9*4]
	vfmadd231ps	ymm2, ymm5, YMMWORD PTR -96[rdx+r9*4]
	vmovups	ymm4, YMMWORD PTR -64[rax+r9*4]
	vmovups	ymm5, YMMWORD PTR -32[rax+r9*4]
	vfmadd231ps	ymm3, ymm4, YMMWORD PTR -64[rdx+r9*4]
	vfmadd231ps	ymm0, ymm5, YMMWORD PTR -32[rdx+r9*4]
.LVL54:
	.loc 1 64 47 view .LVU142
.LBE17:
.LBE16:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU143
	lea	r9, 32[r9]
.LVL55:
	.loc 1 62 18 is_stmt 0 discriminator 1 view .LVU144
	cmp	r8, r9
	jnb	.L58
	vextractf128	XMMWORD PTR 16[rsp], ymm1, 0x1
	vextractf128	XMMWORD PTR 48[rsp], ymm2, 0x1
	vmovups	XMMWORD PTR [rsp], xmm1
	vmovups	XMMWORD PTR 32[rsp], xmm2
	vmovups	XMMWORD PTR 64[rsp], xmm3
	vmovups	XMMWORD PTR 96[rsp], xmm0
	vextractf128	XMMWORD PTR 80[rsp], ymm3, 0x1
	vextractf128	XMMWORD PTR 112[rsp], ymm0, 0x1
.LVL56:
.L59:
	.loc 1 62 18 discriminator 1 view .LVU145
.LBE15:
.LBB18:
	.loc 1 67 26 is_stmt 1 discriminator 1 view .LVU146
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU147
	vxorps	xmm0, xmm0, xmm0
	vaddss	xmm0, xmm0, DWORD PTR [rsp]
	vaddss	xmm0, xmm0, DWORD PTR 4[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 8[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 12[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 16[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 20[rsp]
	.loc 1 67 38 discriminator 3 view .LVU148
	vaddss	xmm0, xmm0, DWORD PTR 24[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 28[rsp]
.LVL57:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU149
	.loc 1 67 26 discriminator 1 view .LVU150
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU151
	vaddss	xmm0, xmm0, DWORD PTR 32[rsp]
.LVL58:
	.loc 1 67 26 discriminator 1 view .LVU152
	vaddss	xmm0, xmm0, DWORD PTR 36[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 40[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 44[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 48[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 52[rsp]
	.loc 1 67 38 discriminator 3 view .LVU153
	vaddss	xmm0, xmm0, DWORD PTR 56[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 60[rsp]
.LVL59:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU154
	.loc 1 67 26 discriminator 1 view .LVU155
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU156
	vaddss	xmm0, xmm0, DWORD PTR 64[rsp]
.LVL60:
	.loc 1 67 26 discriminator 1 view .LVU157
	vaddss	xmm0, xmm0, DWORD PTR 68[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 72[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 76[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 80[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 84[rsp]
	.loc 1 67 38 discriminator 3 view .LVU158
	vaddss	xmm0, xmm0, DWORD PTR 88[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 92[rsp]
.LVL61:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU159
	.loc 1 67 26 discriminator 1 view .LVU160
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU161
	vaddss	xmm0, xmm0, DWORD PTR 96[rsp]
.LVL62:
	.loc 1 67 26 discriminator 1 view .LVU162
	vaddss	xmm0, xmm0, DWORD PTR 100[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 104[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 108[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 112[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 116[rsp]
	.loc 1 67 38 discriminator 3 view .LVU163
	vaddss	xmm0, xmm0, DWORD PTR 120[rsp]
	vaddss	xmm0, xmm0, DWORD PTR 124[rsp]
.LVL63:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU164
	.loc 1 67 26 discriminator 1 view .LVU165
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU166
.LBE18:
	.loc 1 68 14 is_stmt 1 discriminator 1 view .LVU167
	cmp	rcx, r8
	jnb	.L57
	mov	r10, r8
	sub	r10, rcx
	lea	r9, -1[r10]
	cmp	r9, 6
	jbe	.L70
	mov	rbx, r10
	lea	r11, 0[0+rcx*4]
	xor	r9d, r9d
	shr	rbx, 3
	lea	rsi, [rax+r11]
	add	r11, rdx
	sal	rbx, 5
.LVL64:
	.p2align 4
	.p2align 3
.L63:
	.loc 1 68 34 is_stmt 0 discriminator 2 view .LVU168
	vmovups	ymm4, YMMWORD PTR [r11+r9]
	vmulps	ymm1, ymm4, YMMWORD PTR [rsi+r9]
	add	r9, 32
	vshufps	xmm3, xmm1, xmm1, 85
	vshufps	xmm2, xmm1, xmm1, 255
	vaddss	xmm0, xmm1, xmm0
.LVL65:
	.loc 1 68 34 discriminator 2 view .LVU169
	vaddss	xmm3, xmm3, xmm0
	vunpckhps	xmm0, xmm1, xmm1
	vextractf128	xmm1, ymm1, 0x1
	vaddss	xmm0, xmm0, xmm3
	vaddss	xmm2, xmm2, xmm0
	vaddss	xmm0, xmm1, xmm2
	vshufps	xmm2, xmm1, xmm1, 85
	vaddss	xmm2, xmm2, xmm0
	vunpckhps	xmm0, xmm1, xmm1
	.loc 1 68 26 discriminator 2 view .LVU170
	vshufps	xmm1, xmm1, xmm1, 255
	vaddss	xmm0, xmm0, xmm2
	vaddss	xmm0, xmm0, xmm1
.LVL66:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU171
	.loc 1 68 14 discriminator 1 view .LVU172
	cmp	rbx, r9
	jne	.L63
	mov	r11, r10
	and	r11, -8
	lea	r9, [rcx+r11]
	test	r10b, 7
	je	.L57
.L62:
	.loc 1 68 14 is_stmt 0 discriminator 1 view .LVU173
	sub	r10, r11
	lea	rbx, -1[r10]
	cmp	rbx, 2
	jbe	.L66
	.loc 1 68 14 discriminator 1 view .LVU174
	add	rcx, r11
	.loc 1 68 34 discriminator 2 view .LVU175
	vmovups	xmm5, XMMWORD PTR [rax+rcx*4]
	vmulps	xmm1, xmm5, XMMWORD PTR [rdx+rcx*4]
	mov	rcx, r10
	and	rcx, -4
	add	r9, rcx
	and	r10d, 3
	vaddss	xmm0, xmm0, xmm1
.LVL67:
	.loc 1 68 34 discriminator 2 view .LVU176
	vshufps	xmm2, xmm1, xmm1, 85
	vaddss	xmm0, xmm0, xmm2
	vunpckhps	xmm2, xmm1, xmm1
	.loc 1 68 26 discriminator 2 view .LVU177
	vshufps	xmm1, xmm1, xmm1, 255
	vaddss	xmm0, xmm0, xmm2
	vaddss	xmm0, xmm0, xmm1
.LVL68:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU178
	.loc 1 68 14 discriminator 1 view .LVU179
	je	.L57
.L66:
.LVL69:
	.loc 1 68 26 is_stmt 0 discriminator 2 view .LVU180
	vmovss	xmm5, DWORD PTR [rdx+r9*4]
	.loc 1 68 5 discriminator 2 view .LVU181
	lea	r10, 1[r9]
	.loc 1 68 30 discriminator 2 view .LVU182
	lea	rcx, 0[0+r9*4]
	.loc 1 68 26 discriminator 2 view .LVU183
	vfmadd231ss	xmm0, xmm5, DWORD PTR [rax+r9*4]
.LVL70:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU184
	.loc 1 68 14 discriminator 1 view .LVU185
	cmp	r10, r8
	jnb	.L57
	.loc 1 68 26 is_stmt 0 discriminator 2 view .LVU186
	vmovss	xmm5, DWORD PTR 4[rax+rcx]
	.loc 1 68 5 discriminator 2 view .LVU187
	add	r9, 2
	.loc 1 68 26 discriminator 2 view .LVU188
	vfmadd231ss	xmm0, xmm5, DWORD PTR 4[rdx+rcx]
.LVL71:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU189
	.loc 1 68 14 discriminator 1 view .LVU190
	cmp	r9, r8
	jnb	.L57
	.loc 1 68 26 is_stmt 0 discriminator 2 view .LVU191
	vmovss	xmm5, DWORD PTR 8[rax+rcx]
	vfmadd231ss	xmm0, xmm5, DWORD PTR 8[rdx+rcx]
.LVL72:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU192
	.loc 1 68 14 discriminator 1 view .LVU193
.L57:
	.loc 1 68 14 is_stmt 0 discriminator 1 view .LVU194
	vzeroupper
.LVL73:
	.loc 1 70 1 view .LVU195
	add	rsp, 136
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	pop	rsi
	.cfi_restore 4
	.cfi_def_cfa_offset 8
	ret
.LVL74:
.L70:
	.cfi_restore_state
	.loc 1 68 14 discriminator 1 view .LVU196
	mov	r9, rcx
	xor	r11d, r11d
	jmp	.L62
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
.LVL75:
.LFB32:
	.loc 1 76 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 76 15 is_stmt 0 view .LVU198
	.seh_endprologue
.LVL76:
.LBB19:
	.loc 1 77 26 is_stmt 1 discriminator 1 view .LVU199
	test	r9, r9
	je	.L98
	lea	rax, -1[r9]
	cmp	rax, 6
	jbe	.L86
	mov	rcx, r9
	vbroadcastss	ymm2, xmm0
	xor	eax, eax
	shr	rcx, 3
	sal	rcx, 5
.LVL77:
	.p2align 4
	.p2align 3
.L82:
	.loc 1 77 52 is_stmt 0 discriminator 3 view .LVU200
	vmovups	ymm1, YMMWORD PTR [rdx+rax]
	vfmadd213ps	ymm1, ymm2, YMMWORD PTR [r8+rax]
	.loc 1 77 41 discriminator 3 view .LVU201
	vextractf128	XMMWORD PTR 16[r8+rax], ymm1, 0x1
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU202
	.loc 1 77 26 discriminator 1 view .LVU203
	.loc 1 77 41 is_stmt 0 discriminator 3 view .LVU204
	vmovups	XMMWORD PTR [r8+rax], xmm1
	add	rax, 32
	cmp	rax, rcx
	jne	.L82
	mov	rax, r9
	and	rax, -8
	test	r9b, 7
	je	.L99
	vzeroupper
.LVL78:
.L81:
	.loc 1 77 41 discriminator 3 view .LVU205
	mov	rcx, r9
	sub	rcx, rax
	lea	r10, -1[rcx]
	cmp	r10, 2
	jbe	.L84
	lea	r11, 0[0+rax*4]
	.loc 1 77 52 discriminator 3 view .LVU206
	vshufps	xmm1, xmm0, xmm0, 0
	lea	r10, [r8+r11]
	vmovups	xmm3, XMMWORD PTR [r10]
	vfmadd132ps	xmm1, xmm3, XMMWORD PTR [rdx+r11]
	.loc 1 77 41 discriminator 3 view .LVU207
	vmovups	XMMWORD PTR [r10], xmm1
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU208
	.loc 1 77 26 discriminator 1 view .LVU209
	mov	r10, rcx
	and	r10, -4
	add	rax, r10
	and	ecx, 3
	je	.L98
.L84:
.LVL79:
	.loc 1 77 48 is_stmt 0 discriminator 3 view .LVU210
	lea	rcx, 0[0+rax*4]
	.loc 1 77 55 discriminator 3 view .LVU211
	lea	r10, [r8+rcx]
	.loc 1 77 52 discriminator 3 view .LVU212
	vmovss	xmm1, DWORD PTR [rdx+rcx]
	vfmadd213ss	xmm1, xmm0, DWORD PTR [r10]
	.loc 1 77 41 discriminator 3 view .LVU213
	vmovss	DWORD PTR [r10], xmm1
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU214
	.loc 1 77 26 discriminator 1 view .LVU215
	.loc 1 77 5 is_stmt 0 discriminator 3 view .LVU216
	lea	r10, 1[rax]
	.loc 1 77 26 discriminator 1 view .LVU217
	cmp	r10, r9
	jnb	.L98
	.loc 1 77 55 discriminator 3 view .LVU218
	lea	r10, 4[r8+rcx]
	.loc 1 77 52 discriminator 3 view .LVU219
	vmovss	xmm1, DWORD PTR 4[rdx+rcx]
	.loc 1 77 5 discriminator 3 view .LVU220
	add	rax, 2
	.loc 1 77 52 discriminator 3 view .LVU221
	vfmadd213ss	xmm1, xmm0, DWORD PTR [r10]
	.loc 1 77 41 discriminator 3 view .LVU222
	vmovss	DWORD PTR [r10], xmm1
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU223
	.loc 1 77 26 discriminator 1 view .LVU224
	cmp	rax, r9
	jnb	.L98
	.loc 1 77 55 is_stmt 0 discriminator 3 view .LVU225
	lea	rax, 8[r8+rcx]
	.loc 1 77 52 discriminator 3 view .LVU226
	vmovss	xmm4, DWORD PTR [rax]
	vfmadd132ss	xmm0, xmm4, DWORD PTR 8[rdx+rcx]
.LVL80:
	.loc 1 77 41 discriminator 3 view .LVU227
	vmovss	DWORD PTR [rax], xmm0
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU228
	.loc 1 77 26 discriminator 1 view .LVU229
.LVL81:
.L98:
	.loc 1 77 26 is_stmt 0 discriminator 1 view .LVU230
.LBE19:
	.loc 1 78 1 view .LVU231
	ret
.LVL82:
	.p2align 4
	.p2align 3
.L99:
	.loc 1 78 1 view .LVU232
	vzeroupper
.LVL83:
	ret
.LVL84:
.L86:
.LBB20:
	.loc 1 77 17 view .LVU233
	xor	eax, eax
	jmp	.L81
.LBE20:
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
.LVL85:
.LFB33:
	.loc 1 81 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 81 15 is_stmt 0 view .LVU235
	.seh_endprologue
.LVL86:
.LBB21:
	.loc 1 82 26 is_stmt 1 discriminator 1 view .LVU236
	test	r9, r9
	je	.L123
	cmp	QWORD PTR 40[rsp], 1
	jne	.L124
	lea	rax, -1[r9]
	cmp	rax, 6
	jbe	.L110
	mov	rcx, r9
	vbroadcastss	ymm2, xmm0
	xor	eax, eax
	shr	rcx, 3
	sal	rcx, 5
.LVL87:
	.p2align 4
	.p2align 3
.L106:
	.loc 1 82 60 is_stmt 0 discriminator 3 view .LVU237
	vmovups	ymm1, YMMWORD PTR [rdx+rax]
	vfmadd213ps	ymm1, ymm2, YMMWORD PTR [r8+rax]
	.loc 1 82 45 discriminator 3 view .LVU238
	vextractf128	XMMWORD PTR 16[r8+rax], ymm1, 0x1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU239
	.loc 1 82 26 discriminator 1 view .LVU240
	.loc 1 82 45 is_stmt 0 discriminator 3 view .LVU241
	vmovups	XMMWORD PTR [r8+rax], xmm1
	add	rax, 32
	cmp	rax, rcx
	jne	.L106
	mov	rax, r9
	and	rax, -8
	test	r9b, 7
	je	.L125
	vzeroupper
.LVL88:
.L105:
	.loc 1 82 45 discriminator 3 view .LVU242
	mov	rcx, r9
	sub	rcx, rax
	lea	r10, -1[rcx]
	cmp	r10, 2
	jbe	.L108
	lea	r11, 0[0+rax*4]
	.loc 1 82 60 discriminator 3 view .LVU243
	vshufps	xmm1, xmm0, xmm0, 0
	lea	r10, [r8+r11]
	vmovups	xmm3, XMMWORD PTR [r10]
	vfmadd132ps	xmm1, xmm3, XMMWORD PTR [rdx+r11]
	.loc 1 82 45 discriminator 3 view .LVU244
	vmovups	XMMWORD PTR [r10], xmm1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU245
	.loc 1 82 26 discriminator 1 view .LVU246
	mov	r10, rcx
	and	r10, -4
	add	rax, r10
	and	ecx, 3
	je	.L123
.L108:
.LVL89:
	.loc 1 82 52 is_stmt 0 discriminator 3 view .LVU247
	lea	rcx, 0[0+rax*4]
	.loc 1 82 63 discriminator 3 view .LVU248
	lea	r10, [r8+rcx]
	.loc 1 82 60 discriminator 3 view .LVU249
	vmovss	xmm1, DWORD PTR [rdx+rcx]
	vfmadd213ss	xmm1, xmm0, DWORD PTR [r10]
	.loc 1 82 45 discriminator 3 view .LVU250
	vmovss	DWORD PTR [r10], xmm1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU251
	.loc 1 82 26 discriminator 1 view .LVU252
	.loc 1 82 5 is_stmt 0 discriminator 3 view .LVU253
	lea	r10, 1[rax]
	.loc 1 82 26 discriminator 1 view .LVU254
	cmp	r10, r9
	jnb	.L123
	.loc 1 82 63 discriminator 3 view .LVU255
	lea	r10, 4[r8+rcx]
	.loc 1 82 60 discriminator 3 view .LVU256
	vmovss	xmm1, DWORD PTR 4[rdx+rcx]
	.loc 1 82 5 discriminator 3 view .LVU257
	add	rax, 2
	.loc 1 82 60 discriminator 3 view .LVU258
	vfmadd213ss	xmm1, xmm0, DWORD PTR [r10]
	.loc 1 82 45 discriminator 3 view .LVU259
	vmovss	DWORD PTR [r10], xmm1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU260
	.loc 1 82 26 discriminator 1 view .LVU261
	cmp	rax, r9
	jnb	.L123
	.loc 1 82 63 is_stmt 0 discriminator 3 view .LVU262
	lea	rax, 8[r8+rcx]
	.loc 1 82 60 discriminator 3 view .LVU263
	vmovss	xmm4, DWORD PTR [rax]
	vfmadd132ss	xmm0, xmm4, DWORD PTR 8[rdx+rcx]
.LVL90:
	.loc 1 82 45 discriminator 3 view .LVU264
	vmovss	DWORD PTR [rax], xmm0
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU265
	.loc 1 82 26 discriminator 1 view .LVU266
.LVL91:
.L123:
	.loc 1 82 26 is_stmt 0 discriminator 1 view .LVU267
.LBE21:
	.loc 1 83 1 view .LVU268
	ret
.LVL92:
	.p2align 4
	.p2align 3
.L124:
	.loc 1 83 1 view .LVU269
	mov	rax, QWORD PTR 40[rsp]
.LBB22:
	.loc 1 82 17 view .LVU270
	xor	ecx, ecx
	lea	r10, 0[0+rax*4]
	.loc 1 82 26 discriminator 1 view .LVU271
	xor	eax, eax
.LVL93:
	.p2align 4
	.p2align 3
.L103:
	.loc 1 82 60 discriminator 3 view .LVU272
	vmovss	xmm1, DWORD PTR [rdx+rax]
	.loc 1 82 5 discriminator 3 view .LVU273
	inc	rcx
.LVL94:
	.loc 1 82 60 discriminator 3 view .LVU274
	vfmadd213ss	xmm1, xmm0, DWORD PTR [r8+rax]
	.loc 1 82 45 discriminator 3 view .LVU275
	vmovss	DWORD PTR [r8+rax], xmm1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU276
.LVL95:
	.loc 1 82 26 discriminator 1 view .LVU277
	add	rax, r10
	cmp	r9, rcx
	jne	.L103
.LBE22:
	.loc 1 83 1 is_stmt 0 view .LVU278
	ret
.LVL96:
.L125:
	.loc 1 83 1 view .LVU279
	vzeroupper
.LVL97:
	ret
.LVL98:
.L110:
.LBB23:
	.loc 1 82 17 view .LVU280
	xor	eax, eax
	jmp	.L105
.LBE23:
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
.LVL99:
.LFB34:
	.loc 1 86 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 86 15 is_stmt 0 view .LVU282
	push	r14
	.seh_pushreg	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	push	r13
	.seh_pushreg	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	push	r12
	.seh_pushreg	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	push	rbp
	.seh_pushreg	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	push	rdi
	.seh_pushreg	rdi
	.cfi_def_cfa_offset 48
	.cfi_offset 5, -48
	push	rsi
	.seh_pushreg	rsi
	.cfi_def_cfa_offset 56
	.cfi_offset 4, -56
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -64
	.seh_endprologue
.LVL100:
.LBB24:
	.loc 1 88 26 is_stmt 1 discriminator 1 view .LVU283
.LBE24:
	.loc 1 86 15 is_stmt 0 view .LVU284
	mov	r10, QWORD PTR 96[rsp]
	vmovaps	xmm3, xmm0
	mov	rax, rdx
.LBB25:
	.loc 1 88 26 discriminator 1 view .LVU285
	test	r10, r10
	je	.L145
	lea	rdx, -1[r10]
.LVL101:
	.loc 1 88 26 discriminator 1 view .LVU286
	cmp	rdx, 6
	jbe	.L133
	mov	r11, r10
	vbroadcastss	ymm4, xmm0
	xor	ecx, ecx
	shr	r11, 3
	sal	r11, 5
.LVL102:
	.p2align 4
	.p2align 3
.L129:
	.loc 1 88 26 discriminator 1 view .LVU287
	lea	rdx, [r9+rcx]
	.loc 1 88 48 discriminator 3 view .LVU288
	movsx	r13, DWORD PTR 16[rdx]
	movsx	r14, DWORD PTR 24[rdx]
	movsx	rsi, DWORD PTR [rdx]
	movsx	rbx, DWORD PTR 4[rdx]
	movsx	rbp, DWORD PTR 8[rdx]
	movsx	rdi, DWORD PTR 12[rdx]
	movsx	r12, DWORD PTR 20[rdx]
	movsx	rdx, DWORD PTR 28[rdx]
	vmovss	xmm0, DWORD PTR [rax+r14*4]
	vmovss	xmm1, DWORD PTR [rax+r13*4]
	vmovss	xmm2, DWORD PTR [rax+rbp*4]
	vinsertps	xmm0, xmm0, DWORD PTR [rax+rdx*4], 0x10
	vinsertps	xmm1, xmm1, DWORD PTR [rax+r12*4], 0x10
	vinsertps	xmm2, xmm2, DWORD PTR [rax+rdi*4], 0x10
	vmovlhps	xmm1, xmm1, xmm0
	vmovss	xmm0, DWORD PTR [rax+rsi*4]
	vinsertps	xmm0, xmm0, DWORD PTR [rax+rbx*4], 0x10
	vmovlhps	xmm0, xmm0, xmm2
	vinsertf128	ymm0, ymm0, xmm1, 0x1
	.loc 1 88 57 discriminator 3 view .LVU289
	vfmadd213ps	ymm0, ymm4, YMMWORD PTR [r8+rcx]
	.loc 1 88 41 discriminator 3 view .LVU290
	vextractf128	XMMWORD PTR 16[r8+rcx], ymm0, 0x1
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU291
	.loc 1 88 26 discriminator 1 view .LVU292
	.loc 1 88 41 is_stmt 0 discriminator 3 view .LVU293
	vmovups	XMMWORD PTR [r8+rcx], xmm0
	add	rcx, 32
	cmp	r11, rcx
	jne	.L129
	mov	rdx, r10
	and	rdx, -8
	test	r10b, 7
	je	.L146
	vzeroupper
.LVL103:
.L128:
	.loc 1 88 41 discriminator 3 view .LVU294
	mov	rbx, r10
	sub	rbx, rdx
	lea	rcx, -1[rbx]
	cmp	rcx, 2
	jbe	.L131
	lea	rcx, 0[0+rdx*4]
	lea	r11, [r9+rcx]
	add	rcx, r8
	.loc 1 88 48 discriminator 3 view .LVU295
	movsx	rdi, DWORD PTR [r11]
	movsx	rbp, DWORD PTR 8[r11]
	movsx	rsi, DWORD PTR 4[r11]
	movsx	r11, DWORD PTR 12[r11]
	vmovss	xmm1, DWORD PTR [rax+rbp*4]
	vmovss	xmm0, DWORD PTR [rax+rdi*4]
	vinsertps	xmm1, xmm1, DWORD PTR [rax+r11*4], 0x10
	vinsertps	xmm0, xmm0, DWORD PTR [rax+rsi*4], 0x10
	vmovlhps	xmm0, xmm0, xmm1
	.loc 1 88 57 discriminator 3 view .LVU296
	vshufps	xmm1, xmm3, xmm3, 0
	vfmadd213ps	xmm0, xmm1, XMMWORD PTR [rcx]
	.loc 1 88 41 discriminator 3 view .LVU297
	vmovups	XMMWORD PTR [rcx], xmm0
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU298
	.loc 1 88 26 discriminator 1 view .LVU299
	mov	rcx, rbx
	and	rcx, -4
	add	rdx, rcx
	and	ebx, 3
	je	.L145
.L131:
.LVL104:
	.loc 1 88 54 is_stmt 0 discriminator 3 view .LVU300
	lea	rcx, 0[0+rdx*4]
	movsx	rbx, DWORD PTR [r9+rcx]
	.loc 1 88 60 discriminator 3 view .LVU301
	lea	r11, [r8+rcx]
	.loc 1 88 57 discriminator 3 view .LVU302
	vmovss	xmm0, DWORD PTR [rax+rbx*4]
	vfmadd213ss	xmm0, xmm3, DWORD PTR [r11]
	.loc 1 88 41 discriminator 3 view .LVU303
	vmovss	DWORD PTR [r11], xmm0
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU304
	.loc 1 88 26 discriminator 1 view .LVU305
	.loc 1 88 5 is_stmt 0 discriminator 3 view .LVU306
	lea	r11, 1[rdx]
	.loc 1 88 26 discriminator 1 view .LVU307
	cmp	r11, r10
	jnb	.L145
	.loc 1 88 54 discriminator 3 view .LVU308
	movsx	rbx, DWORD PTR 4[r9+rcx]
	.loc 1 88 60 discriminator 3 view .LVU309
	lea	r11, 4[r8+rcx]
	.loc 1 88 5 discriminator 3 view .LVU310
	add	rdx, 2
	.loc 1 88 57 discriminator 3 view .LVU311
	vmovss	xmm0, DWORD PTR [rax+rbx*4]
	vfmadd213ss	xmm0, xmm3, DWORD PTR [r11]
	.loc 1 88 41 discriminator 3 view .LVU312
	vmovss	DWORD PTR [r11], xmm0
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU313
	.loc 1 88 26 discriminator 1 view .LVU314
	cmp	rdx, r10
	jnb	.L145
	.loc 1 88 60 is_stmt 0 discriminator 3 view .LVU315
	lea	rdx, 8[r8+rcx]
	.loc 1 88 54 discriminator 3 view .LVU316
	movsx	rcx, DWORD PTR 8[r9+rcx]
	.loc 1 88 57 discriminator 3 view .LVU317
	vmovss	xmm5, DWORD PTR [rdx]
	vfmadd132ss	xmm3, xmm5, DWORD PTR [rax+rcx*4]
.LVL105:
	.loc 1 88 41 discriminator 3 view .LVU318
	vmovss	DWORD PTR [rdx], xmm3
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU319
	.loc 1 88 26 discriminator 1 view .LVU320
.LVL106:
.L145:
	.loc 1 88 26 is_stmt 0 discriminator 1 view .LVU321
.LBE25:
	.loc 1 89 1 view .LVU322
	pop	rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 56
	pop	rsi
	.cfi_restore 4
	.cfi_def_cfa_offset 48
	pop	rdi
	.cfi_restore 5
	.cfi_def_cfa_offset 40
	pop	rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_restore 12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_restore 13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_restore 14
	.cfi_def_cfa_offset 8
	ret
.LVL107:
	.p2align 4
	.p2align 3
.L146:
	.cfi_restore_state
	.loc 1 89 1 view .LVU323
	vzeroupper
.LVL108:
	pop	rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 56
	pop	rsi
	.cfi_restore 4
	.cfi_def_cfa_offset 48
	pop	rdi
	.cfi_restore 5
	.cfi_def_cfa_offset 40
	pop	rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_restore 12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_restore 13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_restore 14
	.cfi_def_cfa_offset 8
	ret
.LVL109:
.L133:
	.cfi_restore_state
.LBB26:
	.loc 1 88 17 view .LVU324
	xor	edx, edx
	jmp	.L128
.LBE26:
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
.LVL110:
.LFB35:
	.loc 1 95 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 95 15 is_stmt 0 view .LVU326
	.seh_endprologue
.LVL111:
.LBB27:
	.loc 1 96 26 is_stmt 1 discriminator 1 view .LVU327
	test	r9, r9
	je	.L166
	lea	rax, -1[r9]
	cmp	rax, 6
	jbe	.L154
	mov	r10, r9
	xor	eax, eax
	shr	r10, 3
	sal	r10, 5
.LVL112:
	.p2align 4
	.p2align 3
.L150:
	.loc 1 96 48 is_stmt 0 discriminator 3 view .LVU328
	vmovups	ymm1, YMMWORD PTR [rcx+rax]
	vmulps	ymm0, ymm1, YMMWORD PTR [rdx+rax]
	.loc 1 96 41 discriminator 3 view .LVU329
	vextractf128	XMMWORD PTR 16[r8+rax], ymm0, 0x1
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU330
	.loc 1 96 26 discriminator 1 view .LVU331
	.loc 1 96 41 is_stmt 0 discriminator 3 view .LVU332
	vmovups	XMMWORD PTR [r8+rax], xmm0
	add	rax, 32
	cmp	rax, r10
	jne	.L150
	mov	rax, r9
	and	rax, -8
	test	r9b, 7
	je	.L167
	vzeroupper
.LVL113:
.L149:
	.loc 1 96 41 discriminator 3 view .LVU333
	mov	r11, r9
	sub	r11, rax
	lea	r10, -1[r11]
	cmp	r10, 2
	jbe	.L152
	lea	r10, 0[0+rax*4]
	.loc 1 96 48 discriminator 3 view .LVU334
	vmovups	xmm2, XMMWORD PTR [rcx+r10]
	vmulps	xmm0, xmm2, XMMWORD PTR [rdx+r10]
	.loc 1 96 41 discriminator 3 view .LVU335
	vmovups	XMMWORD PTR [r8+r10], xmm0
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU336
	.loc 1 96 26 discriminator 1 view .LVU337
	mov	r10, r11
	and	r10, -4
	add	rax, r10
	and	r11d, 3
	je	.L166
.L152:
.LVL114:
	.loc 1 96 44 is_stmt 0 discriminator 3 view .LVU338
	lea	r10, 0[0+rax*4]
	.loc 1 96 5 discriminator 3 view .LVU339
	lea	r11, 1[rax]
	.loc 1 96 48 discriminator 3 view .LVU340
	vmovss	xmm0, DWORD PTR [rcx+r10]
	vmulss	xmm0, xmm0, DWORD PTR [rdx+r10]
	.loc 1 96 41 discriminator 3 view .LVU341
	vmovss	DWORD PTR [r8+r10], xmm0
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU342
	.loc 1 96 26 discriminator 1 view .LVU343
	cmp	r11, r9
	jnb	.L166
	.loc 1 96 48 is_stmt 0 discriminator 3 view .LVU344
	vmovss	xmm0, DWORD PTR 4[rdx+r10]
	.loc 1 96 5 discriminator 3 view .LVU345
	add	rax, 2
	.loc 1 96 48 discriminator 3 view .LVU346
	vmulss	xmm0, xmm0, DWORD PTR 4[rcx+r10]
	.loc 1 96 41 discriminator 3 view .LVU347
	vmovss	DWORD PTR 4[r8+r10], xmm0
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU348
	.loc 1 96 26 discriminator 1 view .LVU349
	cmp	rax, r9
	jnb	.L166
	.loc 1 96 48 is_stmt 0 discriminator 3 view .LVU350
	vmovss	xmm0, DWORD PTR 8[rcx+r10]
	vmulss	xmm0, xmm0, DWORD PTR 8[rdx+r10]
	.loc 1 96 41 discriminator 3 view .LVU351
	vmovss	DWORD PTR 8[r8+r10], xmm0
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU352
	.loc 1 96 26 discriminator 1 view .LVU353
.LVL115:
.L166:
	.loc 1 96 26 is_stmt 0 discriminator 1 view .LVU354
.LBE27:
	.loc 1 97 1 view .LVU355
	ret
	.p2align 4
	.p2align 3
.L167:
	.loc 1 97 1 view .LVU356
	vzeroupper
.LVL116:
	ret
.LVL117:
.L154:
.LBB28:
	.loc 1 96 17 view .LVU357
	xor	eax, eax
	jmp	.L149
.LBE28:
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
.LVL118:
.LFB36:
	.loc 1 147 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 147 13 is_stmt 0 view .LVU359
	.seh_endprologue
	.loc 1 148 17 view .LVU360
	fldz
	.loc 1 147 13 view .LVU361
	mov	rax, rcx
	.loc 1 148 17 view .LVU362
	fstp	TBYTE PTR [rcx]
	fld	TBYTE PTR [rcx]
.LVL119:
.LBB29:
	.loc 1 149 26 is_stmt 1 discriminator 1 view .LVU363
	test	r9, r9
	je	.L175
	.loc 1 149 17 is_stmt 0 view .LVU364
	xor	r10d, r10d
.LVL120:
	.p2align 4
	.p2align 3
.L170:
	.loc 1 149 61 discriminator 3 view .LVU365
	fld	DWORD PTR [r8+r10*4]
	.loc 1 149 59 discriminator 3 view .LVU366
	fmul	DWORD PTR [rdx+r10*4]
	.loc 1 149 5 discriminator 3 view .LVU367
	inc	r10
.LVL121:
	.loc 1 149 38 discriminator 3 view .LVU368
	faddp	st(1), st
	.loc 1 149 5 is_stmt 1 discriminator 3 view .LVU369
.LVL122:
	.loc 1 149 26 discriminator 1 view .LVU370
	cmp	r9, r10
	jne	.L170
	fstp	TBYTE PTR [rax]
.LBE29:
	.loc 1 150 12 is_stmt 0 view .LVU371
	jmp	.L168
.LVL123:
	.p2align 4
	.p2align 3
.L175:
	.loc 1 150 12 view .LVU372
	ffreep	st(0)
.LVL124:
.L168:
	.loc 1 151 1 view .LVU373
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
.LVL125:
.LFB37:
	.loc 1 154 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 154 13 is_stmt 0 view .LVU375
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
	.loc 1 154 13 view .LVU376
	vmovss	DWORD PTR 4[rsp], xmm1
	.loc 1 154 67 view .LVU377
	fld	DWORD PTR 4[rsp]
	.loc 1 154 13 view .LVU378
	vmovss	DWORD PTR 8[rsp], xmm2
	mov	rax, rcx
	vmovss	DWORD PTR 12[rsp], xmm3
	.loc 1 154 67 view .LVU379
	fmul	DWORD PTR 8[rsp]
	.loc 1 154 84 view .LVU380
	fadd	DWORD PTR 12[rsp]
	.loc 1 154 99 view .LVU381
	fstp	TBYTE PTR [rcx]
	.loc 1 154 102 view .LVU382
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
.LVL126:
.LFB38:
	.loc 1 157 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 157 13 is_stmt 0 view .LVU384
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
	.loc 1 157 13 view .LVU385
	vmovss	DWORD PTR 8[rsp], xmm1
	.loc 1 157 61 view .LVU386
	fld	DWORD PTR 8[rsp]
	.loc 1 157 13 view .LVU387
	vmovss	DWORD PTR 12[rsp], xmm2
	mov	rax, rcx
	.loc 1 157 61 view .LVU388
	fmul	DWORD PTR 12[rsp]
	.loc 1 157 76 view .LVU389
	fstp	TBYTE PTR [rcx]
	.loc 1 157 79 view .LVU390
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
.LVL127:
.LFB39:
	.loc 1 14 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 14 12 is_stmt 0 view .LVU392
	.seh_endprologue
.LVL128:
.LBB30:
	.loc 1 16 26 is_stmt 1 discriminator 1 view .LVU393
	test	r8, r8
	je	.L184
	lea	rax, -1[r8]
	cmp	rax, 2
	jbe	.L185
	mov	r9, r8
	xor	eax, eax
.LBE30:
	.loc 1 15 7 is_stmt 0 view .LVU394
	vxorpd	xmm0, xmm0, xmm0
	shr	r9, 2
	sal	r9, 5
.LVL129:
	.p2align 4
	.p2align 3
.L181:
.LBB31:
	.loc 1 16 46 discriminator 3 view .LVU395
	vmovupd	ymm4, YMMWORD PTR [rcx+rax]
	vmulpd	ymm1, ymm4, YMMWORD PTR [rdx+rax]
	add	rax, 32
	vaddsd	xmm0, xmm0, xmm1
.LVL130:
	.loc 1 16 46 discriminator 3 view .LVU396
	vunpckhpd	xmm2, xmm1, xmm1
	vextractf128	xmm1, ymm1, 0x1
	vaddsd	xmm0, xmm0, xmm2
	.loc 1 16 38 discriminator 3 view .LVU397
	vaddsd	xmm0, xmm0, xmm1
	vunpckhpd	xmm1, xmm1, xmm1
	vaddsd	xmm0, xmm0, xmm1
.LVL131:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU398
	.loc 1 16 26 discriminator 1 view .LVU399
	cmp	rax, r9
	jne	.L181
	test	r8b, 3
	je	.L190
	mov	rax, r8
	and	rax, -4
	vzeroupper
.LVL132:
.L180:
	.loc 1 16 38 is_stmt 0 discriminator 3 view .LVU400
	vmovsd	xmm5, QWORD PTR [rcx+rax*8]
	.loc 1 16 5 discriminator 3 view .LVU401
	lea	r10, 1[rax]
	.loc 1 16 42 discriminator 3 view .LVU402
	lea	r9, 0[0+rax*8]
	.loc 1 16 38 discriminator 3 view .LVU403
	vfmadd231sd	xmm0, xmm5, QWORD PTR [rdx+rax*8]
.LVL133:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU404
	.loc 1 16 26 discriminator 1 view .LVU405
	cmp	r10, r8
	jnb	.L178
	.loc 1 16 38 is_stmt 0 discriminator 3 view .LVU406
	vmovsd	xmm5, QWORD PTR 8[rcx+r9]
	.loc 1 16 5 discriminator 3 view .LVU407
	add	rax, 2
	.loc 1 16 38 discriminator 3 view .LVU408
	vfmadd231sd	xmm0, xmm5, QWORD PTR 8[rdx+r9]
.LVL134:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU409
	.loc 1 16 26 discriminator 1 view .LVU410
	cmp	rax, r8
	jnb	.L178
	.loc 1 16 38 is_stmt 0 discriminator 3 view .LVU411
	vmovsd	xmm5, QWORD PTR 16[rdx+r9]
	vfmadd231sd	xmm0, xmm5, QWORD PTR 16[rcx+r9]
.LVL135:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU412
	.loc 1 16 26 discriminator 1 view .LVU413
.L178:
	.loc 1 16 26 is_stmt 0 discriminator 1 view .LVU414
.LBE31:
	.loc 1 18 1 view .LVU415
	ret
	.p2align 4
	.p2align 3
.L190:
	.loc 1 18 1 view .LVU416
	vzeroupper
.LVL136:
	ret
.LVL137:
	.p2align 4
	.p2align 3
.L184:
	.loc 1 15 7 view .LVU417
	vxorpd	xmm0, xmm0, xmm0
	.loc 1 18 1 view .LVU418
	ret
.L185:
.LBB32:
	.loc 1 16 17 view .LVU419
	xor	eax, eax
.LBE32:
	.loc 1 15 7 view .LVU420
	vxorpd	xmm0, xmm0, xmm0
	jmp	.L180
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
.LVL138:
.LFB40:
	.loc 1 26 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 26 12 is_stmt 0 view .LVU422
	push	rsi
	.seh_pushreg	rsi
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 72
	.seh_stackalloc	72
	.cfi_def_cfa_offset 96
	.seh_endprologue
.LVL139:
	.loc 1 28 7 view .LVU423
	vpxor	xmm0, xmm0, xmm0
	vextracti128	XMMWORD PTR 16[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 32[rsp], ymm0, 0x1
	.loc 1 26 12 view .LVU424
	mov	rax, rcx
	.loc 1 28 7 view .LVU425
	vmovdqu	XMMWORD PTR [rsp], xmm0
	vextracti128	XMMWORD PTR 48[rsp], ymm0, 0x1
.LVL140:
.LBB33:
	.loc 1 30 18 is_stmt 1 discriminator 1 view .LVU426
	cmp	r8, 7
	jbe	.L205
	lea	rcx, -8[r8]
.LVL141:
	.loc 1 30 18 is_stmt 0 discriminator 1 view .LVU427
	vxorpd	xmm0, xmm0, xmm0
	xor	r9d, r9d
	xor	r10d, r10d
	mov	r11, rcx
	vmovapd	ymm1, ymm0
	shr	r11, 3
	inc	r11
.LVL142:
	.p2align 4
	.p2align 3
.L195:
.LBB34:
	.loc 1 31 30 is_stmt 1 discriminator 1 view .LVU428
	.loc 1 31 47 is_stmt 0 discriminator 3 view .LVU429
	vmovupd	ymm4, YMMWORD PTR [rdx+r9]
	vmovupd	ymm5, YMMWORD PTR 32[rdx+r9]
	inc	r10
	vfmadd231pd	ymm1, ymm4, YMMWORD PTR [rax+r9]
	vfmadd231pd	ymm0, ymm5, YMMWORD PTR 32[rax+r9]
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU430
.LVL143:
	.loc 1 31 30 discriminator 1 view .LVU431
	.loc 1 31 9 discriminator 3 view .LVU432
	.loc 1 31 30 discriminator 1 view .LVU433
	.loc 1 31 9 discriminator 3 view .LVU434
	.loc 1 31 30 discriminator 1 view .LVU435
	.loc 1 31 9 discriminator 3 view .LVU436
	.loc 1 31 30 discriminator 1 view .LVU437
	.loc 1 31 9 discriminator 3 view .LVU438
	.loc 1 31 30 discriminator 1 view .LVU439
	.loc 1 31 9 discriminator 3 view .LVU440
	.loc 1 31 30 discriminator 1 view .LVU441
	.loc 1 31 9 discriminator 3 view .LVU442
	.loc 1 31 30 discriminator 1 view .LVU443
	.loc 1 31 9 discriminator 3 view .LVU444
	.loc 1 31 30 discriminator 1 view .LVU445
.LBE34:
	.loc 1 30 18 discriminator 1 view .LVU446
	add	r9, 64
	cmp	r10, r11
	jb	.L195
	vextractf128	XMMWORD PTR 16[rsp], ymm1, 0x1
	vextractf128	XMMWORD PTR 48[rsp], ymm0, 0x1
	and	rcx, -8
	vmovupd	XMMWORD PTR [rsp], xmm1
	add	rcx, 8
	vmovupd	XMMWORD PTR 32[rsp], xmm0
.LVL144:
.L196:
	.loc 1 30 18 is_stmt 0 discriminator 1 view .LVU447
.LBE33:
.LBB35:
	.loc 1 34 26 is_stmt 1 discriminator 1 view .LVU448
	.loc 1 34 38 is_stmt 0 discriminator 3 view .LVU449
	vxorpd	xmm0, xmm0, xmm0
	vaddsd	xmm0, xmm0, QWORD PTR [rsp]
	vaddsd	xmm0, xmm0, QWORD PTR 8[rsp]
.LVL145:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU450
	.loc 1 34 26 discriminator 1 view .LVU451
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU452
	vaddsd	xmm0, xmm0, QWORD PTR 16[rsp]
.LVL146:
	.loc 1 34 38 discriminator 3 view .LVU453
	vaddsd	xmm0, xmm0, QWORD PTR 24[rsp]
.LVL147:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU454
	.loc 1 34 26 discriminator 1 view .LVU455
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU456
	vaddsd	xmm0, xmm0, QWORD PTR 32[rsp]
.LVL148:
	.loc 1 34 38 discriminator 3 view .LVU457
	vaddsd	xmm0, xmm0, QWORD PTR 40[rsp]
.LVL149:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU458
	.loc 1 34 26 discriminator 1 view .LVU459
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU460
	vaddsd	xmm0, xmm0, QWORD PTR 48[rsp]
.LVL150:
	.loc 1 34 38 discriminator 3 view .LVU461
	vaddsd	xmm0, xmm0, QWORD PTR 56[rsp]
.LVL151:
	.loc 1 34 5 is_stmt 1 discriminator 3 view .LVU462
	.loc 1 34 26 discriminator 1 view .LVU463
	.loc 1 34 26 is_stmt 0 discriminator 1 view .LVU464
.LBE35:
	.loc 1 35 14 is_stmt 1 discriminator 1 view .LVU465
	cmp	rcx, r8
	jnb	.L191
	mov	rsi, r8
	sub	rsi, rcx
	lea	r9, -1[rsi]
	cmp	r9, 2
	jbe	.L197
	mov	r11, rsi
	lea	r10, 0[0+rcx*8]
	xor	r9d, r9d
	shr	r11, 2
	lea	rbx, [rax+r10]
	add	r10, rdx
	sal	r11, 5
.LVL152:
	.p2align 4
	.p2align 3
.L198:
	.loc 1 35 34 is_stmt 0 discriminator 2 view .LVU466
	vmovupd	ymm3, YMMWORD PTR [r10+r9]
	vmulpd	ymm1, ymm3, YMMWORD PTR [rbx+r9]
	add	r9, 32
	vaddsd	xmm0, xmm0, xmm1
.LVL153:
	.loc 1 35 34 discriminator 2 view .LVU467
	vunpckhpd	xmm2, xmm1, xmm1
	vextractf128	xmm1, ymm1, 0x1
	vaddsd	xmm2, xmm2, xmm0
	.loc 1 35 26 discriminator 2 view .LVU468
	vaddsd	xmm0, xmm1, xmm2
	vunpckhpd	xmm1, xmm1, xmm1
	vaddsd	xmm0, xmm0, xmm1
.LVL154:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU469
	.loc 1 35 14 discriminator 1 view .LVU470
	cmp	r11, r9
	jne	.L198
	test	sil, 3
	je	.L191
	and	rsi, -4
	add	rcx, rsi
.L197:
.LVL155:
	.loc 1 35 26 is_stmt 0 discriminator 2 view .LVU471
	vmovsd	xmm4, QWORD PTR [rdx+rcx*8]
	.loc 1 35 5 discriminator 2 view .LVU472
	lea	r10, 1[rcx]
	.loc 1 35 30 discriminator 2 view .LVU473
	lea	r9, 0[0+rcx*8]
	.loc 1 35 26 discriminator 2 view .LVU474
	vfmadd231sd	xmm0, xmm4, QWORD PTR [rax+rcx*8]
.LVL156:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU475
	.loc 1 35 14 discriminator 1 view .LVU476
	cmp	r10, r8
	jnb	.L191
	.loc 1 35 26 is_stmt 0 discriminator 2 view .LVU477
	vmovsd	xmm5, QWORD PTR 8[rax+r9]
	.loc 1 35 5 discriminator 2 view .LVU478
	add	rcx, 2
	.loc 1 35 26 discriminator 2 view .LVU479
	vfmadd231sd	xmm0, xmm5, QWORD PTR 8[rdx+r9]
.LVL157:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU480
	.loc 1 35 14 discriminator 1 view .LVU481
	cmp	rcx, r8
	jnb	.L191
	.loc 1 35 26 is_stmt 0 discriminator 2 view .LVU482
	vmovsd	xmm5, QWORD PTR 16[rdx+r9]
	vfmadd231sd	xmm0, xmm5, QWORD PTR 16[rax+r9]
.LVL158:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU483
	.loc 1 35 14 discriminator 1 view .LVU484
.L191:
	.loc 1 35 14 is_stmt 0 discriminator 1 view .LVU485
	vzeroupper
.LVL159:
	.loc 1 37 1 view .LVU486
	add	rsp, 72
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	pop	rsi
	.cfi_restore 4
	.cfi_def_cfa_offset 8
	ret
.LVL160:
.L205:
	.cfi_restore_state
	.loc 1 29 12 view .LVU487
	xor	ecx, ecx
	jmp	.L196
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
.LVL161:
.LFB41:
	.loc 1 45 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 45 12 is_stmt 0 view .LVU489
	sub	rsp, 40
	.seh_stackalloc	40
	.cfi_def_cfa_offset 48
	.seh_endprologue
.LVL162:
.LBB36:
.LBB37:
	.loc 1 47 9 view .LVU490
	vpxor	xmm0, xmm0, xmm0
	vextracti128	XMMWORD PTR 16[rsp], ymm0, 0x1
.LVL163:
	.loc 1 47 9 view .LVU491
	vmovdqu	XMMWORD PTR [rsp], xmm0
	test	r8, r8
	je	.L207
	cmp	r8, 3
	jbe	.L212
	mov	r9, r8
	xor	eax, eax
	vxorpd	xmm0, xmm0, xmm0
	shr	r9, 2
	sal	r9, 5
.LVL164:
	.p2align 4
	.p2align 3
.L209:
	.loc 1 48 38 view .LVU492
	vmovupd	ymm1, YMMWORD PTR [rcx+rax]
	vfmadd231pd	ymm0, ymm1, YMMWORD PTR [rdx+rax]
	add	rax, 32
	cmp	r9, rax
	jne	.L209
	mov	rax, r8
	vextractf128	XMMWORD PTR 16[rsp], ymm0, 0x1
	vmovupd	XMMWORD PTR [rsp], xmm0
	and	rax, -4
	test	r8b, 3
	je	.L207
.L208:
.LVL165:
	.loc 1 48 38 view .LVU493
	vmovsd	xmm2, QWORD PTR [rsp]
	vmovsd	xmm0, QWORD PTR [rcx+rax*8]
	lea	r10, 1[rax]
	.loc 1 48 42 view .LVU494
	lea	r9, 0[0+rax*8]
	.loc 1 48 38 view .LVU495
	vfmadd132sd	xmm0, xmm2, QWORD PTR [rdx+rax*8]
	vmovsd	QWORD PTR [rsp], xmm0
	.loc 1 48 38 view .LVU496
	cmp	r10, r8
	jnb	.L207
	.loc 1 48 38 view .LVU497
	vmovsd	xmm3, QWORD PTR 8[rcx+r9]
	add	rax, 2
	vfmadd231sd	xmm0, xmm3, QWORD PTR 8[rdx+r9]
	vmovsd	QWORD PTR [rsp], xmm0
	.loc 1 48 38 view .LVU498
	cmp	rax, r8
	jnb	.L207
	.loc 1 48 38 view .LVU499
	vmovsd	xmm4, QWORD PTR 16[rcx+r9]
	vfmadd231sd	xmm0, xmm4, QWORD PTR 16[rdx+r9]
	vmovsd	QWORD PTR [rsp], xmm0
.LVL166:
.L207:
	.loc 1 47 9 view .LVU500
	vxorpd	xmm0, xmm0, xmm0
	vaddsd	xmm0, xmm0, QWORD PTR [rsp]
	vaddsd	xmm0, xmm0, QWORD PTR 8[rsp]
.LVL167:
	.loc 1 47 9 view .LVU501
	vaddsd	xmm0, xmm0, QWORD PTR 16[rsp]
.LVL168:
	.loc 1 47 9 view .LVU502
	vaddsd	xmm0, xmm0, QWORD PTR 24[rsp]
	vzeroupper
.LVL169:
.LBE37:
.LBE36:
	.loc 1 50 1 view .LVU503
	add	rsp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL170:
.L212:
	.cfi_restore_state
.LBB39:
.LBB38:
	.loc 1 47 9 view .LVU504
	xor	eax, eax
	jmp	.L208
.LBE38:
.LBE39:
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
.LVL171:
.LFB42:
	.loc 1 58 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 58 12 is_stmt 0 view .LVU506
	push	rsi
	.seh_pushreg	rsi
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 312
	.seh_stackalloc	312
	.cfi_def_cfa_offset 336
	vmovups	XMMWORD PTR 256[rsp], xmm6
	.seh_savexmm	xmm6, 256
	vmovups	XMMWORD PTR 272[rsp], xmm7
	.seh_savexmm	xmm7, 272
	vmovups	XMMWORD PTR 288[rsp], xmm8
	.seh_savexmm	xmm8, 288
	.cfi_offset 23, -80
	.cfi_offset 24, -64
	.cfi_offset 25, -48
	.seh_endprologue
.LVL172:
	.loc 1 60 7 view .LVU507
	vpxor	xmm0, xmm0, xmm0
	vextracti128	XMMWORD PTR 16[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 32[rsp], ymm0, 0x1
	vmovdqu	XMMWORD PTR [rsp], xmm0
	vextracti128	XMMWORD PTR 48[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 64[rsp], ymm0, 0x1
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
.LVL173:
.LBB40:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU508
	cmp	r8, 31
	jbe	.L230
	mov	r10, rcx
	mov	r9, rdx
	mov	r11d, 32
	vxorpd	xmm0, xmm0, xmm0
	vmovapd	ymm7, ymm0
	vmovapd	ymm6, ymm0
	vmovapd	ymm5, ymm0
	vmovapd	ymm4, ymm0
	vmovapd	ymm3, ymm0
	vmovapd	ymm2, ymm0
	vmovapd	ymm1, ymm0
.LVL174:
	.p2align 4
	.p2align 3
.L223:
.LBB41:
.LBB42:
	.loc 1 64 47 is_stmt 0 view .LVU509
	vmovupd	ymm8, YMMWORD PTR [r10]
	mov	rax, r11
.LBE42:
.LBE41:
	.loc 1 62 18 discriminator 1 view .LVU510
	lea	r11, 32[r11]
.LVL175:
	.loc 1 62 18 discriminator 1 view .LVU511
	add	r10, 256
.LBB45:
.LBB43:
	.loc 1 64 47 view .LVU512
	vfmadd231pd	ymm1, ymm8, YMMWORD PTR [r9]
	vmovupd	ymm8, YMMWORD PTR -224[r10]
.LBE43:
.LBE45:
	.loc 1 62 18 discriminator 1 view .LVU513
	add	r9, 256
.LBB46:
.LBB44:
	.loc 1 64 47 view .LVU514
	vfmadd231pd	ymm2, ymm8, YMMWORD PTR -224[r9]
	vmovupd	ymm8, YMMWORD PTR -192[r10]
	vfmadd231pd	ymm3, ymm8, YMMWORD PTR -192[r9]
	vmovupd	ymm8, YMMWORD PTR -160[r10]
	vfmadd231pd	ymm4, ymm8, YMMWORD PTR -160[r9]
	vmovupd	ymm8, YMMWORD PTR -128[r10]
	vfmadd231pd	ymm5, ymm8, YMMWORD PTR -128[r9]
	vmovupd	ymm8, YMMWORD PTR -96[r10]
	vfmadd231pd	ymm6, ymm8, YMMWORD PTR -96[r9]
	vmovupd	ymm8, YMMWORD PTR -64[r10]
	vfmadd231pd	ymm7, ymm8, YMMWORD PTR -64[r9]
	vmovupd	ymm8, YMMWORD PTR -32[r10]
	vfmadd231pd	ymm0, ymm8, YMMWORD PTR -32[r9]
.LVL176:
	.loc 1 64 47 view .LVU515
.LBE44:
.LBE46:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU516
	cmp	r8, r11
	jnb	.L223
	vextractf128	XMMWORD PTR 16[rsp], ymm1, 0x1
	vextractf128	XMMWORD PTR 48[rsp], ymm2, 0x1
	vmovupd	XMMWORD PTR [rsp], xmm1
	vmovupd	XMMWORD PTR 32[rsp], xmm2
	vmovupd	XMMWORD PTR 64[rsp], xmm3
	vmovupd	XMMWORD PTR 96[rsp], xmm4
	vmovupd	XMMWORD PTR 128[rsp], xmm5
	vmovupd	XMMWORD PTR 160[rsp], xmm6
	vmovupd	XMMWORD PTR 192[rsp], xmm7
	vmovupd	XMMWORD PTR 224[rsp], xmm0
	vextractf128	XMMWORD PTR 80[rsp], ymm3, 0x1
	vextractf128	XMMWORD PTR 112[rsp], ymm4, 0x1
	vextractf128	XMMWORD PTR 144[rsp], ymm5, 0x1
	vextractf128	XMMWORD PTR 176[rsp], ymm6, 0x1
	vextractf128	XMMWORD PTR 208[rsp], ymm7, 0x1
	vextractf128	XMMWORD PTR 240[rsp], ymm0, 0x1
.L222:
.LVL177:
	.loc 1 62 18 is_stmt 0 discriminator 1 view .LVU517
.LBE40:
.LBB47:
	.loc 1 67 26 is_stmt 1 discriminator 1 view .LVU518
	.loc 1 67 38 is_stmt 0 discriminator 3 view .LVU519
	vxorpd	xmm0, xmm0, xmm0
	vaddsd	xmm0, xmm0, QWORD PTR [rsp]
	vaddsd	xmm0, xmm0, QWORD PTR 8[rsp]
.LVL178:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU520
	.loc 1 67 26 discriminator 1 view .LVU521
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU522
	vaddsd	xmm0, xmm0, QWORD PTR 16[rsp]
.LVL179:
	.loc 1 67 38 discriminator 3 view .LVU523
	vaddsd	xmm0, xmm0, QWORD PTR 24[rsp]
.LVL180:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU524
	.loc 1 67 26 discriminator 1 view .LVU525
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU526
	vaddsd	xmm0, xmm0, QWORD PTR 32[rsp]
.LVL181:
	.loc 1 67 38 discriminator 3 view .LVU527
	vaddsd	xmm0, xmm0, QWORD PTR 40[rsp]
.LVL182:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU528
	.loc 1 67 26 discriminator 1 view .LVU529
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU530
	vaddsd	xmm0, xmm0, QWORD PTR 48[rsp]
.LVL183:
	.loc 1 67 38 discriminator 3 view .LVU531
	vaddsd	xmm0, xmm0, QWORD PTR 56[rsp]
.LVL184:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU532
	.loc 1 67 26 discriminator 1 view .LVU533
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU534
	vaddsd	xmm0, xmm0, QWORD PTR 64[rsp]
.LVL185:
	.loc 1 67 38 discriminator 3 view .LVU535
	vaddsd	xmm0, xmm0, QWORD PTR 72[rsp]
.LVL186:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU536
	.loc 1 67 26 discriminator 1 view .LVU537
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU538
	vaddsd	xmm0, xmm0, QWORD PTR 80[rsp]
.LVL187:
	.loc 1 67 38 discriminator 3 view .LVU539
	vaddsd	xmm0, xmm0, QWORD PTR 88[rsp]
.LVL188:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU540
	.loc 1 67 26 discriminator 1 view .LVU541
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU542
	vaddsd	xmm0, xmm0, QWORD PTR 96[rsp]
.LVL189:
	.loc 1 67 38 discriminator 3 view .LVU543
	vaddsd	xmm0, xmm0, QWORD PTR 104[rsp]
.LVL190:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU544
	.loc 1 67 26 discriminator 1 view .LVU545
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU546
	vaddsd	xmm0, xmm0, QWORD PTR 112[rsp]
.LVL191:
	.loc 1 67 38 discriminator 3 view .LVU547
	vaddsd	xmm0, xmm0, QWORD PTR 120[rsp]
.LVL192:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU548
	.loc 1 67 26 discriminator 1 view .LVU549
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU550
	vaddsd	xmm0, xmm0, QWORD PTR 128[rsp]
.LVL193:
	.loc 1 67 38 discriminator 3 view .LVU551
	vaddsd	xmm0, xmm0, QWORD PTR 136[rsp]
.LVL194:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU552
	.loc 1 67 26 discriminator 1 view .LVU553
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU554
	vaddsd	xmm0, xmm0, QWORD PTR 144[rsp]
.LVL195:
	.loc 1 67 38 discriminator 3 view .LVU555
	vaddsd	xmm0, xmm0, QWORD PTR 152[rsp]
.LVL196:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU556
	.loc 1 67 26 discriminator 1 view .LVU557
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU558
	vaddsd	xmm0, xmm0, QWORD PTR 160[rsp]
.LVL197:
	.loc 1 67 38 discriminator 3 view .LVU559
	vaddsd	xmm0, xmm0, QWORD PTR 168[rsp]
.LVL198:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU560
	.loc 1 67 26 discriminator 1 view .LVU561
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU562
	vaddsd	xmm0, xmm0, QWORD PTR 176[rsp]
.LVL199:
	.loc 1 67 38 discriminator 3 view .LVU563
	vaddsd	xmm0, xmm0, QWORD PTR 184[rsp]
.LVL200:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU564
	.loc 1 67 26 discriminator 1 view .LVU565
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU566
	vaddsd	xmm0, xmm0, QWORD PTR 192[rsp]
.LVL201:
	.loc 1 67 38 discriminator 3 view .LVU567
	vaddsd	xmm0, xmm0, QWORD PTR 200[rsp]
.LVL202:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU568
	.loc 1 67 26 discriminator 1 view .LVU569
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU570
	vaddsd	xmm0, xmm0, QWORD PTR 208[rsp]
.LVL203:
	.loc 1 67 38 discriminator 3 view .LVU571
	vaddsd	xmm0, xmm0, QWORD PTR 216[rsp]
.LVL204:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU572
	.loc 1 67 26 discriminator 1 view .LVU573
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU574
	vaddsd	xmm0, xmm0, QWORD PTR 224[rsp]
.LVL205:
	.loc 1 67 38 discriminator 3 view .LVU575
	vaddsd	xmm0, xmm0, QWORD PTR 232[rsp]
.LVL206:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU576
	.loc 1 67 26 discriminator 1 view .LVU577
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU578
	vaddsd	xmm0, xmm0, QWORD PTR 240[rsp]
.LVL207:
	.loc 1 67 38 discriminator 3 view .LVU579
	vaddsd	xmm0, xmm0, QWORD PTR 248[rsp]
.LVL208:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU580
	.loc 1 67 26 discriminator 1 view .LVU581
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU582
.LBE47:
	.loc 1 68 14 is_stmt 1 discriminator 1 view .LVU583
	cmp	rax, r8
	jnb	.L221
	mov	rsi, r8
	sub	rsi, rax
	lea	r9, -1[rsi]
	cmp	r9, 2
	jbe	.L226
	mov	r11, rsi
	lea	r10, 0[0+rax*8]
	xor	r9d, r9d
	shr	r11, 2
	lea	rbx, [rcx+r10]
	add	r10, rdx
	sal	r11, 5
.LVL209:
	.p2align 4
	.p2align 3
.L227:
	.loc 1 68 34 is_stmt 0 discriminator 2 view .LVU584
	vmovupd	ymm4, YMMWORD PTR [r10+r9]
	vmulpd	ymm1, ymm4, YMMWORD PTR [rbx+r9]
	add	r9, 32
	vaddsd	xmm3, xmm1, xmm0
	vunpckhpd	xmm2, xmm1, xmm1
	vextractf128	xmm1, ymm1, 0x1
	vaddsd	xmm2, xmm2, xmm3
	.loc 1 68 26 discriminator 2 view .LVU585
	vaddsd	xmm0, xmm1, xmm2
.LVL210:
	.loc 1 68 26 discriminator 2 view .LVU586
	vunpckhpd	xmm1, xmm1, xmm1
	vaddsd	xmm0, xmm0, xmm1
.LVL211:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU587
	.loc 1 68 14 discriminator 1 view .LVU588
	cmp	r11, r9
	jne	.L227
	test	sil, 3
	je	.L221
	and	rsi, -4
	add	rax, rsi
.L226:
.LVL212:
	.loc 1 68 26 is_stmt 0 discriminator 2 view .LVU589
	vmovsd	xmm5, QWORD PTR [rdx+rax*8]
	.loc 1 68 5 discriminator 2 view .LVU590
	lea	r10, 1[rax]
	.loc 1 68 30 discriminator 2 view .LVU591
	lea	r9, 0[0+rax*8]
	.loc 1 68 26 discriminator 2 view .LVU592
	vfmadd231sd	xmm0, xmm5, QWORD PTR [rcx+rax*8]
.LVL213:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU593
	.loc 1 68 14 discriminator 1 view .LVU594
	cmp	r10, r8
	jnb	.L221
	.loc 1 68 26 is_stmt 0 discriminator 2 view .LVU595
	vmovsd	xmm6, QWORD PTR 8[rcx+r9]
	.loc 1 68 5 discriminator 2 view .LVU596
	add	rax, 2
	.loc 1 68 26 discriminator 2 view .LVU597
	vfmadd231sd	xmm0, xmm6, QWORD PTR 8[rdx+r9]
.LVL214:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU598
	.loc 1 68 14 discriminator 1 view .LVU599
	cmp	rax, r8
	jnb	.L221
	.loc 1 68 26 is_stmt 0 discriminator 2 view .LVU600
	vmovsd	xmm7, QWORD PTR 16[rdx+r9]
	vfmadd231sd	xmm0, xmm7, QWORD PTR 16[rcx+r9]
.LVL215:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU601
	.loc 1 68 14 discriminator 1 view .LVU602
.L221:
	.loc 1 68 14 is_stmt 0 discriminator 1 view .LVU603
	vzeroupper
.LVL216:
	.loc 1 70 1 view .LVU604
	vmovups	xmm6, XMMWORD PTR 256[rsp]
	vmovups	xmm7, XMMWORD PTR 272[rsp]
	vmovups	xmm8, XMMWORD PTR 288[rsp]
	add	rsp, 312
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
.LVL217:
.L230:
	.cfi_restore_state
	.loc 1 61 12 view .LVU605
	xor	eax, eax
	jmp	.L222
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
.LVL218:
.LFB43:
	.loc 1 76 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 76 15 is_stmt 0 view .LVU607
	.seh_endprologue
.LVL219:
.LBB48:
	.loc 1 77 26 is_stmt 1 discriminator 1 view .LVU608
	test	r9, r9
	je	.L259
	lea	rax, -1[r9]
	cmp	rax, 2
	jbe	.L244
	mov	rcx, r9
	vbroadcastsd	ymm2, xmm0
	xor	eax, eax
	shr	rcx, 2
	sal	rcx, 5
.LVL220:
	.p2align 4
	.p2align 3
.L240:
	.loc 1 77 52 is_stmt 0 discriminator 3 view .LVU609
	vmovupd	ymm1, YMMWORD PTR [rdx+rax]
	vfmadd213pd	ymm1, ymm2, YMMWORD PTR [r8+rax]
	.loc 1 77 41 discriminator 3 view .LVU610
	vextractf128	XMMWORD PTR 16[r8+rax], ymm1, 0x1
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU611
	.loc 1 77 26 discriminator 1 view .LVU612
	.loc 1 77 41 is_stmt 0 discriminator 3 view .LVU613
	vmovupd	XMMWORD PTR [r8+rax], xmm1
	add	rax, 32
	cmp	rax, rcx
	jne	.L240
	test	r9b, 3
	je	.L258
	mov	rax, r9
	and	rax, -4
	vzeroupper
.LVL221:
.L239:
	.loc 1 77 41 discriminator 3 view .LVU614
	sub	r9, rax
.LVL222:
	.loc 1 77 41 discriminator 3 view .LVU615
	cmp	r9, 1
	je	.L242
	lea	r10, 0[0+rax*8]
	.loc 1 77 52 discriminator 3 view .LVU616
	vmovddup	xmm1, xmm0
	lea	rcx, [r8+r10]
	vmovupd	xmm4, XMMWORD PTR [rcx]
	vfmadd132pd	xmm1, xmm4, XMMWORD PTR [rdx+r10]
	.loc 1 77 41 discriminator 3 view .LVU617
	vmovupd	XMMWORD PTR [rcx], xmm1
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU618
	.loc 1 77 26 discriminator 1 view .LVU619
	test	r9b, 1
	je	.L259
	and	r9, -2
	add	rax, r9
.L242:
.LVL223:
	.loc 1 77 48 is_stmt 0 discriminator 3 view .LVU620
	sal	rax, 3
	.loc 1 77 55 discriminator 3 view .LVU621
	add	r8, rax
.LVL224:
	.loc 1 77 52 discriminator 3 view .LVU622
	vmovsd	xmm3, QWORD PTR [r8]
	vfmadd132sd	xmm0, xmm3, QWORD PTR [rdx+rax]
.LVL225:
	.loc 1 77 41 discriminator 3 view .LVU623
	vmovsd	QWORD PTR [r8], xmm0
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU624
	.loc 1 77 26 discriminator 1 view .LVU625
.LVL226:
.L259:
	.loc 1 77 26 is_stmt 0 discriminator 1 view .LVU626
.LBE48:
	.loc 1 78 1 view .LVU627
	ret
.LVL227:
	.p2align 4
	.p2align 3
.L258:
	.loc 1 78 1 view .LVU628
	vzeroupper
.LVL228:
	ret
.LVL229:
.L244:
.LBB49:
	.loc 1 77 17 view .LVU629
	xor	eax, eax
	jmp	.L239
.LBE49:
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
.LVL230:
.LFB44:
	.loc 1 81 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 81 15 is_stmt 0 view .LVU631
	.seh_endprologue
.LVL231:
.LBB50:
	.loc 1 82 26 is_stmt 1 discriminator 1 view .LVU632
	test	r9, r9
	je	.L286
	cmp	QWORD PTR 40[rsp], 1
	jne	.L287
	lea	rax, -1[r9]
	cmp	rax, 2
	jbe	.L270
	mov	rcx, r9
	vbroadcastsd	ymm2, xmm0
	xor	eax, eax
	shr	rcx, 2
	sal	rcx, 5
.LVL232:
	.p2align 4
	.p2align 3
.L266:
	.loc 1 82 60 is_stmt 0 discriminator 3 view .LVU633
	vmovupd	ymm1, YMMWORD PTR [rdx+rax]
	vfmadd213pd	ymm1, ymm2, YMMWORD PTR [r8+rax]
	.loc 1 82 45 discriminator 3 view .LVU634
	vextractf128	XMMWORD PTR 16[r8+rax], ymm1, 0x1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU635
	.loc 1 82 26 discriminator 1 view .LVU636
	.loc 1 82 45 is_stmt 0 discriminator 3 view .LVU637
	vmovupd	XMMWORD PTR [r8+rax], xmm1
	add	rax, 32
	cmp	rax, rcx
	jne	.L266
	mov	rax, r9
	and	rax, -4
	test	r9b, 3
	je	.L288
	vzeroupper
.LVL233:
.L265:
	.loc 1 82 45 discriminator 3 view .LVU638
	sub	r9, rax
.LVL234:
	.loc 1 82 45 discriminator 3 view .LVU639
	cmp	r9, 1
	je	.L268
	lea	r10, 0[0+rax*8]
	.loc 1 82 60 discriminator 3 view .LVU640
	vmovddup	xmm1, xmm0
	lea	rcx, [r8+r10]
	vmovupd	xmm4, XMMWORD PTR [rcx]
	vfmadd132pd	xmm1, xmm4, XMMWORD PTR [rdx+r10]
	.loc 1 82 45 discriminator 3 view .LVU641
	vmovupd	XMMWORD PTR [rcx], xmm1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU642
	.loc 1 82 26 discriminator 1 view .LVU643
	test	r9b, 1
	je	.L286
	and	r9, -2
	add	rax, r9
.L268:
.LVL235:
	.loc 1 82 52 is_stmt 0 discriminator 3 view .LVU644
	sal	rax, 3
	.loc 1 82 63 discriminator 3 view .LVU645
	add	r8, rax
.LVL236:
	.loc 1 82 60 discriminator 3 view .LVU646
	vmovsd	xmm3, QWORD PTR [r8]
	vfmadd132sd	xmm0, xmm3, QWORD PTR [rdx+rax]
.LVL237:
	.loc 1 82 45 discriminator 3 view .LVU647
	vmovsd	QWORD PTR [r8], xmm0
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU648
	.loc 1 82 26 discriminator 1 view .LVU649
.LVL238:
.L286:
	.loc 1 82 26 is_stmt 0 discriminator 1 view .LVU650
.LBE50:
	.loc 1 83 1 view .LVU651
	ret
.LVL239:
	.p2align 4
	.p2align 3
.L288:
	.loc 1 83 1 view .LVU652
	vzeroupper
.LVL240:
	ret
.LVL241:
	.p2align 4
	.p2align 3
.L287:
	.loc 1 83 1 view .LVU653
	mov	rax, QWORD PTR 40[rsp]
.LBB51:
	.loc 1 82 17 view .LVU654
	xor	ecx, ecx
	lea	r10, 0[0+rax*8]
	.loc 1 82 26 discriminator 1 view .LVU655
	xor	eax, eax
.LVL242:
	.p2align 4
	.p2align 3
.L263:
	.loc 1 82 60 discriminator 3 view .LVU656
	vmovsd	xmm1, QWORD PTR [rdx+rax]
	.loc 1 82 5 discriminator 3 view .LVU657
	inc	rcx
.LVL243:
	.loc 1 82 60 discriminator 3 view .LVU658
	vfmadd213sd	xmm1, xmm0, QWORD PTR [r8+rax]
	.loc 1 82 45 discriminator 3 view .LVU659
	vmovsd	QWORD PTR [r8+rax], xmm1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU660
.LVL244:
	.loc 1 82 26 discriminator 1 view .LVU661
	add	rax, r10
	cmp	r9, rcx
	jne	.L263
.LBE51:
	.loc 1 83 1 is_stmt 0 view .LVU662
	ret
.LVL245:
.L270:
.LBB52:
	.loc 1 82 17 view .LVU663
	xor	eax, eax
	jmp	.L265
.LBE52:
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
.LVL246:
.LFB45:
	.loc 1 86 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 86 15 is_stmt 0 view .LVU665
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
.LVL247:
.LBB53:
	.loc 1 88 26 is_stmt 1 discriminator 1 view .LVU666
.LBE53:
	.loc 1 86 15 is_stmt 0 view .LVU667
	mov	rsi, QWORD PTR 72[rsp]
	vmovsd	xmm4, xmm0, xmm0
.LBB54:
	.loc 1 88 26 discriminator 1 view .LVU668
	test	rsi, rsi
	je	.L308
	lea	rax, -1[rsi]
	cmp	rax, 6
	jbe	.L296
	mov	rbp, rsi
	vbroadcastsd	ymm3, xmm0
	mov	rax, r9
	mov	rcx, r8
	shr	rbp, 3
	sal	rbp, 5
	add	rbp, r9
.LVL248:
	.p2align 4
	.p2align 3
.L292:
	.loc 1 88 48 discriminator 3 view .LVU669
	movsx	r11, DWORD PTR 16[rax]
	movsx	rdi, DWORD PTR 24[rax]
	add	rax, 32
	add	rcx, 64
	movsx	r10, DWORD PTR -12[rax]
	movsx	rbx, DWORD PTR -4[rax]
	vmovsd	xmm1, QWORD PTR [rdx+rdi*8]
	vmovsd	xmm0, QWORD PTR [rdx+r11*8]
	movsx	rdi, DWORD PTR -24[rax]
	movsx	r11, DWORD PTR -32[rax]
	vmovsd	xmm2, QWORD PTR [rdx+rdi*8]
	vmovhpd	xmm1, xmm1, QWORD PTR [rdx+rbx*8]
	vmovhpd	xmm0, xmm0, QWORD PTR [rdx+r10*8]
	vinsertf128	ymm0, ymm0, xmm1, 0x1
	vmovsd	xmm1, QWORD PTR [rdx+r11*8]
	movsx	r10, DWORD PTR -28[rax]
	movsx	rbx, DWORD PTR -20[rax]
	.loc 1 88 57 discriminator 3 view .LVU670
	vfmadd213pd	ymm0, ymm3, YMMWORD PTR -32[rcx]
	.loc 1 88 48 discriminator 3 view .LVU671
	vmovhpd	xmm2, xmm2, QWORD PTR [rdx+rbx*8]
	vmovhpd	xmm1, xmm1, QWORD PTR [rdx+r10*8]
	vinsertf128	ymm1, ymm1, xmm2, 0x1
	.loc 1 88 57 discriminator 3 view .LVU672
	vfmadd213pd	ymm1, ymm3, YMMWORD PTR -64[rcx]
	.loc 1 88 41 discriminator 3 view .LVU673
	vmovupd	XMMWORD PTR -32[rcx], xmm0
	vextractf128	XMMWORD PTR -16[rcx], ymm0, 0x1
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU674
	.loc 1 88 26 discriminator 1 view .LVU675
	.loc 1 88 41 is_stmt 0 discriminator 3 view .LVU676
	vmovupd	XMMWORD PTR -64[rcx], xmm1
	vextractf128	XMMWORD PTR -48[rcx], ymm1, 0x1
	cmp	rbp, rax
	jne	.L292
	mov	rax, rsi
	and	rax, -8
	test	sil, 7
	je	.L309
	vzeroupper
.LVL249:
.L291:
	.loc 1 88 41 discriminator 3 view .LVU677
	mov	r10, rsi
	sub	r10, rax
	lea	rcx, -1[r10]
	cmp	rcx, 2
	jbe	.L294
	.loc 1 88 48 discriminator 3 view .LVU678
	movsx	rdi, DWORD PTR 8[r9+rax*4]
	movsx	rbx, DWORD PTR 12[r9+rax*4]
	lea	r11, [r9+rax*4]
	lea	rcx, [r8+rax*8]
	vmovddup	xmm2, xmm4
	vmovsd	xmm0, QWORD PTR [rdx+rdi*8]
	vmovhpd	xmm0, xmm0, QWORD PTR [rdx+rbx*8]
	movsx	rbx, DWORD PTR [r11]
	movsx	r11, DWORD PTR 4[r11]
	.loc 1 88 57 discriminator 3 view .LVU679
	vfmadd213pd	xmm0, xmm2, XMMWORD PTR 16[rcx]
	.loc 1 88 48 discriminator 3 view .LVU680
	vmovsd	xmm1, QWORD PTR [rdx+rbx*8]
	vmovhpd	xmm1, xmm1, QWORD PTR [rdx+r11*8]
	.loc 1 88 57 discriminator 3 view .LVU681
	vfmadd213pd	xmm1, xmm2, XMMWORD PTR [rcx]
	.loc 1 88 41 discriminator 3 view .LVU682
	vmovupd	XMMWORD PTR 16[rcx], xmm0
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU683
	.loc 1 88 26 discriminator 1 view .LVU684
	.loc 1 88 41 is_stmt 0 discriminator 3 view .LVU685
	vmovupd	XMMWORD PTR [rcx], xmm1
	mov	rcx, r10
	and	rcx, -4
	add	rax, rcx
	and	r10d, 3
	je	.L308
.L294:
.LVL250:
	.loc 1 88 54 discriminator 3 view .LVU686
	movsx	rbx, DWORD PTR [r9+rax*4]
	.loc 1 88 60 discriminator 3 view .LVU687
	lea	rcx, 0[0+rax*8]
	.loc 1 88 54 discriminator 3 view .LVU688
	lea	r11, 0[0+rax*4]
	.loc 1 88 60 discriminator 3 view .LVU689
	lea	r10, [r8+rcx]
	.loc 1 88 57 discriminator 3 view .LVU690
	vmovsd	xmm0, QWORD PTR [rdx+rbx*8]
	vfmadd213sd	xmm0, xmm4, QWORD PTR [r10]
	.loc 1 88 41 discriminator 3 view .LVU691
	vmovsd	QWORD PTR [r10], xmm0
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU692
	.loc 1 88 26 discriminator 1 view .LVU693
	.loc 1 88 5 is_stmt 0 discriminator 3 view .LVU694
	lea	r10, 1[rax]
	.loc 1 88 26 discriminator 1 view .LVU695
	cmp	r10, rsi
	jnb	.L308
	.loc 1 88 54 discriminator 3 view .LVU696
	movsx	rbx, DWORD PTR 4[r9+r11]
	.loc 1 88 60 discriminator 3 view .LVU697
	lea	r10, 8[r8+rcx]
	.loc 1 88 5 discriminator 3 view .LVU698
	add	rax, 2
	.loc 1 88 57 discriminator 3 view .LVU699
	vmovsd	xmm0, QWORD PTR [rdx+rbx*8]
	vfmadd213sd	xmm0, xmm4, QWORD PTR [r10]
	.loc 1 88 41 discriminator 3 view .LVU700
	vmovsd	QWORD PTR [r10], xmm0
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU701
	.loc 1 88 26 discriminator 1 view .LVU702
	cmp	rax, rsi
	jnb	.L308
	.loc 1 88 60 is_stmt 0 discriminator 3 view .LVU703
	lea	rax, 16[r8+rcx]
	.loc 1 88 54 discriminator 3 view .LVU704
	movsx	rcx, DWORD PTR 8[r9+r11]
	.loc 1 88 57 discriminator 3 view .LVU705
	vmovsd	xmm5, QWORD PTR [rax]
	vfmadd132sd	xmm4, xmm5, QWORD PTR [rdx+rcx*8]
.LVL251:
	.loc 1 88 41 discriminator 3 view .LVU706
	vmovsd	QWORD PTR [rax], xmm4
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU707
	.loc 1 88 26 discriminator 1 view .LVU708
.LVL252:
.L308:
	.loc 1 88 26 is_stmt 0 discriminator 1 view .LVU709
.LBE54:
	.loc 1 89 1 view .LVU710
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
	ret
.LVL253:
	.p2align 4
	.p2align 3
.L309:
	.cfi_restore_state
	.loc 1 89 1 view .LVU711
	vzeroupper
.LVL254:
	pop	rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 32
	pop	rsi
	.cfi_restore 4
	.cfi_def_cfa_offset 24
.LVL255:
	.loc 1 89 1 view .LVU712
	pop	rdi
	.cfi_restore 5
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	ret
.LVL256:
.L296:
	.cfi_restore_state
.LBB55:
	.loc 1 88 17 view .LVU713
	xor	eax, eax
	jmp	.L291
.LBE55:
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
.LVL257:
.LFB46:
	.loc 1 95 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 95 15 is_stmt 0 view .LVU715
	.seh_endprologue
.LVL258:
.LBB56:
	.loc 1 96 26 is_stmt 1 discriminator 1 view .LVU716
	test	r9, r9
	je	.L332
	lea	rax, -1[r9]
	cmp	rax, 2
	jbe	.L317
	mov	r10, r9
	xor	eax, eax
	shr	r10, 2
	sal	r10, 5
.LVL259:
	.p2align 4
	.p2align 3
.L313:
	.loc 1 96 48 is_stmt 0 discriminator 3 view .LVU717
	vmovupd	ymm1, YMMWORD PTR [rcx+rax]
	vmulpd	ymm0, ymm1, YMMWORD PTR [rdx+rax]
	.loc 1 96 41 discriminator 3 view .LVU718
	vextractf128	XMMWORD PTR 16[r8+rax], ymm0, 0x1
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU719
	.loc 1 96 26 discriminator 1 view .LVU720
	.loc 1 96 41 is_stmt 0 discriminator 3 view .LVU721
	vmovupd	XMMWORD PTR [r8+rax], xmm0
	add	rax, 32
	cmp	rax, r10
	jne	.L313
	test	r9b, 3
	je	.L331
	mov	rax, r9
	and	rax, -4
	vzeroupper
.LVL260:
.L312:
	.loc 1 96 41 discriminator 3 view .LVU722
	sub	r9, rax
.LVL261:
	.loc 1 96 41 discriminator 3 view .LVU723
	cmp	r9, 1
	je	.L315
	lea	r10, 0[0+rax*8]
	.loc 1 96 48 discriminator 3 view .LVU724
	vmovupd	xmm2, XMMWORD PTR [rcx+r10]
	vmulpd	xmm0, xmm2, XMMWORD PTR [rdx+r10]
	.loc 1 96 41 discriminator 3 view .LVU725
	vmovupd	XMMWORD PTR [r8+r10], xmm0
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU726
	.loc 1 96 26 discriminator 1 view .LVU727
	test	r9b, 1
	je	.L332
	and	r9, -2
	add	rax, r9
.L315:
.LVL262:
	.loc 1 96 44 is_stmt 0 discriminator 3 view .LVU728
	sal	rax, 3
	.loc 1 96 48 discriminator 3 view .LVU729
	vmovsd	xmm0, QWORD PTR [rcx+rax]
	vmulsd	xmm0, xmm0, QWORD PTR [rdx+rax]
	.loc 1 96 41 discriminator 3 view .LVU730
	vmovsd	QWORD PTR [r8+rax], xmm0
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU731
	.loc 1 96 26 discriminator 1 view .LVU732
.LVL263:
.L332:
	.loc 1 96 26 is_stmt 0 discriminator 1 view .LVU733
.LBE56:
	.loc 1 97 1 view .LVU734
	ret
.LVL264:
	.p2align 4
	.p2align 3
.L331:
	.loc 1 97 1 view .LVU735
	vzeroupper
.LVL265:
	ret
.LVL266:
.L317:
.LBB57:
	.loc 1 96 17 view .LVU736
	xor	eax, eax
	jmp	.L312
.LBE57:
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
.LVL267:
.LFB47:
	.loc 1 147 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 147 13 is_stmt 0 view .LVU738
	.seh_endprologue
	.loc 1 148 17 view .LVU739
	fldz
	.loc 1 147 13 view .LVU740
	mov	rax, rcx
	.loc 1 148 17 view .LVU741
	fstp	TBYTE PTR [rcx]
	fld	TBYTE PTR [rcx]
.LVL268:
.LBB58:
	.loc 1 149 26 is_stmt 1 discriminator 1 view .LVU742
	test	r9, r9
	je	.L340
	.loc 1 149 17 is_stmt 0 view .LVU743
	xor	r10d, r10d
.LVL269:
	.p2align 4
	.p2align 3
.L335:
	.loc 1 149 61 discriminator 3 view .LVU744
	fld	QWORD PTR [r8+r10*8]
	.loc 1 149 59 discriminator 3 view .LVU745
	fmul	QWORD PTR [rdx+r10*8]
	.loc 1 149 5 discriminator 3 view .LVU746
	inc	r10
.LVL270:
	.loc 1 149 38 discriminator 3 view .LVU747
	faddp	st(1), st
	.loc 1 149 5 is_stmt 1 discriminator 3 view .LVU748
.LVL271:
	.loc 1 149 26 discriminator 1 view .LVU749
	cmp	r9, r10
	jne	.L335
	fstp	TBYTE PTR [rax]
.LBE58:
	.loc 1 150 12 is_stmt 0 view .LVU750
	jmp	.L333
.LVL272:
	.p2align 4
	.p2align 3
.L340:
	.loc 1 150 12 view .LVU751
	ffreep	st(0)
.LVL273:
.L333:
	.loc 1 151 1 view .LVU752
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
.LVL274:
.LFB48:
	.loc 1 154 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 154 13 is_stmt 0 view .LVU754
	sub	rsp, 40
	.seh_stackalloc	40
	.cfi_def_cfa_offset 48
	.seh_endprologue
	.loc 1 154 13 view .LVU755
	vmovsd	QWORD PTR 8[rsp], xmm1
	.loc 1 154 67 view .LVU756
	fld	QWORD PTR 8[rsp]
	.loc 1 154 13 view .LVU757
	vmovsd	QWORD PTR 16[rsp], xmm2
	mov	rax, rcx
	vmovsd	QWORD PTR 24[rsp], xmm3
	.loc 1 154 67 view .LVU758
	fmul	QWORD PTR 16[rsp]
	.loc 1 154 84 view .LVU759
	fadd	QWORD PTR 24[rsp]
	.loc 1 154 99 view .LVU760
	fstp	TBYTE PTR [rcx]
	.loc 1 154 102 view .LVU761
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
.LVL275:
.LFB49:
	.loc 1 157 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 157 13 is_stmt 0 view .LVU763
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
	.loc 1 157 13 view .LVU764
	vmovsd	QWORD PTR [rsp], xmm1
	.loc 1 157 61 view .LVU765
	fld	QWORD PTR [rsp]
	.loc 1 157 13 view .LVU766
	vmovsd	QWORD PTR 8[rsp], xmm2
	mov	rax, rcx
	.loc 1 157 61 view .LVU767
	fmul	QWORD PTR 8[rsp]
	.loc 1 157 76 view .LVU768
	fstp	TBYTE PTR [rcx]
	.loc 1 157 79 view .LVU769
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
.LVL276:
.LFB50:
	.loc 1 14 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 14 12 is_stmt 0 view .LVU771
	.seh_endprologue
.LVL277:
.LBB59:
	.loc 1 16 26 is_stmt 1 discriminator 1 view .LVU772
.LBE59:
	.loc 1 14 12 is_stmt 0 view .LVU773
	mov	r9, rcx
	mov	rcx, rdx
.LVL278:
.LBB60:
	.loc 1 16 26 discriminator 1 view .LVU774
	test	r8, r8
	je	.L351
	lea	rax, -1[r8]
	cmp	rax, 6
	jbe	.L352
	mov	rdx, r8
.LVL279:
	.loc 1 16 26 discriminator 1 view .LVU775
	xor	eax, eax
	vpxor	xmm1, xmm1, xmm1
	shr	rdx, 3
	sal	rdx, 5
.LVL280:
	.p2align 4
	.p2align 3
.L346:
	.loc 1 16 46 discriminator 3 view .LVU776
	vmovdqu	ymm3, YMMWORD PTR [r9+rax]
	vpmulld	ymm0, ymm3, YMMWORD PTR [rcx+rax]
	add	rax, 32
	.loc 1 16 38 discriminator 3 view .LVU777
	vpaddd	ymm1, ymm1, ymm0
.LVL281:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU778
	.loc 1 16 26 discriminator 1 view .LVU779
	cmp	rdx, rax
	jne	.L346
	vmovdqa	xmm0, xmm1
	vextracti128	xmm1, ymm1, 0x1
	mov	rdx, r8
	vpaddd	xmm1, xmm0, xmm1
	and	rdx, -8
	vpsrldq	xmm0, xmm1, 8
	vpaddd	xmm0, xmm1, xmm0
	vpsrldq	xmm2, xmm0, 4
	vpaddd	xmm0, xmm0, xmm2
	vmovd	eax, xmm0
	test	r8b, 7
	je	.L361
	vzeroupper
.LVL282:
.L345:
	.loc 1 16 26 is_stmt 0 discriminator 1 view .LVU780
	mov	r10, r8
	sub	r10, rdx
	lea	r11, -1[r10]
	cmp	r11, 2
	jbe	.L349
	.loc 1 16 46 discriminator 3 view .LVU781
	vmovdqu	xmm4, XMMWORD PTR [r9+rdx*4]
	mov	r11, r10
	vpmulld	xmm0, xmm4, XMMWORD PTR [rcx+rdx*4]
	and	r11, -4
	add	rdx, r11
	and	r10d, 3
	.loc 1 16 38 discriminator 3 view .LVU782
	vpaddd	xmm0, xmm0, xmm1
.LVL283:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU783
	.loc 1 16 26 discriminator 1 view .LVU784
	vpsrldq	xmm1, xmm0, 8
	vpaddd	xmm0, xmm0, xmm1
	vpsrldq	xmm1, xmm0, 4
	vpaddd	xmm0, xmm0, xmm1
	vmovd	eax, xmm0
	je	.L343
.LVL284:
.L349:
	.loc 1 16 42 is_stmt 0 discriminator 3 view .LVU785
	lea	r10, 0[0+rdx*4]
	.loc 1 16 46 discriminator 3 view .LVU786
	mov	r11d, DWORD PTR [r9+r10]
	imul	r11d, DWORD PTR [rcx+r10]
	.loc 1 16 38 discriminator 3 view .LVU787
	add	eax, r11d
.LVL285:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU788
	.loc 1 16 26 discriminator 1 view .LVU789
	.loc 1 16 5 is_stmt 0 discriminator 3 view .LVU790
	lea	r11, 1[rdx]
	.loc 1 16 26 discriminator 1 view .LVU791
	cmp	r11, r8
	jnb	.L343
	.loc 1 16 46 discriminator 3 view .LVU792
	mov	r11d, DWORD PTR 4[rcx+r10]
	imul	r11d, DWORD PTR 4[r9+r10]
	.loc 1 16 5 discriminator 3 view .LVU793
	add	rdx, 2
	.loc 1 16 38 discriminator 3 view .LVU794
	add	eax, r11d
.LVL286:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU795
	.loc 1 16 26 discriminator 1 view .LVU796
	cmp	rdx, r8
	jnb	.L343
	.loc 1 16 46 is_stmt 0 discriminator 3 view .LVU797
	mov	edx, DWORD PTR 8[r9+r10]
	imul	edx, DWORD PTR 8[rcx+r10]
	.loc 1 16 38 discriminator 3 view .LVU798
	add	eax, edx
.LVL287:
	.loc 1 16 5 is_stmt 1 discriminator 3 view .LVU799
	.loc 1 16 26 discriminator 1 view .LVU800
.L343:
	.loc 1 16 26 is_stmt 0 discriminator 1 view .LVU801
.LBE60:
	.loc 1 18 1 view .LVU802
	ret
.LVL288:
	.p2align 4
	.p2align 3
.L351:
	.loc 1 15 7 view .LVU803
	xor	eax, eax
	.loc 1 18 1 view .LVU804
	ret
.LVL289:
	.p2align 4
	.p2align 3
.L361:
	.loc 1 18 1 view .LVU805
	vzeroupper
.LVL290:
	ret
.LVL291:
.L352:
.LBB61:
	.loc 1 16 26 discriminator 1 view .LVU806
	vpxor	xmm1, xmm1, xmm1
	.loc 1 16 17 view .LVU807
	xor	edx, edx
.LVL292:
	.loc 1 16 17 view .LVU808
.LBE61:
	.loc 1 15 7 view .LVU809
	xor	eax, eax
	jmp	.L345
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
.LVL293:
.LFB51:
	.loc 1 26 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 26 12 is_stmt 0 view .LVU811
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
.LVL294:
	.loc 1 28 7 view .LVU812
	vpxor	xmm0, xmm0, xmm0
	vextracti128	XMMWORD PTR 16[rsp], ymm0, 0x1
.LVL295:
.LBB62:
	.loc 1 30 18 is_stmt 1 discriminator 1 view .LVU813
.LBE62:
	.loc 1 26 12 is_stmt 0 view .LVU814
	mov	r9, rcx
	mov	r10, rdx
	.loc 1 28 7 view .LVU815
	vmovdqu	XMMWORD PTR [rsp], xmm0
.LBB65:
	.loc 1 30 18 discriminator 1 view .LVU816
	cmp	r8, 7
	jbe	.L363
	lea	r11, -8[r8]
	xor	eax, eax
	xor	edx, edx
.LVL296:
	.loc 1 30 18 discriminator 1 view .LVU817
	vpxor	xmm1, xmm1, xmm1
	mov	rcx, r11
.LVL297:
	.loc 1 30 18 discriminator 1 view .LVU818
	shr	rcx, 3
	inc	rcx
.LVL298:
	.p2align 4
	.p2align 3
.L364:
.LBB63:
	.loc 1 31 30 is_stmt 1 discriminator 1 view .LVU819
	.loc 1 31 59 is_stmt 0 discriminator 3 view .LVU820
	vmovdqu	ymm3, YMMWORD PTR [r10+rax]
.LBE63:
	.loc 1 30 18 discriminator 1 view .LVU821
	inc	rdx
.LBB64:
	.loc 1 31 59 discriminator 3 view .LVU822
	vpmulld	ymm0, ymm3, YMMWORD PTR [r9+rax]
	add	rax, 32
	.loc 1 31 47 discriminator 3 view .LVU823
	vpaddd	ymm1, ymm1, ymm0
	.loc 1 31 9 is_stmt 1 discriminator 3 view .LVU824
.LVL299:
	.loc 1 31 30 discriminator 1 view .LVU825
	.loc 1 31 9 discriminator 3 view .LVU826
	.loc 1 31 30 discriminator 1 view .LVU827
	.loc 1 31 9 discriminator 3 view .LVU828
	.loc 1 31 30 discriminator 1 view .LVU829
	.loc 1 31 9 discriminator 3 view .LVU830
	.loc 1 31 30 discriminator 1 view .LVU831
	.loc 1 31 9 discriminator 3 view .LVU832
	.loc 1 31 30 discriminator 1 view .LVU833
	.loc 1 31 9 discriminator 3 view .LVU834
	.loc 1 31 30 discriminator 1 view .LVU835
	.loc 1 31 9 discriminator 3 view .LVU836
	.loc 1 31 30 discriminator 1 view .LVU837
	.loc 1 31 9 discriminator 3 view .LVU838
	.loc 1 31 30 discriminator 1 view .LVU839
.LBE64:
	.loc 1 30 18 discriminator 1 view .LVU840
	cmp	rdx, rcx
	jb	.L364
	vextracti128	XMMWORD PTR 16[rsp], ymm1, 0x1
.LVL300:
	.loc 1 30 18 is_stmt 0 discriminator 1 view .LVU841
.LBE65:
	.loc 1 34 26 is_stmt 1 discriminator 1 view .LVU842
	.loc 1 34 5 discriminator 3 view .LVU843
	.loc 1 34 26 discriminator 1 view .LVU844
	vmovdqu	XMMWORD PTR [rsp], xmm1
	and	r11, -8
	vmovdqu	xmm2, XMMWORD PTR 16[rsp]
	add	r11, 8
	vpaddd	xmm0, xmm2, XMMWORD PTR [rsp]
	vpsrldq	xmm1, xmm0, 8
	vpaddd	xmm0, xmm0, xmm1
	vpsrldq	xmm1, xmm0, 4
	vpaddd	xmm0, xmm0, xmm1
	vmovd	ebx, xmm0
.LVL301:
	.loc 1 35 14 discriminator 1 view .LVU845
	cmp	r11, r8
	jnb	.L371
	mov	rdx, r8
	sub	rdx, r11
	lea	rax, -1[rdx]
	cmp	rax, 6
	jbe	.L372
	mov	rsi, rdx
	lea	rcx, 0[0+r11*4]
	xor	eax, eax
	vpxor	xmm1, xmm1, xmm1
	shr	rsi, 3
	lea	rdi, [r9+rcx]
	add	rcx, r10
	sal	rsi, 5
.LVL302:
	.p2align 4
	.p2align 3
.L367:
	.loc 1 35 34 is_stmt 0 discriminator 2 view .LVU846
	vmovdqu	ymm4, YMMWORD PTR [rcx+rax]
	vpmulld	ymm0, ymm4, YMMWORD PTR [rdi+rax]
	add	rax, 32
	.loc 1 35 26 discriminator 2 view .LVU847
	vpaddd	ymm1, ymm1, ymm0
.LVL303:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU848
	.loc 1 35 14 discriminator 1 view .LVU849
	cmp	rsi, rax
	jne	.L367
	vextracti128	xmm0, ymm1, 0x1
	mov	rsi, rdx
	vpaddd	xmm1, xmm0, xmm1
	and	rsi, -8
	vpsrldq	xmm0, xmm1, 8
	vpaddd	xmm0, xmm1, xmm0
	vpsrldq	xmm2, xmm0, 4
	vpaddd	xmm0, xmm0, xmm2
	vmovd	ecx, xmm0
	lea	eax, [rcx+rbx]
	lea	rcx, [rsi+r11]
	test	dl, 7
	je	.L362
.LVL304:
.L366:
	.loc 1 35 14 is_stmt 0 discriminator 1 view .LVU850
	sub	rdx, rsi
	lea	rdi, -1[rdx]
	cmp	rdi, 2
	jbe	.L369
	lea	rax, [r11+rsi]
	mov	r11, rdx
	.loc 1 35 34 discriminator 2 view .LVU851
	vmovdqu	xmm5, XMMWORD PTR [r10+rax*4]
	and	r11, -4
	vpmulld	xmm0, xmm5, XMMWORD PTR [r9+rax*4]
	add	rcx, r11
	.loc 1 35 26 discriminator 2 view .LVU852
	vpaddd	xmm0, xmm0, xmm1
.LVL305:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU853
	.loc 1 35 14 discriminator 1 view .LVU854
	vpsrldq	xmm1, xmm0, 8
	vpaddd	xmm0, xmm0, xmm1
	vpsrldq	xmm1, xmm0, 4
	vpaddd	xmm0, xmm0, xmm1
	vmovd	eax, xmm0
	add	eax, ebx
	and	edx, 3
	je	.L362
.LVL306:
.L369:
	.loc 1 35 30 is_stmt 0 discriminator 2 view .LVU855
	lea	rdx, 0[0+rcx*4]
	.loc 1 35 34 discriminator 2 view .LVU856
	mov	r11d, DWORD PTR [r10+rdx]
	imul	r11d, DWORD PTR [r9+rdx]
	.loc 1 35 26 discriminator 2 view .LVU857
	add	eax, r11d
.LVL307:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU858
	.loc 1 35 14 discriminator 1 view .LVU859
	.loc 1 35 5 is_stmt 0 discriminator 2 view .LVU860
	lea	r11, 1[rcx]
	.loc 1 35 14 discriminator 1 view .LVU861
	cmp	r11, r8
	jnb	.L362
	.loc 1 35 34 discriminator 2 view .LVU862
	mov	r11d, DWORD PTR 4[r9+rdx]
	imul	r11d, DWORD PTR 4[r10+rdx]
	.loc 1 35 5 discriminator 2 view .LVU863
	add	rcx, 2
	.loc 1 35 26 discriminator 2 view .LVU864
	add	eax, r11d
.LVL308:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU865
	.loc 1 35 14 discriminator 1 view .LVU866
	cmp	rcx, r8
	jnb	.L362
	.loc 1 35 34 is_stmt 0 discriminator 2 view .LVU867
	mov	ecx, DWORD PTR 8[r10+rdx]
	imul	ecx, DWORD PTR 8[r9+rdx]
	.loc 1 35 26 discriminator 2 view .LVU868
	add	eax, ecx
.LVL309:
	.loc 1 35 5 is_stmt 1 discriminator 2 view .LVU869
	.loc 1 35 14 discriminator 1 view .LVU870
.L362:
	.loc 1 35 14 is_stmt 0 discriminator 1 view .LVU871
	vzeroupper
.LVL310:
	.loc 1 37 1 view .LVU872
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
.LVL311:
.L363:
	.cfi_restore_state
	.loc 1 34 26 is_stmt 1 discriminator 1 view .LVU873
	.loc 1 34 5 discriminator 3 view .LVU874
	.loc 1 34 26 discriminator 1 view .LVU875
	vmovdqu	xmm5, XMMWORD PTR [rsp]
	vpaddd	xmm0, xmm5, XMMWORD PTR 16[rsp]
	vpsrldq	xmm1, xmm0, 8
	vpaddd	xmm0, xmm0, xmm1
	vpsrldq	xmm1, xmm0, 4
	vpaddd	xmm0, xmm0, xmm1
	vmovd	eax, xmm0
.LVL312:
	.loc 1 35 14 discriminator 1 view .LVU876
	test	r8, r8
	je	.L362
	mov	rdx, r8
.LVL313:
	.loc 1 35 14 is_stmt 0 discriminator 1 view .LVU877
	mov	ebx, eax
	.loc 1 29 12 view .LVU878
	xor	r11d, r11d
	.loc 1 35 14 discriminator 1 view .LVU879
	vpxor	xmm1, xmm1, xmm1
	xor	esi, esi
	.loc 1 29 12 view .LVU880
	xor	ecx, ecx
.LVL314:
	.loc 1 29 12 view .LVU881
	jmp	.L366
.LVL315:
.L371:
	.loc 1 35 14 discriminator 1 view .LVU882
	mov	eax, ebx
	.loc 1 36 12 view .LVU883
	jmp	.L362
.L372:
	.loc 1 35 14 discriminator 1 view .LVU884
	mov	eax, ebx
	mov	rcx, r11
	vpxor	xmm1, xmm1, xmm1
	xor	esi, esi
	jmp	.L366
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
.LVL316:
.LFB52:
	.loc 1 45 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 45 12 is_stmt 0 view .LVU886
	sub	rsp, 40
	.seh_stackalloc	40
	.cfi_def_cfa_offset 48
	.seh_endprologue
.LVL317:
.LBB66:
.LBB67:
	.loc 1 47 9 view .LVU887
	vpxor	xmm0, xmm0, xmm0
	vextracti128	XMMWORD PTR 16[rsp], ymm0, 0x1
.LVL318:
	.loc 1 47 9 view .LVU888
	vmovdqu	XMMWORD PTR [rsp], xmm0
	test	r8, r8
	je	.L383
	cmp	r8, 7
	jbe	.L388
	mov	r9, r8
	xor	eax, eax
	vpxor	xmm0, xmm0, xmm0
	shr	r9, 3
	sal	r9, 5
.LVL319:
	.p2align 4
	.p2align 3
.L385:
	.loc 1 48 46 view .LVU889
	vmovdqu	ymm2, YMMWORD PTR [rcx+rax]
	vpmulld	ymm1, ymm2, YMMWORD PTR [rdx+rax]
	add	rax, 32
	.loc 1 48 38 view .LVU890
	vpaddd	ymm0, ymm1, ymm0
	cmp	r9, rax
	jne	.L385
	mov	r9, r8
	vextracti128	XMMWORD PTR 16[rsp], ymm0, 0x1
	vmovdqu	XMMWORD PTR [rsp], xmm0
	and	r9, -8
	test	r8b, 7
	je	.L383
.L384:
.LVL320:
	.loc 1 48 42 view .LVU891
	lea	rax, 0[0+r9*4]
	lea	r11, 1[r9]
	.loc 1 48 46 view .LVU892
	mov	r10d, DWORD PTR [rcx+rax]
	imul	r10d, DWORD PTR [rdx+rax]
	.loc 1 48 38 view .LVU893
	add	r10d, DWORD PTR [rsp]
	mov	DWORD PTR [rsp], r10d
	.loc 1 48 38 view .LVU894
	cmp	r11, r8
	jnb	.L383
	.loc 1 48 46 view .LVU895
	mov	r11d, DWORD PTR 4[rcx+rax]
	imul	r11d, DWORD PTR 4[rdx+rax]
	.loc 1 48 38 view .LVU896
	add	r10d, r11d
	lea	r11, 2[r9]
	mov	DWORD PTR [rsp], r10d
	.loc 1 48 38 view .LVU897
	cmp	r11, r8
	jnb	.L383
	.loc 1 48 46 view .LVU898
	mov	r11d, DWORD PTR 8[rcx+rax]
	imul	r11d, DWORD PTR 8[rdx+rax]
	.loc 1 48 38 view .LVU899
	add	r10d, r11d
	lea	r11, 3[r9]
	mov	DWORD PTR [rsp], r10d
	.loc 1 48 38 view .LVU900
	cmp	r11, r8
	jnb	.L383
	.loc 1 48 46 view .LVU901
	mov	r11d, DWORD PTR 12[rcx+rax]
	imul	r11d, DWORD PTR 12[rdx+rax]
	.loc 1 48 38 view .LVU902
	add	r10d, r11d
	lea	r11, 4[r9]
	mov	DWORD PTR [rsp], r10d
	.loc 1 48 38 view .LVU903
	cmp	r11, r8
	jnb	.L383
	.loc 1 48 46 view .LVU904
	mov	r11d, DWORD PTR 16[rcx+rax]
	imul	r11d, DWORD PTR 16[rdx+rax]
	.loc 1 48 38 view .LVU905
	add	r10d, r11d
	lea	r11, 5[r9]
	mov	DWORD PTR [rsp], r10d
	.loc 1 48 38 view .LVU906
	cmp	r11, r8
	jnb	.L383
	.loc 1 48 46 view .LVU907
	mov	r11d, DWORD PTR 20[rcx+rax]
	add	r9, 6
	imul	r11d, DWORD PTR 20[rdx+rax]
	.loc 1 48 38 view .LVU908
	add	r10d, r11d
	mov	DWORD PTR [rsp], r10d
	.loc 1 48 38 view .LVU909
	cmp	r9, r8
	jnb	.L383
	.loc 1 48 46 view .LVU910
	mov	ecx, DWORD PTR 24[rcx+rax]
.LVL321:
	.loc 1 48 46 view .LVU911
	imul	ecx, DWORD PTR 24[rdx+rax]
	mov	eax, ecx
	.loc 1 48 38 view .LVU912
	add	eax, r10d
	mov	DWORD PTR [rsp], eax
.LVL322:
.L383:
	.loc 1 47 9 view .LVU913
	mov	eax, DWORD PTR [rsp]
	add	eax, DWORD PTR 4[rsp]
.LVL323:
	.loc 1 47 9 view .LVU914
	add	eax, DWORD PTR 8[rsp]
.LVL324:
	.loc 1 47 9 view .LVU915
	add	eax, DWORD PTR 12[rsp]
.LVL325:
	.loc 1 47 9 view .LVU916
	add	eax, DWORD PTR 16[rsp]
.LVL326:
	.loc 1 47 9 view .LVU917
	add	eax, DWORD PTR 20[rsp]
.LVL327:
	.loc 1 47 9 view .LVU918
	add	eax, DWORD PTR 24[rsp]
.LVL328:
	.loc 1 47 9 view .LVU919
	add	eax, DWORD PTR 28[rsp]
	vzeroupper
.LVL329:
.LBE67:
.LBE66:
	.loc 1 50 1 view .LVU920
	add	rsp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL330:
.L388:
	.cfi_restore_state
.LBB69:
.LBB68:
	.loc 1 47 9 view .LVU921
	xor	r9d, r9d
	jmp	.L384
.LBE68:
.LBE69:
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
.LVL331:
.LFB53:
	.loc 1 58 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 58 12 is_stmt 0 view .LVU923
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
.LVL332:
	.loc 1 60 7 view .LVU924
	vpxor	xmm0, xmm0, xmm0
	.loc 1 61 12 view .LVU925
	xor	r9d, r9d
	.loc 1 60 7 view .LVU926
	vextracti128	XMMWORD PTR 16[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 32[rsp], ymm0, 0x1
	vmovdqu	XMMWORD PTR [rsp], xmm0
	vextracti128	XMMWORD PTR 48[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 64[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 80[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 96[rsp], ymm0, 0x1
	vextracti128	XMMWORD PTR 112[rsp], ymm0, 0x1
.LVL333:
.LBB70:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU927
	cmp	r8, 31
	jbe	.L399
	mov	eax, 32
	vpxor	xmm0, xmm0, xmm0
	vmovdqa	ymm3, ymm0
	vmovdqa	ymm2, ymm0
	vmovdqa	ymm1, ymm0
.LVL334:
	.p2align 4
	.p2align 3
.L398:
.LBB71:
.LBB72:
	.loc 1 64 59 is_stmt 0 view .LVU928
	vmovdqu	ymm5, YMMWORD PTR -128[rdx+rax*4]
	mov	r9, rax
	vpmulld	ymm4, ymm5, YMMWORD PTR -128[rcx+rax*4]
	vmovdqu	ymm5, YMMWORD PTR -96[rcx+rax*4]
	.loc 1 64 47 view .LVU929
	vpaddd	ymm1, ymm4, ymm1
	.loc 1 64 59 view .LVU930
	vpmulld	ymm4, ymm5, YMMWORD PTR -96[rdx+rax*4]
	vmovdqu	ymm5, YMMWORD PTR -64[rcx+rax*4]
	.loc 1 64 47 view .LVU931
	vpaddd	ymm2, ymm4, ymm2
	.loc 1 64 59 view .LVU932
	vpmulld	ymm4, ymm5, YMMWORD PTR -64[rdx+rax*4]
	vmovdqu	ymm5, YMMWORD PTR -32[rcx+rax*4]
	.loc 1 64 47 view .LVU933
	vpaddd	ymm3, ymm4, ymm3
	.loc 1 64 59 view .LVU934
	vpmulld	ymm4, ymm5, YMMWORD PTR -32[rdx+rax*4]
.LBE72:
.LBE71:
	.loc 1 62 18 discriminator 1 view .LVU935
	lea	rax, 32[rax]
.LVL335:
.LBB74:
.LBB73:
	.loc 1 64 47 view .LVU936
	vpaddd	ymm0, ymm4, ymm0
.LVL336:
	.loc 1 64 47 view .LVU937
.LBE73:
.LBE74:
	.loc 1 62 18 is_stmt 1 discriminator 1 view .LVU938
	cmp	r8, rax
	jnb	.L398
	vextracti128	XMMWORD PTR 16[rsp], ymm1, 0x1
	vextracti128	XMMWORD PTR 48[rsp], ymm2, 0x1
	vmovdqu	XMMWORD PTR [rsp], xmm1
	vmovdqu	XMMWORD PTR 32[rsp], xmm2
	vmovdqu	XMMWORD PTR 64[rsp], xmm3
	vmovdqu	XMMWORD PTR 96[rsp], xmm0
	vextracti128	XMMWORD PTR 80[rsp], ymm3, 0x1
	vextracti128	XMMWORD PTR 112[rsp], ymm0, 0x1
.L399:
.LVL337:
	.loc 1 62 18 is_stmt 0 discriminator 1 view .LVU939
.LBE70:
.LBB75:
	.loc 1 67 26 is_stmt 1 discriminator 1 view .LVU940
	.loc 1 67 5 discriminator 3 view .LVU941
	.loc 1 67 26 discriminator 1 view .LVU942
	.loc 1 67 38 is_stmt 0 discriminator 3 view .LVU943
	vmovdqu	ymm2, YMMWORD PTR [rsp]
	vpaddd	ymm0, ymm2, YMMWORD PTR 32[rsp]
.LVL338:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU944
	.loc 1 67 26 discriminator 1 view .LVU945
	.loc 1 67 38 is_stmt 0 discriminator 3 view .LVU946
	vpaddd	ymm0, ymm0, YMMWORD PTR 64[rsp]
.LVL339:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU947
	.loc 1 67 26 discriminator 1 view .LVU948
	.loc 1 67 38 is_stmt 0 discriminator 3 view .LVU949
	vpaddd	ymm0, ymm0, YMMWORD PTR 96[rsp]
.LVL340:
	.loc 1 67 5 is_stmt 1 discriminator 3 view .LVU950
	.loc 1 67 26 discriminator 1 view .LVU951
	vmovdqa	xmm1, xmm0
	vextracti128	xmm0, ymm0, 0x1
	vpaddd	xmm0, xmm1, xmm0
	vpsrldq	xmm1, xmm0, 8
	vpaddd	xmm0, xmm0, xmm1
	vpsrldq	xmm1, xmm0, 4
	vpaddd	xmm0, xmm0, xmm1
	vmovd	r10d, xmm0
.LVL341:
	.loc 1 67 26 is_stmt 0 discriminator 1 view .LVU952
.LBE75:
	.loc 1 68 14 is_stmt 1 discriminator 1 view .LVU953
	cmp	r9, r8
	jnb	.L397
	mov	r11, r8
	sub	r11, r9
	lea	rax, -1[r11]
	cmp	rax, 6
	jbe	.L410
	mov	rsi, r11
	lea	rbx, 0[0+r9*4]
	xor	eax, eax
	vpxor	xmm1, xmm1, xmm1
	shr	rsi, 3
	lea	rdi, [rcx+rbx]
	add	rbx, rdx
	sal	rsi, 5
.LVL342:
	.p2align 4
	.p2align 3
.L403:
	.loc 1 68 34 is_stmt 0 discriminator 2 view .LVU954
	vmovdqu	ymm3, YMMWORD PTR [rbx+rax]
	vpmulld	ymm0, ymm3, YMMWORD PTR [rdi+rax]
	add	rax, 32
	.loc 1 68 26 discriminator 2 view .LVU955
	vpaddd	ymm1, ymm1, ymm0
.LVL343:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU956
	.loc 1 68 14 discriminator 1 view .LVU957
	cmp	rsi, rax
	jne	.L403
	vextracti128	xmm0, ymm1, 0x1
	mov	rsi, r11
	vpaddd	xmm1, xmm0, xmm1
	and	rsi, -8
	vpsrldq	xmm0, xmm1, 8
	vpaddd	xmm0, xmm1, xmm0
	lea	rbx, [r9+rsi]
	vpsrldq	xmm2, xmm0, 4
	vpaddd	xmm0, xmm0, xmm2
	vmovd	eax, xmm0
	add	eax, r10d
	test	r11b, 7
	je	.L419
.LVL344:
.L402:
	.loc 1 68 14 is_stmt 0 discriminator 1 view .LVU958
	sub	r11, rsi
	lea	rdi, -1[r11]
	cmp	rdi, 2
	jbe	.L412
	add	r9, rsi
	.loc 1 68 34 discriminator 2 view .LVU959
	vmovdqu	xmm2, XMMWORD PTR [rcx+r9*4]
	vpmulld	xmm0, xmm2, XMMWORD PTR [rdx+r9*4]
	.loc 1 68 26 discriminator 2 view .LVU960
	vpaddd	xmm0, xmm0, xmm1
.LVL345:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU961
	.loc 1 68 14 discriminator 1 view .LVU962
	vpsrldq	xmm1, xmm0, 8
	vpaddd	xmm0, xmm0, xmm1
	vpsrldq	xmm1, xmm0, 4
	vpaddd	xmm0, xmm0, xmm1
	vmovd	eax, xmm0
	add	r10d, eax
	mov	rax, r11
	and	rax, -4
	add	rbx, rax
	and	r11d, 3
	je	.L397
.LVL346:
.L406:
	.loc 1 68 30 is_stmt 0 discriminator 2 view .LVU963
	lea	rax, 0[0+rbx*4]
	.loc 1 68 34 discriminator 2 view .LVU964
	mov	r9d, DWORD PTR [rcx+rax]
	imul	r9d, DWORD PTR [rdx+rax]
	.loc 1 68 26 discriminator 2 view .LVU965
	add	r10d, r9d
.LVL347:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU966
	.loc 1 68 14 discriminator 1 view .LVU967
	.loc 1 68 5 is_stmt 0 discriminator 2 view .LVU968
	lea	r9, 1[rbx]
	.loc 1 68 14 discriminator 1 view .LVU969
	cmp	r9, r8
	jnb	.L397
	.loc 1 68 34 discriminator 2 view .LVU970
	mov	r9d, DWORD PTR 4[rcx+rax]
	imul	r9d, DWORD PTR 4[rdx+rax]
	.loc 1 68 5 discriminator 2 view .LVU971
	add	rbx, 2
.LVL348:
	.loc 1 68 26 discriminator 2 view .LVU972
	add	r10d, r9d
.LVL349:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU973
	.loc 1 68 14 discriminator 1 view .LVU974
	cmp	rbx, r8
	jnb	.L397
	.loc 1 68 34 is_stmt 0 discriminator 2 view .LVU975
	mov	edx, DWORD PTR 8[rdx+rax]
.LVL350:
	.loc 1 68 34 discriminator 2 view .LVU976
	imul	edx, DWORD PTR 8[rcx+rax]
	.loc 1 68 26 discriminator 2 view .LVU977
	add	r10d, edx
.LVL351:
	.loc 1 68 5 is_stmt 1 discriminator 2 view .LVU978
	.loc 1 68 14 discriminator 1 view .LVU979
.L397:
	.loc 1 70 1 is_stmt 0 view .LVU980
	mov	eax, r10d
	vzeroupper
.LVL352:
	sub	rsp, -128
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
.LVL353:
.L419:
	.cfi_restore_state
	.loc 1 68 26 discriminator 2 view .LVU981
	mov	r10d, eax
	vzeroupper
.LVL354:
	.loc 1 70 1 view .LVU982
	mov	eax, r10d
	sub	rsp, -128
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
.LVL355:
.L410:
	.cfi_restore_state
	.loc 1 68 14 discriminator 1 view .LVU983
	mov	eax, r10d
	mov	rbx, r9
	vpxor	xmm1, xmm1, xmm1
	xor	esi, esi
	jmp	.L402
.LVL356:
.L412:
	.loc 1 68 14 discriminator 1 view .LVU984
	mov	r10d, eax
	jmp	.L406
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
.LVL357:
.LFB54:
	.loc 1 76 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 76 15 is_stmt 0 view .LVU986
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.seh_endprologue
.LVL358:
.LBB76:
	.loc 1 77 26 is_stmt 1 discriminator 1 view .LVU987
	test	r9, r9
	je	.L439
	lea	rax, -1[r9]
	cmp	rax, 6
	jbe	.L427
	mov	r10, r9
	vmovd	xmm1, ecx
	xor	eax, eax
	vpbroadcastd	ymm1, xmm1
	shr	r10, 3
	sal	r10, 5
.LVL359:
	.p2align 4
	.p2align 3
.L423:
	.loc 1 77 45 is_stmt 0 discriminator 3 view .LVU988
	vpmulld	ymm0, ymm1, YMMWORD PTR [rdx+rax]
	.loc 1 77 52 discriminator 3 view .LVU989
	vpaddd	ymm0, ymm0, YMMWORD PTR [r8+rax]
	.loc 1 77 41 discriminator 3 view .LVU990
	vextracti128	XMMWORD PTR 16[r8+rax], ymm0, 0x1
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU991
	.loc 1 77 26 discriminator 1 view .LVU992
	.loc 1 77 41 is_stmt 0 discriminator 3 view .LVU993
	vmovdqu	XMMWORD PTR [r8+rax], xmm0
	add	rax, 32
	cmp	rax, r10
	jne	.L423
	mov	rax, r9
	and	rax, -8
	test	r9b, 7
	je	.L440
	vzeroupper
.LVL360:
.L422:
	.loc 1 77 41 discriminator 3 view .LVU994
	mov	r10, r9
	sub	r10, rax
	lea	r11, -1[r10]
	cmp	r11, 2
	jbe	.L425
	lea	rbx, 0[0+rax*4]
	.loc 1 77 45 discriminator 3 view .LVU995
	vmovd	xmm2, ecx
	vpshufd	xmm0, xmm2, 0
	vpmulld	xmm0, xmm0, XMMWORD PTR [rdx+rbx]
	lea	r11, [r8+rbx]
	.loc 1 77 52 discriminator 3 view .LVU996
	vpaddd	xmm0, xmm0, XMMWORD PTR [r11]
	.loc 1 77 41 discriminator 3 view .LVU997
	vmovdqu	XMMWORD PTR [r11], xmm0
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU998
	.loc 1 77 26 discriminator 1 view .LVU999
	mov	r11, r10
	and	r11, -4
	add	rax, r11
	and	r10d, 3
	je	.L439
.L425:
.LVL361:
	.loc 1 77 45 is_stmt 0 discriminator 3 view .LVU1000
	mov	r11d, DWORD PTR [rdx+rax*4]
	.loc 1 77 48 discriminator 3 view .LVU1001
	lea	r10, 0[0+rax*4]
	.loc 1 77 45 discriminator 3 view .LVU1002
	imul	r11d, ecx
	.loc 1 77 52 discriminator 3 view .LVU1003
	add	DWORD PTR [r8+rax*4], r11d
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU1004
	.loc 1 77 26 discriminator 1 view .LVU1005
	.loc 1 77 5 is_stmt 0 discriminator 3 view .LVU1006
	lea	r11, 1[rax]
	.loc 1 77 26 discriminator 1 view .LVU1007
	cmp	r11, r9
	jnb	.L439
	.loc 1 77 45 discriminator 3 view .LVU1008
	mov	r11d, DWORD PTR 4[rdx+r10]
	.loc 1 77 5 discriminator 3 view .LVU1009
	add	rax, 2
	.loc 1 77 45 discriminator 3 view .LVU1010
	imul	r11d, ecx
	.loc 1 77 52 discriminator 3 view .LVU1011
	add	DWORD PTR 4[r8+r10], r11d
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU1012
	.loc 1 77 26 discriminator 1 view .LVU1013
	cmp	rax, r9
	jnb	.L439
	.loc 1 77 45 is_stmt 0 discriminator 3 view .LVU1014
	imul	ecx, DWORD PTR 8[rdx+r10]
.LVL362:
	.loc 1 77 52 discriminator 3 view .LVU1015
	add	DWORD PTR 8[r8+r10], ecx
	.loc 1 77 5 is_stmt 1 discriminator 3 view .LVU1016
	.loc 1 77 26 discriminator 1 view .LVU1017
.LVL363:
.L439:
	.loc 1 77 26 is_stmt 0 discriminator 1 view .LVU1018
.LBE76:
	.loc 1 78 1 view .LVU1019
	pop	rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
.LVL364:
	.p2align 4
	.p2align 3
.L440:
	.cfi_restore_state
	.loc 1 78 1 view .LVU1020
	vzeroupper
.LVL365:
	pop	rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
.LVL366:
.L427:
	.cfi_restore_state
.LBB77:
	.loc 1 77 17 view .LVU1021
	xor	eax, eax
	jmp	.L422
.LBE77:
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
.LVL367:
.LFB55:
	.loc 1 81 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 81 15 is_stmt 0 view .LVU1023
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.seh_endprologue
.LVL368:
.LBB78:
	.loc 1 82 26 is_stmt 1 discriminator 1 view .LVU1024
	test	r9, r9
	je	.L464
	cmp	QWORD PTR 48[rsp], 1
	jne	.L465
	lea	rax, -1[r9]
	cmp	rax, 6
	jbe	.L451
	mov	r10, r9
	vmovd	xmm1, ecx
	xor	eax, eax
	vpbroadcastd	ymm1, xmm1
	shr	r10, 3
	sal	r10, 5
.LVL369:
	.p2align 4
	.p2align 3
.L447:
	.loc 1 82 49 is_stmt 0 discriminator 3 view .LVU1025
	vpmulld	ymm0, ymm1, YMMWORD PTR [rdx+rax]
	.loc 1 82 60 discriminator 3 view .LVU1026
	vpaddd	ymm0, ymm0, YMMWORD PTR [r8+rax]
	.loc 1 82 45 discriminator 3 view .LVU1027
	vextracti128	XMMWORD PTR 16[r8+rax], ymm0, 0x1
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU1028
	.loc 1 82 26 discriminator 1 view .LVU1029
	.loc 1 82 45 is_stmt 0 discriminator 3 view .LVU1030
	vmovdqu	XMMWORD PTR [r8+rax], xmm0
	add	rax, 32
	cmp	rax, r10
	jne	.L447
	mov	rax, r9
	and	rax, -8
	test	r9b, 7
	je	.L466
	vzeroupper
.LVL370:
.L446:
	.loc 1 82 45 discriminator 3 view .LVU1031
	mov	r10, r9
	sub	r10, rax
	lea	r11, -1[r10]
	cmp	r11, 2
	jbe	.L449
	lea	rbx, 0[0+rax*4]
	.loc 1 82 49 discriminator 3 view .LVU1032
	vmovd	xmm2, ecx
	vpshufd	xmm0, xmm2, 0
	vpmulld	xmm0, xmm0, XMMWORD PTR [rdx+rbx]
	lea	r11, [r8+rbx]
	.loc 1 82 60 discriminator 3 view .LVU1033
	vpaddd	xmm0, xmm0, XMMWORD PTR [r11]
	.loc 1 82 45 discriminator 3 view .LVU1034
	vmovdqu	XMMWORD PTR [r11], xmm0
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU1035
	.loc 1 82 26 discriminator 1 view .LVU1036
	mov	r11, r10
	and	r11, -4
	add	rax, r11
	and	r10d, 3
	je	.L464
.L449:
.LVL371:
	.loc 1 82 49 is_stmt 0 discriminator 3 view .LVU1037
	mov	r11d, DWORD PTR [rdx+rax*4]
	.loc 1 82 52 discriminator 3 view .LVU1038
	lea	r10, 0[0+rax*4]
	.loc 1 82 49 discriminator 3 view .LVU1039
	imul	r11d, ecx
	.loc 1 82 60 discriminator 3 view .LVU1040
	add	DWORD PTR [r8+rax*4], r11d
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU1041
	.loc 1 82 26 discriminator 1 view .LVU1042
	.loc 1 82 5 is_stmt 0 discriminator 3 view .LVU1043
	lea	r11, 1[rax]
	.loc 1 82 26 discriminator 1 view .LVU1044
	cmp	r11, r9
	jnb	.L464
	.loc 1 82 49 discriminator 3 view .LVU1045
	mov	r11d, DWORD PTR 4[rdx+r10]
	.loc 1 82 5 discriminator 3 view .LVU1046
	add	rax, 2
	.loc 1 82 49 discriminator 3 view .LVU1047
	imul	r11d, ecx
	.loc 1 82 60 discriminator 3 view .LVU1048
	add	DWORD PTR 4[r8+r10], r11d
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU1049
	.loc 1 82 26 discriminator 1 view .LVU1050
	cmp	rax, r9
	jnb	.L464
	.loc 1 82 49 is_stmt 0 discriminator 3 view .LVU1051
	imul	ecx, DWORD PTR 8[rdx+r10]
.LVL372:
	.loc 1 82 60 discriminator 3 view .LVU1052
	add	DWORD PTR 8[r8+r10], ecx
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU1053
	.loc 1 82 26 discriminator 1 view .LVU1054
.LVL373:
.L464:
	.loc 1 82 26 is_stmt 0 discriminator 1 view .LVU1055
.LBE78:
	.loc 1 83 1 view .LVU1056
	pop	rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
.LVL374:
	.p2align 4
	.p2align 3
.L465:
	.cfi_restore_state
	.loc 1 83 1 view .LVU1057
	mov	rax, QWORD PTR 48[rsp]
.LBB79:
	.loc 1 82 17 view .LVU1058
	xor	r10d, r10d
	lea	r11, 0[0+rax*4]
	.loc 1 82 26 discriminator 1 view .LVU1059
	xor	eax, eax
.LVL375:
	.p2align 4
	.p2align 3
.L444:
	.loc 1 82 49 discriminator 3 view .LVU1060
	mov	ebx, DWORD PTR [rdx+rax]
	.loc 1 82 5 discriminator 3 view .LVU1061
	inc	r10
.LVL376:
	.loc 1 82 49 discriminator 3 view .LVU1062
	imul	ebx, ecx
	.loc 1 82 60 discriminator 3 view .LVU1063
	add	DWORD PTR [r8+rax], ebx
	.loc 1 82 5 is_stmt 1 discriminator 3 view .LVU1064
.LVL377:
	.loc 1 82 26 discriminator 1 view .LVU1065
	add	rax, r11
	cmp	r9, r10
	jne	.L444
.LBE79:
	.loc 1 83 1 is_stmt 0 view .LVU1066
	pop	rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
.LVL378:
.L466:
	.cfi_restore_state
	.loc 1 83 1 view .LVU1067
	vzeroupper
.LVL379:
	pop	rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
.LVL380:
.L451:
	.cfi_restore_state
.LBB80:
	.loc 1 82 17 view .LVU1068
	xor	eax, eax
	jmp	.L446
.LBE80:
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
.LVL381:
.LFB56:
	.loc 1 86 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 86 15 is_stmt 0 view .LVU1070
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
	.seh_endprologue
.LVL382:
.LBB81:
	.loc 1 88 26 is_stmt 1 discriminator 1 view .LVU1071
.LBE81:
	.loc 1 86 15 is_stmt 0 view .LVU1072
	mov	r11, QWORD PTR 104[rsp]
	mov	r10d, ecx
	mov	rax, rdx
.LBB82:
	.loc 1 88 26 discriminator 1 view .LVU1073
	test	r11, r11
	je	.L486
	lea	rdx, -1[r11]
.LVL383:
	.loc 1 88 26 discriminator 1 view .LVU1074
	cmp	rdx, 6
	jbe	.L474
	mov	rbx, r11
	vmovd	xmm3, ecx
	xor	ecx, ecx
.LVL384:
	.loc 1 88 26 discriminator 1 view .LVU1075
	vpbroadcastd	ymm3, xmm3
	shr	rbx, 3
	sal	rbx, 5
.LVL385:
	.p2align 4
	.p2align 3
.L470:
	.loc 1 88 26 discriminator 1 view .LVU1076
	lea	rdx, [r9+rcx]
	.loc 1 88 48 discriminator 3 view .LVU1077
	movsx	rdi, DWORD PTR [rdx]
	movsx	rsi, DWORD PTR 4[rdx]
	movsx	r12, DWORD PTR 8[rdx]
	movsx	rbp, DWORD PTR 12[rdx]
	movsx	r14, DWORD PTR 16[rdx]
	movsx	r13, DWORD PTR 20[rdx]
	movsx	r15, DWORD PTR 24[rdx]
	movsx	rdx, DWORD PTR 28[rdx]
	vmovd	xmm2, DWORD PTR [rax+r12*4]
	vpinsrd	xmm2, xmm2, DWORD PTR [rax+rbp*4], 1
	vmovd	xmm1, DWORD PTR [rax+r14*4]
	vpinsrd	xmm1, xmm1, DWORD PTR [rax+r13*4], 1
	vmovd	xmm0, DWORD PTR [rax+r15*4]
	vpinsrd	xmm0, xmm0, DWORD PTR [rax+rdx*4], 1
	vpunpcklqdq	xmm1, xmm1, xmm0
	vmovd	xmm0, DWORD PTR [rax+rdi*4]
	vpinsrd	xmm0, xmm0, DWORD PTR [rax+rsi*4], 1
	vpunpcklqdq	xmm0, xmm0, xmm2
	vinserti128	ymm0, ymm0, xmm1, 0x1
	.loc 1 88 45 discriminator 3 view .LVU1078
	vpmulld	ymm0, ymm0, ymm3
	.loc 1 88 57 discriminator 3 view .LVU1079
	vpaddd	ymm0, ymm0, YMMWORD PTR [r8+rcx]
	.loc 1 88 41 discriminator 3 view .LVU1080
	vextracti128	XMMWORD PTR 16[r8+rcx], ymm0, 0x1
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU1081
	.loc 1 88 26 discriminator 1 view .LVU1082
	.loc 1 88 41 is_stmt 0 discriminator 3 view .LVU1083
	vmovdqu	XMMWORD PTR [r8+rcx], xmm0
	add	rcx, 32
	cmp	rbx, rcx
	jne	.L470
	mov	rdx, r11
	and	rdx, -8
	test	r11b, 7
	je	.L487
	vzeroupper
.LVL386:
.L469:
	.loc 1 88 41 discriminator 3 view .LVU1084
	mov	rsi, r11
	sub	rsi, rdx
	lea	rcx, -1[rsi]
	cmp	rcx, 2
	jbe	.L472
	lea	rcx, 0[0+rdx*4]
	.loc 1 88 45 discriminator 3 view .LVU1085
	vmovd	xmm4, r10d
	lea	rbx, [r9+rcx]
	add	rcx, r8
	.loc 1 88 48 discriminator 3 view .LVU1086
	movsx	rbp, DWORD PTR [rbx]
	movsx	rdi, DWORD PTR 4[rbx]
	movsx	r12, DWORD PTR 8[rbx]
	movsx	rbx, DWORD PTR 12[rbx]
	vmovd	xmm0, DWORD PTR [rax+rbp*4]
	vpinsrd	xmm0, xmm0, DWORD PTR [rax+rdi*4], 1
	vmovd	xmm1, DWORD PTR [rax+r12*4]
	vpinsrd	xmm1, xmm1, DWORD PTR [rax+rbx*4], 1
	vpunpcklqdq	xmm0, xmm0, xmm1
	.loc 1 88 45 discriminator 3 view .LVU1087
	vpshufd	xmm1, xmm4, 0
	vpmulld	xmm0, xmm0, xmm1
	.loc 1 88 57 discriminator 3 view .LVU1088
	vpaddd	xmm0, xmm0, XMMWORD PTR [rcx]
	.loc 1 88 41 discriminator 3 view .LVU1089
	vmovdqu	XMMWORD PTR [rcx], xmm0
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU1090
	.loc 1 88 26 discriminator 1 view .LVU1091
	mov	rcx, rsi
	and	rcx, -4
	add	rdx, rcx
	and	esi, 3
	je	.L486
.L472:
.LVL387:
	.loc 1 88 54 is_stmt 0 discriminator 3 view .LVU1092
	movsx	rbx, DWORD PTR [r9+rdx*4]
	lea	rcx, 0[0+rdx*4]
	.loc 1 88 45 discriminator 3 view .LVU1093
	mov	edi, DWORD PTR [rax+rbx*4]
	.loc 1 88 5 discriminator 3 view .LVU1094
	lea	rbx, 1[rdx]
	.loc 1 88 45 discriminator 3 view .LVU1095
	imul	edi, r10d
	.loc 1 88 57 discriminator 3 view .LVU1096
	add	DWORD PTR [r8+rdx*4], edi
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU1097
	.loc 1 88 26 discriminator 1 view .LVU1098
	cmp	rbx, r11
	jnb	.L486
	.loc 1 88 54 is_stmt 0 discriminator 3 view .LVU1099
	movsx	rbx, DWORD PTR 4[r9+rcx]
	.loc 1 88 5 discriminator 3 view .LVU1100
	add	rdx, 2
	.loc 1 88 45 discriminator 3 view .LVU1101
	mov	edi, DWORD PTR [rax+rbx*4]
	imul	edi, r10d
	.loc 1 88 57 discriminator 3 view .LVU1102
	add	DWORD PTR 4[r8+rcx], edi
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU1103
	.loc 1 88 26 discriminator 1 view .LVU1104
	cmp	rdx, r11
	jnb	.L486
	.loc 1 88 54 is_stmt 0 discriminator 3 view .LVU1105
	movsx	rdx, DWORD PTR 8[r9+rcx]
	.loc 1 88 45 discriminator 3 view .LVU1106
	imul	r10d, DWORD PTR [rax+rdx*4]
.LVL388:
	.loc 1 88 57 discriminator 3 view .LVU1107
	add	DWORD PTR 8[r8+rcx], r10d
	.loc 1 88 5 is_stmt 1 discriminator 3 view .LVU1108
	.loc 1 88 26 discriminator 1 view .LVU1109
.LVL389:
.L486:
	.loc 1 88 26 is_stmt 0 discriminator 1 view .LVU1110
.LBE82:
	.loc 1 89 1 view .LVU1111
	pop	rbx
	.cfi_remember_state
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
	pop	r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
	ret
.LVL390:
	.p2align 4
	.p2align 3
.L487:
	.cfi_restore_state
	.loc 1 89 1 view .LVU1112
	vzeroupper
.LVL391:
	pop	rbx
	.cfi_remember_state
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
	pop	r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
	ret
.LVL392:
.L474:
	.cfi_restore_state
.LBB83:
	.loc 1 88 17 view .LVU1113
	xor	edx, edx
	jmp	.L469
.LBE83:
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
.LVL393:
.LFB57:
	.loc 1 95 15 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 95 15 is_stmt 0 view .LVU1115
	push	rbx
	.seh_pushreg	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.seh_endprologue
.LVL394:
.LBB84:
	.loc 1 96 26 is_stmt 1 discriminator 1 view .LVU1116
	test	r9, r9
	je	.L507
	lea	rax, -1[r9]
	cmp	rax, 6
	jbe	.L495
	mov	r10, r9
	xor	eax, eax
	shr	r10, 3
	sal	r10, 5
.LVL395:
	.p2align 4
	.p2align 3
.L491:
	.loc 1 96 48 is_stmt 0 discriminator 3 view .LVU1117
	vmovdqu	ymm1, YMMWORD PTR [rcx+rax]
	vpmulld	ymm0, ymm1, YMMWORD PTR [rdx+rax]
	.loc 1 96 41 discriminator 3 view .LVU1118
	vextracti128	XMMWORD PTR 16[r8+rax], ymm0, 0x1
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU1119
	.loc 1 96 26 discriminator 1 view .LVU1120
	.loc 1 96 41 is_stmt 0 discriminator 3 view .LVU1121
	vmovdqu	XMMWORD PTR [r8+rax], xmm0
	add	rax, 32
	cmp	rax, r10
	jne	.L491
	mov	rax, r9
	and	rax, -8
	test	r9b, 7
	je	.L508
	vzeroupper
.LVL396:
.L490:
	.loc 1 96 41 discriminator 3 view .LVU1122
	mov	r11, r9
	sub	r11, rax
	lea	r10, -1[r11]
	cmp	r10, 2
	jbe	.L493
	lea	r10, 0[0+rax*4]
	.loc 1 96 48 discriminator 3 view .LVU1123
	vmovdqu	xmm2, XMMWORD PTR [rcx+r10]
	vpmulld	xmm0, xmm2, XMMWORD PTR [rdx+r10]
	.loc 1 96 41 discriminator 3 view .LVU1124
	vmovdqu	XMMWORD PTR [r8+r10], xmm0
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU1125
	.loc 1 96 26 discriminator 1 view .LVU1126
	mov	r10, r11
	and	r10, -4
	add	rax, r10
	and	r11d, 3
	je	.L507
.L493:
.LVL397:
	.loc 1 96 44 is_stmt 0 discriminator 3 view .LVU1127
	lea	r10, 0[0+rax*4]
	.loc 1 96 48 discriminator 3 view .LVU1128
	mov	r11d, DWORD PTR [rcx+r10]
	imul	r11d, DWORD PTR [rdx+r10]
	.loc 1 96 41 discriminator 3 view .LVU1129
	mov	DWORD PTR [r8+r10], r11d
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU1130
	.loc 1 96 26 discriminator 1 view .LVU1131
	.loc 1 96 5 is_stmt 0 discriminator 3 view .LVU1132
	lea	r11, 1[rax]
	.loc 1 96 26 discriminator 1 view .LVU1133
	cmp	r11, r9
	jnb	.L507
	.loc 1 96 48 discriminator 3 view .LVU1134
	mov	ebx, DWORD PTR 4[rdx+r10]
	imul	ebx, DWORD PTR 4[rcx+r10]
	.loc 1 96 5 discriminator 3 view .LVU1135
	add	rax, 2
	.loc 1 96 41 discriminator 3 view .LVU1136
	mov	DWORD PTR 4[r8+r10], ebx
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU1137
	.loc 1 96 26 discriminator 1 view .LVU1138
	cmp	rax, r9
	jnb	.L507
	.loc 1 96 48 is_stmt 0 discriminator 3 view .LVU1139
	mov	eax, DWORD PTR 8[rcx+r10]
	imul	eax, DWORD PTR 8[rdx+r10]
	.loc 1 96 41 discriminator 3 view .LVU1140
	mov	DWORD PTR 8[r8+r10], eax
	.loc 1 96 5 is_stmt 1 discriminator 3 view .LVU1141
	.loc 1 96 26 discriminator 1 view .LVU1142
.LVL398:
.L507:
	.loc 1 96 26 is_stmt 0 discriminator 1 view .LVU1143
.LBE84:
	.loc 1 97 1 view .LVU1144
	pop	rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L508:
	.cfi_restore_state
	.loc 1 97 1 view .LVU1145
	vzeroupper
.LVL399:
	pop	rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
.LVL400:
.L495:
	.cfi_restore_state
.LBB85:
	.loc 1 96 17 view .LVU1146
	xor	eax, eax
	jmp	.L490
.LBE85:
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
.LVL401:
.LFB58:
	.loc 1 147 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 147 13 is_stmt 0 view .LVU1148
	.seh_endprologue
	.loc 1 148 17 view .LVU1149
	fldz
	.loc 1 147 13 view .LVU1150
	mov	rax, rcx
	.loc 1 148 17 view .LVU1151
	fstp	TBYTE PTR [rcx]
	fld	TBYTE PTR [rcx]
.LVL402:
.LBB86:
	.loc 1 149 26 is_stmt 1 discriminator 1 view .LVU1152
	test	r9, r9
	je	.L516
	.loc 1 149 17 is_stmt 0 view .LVU1153
	xor	r10d, r10d
.LVL403:
	.p2align 4
	.p2align 3
.L511:
	.loc 1 149 41 discriminator 3 view .LVU1154
	fild	DWORD PTR [rdx+r10*4]
	.loc 1 149 61 discriminator 3 view .LVU1155
	fild	DWORD PTR [r8+r10*4]
	.loc 1 149 5 discriminator 3 view .LVU1156
	inc	r10
.LVL404:
	.loc 1 149 59 discriminator 3 view .LVU1157
	fmulp	st(1), st
	.loc 1 149 38 discriminator 3 view .LVU1158
	faddp	st(1), st
	.loc 1 149 5 is_stmt 1 discriminator 3 view .LVU1159
.LVL405:
	.loc 1 149 26 discriminator 1 view .LVU1160
	cmp	r9, r10
	jne	.L511
	fstp	TBYTE PTR [rax]
.LBE86:
	.loc 1 150 12 is_stmt 0 view .LVU1161
	jmp	.L509
.LVL406:
	.p2align 4
	.p2align 3
.L516:
	.loc 1 150 12 view .LVU1162
	ffreep	st(0)
.LVL407:
.L509:
	.loc 1 151 1 view .LVU1163
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
.LVL408:
.LFB59:
	.loc 1 154 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 154 13 is_stmt 0 view .LVU1165
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
	.loc 1 154 52 view .LVU1166
	mov	DWORD PTR 12[rsp], edx
	fild	DWORD PTR 12[rsp]
	.loc 1 154 69 view .LVU1167
	mov	DWORD PTR 12[rsp], r8d
	.loc 1 154 13 view .LVU1168
	mov	rax, rcx
	.loc 1 154 69 view .LVU1169
	fild	DWORD PTR 12[rsp]
	.loc 1 154 86 view .LVU1170
	mov	DWORD PTR 12[rsp], r9d
	.loc 1 154 67 view .LVU1171
	fmulp	st(1), st
	.loc 1 154 86 view .LVU1172
	fild	DWORD PTR 12[rsp]
	.loc 1 154 84 view .LVU1173
	faddp	st(1), st
	.loc 1 154 99 view .LVU1174
	fstp	TBYTE PTR [rcx]
	.loc 1 154 102 view .LVU1175
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
.LVL409:
.LFB60:
	.loc 1 157 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 157 13 is_stmt 0 view .LVU1177
	sub	rsp, 24
	.seh_stackalloc	24
	.cfi_def_cfa_offset 32
	.seh_endprologue
	.loc 1 157 46 view .LVU1178
	mov	DWORD PTR 12[rsp], edx
	fild	DWORD PTR 12[rsp]
	.loc 1 157 63 view .LVU1179
	mov	DWORD PTR 12[rsp], r8d
	.loc 1 157 13 view .LVU1180
	mov	rax, rcx
	.loc 1 157 63 view .LVU1181
	fild	DWORD PTR 12[rsp]
	.loc 1 157 61 view .LVU1182
	fmulp	st(1), st
	.loc 1 157 76 view .LVU1183
	fstp	TBYTE PTR [rcx]
	.loc 1 157 79 view .LVU1184
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
.LVL410:
.LFB61:
	.loc 1 115 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 115 12 is_stmt 0 view .LVU1186
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
.LVL411:
.LBB87:
	.loc 1 125 23 is_stmt 1 discriminator 1 view .LVU1187
	.loc 1 125 5 discriminator 3 view .LVU1188
	.loc 1 125 23 discriminator 1 view .LVU1189
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1190
	vbroadcastss	ymm13, DWORD PTR .LC25[rip]
	vbroadcastss	ymm12, DWORD PTR .LC23[rip]
.LBE87:
	.loc 1 126 13 view .LVU1191
	vxorps	xmm14, xmm14, xmm14
.LBB88:
	.loc 1 125 40 discriminator 3 view .LVU1192
	vbroadcastss	ymm11, DWORD PTR .LC21[rip]
	vbroadcastss	ymm10, DWORD PTR .LC19[rip]
	vbroadcastss	ymm9, DWORD PTR .LC17[rip]
	vbroadcastss	ymm8, DWORD PTR .LC15[rip]
	vbroadcastss	ymm7, DWORD PTR .LC13[rip]
	vbroadcastss	ymm6, DWORD PTR .LC11[rip]
	vbroadcastss	ymm5, DWORD PTR .LC9[rip]
	vbroadcastss	ymm4, DWORD PTR .LC7[rip]
	vbroadcastss	ymm3, DWORD PTR .LC5[rip]
.LBE88:
	.loc 1 126 13 view .LVU1193
	vaddss	xmm0, xmm1, xmm14
	.loc 1 126 27 view .LVU1194
	vaddss	xmm1, xmm2, xmm14
.LVL412:
	.loc 1 115 12 view .LVU1195
	lea	rax, 31[rsp]
	and	rax, -32
.LBB89:
	.loc 1 127 28 discriminator 1 view .LVU1196
	vbroadcastss	ymm2, DWORD PTR .LC27[rip]
.LVL413:
	.loc 1 127 28 discriminator 1 view .LVU1197
.LBE89:
.LBB92:
	.loc 1 125 40 discriminator 3 view .LVU1198
	vmovups	YMMWORD PTR 32[rax], ymm13
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1199
.LVL414:
	.loc 1 125 23 discriminator 1 view .LVU1200
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1201
	vmovups	YMMWORD PTR 64[rax], ymm12
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1202
.LVL415:
	.loc 1 125 23 discriminator 1 view .LVU1203
	.loc 1 125 23 is_stmt 0 discriminator 1 view .LVU1204
.LBE92:
	.loc 1 126 13 view .LVU1205
	vbroadcastss	ymm0, xmm0
	.loc 1 126 27 view .LVU1206
	vbroadcastss	ymm1, xmm1
.LBB93:
	.loc 1 125 40 discriminator 3 view .LVU1207
	vmovups	YMMWORD PTR 96[rax], ymm11
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1208
.LVL416:
	.loc 1 125 23 discriminator 1 view .LVU1209
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1210
	vmovups	YMMWORD PTR 128[rax], ymm10
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1211
.LVL417:
	.loc 1 125 23 discriminator 1 view .LVU1212
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1213
	vmovups	YMMWORD PTR 160[rax], ymm9
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1214
.LVL418:
	.loc 1 125 23 discriminator 1 view .LVU1215
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1216
	vmovups	YMMWORD PTR 192[rax], ymm8
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1217
.LVL419:
	.loc 1 125 23 discriminator 1 view .LVU1218
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1219
	vmovups	YMMWORD PTR 224[rax], ymm7
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1220
.LVL420:
	.loc 1 125 23 discriminator 1 view .LVU1221
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1222
	vmovups	YMMWORD PTR 256[rax], ymm6
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1223
.LVL421:
	.loc 1 125 23 discriminator 1 view .LVU1224
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1225
	vmovups	YMMWORD PTR 288[rax], ymm5
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1226
.LVL422:
	.loc 1 125 23 discriminator 1 view .LVU1227
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1228
	vmovups	YMMWORD PTR 320[rax], ymm4
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1229
.LVL423:
	.loc 1 125 23 discriminator 1 view .LVU1230
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1231
	vmovups	YMMWORD PTR 352[rax], ymm3
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1232
.LVL424:
	.loc 1 125 23 discriminator 1 view .LVU1233
	.loc 1 125 23 is_stmt 0 discriminator 1 view .LVU1234
.LBE93:
.LBB94:
	.loc 1 127 28 is_stmt 1 discriminator 1 view .LVU1235
	test	rcx, rcx
	je	.L520
	.loc 1 127 17 is_stmt 0 view .LVU1236
	xor	edx, edx
.LVL425:
	.p2align 4
	.p2align 3
.L521:
.LBB90:
	.loc 1 129 23 is_stmt 1 discriminator 1 view .LVU1237
.LBE90:
	.loc 1 127 5 is_stmt 0 discriminator 2 view .LVU1238
	inc	rdx
.LVL426:
.LBB91:
	.loc 1 129 58 discriminator 3 view .LVU1239
	vfmadd132ps	ymm2, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1240
.LVL427:
	.loc 1 129 23 discriminator 1 view .LVU1241
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1242
	vfmadd132ps	ymm13, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1243
.LVL428:
	.loc 1 129 23 discriminator 1 view .LVU1244
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1245
	vfmadd132ps	ymm12, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1246
.LVL429:
	.loc 1 129 23 discriminator 1 view .LVU1247
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1248
	vfmadd132ps	ymm11, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1249
.LVL430:
	.loc 1 129 23 discriminator 1 view .LVU1250
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1251
	vfmadd132ps	ymm10, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1252
.LVL431:
	.loc 1 129 23 discriminator 1 view .LVU1253
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1254
	vfmadd132ps	ymm9, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1255
.LVL432:
	.loc 1 129 23 discriminator 1 view .LVU1256
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1257
	vfmadd132ps	ymm8, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1258
.LVL433:
	.loc 1 129 23 discriminator 1 view .LVU1259
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1260
	vfmadd132ps	ymm7, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1261
.LVL434:
	.loc 1 129 23 discriminator 1 view .LVU1262
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1263
	vfmadd132ps	ymm6, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1264
.LVL435:
	.loc 1 129 23 discriminator 1 view .LVU1265
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1266
	vfmadd132ps	ymm5, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1267
.LVL436:
	.loc 1 129 23 discriminator 1 view .LVU1268
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1269
	vfmadd132ps	ymm4, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1270
.LVL437:
	.loc 1 129 23 discriminator 1 view .LVU1271
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1272
	vfmadd132ps	ymm3, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1273
.LVL438:
	.loc 1 129 23 discriminator 1 view .LVU1274
.LBE91:
	.loc 1 127 5 discriminator 2 view .LVU1275
	.loc 1 127 28 discriminator 1 view .LVU1276
	cmp	rcx, rdx
	jne	.L521
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
.LVL439:
.L520:
	.loc 1 127 28 is_stmt 0 discriminator 1 view .LVU1277
.LBE94:
.LBB95:
	.loc 1 132 23 is_stmt 1 discriminator 1 view .LVU1278
	.loc 1 132 5 discriminator 3 view .LVU1279
	.loc 1 132 23 discriminator 1 view .LVU1280
	.loc 1 132 5 discriminator 3 view .LVU1281
	.loc 1 132 23 discriminator 1 view .LVU1282
	.loc 1 132 5 discriminator 3 view .LVU1283
	.loc 1 132 23 discriminator 1 view .LVU1284
	.loc 1 132 5 discriminator 3 view .LVU1285
	.loc 1 132 23 discriminator 1 view .LVU1286
	.loc 1 132 5 discriminator 3 view .LVU1287
	.loc 1 132 23 discriminator 1 view .LVU1288
	.loc 1 132 5 discriminator 3 view .LVU1289
	.loc 1 132 23 discriminator 1 view .LVU1290
	.loc 1 132 5 discriminator 3 view .LVU1291
	.loc 1 132 23 discriminator 1 view .LVU1292
	.loc 1 132 5 discriminator 3 view .LVU1293
	.loc 1 132 23 discriminator 1 view .LVU1294
	.loc 1 132 5 discriminator 3 view .LVU1295
	.loc 1 132 23 discriminator 1 view .LVU1296
	.loc 1 132 5 discriminator 3 view .LVU1297
	.loc 1 132 23 discriminator 1 view .LVU1298
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU1299
	vaddps	ymm1, ymm2, YMMWORD PTR 32[rax]
.LVL440:
	.loc 1 132 35 discriminator 3 view .LVU1300
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
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU1301
.LVL441:
	.loc 1 132 23 discriminator 1 view .LVU1302
	.loc 1 132 23 is_stmt 0 discriminator 1 view .LVU1303
.LBE95:
	.loc 1 133 21 view .LVU1304
	mov	rax, QWORD PTR .LC28[rip]
	mov	QWORD PTR [r9], rax
.LVL442:
.LBB96:
	.loc 1 138 23 is_stmt 1 discriminator 1 view .LVU1305
	.loc 1 138 23 is_stmt 0 discriminator 1 view .LVU1306
	vaddss	xmm2, xmm1, xmm3
	vshufps	xmm3, xmm1, xmm1, 85
	vshufps	xmm0, xmm1, xmm1, 255
.LVL443:
	.loc 1 138 23 discriminator 1 view .LVU1307
	vaddss	xmm3, xmm3, xmm2
	vunpckhps	xmm2, xmm1, xmm1
	vextractf128	xmm1, ymm1, 0x1
.LVL444:
	.loc 1 138 23 discriminator 1 view .LVU1308
	vaddss	xmm2, xmm2, xmm3
	vaddss	xmm0, xmm0, xmm2
	vshufps	xmm2, xmm1, xmm1, 85
	vaddss	xmm0, xmm1, xmm0
	vaddss	xmm2, xmm2, xmm0
	vunpckhps	xmm0, xmm1, xmm1
.LVL445:
	.loc 1 138 5 is_stmt 1 discriminator 3 view .LVU1309
	.loc 1 138 23 discriminator 1 view .LVU1310
	.loc 1 138 35 is_stmt 0 discriminator 3 view .LVU1311
	vshufps	xmm1, xmm1, xmm1, 255
	vaddss	xmm0, xmm0, xmm2
	vaddss	xmm0, xmm0, xmm1
	vzeroupper
.LVL446:
.LBE96:
	.loc 1 141 1 view .LVU1312
	vmovups	xmm6, XMMWORD PTR 400[rsp]
	vmovups	xmm7, XMMWORD PTR 416[rsp]
	vmovups	xmm8, XMMWORD PTR 432[rsp]
	vmovups	xmm9, XMMWORD PTR 448[rsp]
	vmovups	xmm10, XMMWORD PTR 464[rsp]
	vmovups	xmm11, XMMWORD PTR 480[rsp]
	vmovups	xmm12, XMMWORD PTR 496[rsp]
	vmovups	xmm13, XMMWORD PTR 512[rsp]
	vmovups	xmm14, XMMWORD PTR 528[rsp]
.LVL447:
	.loc 1 141 1 view .LVU1313
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
.LVL448:
.LFB62:
	.loc 1 115 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 115 12 is_stmt 0 view .LVU1315
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
.LVL449:
.LBB97:
	.loc 1 125 23 is_stmt 1 discriminator 1 view .LVU1316
	.loc 1 125 5 discriminator 3 view .LVU1317
	.loc 1 125 23 discriminator 1 view .LVU1318
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1319
	vbroadcastsd	ymm13, QWORD PTR .LC50[rip]
	vbroadcastsd	ymm12, QWORD PTR .LC48[rip]
.LBE97:
	.loc 1 126 13 view .LVU1320
	vxorpd	xmm14, xmm14, xmm14
.LBB98:
	.loc 1 125 40 discriminator 3 view .LVU1321
	vbroadcastsd	ymm11, QWORD PTR .LC46[rip]
	vbroadcastsd	ymm10, QWORD PTR .LC44[rip]
	vbroadcastsd	ymm9, QWORD PTR .LC42[rip]
	vbroadcastsd	ymm8, QWORD PTR .LC40[rip]
	vbroadcastsd	ymm7, QWORD PTR .LC38[rip]
	vbroadcastsd	ymm6, QWORD PTR .LC36[rip]
	vbroadcastsd	ymm5, QWORD PTR .LC34[rip]
	vbroadcastsd	ymm4, QWORD PTR .LC32[rip]
	vbroadcastsd	ymm3, QWORD PTR .LC30[rip]
.LBE98:
	.loc 1 126 13 view .LVU1322
	vaddsd	xmm0, xmm1, xmm14
	.loc 1 126 27 view .LVU1323
	vaddsd	xmm1, xmm2, xmm14
.LVL450:
	.loc 1 115 12 view .LVU1324
	lea	rax, 31[rsp]
	and	rax, -32
.LBB99:
	.loc 1 127 28 discriminator 1 view .LVU1325
	vbroadcastsd	ymm2, QWORD PTR .LC52[rip]
.LVL451:
	.loc 1 127 28 discriminator 1 view .LVU1326
.LBE99:
.LBB102:
	.loc 1 125 40 discriminator 3 view .LVU1327
	vmovupd	YMMWORD PTR 32[rax], ymm13
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1328
.LVL452:
	.loc 1 125 23 discriminator 1 view .LVU1329
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1330
	vmovupd	YMMWORD PTR 64[rax], ymm12
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1331
.LVL453:
	.loc 1 125 23 discriminator 1 view .LVU1332
	.loc 1 125 23 is_stmt 0 discriminator 1 view .LVU1333
.LBE102:
	.loc 1 126 13 view .LVU1334
	vbroadcastsd	ymm0, xmm0
	.loc 1 126 27 view .LVU1335
	vbroadcastsd	ymm1, xmm1
.LBB103:
	.loc 1 125 40 discriminator 3 view .LVU1336
	vmovupd	YMMWORD PTR 96[rax], ymm11
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1337
.LVL454:
	.loc 1 125 23 discriminator 1 view .LVU1338
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1339
	vmovupd	YMMWORD PTR 128[rax], ymm10
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1340
.LVL455:
	.loc 1 125 23 discriminator 1 view .LVU1341
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1342
	vmovupd	YMMWORD PTR 160[rax], ymm9
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1343
.LVL456:
	.loc 1 125 23 discriminator 1 view .LVU1344
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1345
	vmovupd	YMMWORD PTR 192[rax], ymm8
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1346
.LVL457:
	.loc 1 125 23 discriminator 1 view .LVU1347
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1348
	vmovupd	YMMWORD PTR 224[rax], ymm7
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1349
.LVL458:
	.loc 1 125 23 discriminator 1 view .LVU1350
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1351
	vmovupd	YMMWORD PTR 256[rax], ymm6
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1352
.LVL459:
	.loc 1 125 23 discriminator 1 view .LVU1353
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1354
	vmovupd	YMMWORD PTR 288[rax], ymm5
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1355
.LVL460:
	.loc 1 125 23 discriminator 1 view .LVU1356
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1357
	vmovupd	YMMWORD PTR 320[rax], ymm4
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1358
.LVL461:
	.loc 1 125 23 discriminator 1 view .LVU1359
	.loc 1 125 40 is_stmt 0 discriminator 3 view .LVU1360
	vmovupd	YMMWORD PTR 352[rax], ymm3
	.loc 1 125 5 is_stmt 1 discriminator 3 view .LVU1361
.LVL462:
	.loc 1 125 23 discriminator 1 view .LVU1362
	.loc 1 125 23 is_stmt 0 discriminator 1 view .LVU1363
.LBE103:
.LBB104:
	.loc 1 127 28 is_stmt 1 discriminator 1 view .LVU1364
	test	rcx, rcx
	je	.L525
	.loc 1 127 17 is_stmt 0 view .LVU1365
	xor	edx, edx
.LVL463:
	.p2align 4
	.p2align 3
.L526:
.LBB100:
	.loc 1 129 23 is_stmt 1 discriminator 1 view .LVU1366
.LBE100:
	.loc 1 127 5 is_stmt 0 discriminator 2 view .LVU1367
	inc	rdx
.LVL464:
.LBB101:
	.loc 1 129 58 discriminator 3 view .LVU1368
	vfmadd132pd	ymm2, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1369
.LVL465:
	.loc 1 129 23 discriminator 1 view .LVU1370
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1371
	vfmadd132pd	ymm13, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1372
.LVL466:
	.loc 1 129 23 discriminator 1 view .LVU1373
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1374
	vfmadd132pd	ymm12, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1375
.LVL467:
	.loc 1 129 23 discriminator 1 view .LVU1376
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1377
	vfmadd132pd	ymm11, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1378
.LVL468:
	.loc 1 129 23 discriminator 1 view .LVU1379
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1380
	vfmadd132pd	ymm10, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1381
.LVL469:
	.loc 1 129 23 discriminator 1 view .LVU1382
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1383
	vfmadd132pd	ymm9, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1384
.LVL470:
	.loc 1 129 23 discriminator 1 view .LVU1385
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1386
	vfmadd132pd	ymm8, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1387
.LVL471:
	.loc 1 129 23 discriminator 1 view .LVU1388
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1389
	vfmadd132pd	ymm7, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1390
.LVL472:
	.loc 1 129 23 discriminator 1 view .LVU1391
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1392
	vfmadd132pd	ymm6, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1393
.LVL473:
	.loc 1 129 23 discriminator 1 view .LVU1394
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1395
	vfmadd132pd	ymm5, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1396
.LVL474:
	.loc 1 129 23 discriminator 1 view .LVU1397
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1398
	vfmadd132pd	ymm4, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1399
.LVL475:
	.loc 1 129 23 discriminator 1 view .LVU1400
	.loc 1 129 58 is_stmt 0 discriminator 3 view .LVU1401
	vfmadd132pd	ymm3, ymm1, ymm0
	.loc 1 129 23 is_stmt 1 discriminator 3 view .LVU1402
.LVL476:
	.loc 1 129 23 discriminator 1 view .LVU1403
.LBE101:
	.loc 1 127 5 discriminator 2 view .LVU1404
	.loc 1 127 28 discriminator 1 view .LVU1405
	cmp	rcx, rdx
	jne	.L526
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
.LVL477:
.L525:
	.loc 1 127 28 is_stmt 0 discriminator 1 view .LVU1406
.LBE104:
.LBB105:
	.loc 1 132 23 is_stmt 1 discriminator 1 view .LVU1407
	.loc 1 132 5 discriminator 3 view .LVU1408
	.loc 1 132 23 discriminator 1 view .LVU1409
	.loc 1 132 5 discriminator 3 view .LVU1410
	.loc 1 132 23 discriminator 1 view .LVU1411
	.loc 1 132 5 discriminator 3 view .LVU1412
	.loc 1 132 23 discriminator 1 view .LVU1413
	.loc 1 132 5 discriminator 3 view .LVU1414
	.loc 1 132 23 discriminator 1 view .LVU1415
	.loc 1 132 5 discriminator 3 view .LVU1416
	.loc 1 132 23 discriminator 1 view .LVU1417
	.loc 1 132 5 discriminator 3 view .LVU1418
	.loc 1 132 23 discriminator 1 view .LVU1419
	.loc 1 132 5 discriminator 3 view .LVU1420
	.loc 1 132 23 discriminator 1 view .LVU1421
	.loc 1 132 5 discriminator 3 view .LVU1422
	.loc 1 132 23 discriminator 1 view .LVU1423
	.loc 1 132 5 discriminator 3 view .LVU1424
	.loc 1 132 23 discriminator 1 view .LVU1425
	.loc 1 132 5 discriminator 3 view .LVU1426
	.loc 1 132 23 discriminator 1 view .LVU1427
	.loc 1 132 35 is_stmt 0 discriminator 3 view .LVU1428
	vaddpd	ymm0, ymm2, YMMWORD PTR 32[rax]
.LVL478:
	.loc 1 132 35 discriminator 3 view .LVU1429
.LBE105:
.LBB106:
	.loc 1 138 35 discriminator 3 view .LVU1430
	vxorpd	xmm3, xmm3, xmm3
.LBE106:
.LBB107:
	.loc 1 132 35 discriminator 3 view .LVU1431
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
.LVL479:
	.loc 1 132 5 is_stmt 1 discriminator 3 view .LVU1432
	.loc 1 132 23 discriminator 1 view .LVU1433
.LBE107:
	.loc 1 133 21 is_stmt 0 view .LVU1434
	mov	rax, QWORD PTR .LC53[rip]
	mov	QWORD PTR [r9], rax
.LVL480:
.LBB108:
	.loc 1 138 23 is_stmt 1 discriminator 1 view .LVU1435
	.loc 1 138 35 is_stmt 0 discriminator 3 view .LVU1436
	vaddsd	xmm2, xmm0, xmm3
.LVL481:
	.loc 1 138 5 is_stmt 1 discriminator 3 view .LVU1437
	.loc 1 138 23 discriminator 1 view .LVU1438
	.loc 1 138 39 is_stmt 0 discriminator 3 view .LVU1439
	vunpckhpd	xmm1, xmm0, xmm0
.LVL482:
	.loc 1 138 39 discriminator 3 view .LVU1440
	vextractf128	xmm0, ymm0, 0x1
.LVL483:
	.loc 1 138 35 discriminator 3 view .LVU1441
	vaddsd	xmm1, xmm1, xmm2
.LVL484:
	.loc 1 138 5 is_stmt 1 discriminator 3 view .LVU1442
	.loc 1 138 23 discriminator 1 view .LVU1443
	.loc 1 138 35 is_stmt 0 discriminator 3 view .LVU1444
	vaddsd	xmm1, xmm0, xmm1
.LVL485:
	.loc 1 138 5 is_stmt 1 discriminator 3 view .LVU1445
	.loc 1 138 23 discriminator 1 view .LVU1446
	.loc 1 138 5 discriminator 3 view .LVU1447
	.loc 1 138 23 discriminator 1 view .LVU1448
	.loc 1 138 39 is_stmt 0 discriminator 3 view .LVU1449
	vunpckhpd	xmm0, xmm0, xmm0
	.loc 1 138 35 discriminator 3 view .LVU1450
	vaddsd	xmm0, xmm0, xmm1
	vzeroupper
.LVL486:
.LBE108:
	.loc 1 141 1 view .LVU1451
	vmovups	xmm6, XMMWORD PTR 400[rsp]
	vmovups	xmm7, XMMWORD PTR 416[rsp]
	vmovups	xmm8, XMMWORD PTR 432[rsp]
	vmovups	xmm9, XMMWORD PTR 448[rsp]
	vmovups	xmm10, XMMWORD PTR 464[rsp]
	vmovups	xmm11, XMMWORD PTR 480[rsp]
	vmovups	xmm12, XMMWORD PTR 496[rsp]
	vmovups	xmm13, XMMWORD PTR 512[rsp]
	vmovups	xmm14, XMMWORD PTR 528[rsp]
.LVL487:
	.loc 1 141 1 view .LVU1452
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
	.long	0x260e
	.word	0x5
	.byte	0x1
	.byte	0x8
	.secrel32	.Ldebug_abbrev0
	.uleb128 0x1b
	.ascii "GNU C++17 13.1.0 -march=znver1 -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -msse4a -mno-fma4 -mno-xop -mfma -mno-avx512f -mbmi -mbmi2 -maes -mpclmul -mno-avx512vl -mno-avx512bw -mno-avx512dq -mno-avx512cd -mno-avx512er -mno-avx512pf -mno-avx512vbmi -mno-avx512ifma -mno-avx5124vnniw -mno-avx5124fmaps -mno-avx512vpopcntdq -mno-avx512vbmi2 -mno-gfni -mno-vpclmulqdq -mno-avx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mno-clwb -mclzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mno-movdir64b -mno-movdiri -mmwaitx -mno-pconfig -mno-pku -mno-prefetchwt1 -mprfchw -mno-ptwrite -mno-rdpid -mrdrnd -mrdseed -mno-rtm -mno-serialize -mno-sgx -msha -mno-shstk -mno-tbm -mno-tsxldtrk -mno-vaes -mno-waitpkg -mno-wbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -mno-uintr -mno-hreset -mno-kl -mno-widekl -mno-avxvnni -mno-avx512fp16 -mno-avxifma -mno-avxvnniint8 -mno-avxneconvert -mno-cmpccxadd -mno-amx-fp16 -mno-prefetchi -mno-raoint -mno-amx-complex --param=l1-cache-size=32 --param=l1-cache-line-size=64 --param=l2-cache-size=512 -mtune=znver1 -mprefer-vector-width=256 -masm=intel -g -O3 -std=c++17 -fopenmp-simd\0"
	.byte	0x21
	.secrel32	.LASF0
	.secrel32	.LASF1
	.secrel32	.LLRL131
	.quad	0
	.secrel32	.Ldebug_line0
	.uleb128 0xa
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.uleb128 0xa
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0xa
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0xa
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0xa
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x6
	.ascii "intptr_t\0"
	.byte	0x2
	.byte	0x3e
	.byte	0x23
	.long	0x56b
	.uleb128 0x6
	.ascii "uintptr_t\0"
	.byte	0x2
	.byte	0x4b
	.byte	0x2c
	.long	0x551
	.uleb128 0xa
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x12
	.long	0x5b5
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0xa
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
	.long	0x629
	.uleb128 0x17
	.ascii "__max_align_ll\0"
	.word	0x1a9
	.byte	0xd
	.long	0x56b
	.byte	0x8
	.byte	0
	.uleb128 0x17
	.ascii "__max_align_ld\0"
	.word	0x1aa
	.byte	0xf
	.long	0x629
	.byte	0x10
	.byte	0x10
	.byte	0
	.uleb128 0xa
	.byte	0x10
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0x1d
	.ascii "max_align_t\0"
	.byte	0x3
	.word	0x1ab
	.byte	0x3
	.long	0x5dd
	.byte	0x10
	.uleb128 0x1e
	.ascii "std\0"
	.byte	0x6
	.word	0x132
	.byte	0xb
	.long	0x759
	.uleb128 0x7
	.byte	0x4
	.byte	0x3a
	.byte	0xb
	.long	0x638
	.uleb128 0x7
	.byte	0x5
	.byte	0x33
	.byte	0xb
	.long	0x76a
	.uleb128 0x7
	.byte	0x5
	.byte	0x34
	.byte	0xb
	.long	0x798
	.uleb128 0x7
	.byte	0x5
	.byte	0x35
	.byte	0xb
	.long	0x7c6
	.uleb128 0x7
	.byte	0x5
	.byte	0x36
	.byte	0xb
	.long	0x7ec
	.uleb128 0x7
	.byte	0x5
	.byte	0x38
	.byte	0xb
	.long	0x8bf
	.uleb128 0x7
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.long	0x8e8
	.uleb128 0x7
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.long	0x913
	.uleb128 0x7
	.byte	0x5
	.byte	0x3b
	.byte	0xb
	.long	0x93e
	.uleb128 0x7
	.byte	0x5
	.byte	0x3d
	.byte	0xb
	.long	0x80d
	.uleb128 0x7
	.byte	0x5
	.byte	0x3e
	.byte	0xb
	.long	0x838
	.uleb128 0x7
	.byte	0x5
	.byte	0x3f
	.byte	0xb
	.long	0x865
	.uleb128 0x7
	.byte	0x5
	.byte	0x40
	.byte	0xb
	.long	0x892
	.uleb128 0x7
	.byte	0x5
	.byte	0x42
	.byte	0xb
	.long	0x969
	.uleb128 0x7
	.byte	0x5
	.byte	0x43
	.byte	0xb
	.long	0x57c
	.uleb128 0x7
	.byte	0x5
	.byte	0x45
	.byte	0xb
	.long	0x788
	.uleb128 0x7
	.byte	0x5
	.byte	0x46
	.byte	0xb
	.long	0x7b5
	.uleb128 0x7
	.byte	0x5
	.byte	0x47
	.byte	0xb
	.long	0x7db
	.uleb128 0x7
	.byte	0x5
	.byte	0x48
	.byte	0xb
	.long	0x7fc
	.uleb128 0x7
	.byte	0x5
	.byte	0x4a
	.byte	0xb
	.long	0x8d3
	.uleb128 0x7
	.byte	0x5
	.byte	0x4b
	.byte	0xb
	.long	0x8fd
	.uleb128 0x7
	.byte	0x5
	.byte	0x4c
	.byte	0xb
	.long	0x928
	.uleb128 0x7
	.byte	0x5
	.byte	0x4d
	.byte	0xb
	.long	0x953
	.uleb128 0x7
	.byte	0x5
	.byte	0x4f
	.byte	0xb
	.long	0x822
	.uleb128 0x7
	.byte	0x5
	.byte	0x50
	.byte	0xb
	.long	0x84e
	.uleb128 0x7
	.byte	0x5
	.byte	0x51
	.byte	0xb
	.long	0x87b
	.uleb128 0x7
	.byte	0x5
	.byte	0x52
	.byte	0xb
	.long	0x8a8
	.uleb128 0x7
	.byte	0x5
	.byte	0x54
	.byte	0xb
	.long	0x97a
	.uleb128 0x7
	.byte	0x5
	.byte	0x55
	.byte	0xb
	.long	0x58d
	.uleb128 0x1f
	.ascii "size_t\0"
	.byte	0x6
	.word	0x134
	.byte	0x1a
	.long	0x551
	.uleb128 0x12
	.long	0x743
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x6
	.ascii "int8_t\0"
	.byte	0x7
	.byte	0x23
	.byte	0x15
	.long	0x779
	.uleb128 0xa
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x6
	.ascii "uint8_t\0"
	.byte	0x7
	.byte	0x24
	.byte	0x19
	.long	0x759
	.uleb128 0x6
	.ascii "int16_t\0"
	.byte	0x7
	.byte	0x25
	.byte	0x10
	.long	0x7a8
	.uleb128 0xa
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x6
	.ascii "uint16_t\0"
	.byte	0x7
	.byte	0x26
	.byte	0x19
	.long	0x59f
	.uleb128 0x6
	.ascii "int32_t\0"
	.byte	0x7
	.byte	0x27
	.byte	0xe
	.long	0x5b5
	.uleb128 0x12
	.long	0x7c6
	.uleb128 0x6
	.ascii "uint32_t\0"
	.byte	0x7
	.byte	0x28
	.byte	0x14
	.long	0x5cd
	.uleb128 0x6
	.ascii "int64_t\0"
	.byte	0x7
	.byte	0x29
	.byte	0x26
	.long	0x56b
	.uleb128 0x6
	.ascii "uint64_t\0"
	.byte	0x7
	.byte	0x2a
	.byte	0x30
	.long	0x551
	.uleb128 0x6
	.ascii "int_least8_t\0"
	.byte	0x7
	.byte	0x2d
	.byte	0x15
	.long	0x779
	.uleb128 0x6
	.ascii "uint_least8_t\0"
	.byte	0x7
	.byte	0x2e
	.byte	0x19
	.long	0x759
	.uleb128 0x6
	.ascii "int_least16_t\0"
	.byte	0x7
	.byte	0x2f
	.byte	0x10
	.long	0x7a8
	.uleb128 0x6
	.ascii "uint_least16_t\0"
	.byte	0x7
	.byte	0x30
	.byte	0x19
	.long	0x59f
	.uleb128 0x6
	.ascii "int_least32_t\0"
	.byte	0x7
	.byte	0x31
	.byte	0xe
	.long	0x5b5
	.uleb128 0x6
	.ascii "uint_least32_t\0"
	.byte	0x7
	.byte	0x32
	.byte	0x14
	.long	0x5cd
	.uleb128 0x6
	.ascii "int_least64_t\0"
	.byte	0x7
	.byte	0x33
	.byte	0x26
	.long	0x56b
	.uleb128 0x6
	.ascii "uint_least64_t\0"
	.byte	0x7
	.byte	0x34
	.byte	0x30
	.long	0x551
	.uleb128 0x6
	.ascii "int_fast8_t\0"
	.byte	0x7
	.byte	0x3a
	.byte	0x15
	.long	0x779
	.uleb128 0x6
	.ascii "uint_fast8_t\0"
	.byte	0x7
	.byte	0x3b
	.byte	0x17
	.long	0x759
	.uleb128 0x6
	.ascii "int_fast16_t\0"
	.byte	0x7
	.byte	0x3c
	.byte	0x10
	.long	0x7a8
	.uleb128 0x6
	.ascii "uint_fast16_t\0"
	.byte	0x7
	.byte	0x3d
	.byte	0x19
	.long	0x59f
	.uleb128 0x6
	.ascii "int_fast32_t\0"
	.byte	0x7
	.byte	0x3e
	.byte	0xe
	.long	0x5b5
	.uleb128 0x6
	.ascii "uint_fast32_t\0"
	.byte	0x7
	.byte	0x3f
	.byte	0x18
	.long	0x5cd
	.uleb128 0x6
	.ascii "int_fast64_t\0"
	.byte	0x7
	.byte	0x40
	.byte	0x26
	.long	0x56b
	.uleb128 0x6
	.ascii "uint_fast64_t\0"
	.byte	0x7
	.byte	0x41
	.byte	0x30
	.long	0x551
	.uleb128 0x6
	.ascii "intmax_t\0"
	.byte	0x7
	.byte	0x44
	.byte	0x26
	.long	0x56b
	.uleb128 0x6
	.ascii "uintmax_t\0"
	.byte	0x7
	.byte	0x45
	.byte	0x30
	.long	0x551
	.uleb128 0x7
	.byte	0x1
	.byte	0x3
	.byte	0xc
	.long	0x743
	.uleb128 0x9
	.ascii "peak_flops<double>\0"
	.byte	0x73
	.byte	0xc
	.ascii "_Z10peak_flopsIdET_yS0_S0_Pd\0"
	.long	0x536
	.quad	.LFB62
	.quad	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.long	0xb3b
	.uleb128 0x4
	.ascii "T\0"
	.long	0x536
	.uleb128 0x1
	.ascii "iters\0"
	.byte	0x73
	.byte	0x1e
	.long	0x743
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.ascii "m\0"
	.byte	0x73
	.byte	0x27
	.long	0x536
	.secrel32	.LLST115
	.secrel32	.LVUS115
	.uleb128 0x5
	.ascii "c\0"
	.byte	0x73
	.byte	0x2c
	.long	0x536
	.secrel32	.LLST116
	.secrel32	.LVUS116
	.uleb128 0x18
	.secrel32	.LASF2
	.byte	0x73
	.long	0xb40
	.uleb128 0x1
	.byte	0x59
	.uleb128 0xd
	.ascii "K\0"
	.byte	0x74
	.byte	0x13
	.long	0x5bc
	.byte	0xc
	.uleb128 0x6
	.ascii "V\0"
	.byte	0x1
	.byte	0x79
	.byte	0xf
	.long	0xb4a
	.uleb128 0x12
	.long	0xa2f
	.uleb128 0xd
	.ascii "L\0"
	.byte	0x7a
	.byte	0x13
	.long	0x5bc
	.byte	0x4
	.uleb128 0xf
	.long	0xa2f
	.long	0xa58
	.uleb128 0x10
	.long	0x551
	.byte	0xb
	.byte	0
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x7c
	.long	0xa48
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.uleb128 0x2
	.ascii "vm\0"
	.byte	0x7e
	.byte	0xd
	.long	0xa39
	.secrel32	.LLST117
	.secrel32	.LVUS117
	.uleb128 0x2
	.ascii "vc\0"
	.byte	0x7e
	.byte	0x1b
	.long	0xa39
	.secrel32	.LLST118
	.secrel32	.LVUS118
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x83
	.byte	0x7
	.long	0xa2f
	.secrel32	.LLST119
	.secrel32	.LVUS119
	.uleb128 0x2
	.ascii "r\0"
	.byte	0x89
	.byte	0x7
	.long	0x536
	.secrel32	.LLST120
	.secrel32	.LVUS120
	.uleb128 0x8
	.secrel32	.LLRL121
	.long	0xac6
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x7d
	.byte	0xe
	.long	0x5b5
	.secrel32	.LLST122
	.secrel32	.LVUS122
	.byte	0
	.uleb128 0x8
	.secrel32	.LLRL123
	.long	0xaf9
	.uleb128 0x2
	.ascii "it\0"
	.byte	0x7f
	.byte	0x11
	.long	0x743
	.secrel32	.LLST124
	.secrel32	.LVUS124
	.uleb128 0x13
	.secrel32	.LLRL125
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x81
	.byte	0x12
	.long	0x5b5
	.secrel32	.LLST126
	.secrel32	.LVUS126
	.byte	0
	.byte	0
	.uleb128 0x8
	.secrel32	.LLRL127
	.long	0xb14
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x84
	.byte	0xe
	.long	0x5b5
	.secrel32	.LLST128
	.secrel32	.LVUS128
	.byte	0
	.uleb128 0x8
	.secrel32	.LLRL129
	.long	0xb2f
	.uleb128 0x2
	.ascii "l\0"
	.byte	0x8a
	.byte	0xe
	.long	0x5b5
	.secrel32	.LLST130
	.secrel32	.LVUS130
	.byte	0
	.uleb128 0x3
	.quad	.LVL486
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x12
	.long	0x536
	.uleb128 0x14
	.long	0x536
	.uleb128 0x15
	.long	0xb40
	.uleb128 0x19
	.long	0x536
	.long	0xb56
	.uleb128 0x1a
	.byte	0x3
	.byte	0
	.uleb128 0x9
	.ascii "peak_flops<float>\0"
	.byte	0x73
	.byte	0xc
	.ascii "_Z10peak_flopsIfET_yS0_S0_Pd\0"
	.long	0x540
	.quad	.LFB61
	.quad	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.long	0xd14
	.uleb128 0x4
	.ascii "T\0"
	.long	0x540
	.uleb128 0x1
	.ascii "iters\0"
	.byte	0x73
	.byte	0x1e
	.long	0x743
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.ascii "m\0"
	.byte	0x73
	.byte	0x27
	.long	0x540
	.secrel32	.LLST101
	.secrel32	.LVUS101
	.uleb128 0x5
	.ascii "c\0"
	.byte	0x73
	.byte	0x2c
	.long	0x540
	.secrel32	.LLST102
	.secrel32	.LVUS102
	.uleb128 0x18
	.secrel32	.LASF2
	.byte	0x73
	.long	0xb40
	.uleb128 0x1
	.byte	0x59
	.uleb128 0xd
	.ascii "K\0"
	.byte	0x74
	.byte	0x13
	.long	0x5bc
	.byte	0xc
	.uleb128 0x6
	.ascii "V\0"
	.byte	0x1
	.byte	0x79
	.byte	0xf
	.long	0xd19
	.uleb128 0x12
	.long	0xbf0
	.uleb128 0xd
	.ascii "L\0"
	.byte	0x7a
	.byte	0x13
	.long	0x5bc
	.byte	0x8
	.uleb128 0xf
	.long	0xbf0
	.long	0xc19
	.uleb128 0x10
	.long	0x551
	.byte	0xb
	.byte	0
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x7c
	.long	0xc09
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.uleb128 0x2
	.ascii "vm\0"
	.byte	0x7e
	.byte	0xd
	.long	0xbfa
	.secrel32	.LLST103
	.secrel32	.LVUS103
	.uleb128 0x2
	.ascii "vc\0"
	.byte	0x7e
	.byte	0x1b
	.long	0xbfa
	.secrel32	.LLST104
	.secrel32	.LVUS104
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x83
	.byte	0x7
	.long	0xbf0
	.secrel32	.LLST105
	.secrel32	.LVUS105
	.uleb128 0x2
	.ascii "r\0"
	.byte	0x89
	.byte	0x7
	.long	0x540
	.secrel32	.LLST106
	.secrel32	.LVUS106
	.uleb128 0x8
	.secrel32	.LLRL107
	.long	0xc87
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x7d
	.byte	0xe
	.long	0x5b5
	.secrel32	.LLST108
	.secrel32	.LVUS108
	.byte	0
	.uleb128 0x8
	.secrel32	.LLRL109
	.long	0xcba
	.uleb128 0x2
	.ascii "it\0"
	.byte	0x7f
	.byte	0x11
	.long	0x743
	.secrel32	.LLST110
	.secrel32	.LVUS110
	.uleb128 0x13
	.secrel32	.LLRL111
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x81
	.byte	0x12
	.long	0x5b5
	.secrel32	.LLST112
	.secrel32	.LVUS112
	.byte	0
	.byte	0
	.uleb128 0xe
	.quad	.LBB95
	.quad	.LBE95-.LBB95
	.long	0xce1
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x84
	.byte	0xe
	.long	0x5b5
	.secrel32	.LLST113
	.secrel32	.LVUS113
	.byte	0
	.uleb128 0xe
	.quad	.LBB96
	.quad	.LBE96-.LBB96
	.long	0xd08
	.uleb128 0x2
	.ascii "l\0"
	.byte	0x8a
	.byte	0xe
	.long	0x5b5
	.secrel32	.LLST114
	.secrel32	.LVUS114
	.byte	0
	.uleb128 0x3
	.quad	.LVL446
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x12
	.long	0x540
	.uleb128 0x19
	.long	0x540
	.long	0xd25
	.uleb128 0x1a
	.byte	0x7
	.byte	0
	.uleb128 0x9
	.ascii "vmul_ref_elem<int>\0"
	.byte	0x9d
	.byte	0xd
	.ascii "_Z13vmul_ref_elemIiEeT_S0_\0"
	.long	0x629
	.quad	.LFB60
	.quad	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.long	0xd8e
	.uleb128 0x4
	.ascii "T\0"
	.long	0x5b5
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9d
	.byte	0x1d
	.long	0x5b5
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9d
	.byte	0x22
	.long	0x5b5
	.uleb128 0x1
	.byte	0x58
	.byte	0
	.uleb128 0x9
	.ascii "saxpy_ref_elem<int>\0"
	.byte	0x9a
	.byte	0xd
	.ascii "_Z14saxpy_ref_elemIiEeT_S0_S0_\0"
	.long	0x629
	.quad	.LFB59
	.quad	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.long	0xe07
	.uleb128 0x4
	.ascii "T\0"
	.long	0x5b5
	.uleb128 0x1
	.ascii "a\0"
	.byte	0x9a
	.byte	0x1e
	.long	0x5b5
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9a
	.byte	0x23
	.long	0x5b5
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9a
	.byte	0x28
	.long	0x5b5
	.uleb128 0x1
	.byte	0x59
	.byte	0
	.uleb128 0x9
	.ascii "dot_ref<int>\0"
	.byte	0x93
	.byte	0xd
	.ascii "_Z7dot_refIiEePKT_S2_y\0"
	.long	0x629
	.quad	.LFB58
	.quad	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.long	0xea5
	.uleb128 0x4
	.ascii "T\0"
	.long	0x5b5
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x93
	.byte	0x1e
	.long	0xea5
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x93
	.byte	0x2a
	.long	0xea5
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x93
	.byte	0x34
	.long	0x743
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x94
	.byte	0x11
	.long	0x629
	.secrel32	.LLST99
	.secrel32	.LVUS99
	.uleb128 0x16
	.quad	.LBB86
	.quad	.LBE86-.LBB86
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x95
	.byte	0x11
	.long	0x743
	.secrel32	.LLST100
	.secrel32	.LVUS100
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	0x5bc
	.uleb128 0x15
	.long	0xea5
	.uleb128 0xc
	.ascii "vmul<int>\0"
	.byte	0x5f
	.ascii "_Z4vmulIiEvPKT_S2_PS0_y\0"
	.quad	.LFB57
	.quad	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.long	0xf4e
	.uleb128 0x4
	.ascii "T\0"
	.long	0x5b5
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x5f
	.byte	0x2a
	.long	0xeaa
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x5f
	.byte	0x43
	.long	0xeaa
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "z\0"
	.byte	0x5f
	.byte	0x56
	.long	0xf53
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x5f
	.byte	0x60
	.long	0x743
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x8
	.secrel32	.LLRL97
	.long	0xf37
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x60
	.byte	0x11
	.long	0x743
	.secrel32	.LLST98
	.secrel32	.LVUS98
	.byte	0
	.uleb128 0x3
	.quad	.LVL396
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3
	.quad	.LVL399
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x14
	.long	0x5b5
	.uleb128 0x15
	.long	0xf4e
	.uleb128 0xc
	.ascii "saxpy_gather<int>\0"
	.byte	0x56
	.ascii "_Z12saxpy_gatherIiEvT_PKS0_PS0_PKiy\0"
	.quad	.LFB56
	.quad	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.long	0x102a
	.uleb128 0x4
	.ascii "T\0"
	.long	0x5b5
	.uleb128 0x5
	.ascii "a\0"
	.byte	0x56
	.byte	0x1e
	.long	0x5b5
	.secrel32	.LLST92
	.secrel32	.LVUS92
	.uleb128 0x5
	.ascii "x\0"
	.byte	0x56
	.byte	0x37
	.long	0xeaa
	.secrel32	.LLST93
	.secrel32	.LVUS93
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x56
	.byte	0x4a
	.long	0xf53
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "idx\0"
	.byte	0x57
	.byte	0x3d
	.long	0x102f
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x5
	.ascii "n\0"
	.byte	0x57
	.byte	0x49
	.long	0x743
	.secrel32	.LLST94
	.secrel32	.LVUS94
	.uleb128 0x8
	.secrel32	.LLRL95
	.long	0x1013
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x58
	.byte	0x11
	.long	0x743
	.secrel32	.LLST96
	.secrel32	.LVUS96
	.byte	0
	.uleb128 0x3
	.quad	.LVL386
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3
	.quad	.LVL391
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x14
	.long	0x7d6
	.uleb128 0x15
	.long	0x102a
	.uleb128 0xc
	.ascii "saxpy_stride<int>\0"
	.byte	0x51
	.ascii "_Z12saxpy_strideIiEvT_PKS0_PS0_yy\0"
	.quad	.LFB55
	.quad	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.long	0x10f7
	.uleb128 0x4
	.ascii "T\0"
	.long	0x5b5
	.uleb128 0x5
	.ascii "a\0"
	.byte	0x51
	.byte	0x1e
	.long	0x5b5
	.secrel32	.LLST89
	.secrel32	.LVUS89
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x51
	.byte	0x37
	.long	0xeaa
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x51
	.byte	0x4a
	.long	0xf53
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x51
	.byte	0x54
	.long	0x743
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x1
	.ascii "s\0"
	.byte	0x51
	.byte	0x5e
	.long	0x743
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x8
	.secrel32	.LLRL90
	.long	0x10e0
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x52
	.byte	0x11
	.long	0x743
	.secrel32	.LLST91
	.secrel32	.LVUS91
	.byte	0
	.uleb128 0x3
	.quad	.LVL370
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3
	.quad	.LVL379
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xc
	.ascii "saxpy<int>\0"
	.byte	0x4c
	.ascii "_Z5saxpyIiEvT_PKS0_PS0_y\0"
	.quad	.LFB54
	.quad	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.long	0x119e
	.uleb128 0x4
	.ascii "T\0"
	.long	0x5b5
	.uleb128 0x5
	.ascii "a\0"
	.byte	0x4c
	.byte	0x17
	.long	0x5b5
	.secrel32	.LLST86
	.secrel32	.LVUS86
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x4c
	.byte	0x30
	.long	0xeaa
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x4c
	.byte	0x43
	.long	0xf53
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x4c
	.byte	0x4d
	.long	0x743
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x8
	.secrel32	.LLRL87
	.long	0x1187
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x4d
	.byte	0x11
	.long	0x743
	.secrel32	.LLST88
	.secrel32	.LVUS88
	.byte	0
	.uleb128 0x3
	.quad	.LVL360
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3
	.quad	.LVL365
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x9
	.ascii "dot_simd_acc<int>\0"
	.byte	0x3a
	.byte	0xc
	.ascii "_Z12dot_simd_accIiET_PKS0_S2_y\0"
	.long	0x5b5
	.quad	.LFB53
	.quad	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.long	0x12b4
	.uleb128 0x4
	.ascii "T\0"
	.long	0x5b5
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x3a
	.byte	0x2f
	.long	0xeaa
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.ascii "y\0"
	.byte	0x3a
	.byte	0x48
	.long	0xeaa
	.secrel32	.LLST81
	.secrel32	.LVUS81
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x3a
	.byte	0x52
	.long	0x743
	.uleb128 0x1
	.byte	0x58
	.uleb128 0xd
	.ascii "W\0"
	.byte	0x3b
	.byte	0x16
	.long	0x753
	.byte	0x20
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x3c
	.long	0x12b4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x3d
	.byte	0xc
	.long	0x743
	.secrel32	.LLST82
	.secrel32	.LVUS82
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x42
	.byte	0x7
	.long	0x5b5
	.secrel32	.LLST83
	.secrel32	.LVUS83
	.uleb128 0x8
	.secrel32	.LLRL84
	.long	0x1276
	.uleb128 0xb
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x743
	.uleb128 0x13
	.secrel32	.LLRL84
	.uleb128 0xb
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x743
	.byte	0
	.byte	0
	.uleb128 0xe
	.quad	.LBB75
	.quad	.LBE75-.LBB75
	.long	0x129d
	.uleb128 0x2
	.ascii "j\0"
	.byte	0x43
	.byte	0x11
	.long	0x743
	.secrel32	.LLST85
	.secrel32	.LVUS85
	.byte	0
	.uleb128 0x3
	.quad	.LVL352
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3
	.quad	.LVL354
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xf
	.long	0x5b5
	.long	0x12c4
	.uleb128 0x10
	.long	0x551
	.byte	0x1f
	.byte	0
	.uleb128 0x9
	.ascii "dot_simd<int>\0"
	.byte	0x2d
	.byte	0xc
	.ascii "_Z8dot_simdIiET_PKS0_S2_y\0"
	.long	0x5b5
	.quad	.LFB52
	.quad	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.long	0x1387
	.uleb128 0x4
	.ascii "T\0"
	.long	0x5b5
	.uleb128 0x5
	.ascii "x\0"
	.byte	0x2d
	.byte	0x2b
	.long	0xeaa
	.secrel32	.LLST77
	.secrel32	.LVUS77
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x2d
	.byte	0x44
	.long	0xeaa
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x2d
	.byte	0x4e
	.long	0x743
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0x5b5
	.secrel32	.LLST78
	.secrel32	.LVUS78
	.uleb128 0x8
	.secrel32	.LLRL79
	.long	0x137b
	.uleb128 0xb
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x743
	.uleb128 0x13
	.secrel32	.LLRL79
	.uleb128 0xb
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0x5b5
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x743
	.secrel32	.LLST80
	.secrel32	.LVUS80
	.byte	0
	.byte	0
	.uleb128 0x3
	.quad	.LVL329
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x9
	.ascii "dot_multiacc<int>\0"
	.byte	0x1a
	.byte	0xc
	.ascii "_Z12dot_multiaccIiET_PKS0_S2_y\0"
	.long	0x5b5
	.quad	.LFB51
	.quad	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.long	0x1478
	.uleb128 0x4
	.ascii "T\0"
	.long	0x5b5
	.uleb128 0x5
	.ascii "x\0"
	.byte	0x1a
	.byte	0x2f
	.long	0xeaa
	.secrel32	.LLST71
	.secrel32	.LVUS71
	.uleb128 0x5
	.ascii "y\0"
	.byte	0x1a
	.byte	0x48
	.long	0xeaa
	.secrel32	.LLST72
	.secrel32	.LVUS72
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x1a
	.byte	0x52
	.long	0x743
	.uleb128 0x1
	.byte	0x58
	.uleb128 0xd
	.ascii "K\0"
	.byte	0x1b
	.byte	0x16
	.long	0x753
	.byte	0x8
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x1c
	.long	0x1478
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x1d
	.byte	0xc
	.long	0x743
	.secrel32	.LLST73
	.secrel32	.LVUS73
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x21
	.byte	0x7
	.long	0x5b5
	.secrel32	.LLST74
	.secrel32	.LVUS74
	.uleb128 0x8
	.secrel32	.LLRL75
	.long	0x145d
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x1f
	.byte	0x15
	.long	0x743
	.secrel32	.LLST76
	.secrel32	.LVUS76
	.byte	0
	.uleb128 0x20
	.long	0x146c
	.uleb128 0xb
	.ascii "k\0"
	.byte	0x22
	.byte	0x11
	.long	0x743
	.byte	0
	.uleb128 0x3
	.quad	.LVL310
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xf
	.long	0x5b5
	.long	0x1488
	.uleb128 0x10
	.long	0x551
	.byte	0x7
	.byte	0
	.uleb128 0x9
	.ascii "dot_strict<int>\0"
	.byte	0xe
	.byte	0xc
	.ascii "_Z10dot_strictIiET_PKS0_S2_y\0"
	.long	0x5b5
	.quad	.LFB50
	.quad	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.long	0x1549
	.uleb128 0x4
	.ascii "T\0"
	.long	0x5b5
	.uleb128 0x5
	.ascii "x\0"
	.byte	0xe
	.byte	0x2d
	.long	0xeaa
	.secrel32	.LLST66
	.secrel32	.LVUS66
	.uleb128 0x5
	.ascii "y\0"
	.byte	0xe
	.byte	0x46
	.long	0xeaa
	.secrel32	.LLST67
	.secrel32	.LVUS67
	.uleb128 0x1
	.ascii "n\0"
	.byte	0xe
	.byte	0x50
	.long	0x743
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.ascii "s\0"
	.byte	0xf
	.byte	0x7
	.long	0x5b5
	.secrel32	.LLST68
	.secrel32	.LVUS68
	.uleb128 0x8
	.secrel32	.LLRL69
	.long	0x1532
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x10
	.byte	0x11
	.long	0x743
	.secrel32	.LLST70
	.secrel32	.LVUS70
	.byte	0
	.uleb128 0x3
	.quad	.LVL282
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3
	.quad	.LVL290
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x9
	.ascii "vmul_ref_elem<double>\0"
	.byte	0x9d
	.byte	0xd
	.ascii "_Z13vmul_ref_elemIdEeT_S0_\0"
	.long	0x629
	.quad	.LFB49
	.quad	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.long	0x15b5
	.uleb128 0x4
	.ascii "T\0"
	.long	0x536
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9d
	.byte	0x1d
	.long	0x536
	.uleb128 0x1
	.byte	0x62
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9d
	.byte	0x22
	.long	0x536
	.uleb128 0x1
	.byte	0x63
	.byte	0
	.uleb128 0x9
	.ascii "saxpy_ref_elem<double>\0"
	.byte	0x9a
	.byte	0xd
	.ascii "_Z14saxpy_ref_elemIdEeT_S0_S0_\0"
	.long	0x629
	.quad	.LFB48
	.quad	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.long	0x1631
	.uleb128 0x4
	.ascii "T\0"
	.long	0x536
	.uleb128 0x1
	.ascii "a\0"
	.byte	0x9a
	.byte	0x1e
	.long	0x536
	.uleb128 0x1
	.byte	0x62
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9a
	.byte	0x23
	.long	0x536
	.uleb128 0x1
	.byte	0x63
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9a
	.byte	0x28
	.long	0x536
	.uleb128 0x1
	.byte	0x64
	.byte	0
	.uleb128 0x9
	.ascii "dot_ref<double>\0"
	.byte	0x93
	.byte	0xd
	.ascii "_Z7dot_refIdEePKT_S2_y\0"
	.long	0x629
	.quad	.LFB47
	.quad	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.long	0x16d2
	.uleb128 0x4
	.ascii "T\0"
	.long	0x536
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x93
	.byte	0x1e
	.long	0x16d2
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x93
	.byte	0x2a
	.long	0x16d2
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x93
	.byte	0x34
	.long	0x743
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x94
	.byte	0x11
	.long	0x629
	.secrel32	.LLST64
	.secrel32	.LVUS64
	.uleb128 0x16
	.quad	.LBB58
	.quad	.LBE58-.LBB58
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x95
	.byte	0x11
	.long	0x743
	.secrel32	.LLST65
	.secrel32	.LVUS65
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	0xb3b
	.uleb128 0x15
	.long	0x16d2
	.uleb128 0xc
	.ascii "vmul<double>\0"
	.byte	0x5f
	.ascii "_Z4vmulIdEvPKT_S2_PS0_y\0"
	.quad	.LFB46
	.quad	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.long	0x1784
	.uleb128 0x4
	.ascii "T\0"
	.long	0x536
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x5f
	.byte	0x2a
	.long	0x16d7
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x5f
	.byte	0x43
	.long	0x16d7
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "z\0"
	.byte	0x5f
	.byte	0x56
	.long	0xb45
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x5
	.ascii "n\0"
	.byte	0x5f
	.byte	0x60
	.long	0x743
	.secrel32	.LLST61
	.secrel32	.LVUS61
	.uleb128 0x8
	.secrel32	.LLRL62
	.long	0x176d
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x60
	.byte	0x11
	.long	0x743
	.secrel32	.LLST63
	.secrel32	.LVUS63
	.byte	0
	.uleb128 0x3
	.quad	.LVL260
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3
	.quad	.LVL265
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xc
	.ascii "saxpy_gather<double>\0"
	.byte	0x56
	.ascii "_Z12saxpy_gatherIdEvT_PKS0_PS0_PKiy\0"
	.quad	.LFB45
	.quad	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.long	0x1853
	.uleb128 0x4
	.ascii "T\0"
	.long	0x536
	.uleb128 0x5
	.ascii "a\0"
	.byte	0x56
	.byte	0x1e
	.long	0x536
	.secrel32	.LLST57
	.secrel32	.LVUS57
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x56
	.byte	0x37
	.long	0x16d7
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x56
	.byte	0x4a
	.long	0xb45
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "idx\0"
	.byte	0x57
	.byte	0x3d
	.long	0x102f
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x5
	.ascii "n\0"
	.byte	0x57
	.byte	0x49
	.long	0x743
	.secrel32	.LLST58
	.secrel32	.LVUS58
	.uleb128 0x8
	.secrel32	.LLRL59
	.long	0x183c
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x58
	.byte	0x11
	.long	0x743
	.secrel32	.LLST60
	.secrel32	.LVUS60
	.byte	0
	.uleb128 0x3
	.quad	.LVL249
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3
	.quad	.LVL254
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xc
	.ascii "saxpy_stride<double>\0"
	.byte	0x51
	.ascii "_Z12saxpy_strideIdEvT_PKS0_PS0_yy\0"
	.quad	.LFB44
	.quad	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.long	0x1925
	.uleb128 0x4
	.ascii "T\0"
	.long	0x536
	.uleb128 0x5
	.ascii "a\0"
	.byte	0x51
	.byte	0x1e
	.long	0x536
	.secrel32	.LLST52
	.secrel32	.LVUS52
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x51
	.byte	0x37
	.long	0x16d7
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.ascii "y\0"
	.byte	0x51
	.byte	0x4a
	.long	0xb45
	.secrel32	.LLST53
	.secrel32	.LVUS53
	.uleb128 0x5
	.ascii "n\0"
	.byte	0x51
	.byte	0x54
	.long	0x743
	.secrel32	.LLST54
	.secrel32	.LVUS54
	.uleb128 0x1
	.ascii "s\0"
	.byte	0x51
	.byte	0x5e
	.long	0x743
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x8
	.secrel32	.LLRL55
	.long	0x190e
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x52
	.byte	0x11
	.long	0x743
	.secrel32	.LLST56
	.secrel32	.LVUS56
	.byte	0
	.uleb128 0x3
	.quad	.LVL233
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3
	.quad	.LVL240
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xc
	.ascii "saxpy<double>\0"
	.byte	0x4c
	.ascii "_Z5saxpyIdEvT_PKS0_PS0_y\0"
	.quad	.LFB43
	.quad	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.long	0x19db
	.uleb128 0x4
	.ascii "T\0"
	.long	0x536
	.uleb128 0x5
	.ascii "a\0"
	.byte	0x4c
	.byte	0x17
	.long	0x536
	.secrel32	.LLST47
	.secrel32	.LVUS47
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x4c
	.byte	0x30
	.long	0x16d7
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.ascii "y\0"
	.byte	0x4c
	.byte	0x43
	.long	0xb45
	.secrel32	.LLST48
	.secrel32	.LVUS48
	.uleb128 0x5
	.ascii "n\0"
	.byte	0x4c
	.byte	0x4d
	.long	0x743
	.secrel32	.LLST49
	.secrel32	.LVUS49
	.uleb128 0x8
	.secrel32	.LLRL50
	.long	0x19c4
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x4d
	.byte	0x11
	.long	0x743
	.secrel32	.LLST51
	.secrel32	.LVUS51
	.byte	0
	.uleb128 0x3
	.quad	.LVL221
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3
	.quad	.LVL228
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x9
	.ascii "dot_simd_acc<double>\0"
	.byte	0x3a
	.byte	0xc
	.ascii "_Z12dot_simd_accIdET_PKS0_S2_y\0"
	.long	0x536
	.quad	.LFB42
	.quad	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.long	0x1ae3
	.uleb128 0x4
	.ascii "T\0"
	.long	0x536
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x3a
	.byte	0x2f
	.long	0x16d7
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x3a
	.byte	0x48
	.long	0x16d7
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x3a
	.byte	0x52
	.long	0x743
	.uleb128 0x1
	.byte	0x58
	.uleb128 0xd
	.ascii "W\0"
	.byte	0x3b
	.byte	0x16
	.long	0x753
	.byte	0x20
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x3c
	.long	0x1ae3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x3d
	.byte	0xc
	.long	0x743
	.secrel32	.LLST43
	.secrel32	.LVUS43
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x42
	.byte	0x7
	.long	0x536
	.secrel32	.LLST44
	.secrel32	.LVUS44
	.uleb128 0x8
	.secrel32	.LLRL45
	.long	0x1ab0
	.uleb128 0xb
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x743
	.uleb128 0x13
	.secrel32	.LLRL45
	.uleb128 0xb
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x743
	.byte	0
	.byte	0
	.uleb128 0xe
	.quad	.LBB47
	.quad	.LBE47-.LBB47
	.long	0x1ad7
	.uleb128 0x2
	.ascii "j\0"
	.byte	0x43
	.byte	0x11
	.long	0x743
	.secrel32	.LLST46
	.secrel32	.LVUS46
	.byte	0
	.uleb128 0x3
	.quad	.LVL216
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xf
	.long	0x536
	.long	0x1af3
	.uleb128 0x10
	.long	0x551
	.byte	0x1f
	.byte	0
	.uleb128 0x9
	.ascii "dot_simd<double>\0"
	.byte	0x2d
	.byte	0xc
	.ascii "_Z8dot_simdIdET_PKS0_S2_y\0"
	.long	0x536
	.quad	.LFB41
	.quad	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.long	0x1bb3
	.uleb128 0x4
	.ascii "T\0"
	.long	0x536
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x2d
	.byte	0x2b
	.long	0x16d7
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x2d
	.byte	0x44
	.long	0x16d7
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x2d
	.byte	0x4e
	.long	0x743
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0x536
	.secrel32	.LLST40
	.secrel32	.LVUS40
	.uleb128 0x8
	.secrel32	.LLRL41
	.long	0x1ba7
	.uleb128 0xb
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x743
	.uleb128 0x13
	.secrel32	.LLRL41
	.uleb128 0xb
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0x536
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x743
	.secrel32	.LLST42
	.secrel32	.LVUS42
	.byte	0
	.byte	0
	.uleb128 0x3
	.quad	.LVL169
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x9
	.ascii "dot_multiacc<double>\0"
	.byte	0x1a
	.byte	0xc
	.ascii "_Z12dot_multiaccIdET_PKS0_S2_y\0"
	.long	0x536
	.quad	.LFB40
	.quad	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.long	0x1cc6
	.uleb128 0x4
	.ascii "T\0"
	.long	0x536
	.uleb128 0x5
	.ascii "x\0"
	.byte	0x1a
	.byte	0x2f
	.long	0x16d7
	.secrel32	.LLST35
	.secrel32	.LVUS35
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x1a
	.byte	0x48
	.long	0x16d7
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x1a
	.byte	0x52
	.long	0x743
	.uleb128 0x1
	.byte	0x58
	.uleb128 0xd
	.ascii "K\0"
	.byte	0x1b
	.byte	0x16
	.long	0x753
	.byte	0x8
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x1c
	.long	0x1cc6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x1d
	.byte	0xc
	.long	0x743
	.secrel32	.LLST36
	.secrel32	.LVUS36
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x21
	.byte	0x7
	.long	0x536
	.secrel32	.LLST37
	.secrel32	.LVUS37
	.uleb128 0xe
	.quad	.LBB34
	.quad	.LBE34-.LBB34
	.long	0x1c93
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x1f
	.byte	0x15
	.long	0x743
	.secrel32	.LLST38
	.secrel32	.LVUS38
	.byte	0
	.uleb128 0xe
	.quad	.LBB35
	.quad	.LBE35-.LBB35
	.long	0x1cba
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x22
	.byte	0x11
	.long	0x743
	.secrel32	.LLST39
	.secrel32	.LVUS39
	.byte	0
	.uleb128 0x3
	.quad	.LVL159
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xf
	.long	0x536
	.long	0x1cd6
	.uleb128 0x10
	.long	0x551
	.byte	0x7
	.byte	0
	.uleb128 0x9
	.ascii "dot_strict<double>\0"
	.byte	0xe
	.byte	0xc
	.ascii "_Z10dot_strictIdET_PKS0_S2_y\0"
	.long	0x536
	.quad	.LFB39
	.quad	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.long	0x1d8e
	.uleb128 0x4
	.ascii "T\0"
	.long	0x536
	.uleb128 0x1
	.ascii "x\0"
	.byte	0xe
	.byte	0x2d
	.long	0x16d7
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0xe
	.byte	0x46
	.long	0x16d7
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0xe
	.byte	0x50
	.long	0x743
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.ascii "s\0"
	.byte	0xf
	.byte	0x7
	.long	0x536
	.secrel32	.LLST32
	.secrel32	.LVUS32
	.uleb128 0x8
	.secrel32	.LLRL33
	.long	0x1d77
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x10
	.byte	0x11
	.long	0x743
	.secrel32	.LLST34
	.secrel32	.LVUS34
	.byte	0
	.uleb128 0x3
	.quad	.LVL132
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3
	.quad	.LVL136
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x9
	.ascii "vmul_ref_elem<float>\0"
	.byte	0x9d
	.byte	0xd
	.ascii "_Z13vmul_ref_elemIfEeT_S0_\0"
	.long	0x629
	.quad	.LFB38
	.quad	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.long	0x1df9
	.uleb128 0x4
	.ascii "T\0"
	.long	0x540
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9d
	.byte	0x1d
	.long	0x540
	.uleb128 0x1
	.byte	0x62
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9d
	.byte	0x22
	.long	0x540
	.uleb128 0x1
	.byte	0x63
	.byte	0
	.uleb128 0x9
	.ascii "saxpy_ref_elem<float>\0"
	.byte	0x9a
	.byte	0xd
	.ascii "_Z14saxpy_ref_elemIfEeT_S0_S0_\0"
	.long	0x629
	.quad	.LFB37
	.quad	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.long	0x1e74
	.uleb128 0x4
	.ascii "T\0"
	.long	0x540
	.uleb128 0x1
	.ascii "a\0"
	.byte	0x9a
	.byte	0x1e
	.long	0x540
	.uleb128 0x1
	.byte	0x62
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x9a
	.byte	0x23
	.long	0x540
	.uleb128 0x1
	.byte	0x63
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x9a
	.byte	0x28
	.long	0x540
	.uleb128 0x1
	.byte	0x64
	.byte	0
	.uleb128 0x9
	.ascii "dot_ref<float>\0"
	.byte	0x93
	.byte	0xd
	.ascii "_Z7dot_refIfEePKT_S2_y\0"
	.long	0x629
	.quad	.LFB36
	.quad	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.long	0x1f14
	.uleb128 0x4
	.ascii "T\0"
	.long	0x540
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x93
	.byte	0x1e
	.long	0x1f14
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x93
	.byte	0x2a
	.long	0x1f14
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x93
	.byte	0x34
	.long	0x743
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x94
	.byte	0x11
	.long	0x629
	.secrel32	.LLST30
	.secrel32	.LVUS30
	.uleb128 0x16
	.quad	.LBB29
	.quad	.LBE29-.LBB29
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x95
	.byte	0x11
	.long	0x743
	.secrel32	.LLST31
	.secrel32	.LVUS31
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	0xd14
	.uleb128 0x15
	.long	0x1f14
	.uleb128 0xc
	.ascii "vmul<float>\0"
	.byte	0x5f
	.ascii "_Z4vmulIfEvPKT_S2_PS0_y\0"
	.quad	.LFB35
	.quad	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.long	0x1fbf
	.uleb128 0x4
	.ascii "T\0"
	.long	0x540
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x5f
	.byte	0x2a
	.long	0x1f19
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x5f
	.byte	0x43
	.long	0x1f19
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "z\0"
	.byte	0x5f
	.byte	0x56
	.long	0x1fc4
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x5f
	.byte	0x60
	.long	0x743
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x8
	.secrel32	.LLRL28
	.long	0x1fa8
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x60
	.byte	0x11
	.long	0x743
	.secrel32	.LLST29
	.secrel32	.LVUS29
	.byte	0
	.uleb128 0x3
	.quad	.LVL113
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3
	.quad	.LVL116
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x14
	.long	0x540
	.uleb128 0x15
	.long	0x1fbf
	.uleb128 0xc
	.ascii "saxpy_gather<float>\0"
	.byte	0x56
	.ascii "_Z12saxpy_gatherIfEvT_PKS0_PS0_PKiy\0"
	.quad	.LFB34
	.quad	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.long	0x209d
	.uleb128 0x4
	.ascii "T\0"
	.long	0x540
	.uleb128 0x5
	.ascii "a\0"
	.byte	0x56
	.byte	0x1e
	.long	0x540
	.secrel32	.LLST23
	.secrel32	.LVUS23
	.uleb128 0x5
	.ascii "x\0"
	.byte	0x56
	.byte	0x37
	.long	0x1f19
	.secrel32	.LLST24
	.secrel32	.LVUS24
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x56
	.byte	0x4a
	.long	0x1fc4
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "idx\0"
	.byte	0x57
	.byte	0x3d
	.long	0x102f
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x5
	.ascii "n\0"
	.byte	0x57
	.byte	0x49
	.long	0x743
	.secrel32	.LLST25
	.secrel32	.LVUS25
	.uleb128 0x8
	.secrel32	.LLRL26
	.long	0x2086
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x58
	.byte	0x11
	.long	0x743
	.secrel32	.LLST27
	.secrel32	.LVUS27
	.byte	0
	.uleb128 0x3
	.quad	.LVL103
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3
	.quad	.LVL108
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xc
	.ascii "saxpy_stride<float>\0"
	.byte	0x51
	.ascii "_Z12saxpy_strideIfEvT_PKS0_PS0_yy\0"
	.quad	.LFB33
	.quad	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.long	0x2162
	.uleb128 0x4
	.ascii "T\0"
	.long	0x540
	.uleb128 0x5
	.ascii "a\0"
	.byte	0x51
	.byte	0x1e
	.long	0x540
	.secrel32	.LLST20
	.secrel32	.LVUS20
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x51
	.byte	0x37
	.long	0x1f19
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x51
	.byte	0x4a
	.long	0x1fc4
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x51
	.byte	0x54
	.long	0x743
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x1
	.ascii "s\0"
	.byte	0x51
	.byte	0x5e
	.long	0x743
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x8
	.secrel32	.LLRL21
	.long	0x214b
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x52
	.byte	0x11
	.long	0x743
	.secrel32	.LLST22
	.secrel32	.LVUS22
	.byte	0
	.uleb128 0x3
	.quad	.LVL88
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3
	.quad	.LVL97
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xc
	.ascii "saxpy<float>\0"
	.byte	0x4c
	.ascii "_Z5saxpyIfEvT_PKS0_PS0_y\0"
	.quad	.LFB32
	.quad	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.long	0x220b
	.uleb128 0x4
	.ascii "T\0"
	.long	0x540
	.uleb128 0x5
	.ascii "a\0"
	.byte	0x4c
	.byte	0x17
	.long	0x540
	.secrel32	.LLST17
	.secrel32	.LVUS17
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x4c
	.byte	0x30
	.long	0x1f19
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x4c
	.byte	0x43
	.long	0x1fc4
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x4c
	.byte	0x4d
	.long	0x743
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x8
	.secrel32	.LLRL18
	.long	0x21f4
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x4d
	.byte	0x11
	.long	0x743
	.secrel32	.LLST19
	.secrel32	.LVUS19
	.byte	0
	.uleb128 0x3
	.quad	.LVL78
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3
	.quad	.LVL83
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x9
	.ascii "dot_simd_acc<float>\0"
	.byte	0x3a
	.byte	0xc
	.ascii "_Z12dot_simd_accIfET_PKS0_S2_y\0"
	.long	0x540
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0x2330
	.uleb128 0x4
	.ascii "T\0"
	.long	0x540
	.uleb128 0x5
	.ascii "x\0"
	.byte	0x3a
	.byte	0x2f
	.long	0x1f19
	.secrel32	.LLST13
	.secrel32	.LVUS13
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x3a
	.byte	0x48
	.long	0x1f19
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x3a
	.byte	0x52
	.long	0x743
	.uleb128 0x1
	.byte	0x58
	.uleb128 0xd
	.ascii "W\0"
	.byte	0x3b
	.byte	0x16
	.long	0x753
	.byte	0x20
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x3c
	.long	0x2330
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x3d
	.byte	0xc
	.long	0x743
	.secrel32	.LLST14
	.secrel32	.LVUS14
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x42
	.byte	0x7
	.long	0x540
	.secrel32	.LLST15
	.secrel32	.LVUS15
	.uleb128 0xe
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.long	0x22fd
	.uleb128 0xb
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x743
	.uleb128 0x16
	.quad	.LBB17
	.quad	.LBE17-.LBB17
	.uleb128 0xb
	.ascii "j\0"
	.byte	0x40
	.byte	0x15
	.long	0x743
	.byte	0
	.byte	0
	.uleb128 0xe
	.quad	.LBB18
	.quad	.LBE18-.LBB18
	.long	0x2324
	.uleb128 0x2
	.ascii "j\0"
	.byte	0x43
	.byte	0x11
	.long	0x743
	.secrel32	.LLST16
	.secrel32	.LVUS16
	.byte	0
	.uleb128 0x3
	.quad	.LVL73
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xf
	.long	0x540
	.long	0x2340
	.uleb128 0x10
	.long	0x551
	.byte	0x1f
	.byte	0
	.uleb128 0x9
	.ascii "dot_simd<float>\0"
	.byte	0x2d
	.byte	0xc
	.ascii "_Z8dot_simdIfET_PKS0_S2_y\0"
	.long	0x540
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.long	0x23ff
	.uleb128 0x4
	.ascii "T\0"
	.long	0x540
	.uleb128 0x1
	.ascii "x\0"
	.byte	0x2d
	.byte	0x2b
	.long	0x1f19
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x2d
	.byte	0x44
	.long	0x1f19
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x2d
	.byte	0x4e
	.long	0x743
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0x540
	.secrel32	.LLST10
	.secrel32	.LVUS10
	.uleb128 0x8
	.secrel32	.LLRL11
	.long	0x23f3
	.uleb128 0xb
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x743
	.uleb128 0x13
	.secrel32	.LLRL11
	.uleb128 0xb
	.ascii "s\0"
	.byte	0x2e
	.byte	0x7
	.long	0x540
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x30
	.byte	0x11
	.long	0x743
	.secrel32	.LLST12
	.secrel32	.LVUS12
	.byte	0
	.byte	0
	.uleb128 0x3
	.quad	.LVL47
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x9
	.ascii "dot_multiacc<float>\0"
	.byte	0x1a
	.byte	0xc
	.ascii "_Z12dot_multiaccIfET_PKS0_S2_y\0"
	.long	0x540
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0x2504
	.uleb128 0x4
	.ascii "T\0"
	.long	0x540
	.uleb128 0x5
	.ascii "x\0"
	.byte	0x1a
	.byte	0x2f
	.long	0x1f19
	.secrel32	.LLST4
	.secrel32	.LVUS4
	.uleb128 0x1
	.ascii "y\0"
	.byte	0x1a
	.byte	0x48
	.long	0x1f19
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0x1a
	.byte	0x52
	.long	0x743
	.uleb128 0x1
	.byte	0x58
	.uleb128 0xd
	.ascii "K\0"
	.byte	0x1b
	.byte	0x16
	.long	0x753
	.byte	0x8
	.uleb128 0x11
	.ascii "acc\0"
	.byte	0x1c
	.long	0x2504
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x1d
	.byte	0xc
	.long	0x743
	.secrel32	.LLST5
	.secrel32	.LVUS5
	.uleb128 0x2
	.ascii "s\0"
	.byte	0x21
	.byte	0x7
	.long	0x540
	.secrel32	.LLST6
	.secrel32	.LVUS6
	.uleb128 0x8
	.secrel32	.LLRL7
	.long	0x24d1
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x1f
	.byte	0x15
	.long	0x743
	.secrel32	.LLST8
	.secrel32	.LVUS8
	.byte	0
	.uleb128 0xe
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.long	0x24f8
	.uleb128 0x2
	.ascii "k\0"
	.byte	0x22
	.byte	0x11
	.long	0x743
	.secrel32	.LLST9
	.secrel32	.LVUS9
	.byte	0
	.uleb128 0x3
	.quad	.LVL35
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xf
	.long	0x540
	.long	0x2514
	.uleb128 0x10
	.long	0x551
	.byte	0x7
	.byte	0
	.uleb128 0x9
	.ascii "dot_strict<float>\0"
	.byte	0xe
	.byte	0xc
	.ascii "_Z10dot_strictIfET_PKS0_S2_y\0"
	.long	0x540
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0x25d1
	.uleb128 0x4
	.ascii "T\0"
	.long	0x540
	.uleb128 0x5
	.ascii "x\0"
	.byte	0xe
	.byte	0x2d
	.long	0x1f19
	.secrel32	.LLST0
	.secrel32	.LVUS0
	.uleb128 0x1
	.ascii "y\0"
	.byte	0xe
	.byte	0x46
	.long	0x1f19
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.ascii "n\0"
	.byte	0xe
	.byte	0x50
	.long	0x743
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.ascii "s\0"
	.byte	0xf
	.byte	0x7
	.long	0x540
	.secrel32	.LLST1
	.secrel32	.LVUS1
	.uleb128 0x8
	.secrel32	.LLRL2
	.long	0x25ba
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x10
	.byte	0x11
	.long	0x743
	.secrel32	.LLST3
	.secrel32	.LVUS3
	.byte	0
	.uleb128 0x3
	.quad	.LVL6
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3
	.quad	.LVL16
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.byte	0x2
	.ascii "bool\0"
	.uleb128 0xa
	.byte	0x2
	.byte	0x7
	.ascii "wchar_t\0"
	.uleb128 0xa
	.byte	0x2
	.byte	0x10
	.ascii "char16_t\0"
	.uleb128 0xa
	.byte	0x4
	.byte	0x10
	.ascii "char32_t\0"
	.uleb128 0xa
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
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x83
	.uleb128 0x18
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
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
.LVUS115:
	.uleb128 0
	.uleb128 .LVU1324
	.uleb128 .LVU1324
	.uleb128 0
.LLST115:
	.byte	0x6
	.quad	.LVL448
	.byte	0x4
	.uleb128 .LVL448-.LVL448
	.uleb128 .LVL450-.LVL448
	.uleb128 0x1
	.byte	0x62
	.byte	0x4
	.uleb128 .LVL450-.LVL448
	.uleb128 .LFE62-.LVL448
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x12
	.uleb128 0x536
	.byte	0x9f
	.byte	0
.LVUS116:
	.uleb128 0
	.uleb128 .LVU1326
	.uleb128 .LVU1326
	.uleb128 0
.LLST116:
	.byte	0x6
	.quad	.LVL448
	.byte	0x4
	.uleb128 .LVL448-.LVL448
	.uleb128 .LVL451-.LVL448
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL451-.LVL448
	.uleb128 .LFE62-.LVL448
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x13
	.uleb128 0x536
	.byte	0x9f
	.byte	0
.LVUS117:
	.uleb128 .LVU1363
	.uleb128 .LVU1429
.LLST117:
	.byte	0x8
	.quad	.LVL462
	.uleb128 .LVL478-.LVL462
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS118:
	.uleb128 .LVU1363
	.uleb128 .LVU1440
.LLST118:
	.byte	0x8
	.quad	.LVL462
	.uleb128 .LVL482-.LVL462
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LVUS119:
	.uleb128 .LVU1406
	.uleb128 .LVU1408
	.uleb128 .LVU1432
	.uleb128 .LVU1441
.LLST119:
	.byte	0x6
	.quad	.LVL477
	.byte	0x4
	.uleb128 .LVL477-.LVL477
	.uleb128 .LVL477-.LVL477
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL479-.LVL477
	.uleb128 .LVL483-.LVL477
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS120:
	.uleb128 .LVU1435
	.uleb128 .LVU1437
	.uleb128 .LVU1437
	.uleb128 .LVU1442
	.uleb128 .LVU1442
	.uleb128 .LVU1447
.LLST120:
	.byte	0x6
	.quad	.LVL480
	.byte	0x4
	.uleb128 .LVL480-.LVL480
	.uleb128 .LVL481-.LVL480
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0x4
	.uleb128 .LVL481-.LVL480
	.uleb128 .LVL484-.LVL480
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL484-.LVL480
	.uleb128 .LVL485-.LVL480
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LVUS122:
	.uleb128 .LVU1316
	.uleb128 .LVU1318
	.uleb128 .LVU1318
	.uleb128 .LVU1329
	.uleb128 .LVU1329
	.uleb128 .LVU1332
	.uleb128 .LVU1332
	.uleb128 .LVU1338
	.uleb128 .LVU1338
	.uleb128 .LVU1341
	.uleb128 .LVU1341
	.uleb128 .LVU1344
	.uleb128 .LVU1344
	.uleb128 .LVU1347
	.uleb128 .LVU1347
	.uleb128 .LVU1350
	.uleb128 .LVU1350
	.uleb128 .LVU1353
	.uleb128 .LVU1353
	.uleb128 .LVU1356
	.uleb128 .LVU1356
	.uleb128 .LVU1359
	.uleb128 .LVU1359
	.uleb128 .LVU1362
	.uleb128 .LVU1362
	.uleb128 0
.LLST122:
	.byte	0x6
	.quad	.LVL449
	.byte	0x4
	.uleb128 .LVL449-.LVL449
	.uleb128 .LVL449-.LVL449
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL449-.LVL449
	.uleb128 .LVL452-.LVL449
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL452-.LVL449
	.uleb128 .LVL453-.LVL449
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL453-.LVL449
	.uleb128 .LVL454-.LVL449
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL454-.LVL449
	.uleb128 .LVL455-.LVL449
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL455-.LVL449
	.uleb128 .LVL456-.LVL449
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL456-.LVL449
	.uleb128 .LVL457-.LVL449
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL457-.LVL449
	.uleb128 .LVL458-.LVL449
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL458-.LVL449
	.uleb128 .LVL459-.LVL449
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL459-.LVL449
	.uleb128 .LVL460-.LVL449
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL460-.LVL449
	.uleb128 .LVL461-.LVL449
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL461-.LVL449
	.uleb128 .LVL462-.LVL449
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL462-.LVL449
	.uleb128 .LFE62-.LVL449
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS124:
	.uleb128 .LVU1363
	.uleb128 .LVU1366
	.uleb128 .LVU1366
	.uleb128 .LVU1368
	.uleb128 .LVU1368
	.uleb128 .LVU1405
	.uleb128 .LVU1405
	.uleb128 .LVU1406
.LLST124:
	.byte	0x6
	.quad	.LVL462
	.byte	0x4
	.uleb128 .LVL462-.LVL462
	.uleb128 .LVL463-.LVL462
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL463-.LVL462
	.uleb128 .LVL464-.LVL462
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL464-.LVL462
	.uleb128 .LVL476-.LVL462
	.uleb128 0x3
	.byte	0x71
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL476-.LVL462
	.uleb128 .LVL477-.LVL462
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS126:
	.uleb128 .LVU1366
	.uleb128 .LVU1370
	.uleb128 .LVU1370
	.uleb128 .LVU1373
	.uleb128 .LVU1373
	.uleb128 .LVU1376
	.uleb128 .LVU1376
	.uleb128 .LVU1379
	.uleb128 .LVU1379
	.uleb128 .LVU1382
	.uleb128 .LVU1382
	.uleb128 .LVU1385
	.uleb128 .LVU1385
	.uleb128 .LVU1388
	.uleb128 .LVU1388
	.uleb128 .LVU1391
	.uleb128 .LVU1391
	.uleb128 .LVU1394
	.uleb128 .LVU1394
	.uleb128 .LVU1397
	.uleb128 .LVU1397
	.uleb128 .LVU1400
	.uleb128 .LVU1400
	.uleb128 .LVU1403
	.uleb128 .LVU1403
	.uleb128 .LVU1406
.LLST126:
	.byte	0x6
	.quad	.LVL463
	.byte	0x4
	.uleb128 .LVL463-.LVL463
	.uleb128 .LVL465-.LVL463
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL465-.LVL463
	.uleb128 .LVL466-.LVL463
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL466-.LVL463
	.uleb128 .LVL467-.LVL463
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL467-.LVL463
	.uleb128 .LVL468-.LVL463
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL468-.LVL463
	.uleb128 .LVL469-.LVL463
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL469-.LVL463
	.uleb128 .LVL470-.LVL463
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL470-.LVL463
	.uleb128 .LVL471-.LVL463
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL471-.LVL463
	.uleb128 .LVL472-.LVL463
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL472-.LVL463
	.uleb128 .LVL473-.LVL463
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL473-.LVL463
	.uleb128 .LVL474-.LVL463
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL474-.LVL463
	.uleb128 .LVL475-.LVL463
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL475-.LVL463
	.uleb128 .LVL476-.LVL463
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL476-.LVL463
	.uleb128 .LVL477-.LVL463
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS128:
	.uleb128 .LVU1406
	.uleb128 .LVU1409
	.uleb128 .LVU1409
	.uleb128 .LVU1411
	.uleb128 .LVU1411
	.uleb128 .LVU1413
	.uleb128 .LVU1413
	.uleb128 .LVU1415
	.uleb128 .LVU1415
	.uleb128 .LVU1417
	.uleb128 .LVU1417
	.uleb128 .LVU1419
	.uleb128 .LVU1419
	.uleb128 .LVU1421
	.uleb128 .LVU1421
	.uleb128 .LVU1423
	.uleb128 .LVU1423
	.uleb128 .LVU1425
	.uleb128 .LVU1425
	.uleb128 .LVU1427
	.uleb128 .LVU1427
	.uleb128 .LVU1433
	.uleb128 .LVU1433
	.uleb128 0
.LLST128:
	.byte	0x6
	.quad	.LVL477
	.byte	0x4
	.uleb128 .LVL477-.LVL477
	.uleb128 .LVL477-.LVL477
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL477-.LVL477
	.uleb128 .LVL477-.LVL477
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL477-.LVL477
	.uleb128 .LVL477-.LVL477
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL477-.LVL477
	.uleb128 .LVL477-.LVL477
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL477-.LVL477
	.uleb128 .LVL477-.LVL477
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL477-.LVL477
	.uleb128 .LVL477-.LVL477
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL477-.LVL477
	.uleb128 .LVL477-.LVL477
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL477-.LVL477
	.uleb128 .LVL477-.LVL477
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL477-.LVL477
	.uleb128 .LVL477-.LVL477
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL477-.LVL477
	.uleb128 .LVL477-.LVL477
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL477-.LVL477
	.uleb128 .LVL479-.LVL477
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL479-.LVL477
	.uleb128 .LFE62-.LVL477
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS130:
	.uleb128 .LVU1435
	.uleb128 .LVU1438
	.uleb128 .LVU1438
	.uleb128 .LVU1443
	.uleb128 .LVU1443
	.uleb128 .LVU1446
	.uleb128 .LVU1446
	.uleb128 .LVU1448
	.uleb128 .LVU1448
	.uleb128 0
.LLST130:
	.byte	0x6
	.quad	.LVL480
	.byte	0x4
	.uleb128 .LVL480-.LVL480
	.uleb128 .LVL481-.LVL480
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL481-.LVL480
	.uleb128 .LVL484-.LVL480
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL484-.LVL480
	.uleb128 .LVL485-.LVL480
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL485-.LVL480
	.uleb128 .LVL485-.LVL480
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL485-.LVL480
	.uleb128 .LFE62-.LVL480
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0
.LVUS101:
	.uleb128 0
	.uleb128 .LVU1195
	.uleb128 .LVU1195
	.uleb128 0
.LLST101:
	.byte	0x6
	.quad	.LVL410
	.byte	0x4
	.uleb128 .LVL410-.LVL410
	.uleb128 .LVL412-.LVL410
	.uleb128 0x1
	.byte	0x62
	.byte	0x4
	.uleb128 .LVL412-.LVL410
	.uleb128 .LFE61-.LVL410
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x12
	.uleb128 0x540
	.byte	0x9f
	.byte	0
.LVUS102:
	.uleb128 0
	.uleb128 .LVU1197
	.uleb128 .LVU1197
	.uleb128 0
.LLST102:
	.byte	0x6
	.quad	.LVL410
	.byte	0x4
	.uleb128 .LVL410-.LVL410
	.uleb128 .LVL413-.LVL410
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL413-.LVL410
	.uleb128 .LFE61-.LVL410
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x13
	.uleb128 0x540
	.byte	0x9f
	.byte	0
.LVUS103:
	.uleb128 .LVU1234
	.uleb128 .LVU1307
.LLST103:
	.byte	0x8
	.quad	.LVL424
	.uleb128 .LVL443-.LVL424
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS104:
	.uleb128 .LVU1234
	.uleb128 .LVU1300
.LLST104:
	.byte	0x8
	.quad	.LVL424
	.uleb128 .LVL440-.LVL424
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LVUS105:
	.uleb128 .LVU1303
	.uleb128 .LVU1308
.LLST105:
	.byte	0x8
	.quad	.LVL441
	.uleb128 .LVL444-.LVL441
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LVUS106:
	.uleb128 .LVU1305
	.uleb128 .LVU1309
.LLST106:
	.byte	0x8
	.quad	.LVL442
	.uleb128 .LVL445-.LVL442
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0
.LVUS108:
	.uleb128 .LVU1187
	.uleb128 .LVU1189
	.uleb128 .LVU1189
	.uleb128 .LVU1200
	.uleb128 .LVU1200
	.uleb128 .LVU1203
	.uleb128 .LVU1203
	.uleb128 .LVU1209
	.uleb128 .LVU1209
	.uleb128 .LVU1212
	.uleb128 .LVU1212
	.uleb128 .LVU1215
	.uleb128 .LVU1215
	.uleb128 .LVU1218
	.uleb128 .LVU1218
	.uleb128 .LVU1221
	.uleb128 .LVU1221
	.uleb128 .LVU1224
	.uleb128 .LVU1224
	.uleb128 .LVU1227
	.uleb128 .LVU1227
	.uleb128 .LVU1230
	.uleb128 .LVU1230
	.uleb128 .LVU1233
	.uleb128 .LVU1233
	.uleb128 0
.LLST108:
	.byte	0x6
	.quad	.LVL411
	.byte	0x4
	.uleb128 .LVL411-.LVL411
	.uleb128 .LVL411-.LVL411
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL411-.LVL411
	.uleb128 .LVL414-.LVL411
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL414-.LVL411
	.uleb128 .LVL415-.LVL411
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL415-.LVL411
	.uleb128 .LVL416-.LVL411
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL416-.LVL411
	.uleb128 .LVL417-.LVL411
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL417-.LVL411
	.uleb128 .LVL418-.LVL411
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL418-.LVL411
	.uleb128 .LVL419-.LVL411
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL419-.LVL411
	.uleb128 .LVL420-.LVL411
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL420-.LVL411
	.uleb128 .LVL421-.LVL411
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL421-.LVL411
	.uleb128 .LVL422-.LVL411
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL422-.LVL411
	.uleb128 .LVL423-.LVL411
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL423-.LVL411
	.uleb128 .LVL424-.LVL411
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL424-.LVL411
	.uleb128 .LFE61-.LVL411
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS110:
	.uleb128 .LVU1234
	.uleb128 .LVU1237
	.uleb128 .LVU1237
	.uleb128 .LVU1239
	.uleb128 .LVU1239
	.uleb128 .LVU1276
	.uleb128 .LVU1276
	.uleb128 .LVU1277
.LLST110:
	.byte	0x6
	.quad	.LVL424
	.byte	0x4
	.uleb128 .LVL424-.LVL424
	.uleb128 .LVL425-.LVL424
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL425-.LVL424
	.uleb128 .LVL426-.LVL424
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL426-.LVL424
	.uleb128 .LVL438-.LVL424
	.uleb128 0x3
	.byte	0x71
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL438-.LVL424
	.uleb128 .LVL439-.LVL424
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS112:
	.uleb128 .LVU1237
	.uleb128 .LVU1241
	.uleb128 .LVU1241
	.uleb128 .LVU1244
	.uleb128 .LVU1244
	.uleb128 .LVU1247
	.uleb128 .LVU1247
	.uleb128 .LVU1250
	.uleb128 .LVU1250
	.uleb128 .LVU1253
	.uleb128 .LVU1253
	.uleb128 .LVU1256
	.uleb128 .LVU1256
	.uleb128 .LVU1259
	.uleb128 .LVU1259
	.uleb128 .LVU1262
	.uleb128 .LVU1262
	.uleb128 .LVU1265
	.uleb128 .LVU1265
	.uleb128 .LVU1268
	.uleb128 .LVU1268
	.uleb128 .LVU1271
	.uleb128 .LVU1271
	.uleb128 .LVU1274
	.uleb128 .LVU1274
	.uleb128 .LVU1277
.LLST112:
	.byte	0x6
	.quad	.LVL425
	.byte	0x4
	.uleb128 .LVL425-.LVL425
	.uleb128 .LVL427-.LVL425
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL427-.LVL425
	.uleb128 .LVL428-.LVL425
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL428-.LVL425
	.uleb128 .LVL429-.LVL425
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL429-.LVL425
	.uleb128 .LVL430-.LVL425
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL430-.LVL425
	.uleb128 .LVL431-.LVL425
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL431-.LVL425
	.uleb128 .LVL432-.LVL425
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL432-.LVL425
	.uleb128 .LVL433-.LVL425
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL433-.LVL425
	.uleb128 .LVL434-.LVL425
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL434-.LVL425
	.uleb128 .LVL435-.LVL425
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL435-.LVL425
	.uleb128 .LVL436-.LVL425
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL436-.LVL425
	.uleb128 .LVL437-.LVL425
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL437-.LVL425
	.uleb128 .LVL438-.LVL425
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL438-.LVL425
	.uleb128 .LVL439-.LVL425
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS113:
	.uleb128 .LVU1277
	.uleb128 .LVU1280
	.uleb128 .LVU1280
	.uleb128 .LVU1282
	.uleb128 .LVU1282
	.uleb128 .LVU1284
	.uleb128 .LVU1284
	.uleb128 .LVU1286
	.uleb128 .LVU1286
	.uleb128 .LVU1288
	.uleb128 .LVU1288
	.uleb128 .LVU1290
	.uleb128 .LVU1290
	.uleb128 .LVU1292
	.uleb128 .LVU1292
	.uleb128 .LVU1294
	.uleb128 .LVU1294
	.uleb128 .LVU1296
	.uleb128 .LVU1296
	.uleb128 .LVU1298
	.uleb128 .LVU1298
	.uleb128 .LVU1302
	.uleb128 .LVU1302
	.uleb128 0
.LLST113:
	.byte	0x6
	.quad	.LVL439
	.byte	0x4
	.uleb128 .LVL439-.LVL439
	.uleb128 .LVL439-.LVL439
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL439-.LVL439
	.uleb128 .LVL439-.LVL439
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL439-.LVL439
	.uleb128 .LVL439-.LVL439
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL439-.LVL439
	.uleb128 .LVL439-.LVL439
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL439-.LVL439
	.uleb128 .LVL439-.LVL439
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL439-.LVL439
	.uleb128 .LVL439-.LVL439
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL439-.LVL439
	.uleb128 .LVL439-.LVL439
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL439-.LVL439
	.uleb128 .LVL439-.LVL439
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL439-.LVL439
	.uleb128 .LVL439-.LVL439
	.uleb128 0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL439-.LVL439
	.uleb128 .LVL439-.LVL439
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL439-.LVL439
	.uleb128 .LVL441-.LVL439
	.uleb128 0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL441-.LVL439
	.uleb128 .LFE61-.LVL439
	.uleb128 0x2
	.byte	0x3c
	.byte	0x9f
	.byte	0
.LVUS114:
	.uleb128 .LVU1305
	.uleb128 .LVU1306
.LLST114:
	.byte	0x8
	.quad	.LVL442
	.uleb128 .LVL442-.LVL442
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS99:
	.uleb128 0
	.uleb128 .LVU1162
	.uleb128 .LVU1162
	.uleb128 0
.LLST99:
	.byte	0x6
	.quad	.LVL401
	.byte	0x4
	.uleb128 .LVL401-.LVL401
	.uleb128 .LVL406-.LVL401
	.uleb128 0x2
	.byte	0x72
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL406-.LVL401
	.uleb128 .LFE58-.LVL401
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.byte	0
.LVUS100:
	.uleb128 .LVU1152
	.uleb128 .LVU1154
	.uleb128 .LVU1154
	.uleb128 .LVU1157
	.uleb128 .LVU1157
	.uleb128 .LVU1160
	.uleb128 .LVU1160
	.uleb128 .LVU1162
	.uleb128 .LVU1162
	.uleb128 .LVU1163
.LLST100:
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
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL404-.LVL402
	.uleb128 .LVL405-.LVL402
	.uleb128 0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL405-.LVL402
	.uleb128 .LVL406-.LVL402
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL406-.LVL402
	.uleb128 .LVL407-.LVL402
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS98:
	.uleb128 .LVU1116
	.uleb128 .LVU1117
	.uleb128 .LVU1146
	.uleb128 0
.LLST98:
	.byte	0x6
	.quad	.LVL394
	.byte	0x4
	.uleb128 .LVL394-.LVL394
	.uleb128 .LVL395-.LVL394
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL400-.LVL394
	.uleb128 .LFE57-.LVL394
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS92:
	.uleb128 0
	.uleb128 .LVU1075
	.uleb128 .LVU1075
	.uleb128 .LVU1107
	.uleb128 .LVU1107
	.uleb128 .LVU1112
	.uleb128 .LVU1112
	.uleb128 .LVU1113
	.uleb128 .LVU1113
	.uleb128 0
.LLST92:
	.byte	0x6
	.quad	.LVL381
	.byte	0x4
	.uleb128 .LVL381-.LVL381
	.uleb128 .LVL384-.LVL381
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL384-.LVL381
	.uleb128 .LVL388-.LVL381
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL388-.LVL381
	.uleb128 .LVL390-.LVL381
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL390-.LVL381
	.uleb128 .LVL392-.LVL381
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL392-.LVL381
	.uleb128 .LFE56-.LVL381
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS93:
	.uleb128 0
	.uleb128 .LVU1074
	.uleb128 .LVU1074
	.uleb128 0
.LLST93:
	.byte	0x6
	.quad	.LVL381
	.byte	0x4
	.uleb128 .LVL381-.LVL381
	.uleb128 .LVL383-.LVL381
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL383-.LVL381
	.uleb128 .LFE56-.LVL381
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS94:
	.uleb128 0
	.uleb128 .LVU1112
	.uleb128 .LVU1112
	.uleb128 0
.LLST94:
	.byte	0x6
	.quad	.LVL381
	.byte	0x4
	.uleb128 .LVL381-.LVL381
	.uleb128 .LVL390-.LVL381
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.byte	0x4
	.uleb128 .LVL390-.LVL381
	.uleb128 .LFE56-.LVL381
	.uleb128 0x1
	.byte	0x5b
	.byte	0
.LVUS96:
	.uleb128 .LVU1071
	.uleb128 .LVU1076
	.uleb128 .LVU1113
	.uleb128 0
.LLST96:
	.byte	0x6
	.quad	.LVL382
	.byte	0x4
	.uleb128 .LVL382-.LVL382
	.uleb128 .LVL385-.LVL382
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL392-.LVL382
	.uleb128 .LFE56-.LVL382
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS89:
	.uleb128 0
	.uleb128 .LVU1052
	.uleb128 .LVU1052
	.uleb128 .LVU1057
	.uleb128 .LVU1057
	.uleb128 0
.LLST89:
	.byte	0x6
	.quad	.LVL367
	.byte	0x4
	.uleb128 .LVL367-.LVL367
	.uleb128 .LVL372-.LVL367
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL372-.LVL367
	.uleb128 .LVL374-.LVL367
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL374-.LVL367
	.uleb128 .LFE55-.LVL367
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS91:
	.uleb128 .LVU1024
	.uleb128 .LVU1025
	.uleb128 .LVU1057
	.uleb128 .LVU1060
	.uleb128 .LVU1060
	.uleb128 .LVU1062
	.uleb128 .LVU1062
	.uleb128 .LVU1065
	.uleb128 .LVU1065
	.uleb128 .LVU1067
	.uleb128 .LVU1068
	.uleb128 0
.LLST91:
	.byte	0x6
	.quad	.LVL368
	.byte	0x4
	.uleb128 .LVL368-.LVL368
	.uleb128 .LVL369-.LVL368
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL374-.LVL368
	.uleb128 .LVL375-.LVL368
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL375-.LVL368
	.uleb128 .LVL376-.LVL368
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL376-.LVL368
	.uleb128 .LVL377-.LVL368
	.uleb128 0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL377-.LVL368
	.uleb128 .LVL378-.LVL368
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL380-.LVL368
	.uleb128 .LFE55-.LVL368
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS86:
	.uleb128 0
	.uleb128 .LVU1015
	.uleb128 .LVU1015
	.uleb128 .LVU1020
	.uleb128 .LVU1020
	.uleb128 0
.LLST86:
	.byte	0x6
	.quad	.LVL357
	.byte	0x4
	.uleb128 .LVL357-.LVL357
	.uleb128 .LVL362-.LVL357
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL362-.LVL357
	.uleb128 .LVL364-.LVL357
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL364-.LVL357
	.uleb128 .LFE54-.LVL357
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS88:
	.uleb128 .LVU987
	.uleb128 .LVU988
	.uleb128 .LVU1021
	.uleb128 0
.LLST88:
	.byte	0x6
	.quad	.LVL358
	.byte	0x4
	.uleb128 .LVL358-.LVL358
	.uleb128 .LVL359-.LVL358
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL366-.LVL358
	.uleb128 .LFE54-.LVL358
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS81:
	.uleb128 0
	.uleb128 .LVU976
	.uleb128 .LVU976
	.uleb128 .LVU981
	.uleb128 .LVU981
	.uleb128 0
.LLST81:
	.byte	0x6
	.quad	.LVL331
	.byte	0x4
	.uleb128 .LVL331-.LVL331
	.uleb128 .LVL350-.LVL331
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL350-.LVL331
	.uleb128 .LVL353-.LVL331
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL353-.LVL331
	.uleb128 .LFE53-.LVL331
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS82:
	.uleb128 .LVU927
	.uleb128 .LVU928
	.uleb128 .LVU928
	.uleb128 .LVU936
	.uleb128 .LVU936
	.uleb128 .LVU937
	.uleb128 .LVU952
	.uleb128 .LVU954
	.uleb128 .LVU963
	.uleb128 .LVU967
	.uleb128 .LVU967
	.uleb128 .LVU972
	.uleb128 .LVU972
	.uleb128 .LVU974
	.uleb128 .LVU974
	.uleb128 .LVU979
	.uleb128 .LVU979
	.uleb128 .LVU980
	.uleb128 .LVU983
	.uleb128 .LVU984
.LLST82:
	.byte	0x6
	.quad	.LVL333
	.byte	0x4
	.uleb128 .LVL333-.LVL333
	.uleb128 .LVL334-.LVL333
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL334-.LVL333
	.uleb128 .LVL335-.LVL333
	.uleb128 0x3
	.byte	0x70
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL335-.LVL333
	.uleb128 .LVL336-.LVL333
	.uleb128 0x3
	.byte	0x79
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL341-.LVL333
	.uleb128 .LVL342-.LVL333
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL346-.LVL333
	.uleb128 .LVL347-.LVL333
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL347-.LVL333
	.uleb128 .LVL348-.LVL333
	.uleb128 0x3
	.byte	0x73
	.sleb128 1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL348-.LVL333
	.uleb128 .LVL349-.LVL333
	.uleb128 0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL349-.LVL333
	.uleb128 .LVL351-.LVL333
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL351-.LVL333
	.uleb128 .LVL351-.LVL333
	.uleb128 0x3
	.byte	0x73
	.sleb128 1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL355-.LVL333
	.uleb128 .LVL356-.LVL333
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LVUS83:
	.uleb128 .LVU939
	.uleb128 .LVU941
	.uleb128 .LVU952
	.uleb128 .LVU954
	.uleb128 .LVU963
	.uleb128 .LVU980
	.uleb128 .LVU983
	.uleb128 .LVU984
.LLST83:
	.byte	0x6
	.quad	.LVL337
	.byte	0x4
	.uleb128 .LVL337-.LVL337
	.uleb128 .LVL337-.LVL337
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL341-.LVL337
	.uleb128 .LVL342-.LVL337
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL346-.LVL337
	.uleb128 .LVL351-.LVL337
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL355-.LVL337
	.uleb128 .LVL356-.LVL337
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS85:
	.uleb128 .LVU939
	.uleb128 .LVU941
.LLST85:
	.byte	0x8
	.quad	.LVL337
	.uleb128 .LVL337-.LVL337
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS77:
	.uleb128 0
	.uleb128 .LVU911
	.uleb128 .LVU911
	.uleb128 .LVU921
	.uleb128 .LVU921
	.uleb128 0
.LLST77:
	.byte	0x6
	.quad	.LVL316
	.byte	0x4
	.uleb128 .LVL316-.LVL316
	.uleb128 .LVL321-.LVL316
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL321-.LVL316
	.uleb128 .LVL330-.LVL316
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL330-.LVL316
	.uleb128 .LFE52-.LVL316
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS78:
	.uleb128 .LVU887
	.uleb128 .LVU913
	.uleb128 .LVU913
	.uleb128 .LVU914
	.uleb128 .LVU914
	.uleb128 .LVU919
	.uleb128 .LVU921
	.uleb128 0
.LLST78:
	.byte	0x6
	.quad	.LVL317
	.byte	0x4
	.uleb128 .LVL317-.LVL317
	.uleb128 .LVL322-.LVL317
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL322-.LVL317
	.uleb128 .LVL323-.LVL317
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0x4
	.uleb128 .LVL323-.LVL317
	.uleb128 .LVL328-.LVL317
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL330-.LVL317
	.uleb128 .LFE52-.LVL317
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS80:
	.uleb128 .LVU888
	.uleb128 .LVU889
	.uleb128 .LVU921
	.uleb128 0
.LLST80:
	.byte	0x6
	.quad	.LVL318
	.byte	0x4
	.uleb128 .LVL318-.LVL318
	.uleb128 .LVL319-.LVL318
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL330-.LVL318
	.uleb128 .LFE52-.LVL318
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS71:
	.uleb128 0
	.uleb128 .LVU818
	.uleb128 .LVU818
	.uleb128 .LVU873
	.uleb128 .LVU873
	.uleb128 .LVU881
	.uleb128 .LVU881
	.uleb128 0
.LLST71:
	.byte	0x6
	.quad	.LVL293
	.byte	0x4
	.uleb128 .LVL293-.LVL293
	.uleb128 .LVL297-.LVL293
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL297-.LVL293
	.uleb128 .LVL311-.LVL293
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL311-.LVL293
	.uleb128 .LVL314-.LVL293
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL314-.LVL293
	.uleb128 .LFE51-.LVL293
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LVUS72:
	.uleb128 0
	.uleb128 .LVU817
	.uleb128 .LVU817
	.uleb128 .LVU873
	.uleb128 .LVU873
	.uleb128 .LVU877
	.uleb128 .LVU877
	.uleb128 0
.LLST72:
	.byte	0x6
	.quad	.LVL293
	.byte	0x4
	.uleb128 .LVL293-.LVL293
	.uleb128 .LVL296-.LVL293
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL296-.LVL293
	.uleb128 .LVL311-.LVL293
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL311-.LVL293
	.uleb128 .LVL313-.LVL293
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL313-.LVL293
	.uleb128 .LFE51-.LVL293
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LVUS73:
	.uleb128 .LVU813
	.uleb128 .LVU819
	.uleb128 .LVU845
	.uleb128 .LVU846
	.uleb128 .LVU873
	.uleb128 .LVU882
	.uleb128 .LVU882
	.uleb128 0
.LLST73:
	.byte	0x6
	.quad	.LVL295
	.byte	0x4
	.uleb128 .LVL295-.LVL295
	.uleb128 .LVL298-.LVL295
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL301-.LVL295
	.uleb128 .LVL302-.LVL295
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL311-.LVL295
	.uleb128 .LVL315-.LVL295
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL315-.LVL295
	.uleb128 .LFE51-.LVL295
	.uleb128 0x1
	.byte	0x5b
	.byte	0
.LVUS74:
	.uleb128 .LVU841
	.uleb128 .LVU843
	.uleb128 .LVU845
	.uleb128 .LVU846
	.uleb128 .LVU855
	.uleb128 .LVU871
	.uleb128 .LVU873
	.uleb128 .LVU874
	.uleb128 .LVU876
	.uleb128 .LVU882
	.uleb128 .LVU882
	.uleb128 0
.LLST74:
	.byte	0x6
	.quad	.LVL300
	.byte	0x4
	.uleb128 .LVL300-.LVL300
	.uleb128 .LVL300-.LVL300
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL301-.LVL300
	.uleb128 .LVL302-.LVL300
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL306-.LVL300
	.uleb128 .LVL309-.LVL300
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL311-.LVL300
	.uleb128 .LVL311-.LVL300
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL312-.LVL300
	.uleb128 .LVL315-.LVL300
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL315-.LVL300
	.uleb128 .LFE51-.LVL300
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LVUS76:
	.uleb128 .LVU819
	.uleb128 .LVU825
	.uleb128 .LVU825
	.uleb128 .LVU827
	.uleb128 .LVU827
	.uleb128 .LVU829
	.uleb128 .LVU829
	.uleb128 .LVU831
	.uleb128 .LVU831
	.uleb128 .LVU833
	.uleb128 .LVU833
	.uleb128 .LVU835
	.uleb128 .LVU835
	.uleb128 .LVU837
	.uleb128 .LVU837
	.uleb128 .LVU839
	.uleb128 .LVU839
	.uleb128 .LVU850
	.uleb128 .LVU882
	.uleb128 0
.LLST76:
	.byte	0x6
	.quad	.LVL298
	.byte	0x4
	.uleb128 .LVL298-.LVL298
	.uleb128 .LVL299-.LVL298
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL299-.LVL298
	.uleb128 .LVL299-.LVL298
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL299-.LVL298
	.uleb128 .LVL299-.LVL298
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL299-.LVL298
	.uleb128 .LVL299-.LVL298
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL299-.LVL298
	.uleb128 .LVL299-.LVL298
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL299-.LVL298
	.uleb128 .LVL299-.LVL298
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL299-.LVL298
	.uleb128 .LVL299-.LVL298
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL299-.LVL298
	.uleb128 .LVL299-.LVL298
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL299-.LVL298
	.uleb128 .LVL304-.LVL298
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL315-.LVL298
	.uleb128 .LFE51-.LVL298
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0
.LVUS66:
	.uleb128 0
	.uleb128 .LVU774
	.uleb128 .LVU774
	.uleb128 0
.LLST66:
	.byte	0x6
	.quad	.LVL276
	.byte	0x4
	.uleb128 .LVL276-.LVL276
	.uleb128 .LVL278-.LVL276
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL278-.LVL276
	.uleb128 .LFE50-.LVL276
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LVUS67:
	.uleb128 0
	.uleb128 .LVU775
	.uleb128 .LVU775
	.uleb128 .LVU803
	.uleb128 .LVU803
	.uleb128 .LVU805
	.uleb128 .LVU805
	.uleb128 .LVU806
	.uleb128 .LVU806
	.uleb128 .LVU808
	.uleb128 .LVU808
	.uleb128 0
.LLST67:
	.byte	0x6
	.quad	.LVL276
	.byte	0x4
	.uleb128 .LVL276-.LVL276
	.uleb128 .LVL279-.LVL276
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL279-.LVL276
	.uleb128 .LVL288-.LVL276
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL288-.LVL276
	.uleb128 .LVL289-.LVL276
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL289-.LVL276
	.uleb128 .LVL291-.LVL276
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL291-.LVL276
	.uleb128 .LVL292-.LVL276
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL292-.LVL276
	.uleb128 .LFE50-.LVL276
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS68:
	.uleb128 .LVU772
	.uleb128 .LVU776
	.uleb128 .LVU785
	.uleb128 .LVU801
	.uleb128 .LVU803
	.uleb128 .LVU805
	.uleb128 .LVU806
	.uleb128 0
.LLST68:
	.byte	0x6
	.quad	.LVL277
	.byte	0x4
	.uleb128 .LVL277-.LVL277
	.uleb128 .LVL280-.LVL277
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL284-.LVL277
	.uleb128 .LVL287-.LVL277
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL288-.LVL277
	.uleb128 .LVL289-.LVL277
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL291-.LVL277
	.uleb128 .LFE50-.LVL277
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS70:
	.uleb128 .LVU772
	.uleb128 .LVU776
	.uleb128 .LVU803
	.uleb128 .LVU805
	.uleb128 .LVU806
	.uleb128 0
.LLST70:
	.byte	0x6
	.quad	.LVL277
	.byte	0x4
	.uleb128 .LVL277-.LVL277
	.uleb128 .LVL280-.LVL277
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL288-.LVL277
	.uleb128 .LVL289-.LVL277
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL291-.LVL277
	.uleb128 .LFE50-.LVL277
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS64:
	.uleb128 0
	.uleb128 .LVU751
	.uleb128 .LVU751
	.uleb128 0
.LLST64:
	.byte	0x6
	.quad	.LVL267
	.byte	0x4
	.uleb128 .LVL267-.LVL267
	.uleb128 .LVL272-.LVL267
	.uleb128 0x2
	.byte	0x72
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL272-.LVL267
	.uleb128 .LFE47-.LVL267
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.byte	0
.LVUS65:
	.uleb128 .LVU742
	.uleb128 .LVU744
	.uleb128 .LVU744
	.uleb128 .LVU747
	.uleb128 .LVU747
	.uleb128 .LVU749
	.uleb128 .LVU749
	.uleb128 .LVU751
	.uleb128 .LVU751
	.uleb128 .LVU752
.LLST65:
	.byte	0x6
	.quad	.LVL268
	.byte	0x4
	.uleb128 .LVL268-.LVL268
	.uleb128 .LVL269-.LVL268
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL269-.LVL268
	.uleb128 .LVL270-.LVL268
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL270-.LVL268
	.uleb128 .LVL271-.LVL268
	.uleb128 0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL271-.LVL268
	.uleb128 .LVL272-.LVL268
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL272-.LVL268
	.uleb128 .LVL273-.LVL268
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS61:
	.uleb128 0
	.uleb128 .LVU723
	.uleb128 .LVU723
	.uleb128 .LVU735
	.uleb128 .LVU735
	.uleb128 0
.LLST61:
	.byte	0x6
	.quad	.LVL257
	.byte	0x4
	.uleb128 .LVL257-.LVL257
	.uleb128 .LVL261-.LVL257
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL261-.LVL257
	.uleb128 .LVL264-.LVL257
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL264-.LVL257
	.uleb128 .LFE46-.LVL257
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LVUS63:
	.uleb128 .LVU716
	.uleb128 .LVU717
	.uleb128 .LVU736
	.uleb128 0
.LLST63:
	.byte	0x6
	.quad	.LVL258
	.byte	0x4
	.uleb128 .LVL258-.LVL258
	.uleb128 .LVL259-.LVL258
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL266-.LVL258
	.uleb128 .LFE46-.LVL258
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS57:
	.uleb128 0
	.uleb128 .LVU669
	.uleb128 .LVU669
	.uleb128 .LVU706
	.uleb128 .LVU706
	.uleb128 .LVU711
	.uleb128 .LVU711
	.uleb128 .LVU713
	.uleb128 .LVU713
	.uleb128 0
.LLST57:
	.byte	0x6
	.quad	.LVL246
	.byte	0x4
	.uleb128 .LVL246-.LVL246
	.uleb128 .LVL248-.LVL246
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL248-.LVL246
	.uleb128 .LVL251-.LVL246
	.uleb128 0x1
	.byte	0x65
	.byte	0x4
	.uleb128 .LVL251-.LVL246
	.uleb128 .LVL253-.LVL246
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x11
	.uleb128 0x536
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL253-.LVL246
	.uleb128 .LVL256-.LVL246
	.uleb128 0x1
	.byte	0x65
	.byte	0x4
	.uleb128 .LVL256-.LVL246
	.uleb128 .LFE45-.LVL246
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS58:
	.uleb128 0
	.uleb128 .LVU711
	.uleb128 .LVU711
	.uleb128 .LVU712
	.uleb128 .LVU712
	.uleb128 .LVU713
	.uleb128 .LVU713
	.uleb128 0
.LLST58:
	.byte	0x6
	.quad	.LVL246
	.byte	0x4
	.uleb128 .LVL246-.LVL246
	.uleb128 .LVL253-.LVL246
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.byte	0x4
	.uleb128 .LVL253-.LVL246
	.uleb128 .LVL255-.LVL246
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL255-.LVL246
	.uleb128 .LVL256-.LVL246
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.byte	0x4
	.uleb128 .LVL256-.LVL246
	.uleb128 .LFE45-.LVL246
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LVUS60:
	.uleb128 .LVU666
	.uleb128 .LVU669
	.uleb128 .LVU713
	.uleb128 0
.LLST60:
	.byte	0x6
	.quad	.LVL247
	.byte	0x4
	.uleb128 .LVL247-.LVL247
	.uleb128 .LVL248-.LVL247
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL256-.LVL247
	.uleb128 .LFE45-.LVL247
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS52:
	.uleb128 0
	.uleb128 .LVU647
	.uleb128 .LVU647
	.uleb128 .LVU652
	.uleb128 .LVU652
	.uleb128 0
.LLST52:
	.byte	0x6
	.quad	.LVL230
	.byte	0x4
	.uleb128 .LVL230-.LVL230
	.uleb128 .LVL237-.LVL230
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL237-.LVL230
	.uleb128 .LVL239-.LVL230
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x11
	.uleb128 0x536
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL239-.LVL230
	.uleb128 .LFE44-.LVL230
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS53:
	.uleb128 0
	.uleb128 .LVU646
	.uleb128 .LVU646
	.uleb128 .LVU652
	.uleb128 .LVU652
	.uleb128 0
.LLST53:
	.byte	0x6
	.quad	.LVL230
	.byte	0x4
	.uleb128 .LVL230-.LVL230
	.uleb128 .LVL236-.LVL230
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL236-.LVL230
	.uleb128 .LVL239-.LVL230
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL239-.LVL230
	.uleb128 .LFE44-.LVL230
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LVUS54:
	.uleb128 0
	.uleb128 .LVU639
	.uleb128 .LVU639
	.uleb128 .LVU652
	.uleb128 .LVU652
	.uleb128 0
.LLST54:
	.byte	0x6
	.quad	.LVL230
	.byte	0x4
	.uleb128 .LVL230-.LVL230
	.uleb128 .LVL234-.LVL230
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL234-.LVL230
	.uleb128 .LVL239-.LVL230
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL239-.LVL230
	.uleb128 .LFE44-.LVL230
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LVUS56:
	.uleb128 .LVU632
	.uleb128 .LVU633
	.uleb128 .LVU653
	.uleb128 .LVU656
	.uleb128 .LVU656
	.uleb128 .LVU658
	.uleb128 .LVU658
	.uleb128 .LVU661
	.uleb128 .LVU661
	.uleb128 .LVU663
	.uleb128 .LVU663
	.uleb128 0
.LLST56:
	.byte	0x6
	.quad	.LVL231
	.byte	0x4
	.uleb128 .LVL231-.LVL231
	.uleb128 .LVL232-.LVL231
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL241-.LVL231
	.uleb128 .LVL242-.LVL231
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL242-.LVL231
	.uleb128 .LVL243-.LVL231
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL243-.LVL231
	.uleb128 .LVL244-.LVL231
	.uleb128 0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL244-.LVL231
	.uleb128 .LVL245-.LVL231
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL245-.LVL231
	.uleb128 .LFE44-.LVL231
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS47:
	.uleb128 0
	.uleb128 .LVU623
	.uleb128 .LVU623
	.uleb128 .LVU628
	.uleb128 .LVU628
	.uleb128 0
.LLST47:
	.byte	0x6
	.quad	.LVL218
	.byte	0x4
	.uleb128 .LVL218-.LVL218
	.uleb128 .LVL225-.LVL218
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL225-.LVL218
	.uleb128 .LVL227-.LVL218
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x11
	.uleb128 0x536
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL227-.LVL218
	.uleb128 .LFE43-.LVL218
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS48:
	.uleb128 0
	.uleb128 .LVU622
	.uleb128 .LVU622
	.uleb128 .LVU628
	.uleb128 .LVU628
	.uleb128 0
.LLST48:
	.byte	0x6
	.quad	.LVL218
	.byte	0x4
	.uleb128 .LVL218-.LVL218
	.uleb128 .LVL224-.LVL218
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL224-.LVL218
	.uleb128 .LVL227-.LVL218
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL227-.LVL218
	.uleb128 .LFE43-.LVL218
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LVUS49:
	.uleb128 0
	.uleb128 .LVU615
	.uleb128 .LVU615
	.uleb128 .LVU628
	.uleb128 .LVU628
	.uleb128 0
.LLST49:
	.byte	0x6
	.quad	.LVL218
	.byte	0x4
	.uleb128 .LVL218-.LVL218
	.uleb128 .LVL222-.LVL218
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL222-.LVL218
	.uleb128 .LVL227-.LVL218
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL227-.LVL218
	.uleb128 .LFE43-.LVL218
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LVUS51:
	.uleb128 .LVU608
	.uleb128 .LVU609
	.uleb128 .LVU629
	.uleb128 0
.LLST51:
	.byte	0x6
	.quad	.LVL219
	.byte	0x4
	.uleb128 .LVL219-.LVL219
	.uleb128 .LVL220-.LVL219
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL229-.LVL219
	.uleb128 .LFE43-.LVL219
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS43:
	.uleb128 .LVU508
	.uleb128 .LVU509
	.uleb128 .LVU509
	.uleb128 .LVU511
	.uleb128 .LVU511
	.uleb128 .LVU515
	.uleb128 .LVU605
	.uleb128 0
.LLST43:
	.byte	0x6
	.quad	.LVL173
	.byte	0x4
	.uleb128 .LVL173-.LVL173
	.uleb128 .LVL174-.LVL173
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL174-.LVL173
	.uleb128 .LVL175-.LVL173
	.uleb128 0x3
	.byte	0x7b
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL175-.LVL173
	.uleb128 .LVL176-.LVL173
	.uleb128 0x3
	.byte	0x70
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL217-.LVL173
	.uleb128 .LFE42-.LVL173
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS44:
	.uleb128 .LVU517
	.uleb128 .LVU520
	.uleb128 .LVU520
	.uleb128 .LVU523
	.uleb128 .LVU523
	.uleb128 .LVU524
	.uleb128 .LVU524
	.uleb128 .LVU527
	.uleb128 .LVU527
	.uleb128 .LVU528
	.uleb128 .LVU528
	.uleb128 .LVU531
	.uleb128 .LVU531
	.uleb128 .LVU532
	.uleb128 .LVU532
	.uleb128 .LVU535
	.uleb128 .LVU535
	.uleb128 .LVU536
	.uleb128 .LVU536
	.uleb128 .LVU539
	.uleb128 .LVU539
	.uleb128 .LVU540
	.uleb128 .LVU540
	.uleb128 .LVU543
	.uleb128 .LVU544
	.uleb128 .LVU547
	.uleb128 .LVU548
	.uleb128 .LVU551
	.uleb128 .LVU552
	.uleb128 .LVU555
	.uleb128 .LVU556
	.uleb128 .LVU559
	.uleb128 .LVU560
	.uleb128 .LVU563
	.uleb128 .LVU564
	.uleb128 .LVU567
	.uleb128 .LVU568
	.uleb128 .LVU571
	.uleb128 .LVU572
	.uleb128 .LVU575
	.uleb128 .LVU576
	.uleb128 .LVU579
	.uleb128 .LVU580
	.uleb128 .LVU586
	.uleb128 .LVU587
	.uleb128 .LVU605
.LLST44:
	.byte	0x6
	.quad	.LVL177
	.byte	0x4
	.uleb128 .LVL177-.LVL177
	.uleb128 .LVL178-.LVL177
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0x4
	.uleb128 .LVL178-.LVL177
	.uleb128 .LVL179-.LVL177
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL179-.LVL177
	.uleb128 .LVL180-.LVL177
	.uleb128 0x1d
	.byte	0x91
	.sleb128 -336
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0xa4
	.uleb128 0x536
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -328
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL180-.LVL177
	.uleb128 .LVL181-.LVL177
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL181-.LVL177
	.uleb128 .LVL182-.LVL177
	.uleb128 0x2d
	.byte	0x91
	.sleb128 -336
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0xa4
	.uleb128 0x536
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -328
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -320
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -312
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL182-.LVL177
	.uleb128 .LVL183-.LVL177
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL183-.LVL177
	.uleb128 .LVL184-.LVL177
	.uleb128 0x3d
	.byte	0x91
	.sleb128 -336
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0xa4
	.uleb128 0x536
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -328
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -320
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -312
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -304
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -296
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL184-.LVL177
	.uleb128 .LVL185-.LVL177
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL185-.LVL177
	.uleb128 .LVL186-.LVL177
	.uleb128 0x4d
	.byte	0x91
	.sleb128 -336
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0xa4
	.uleb128 0x536
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -328
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -320
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -312
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -304
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -296
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -288
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -280
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL186-.LVL177
	.uleb128 .LVL187-.LVL177
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL187-.LVL177
	.uleb128 .LVL188-.LVL177
	.uleb128 0x5d
	.byte	0x91
	.sleb128 -336
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0xa4
	.uleb128 0x536
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -328
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -320
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -312
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -304
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -296
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -288
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -280
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -272
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -264
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL188-.LVL177
	.uleb128 .LVL189-.LVL177
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL190-.LVL177
	.uleb128 .LVL191-.LVL177
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL192-.LVL177
	.uleb128 .LVL193-.LVL177
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL194-.LVL177
	.uleb128 .LVL195-.LVL177
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL196-.LVL177
	.uleb128 .LVL197-.LVL177
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL198-.LVL177
	.uleb128 .LVL199-.LVL177
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL200-.LVL177
	.uleb128 .LVL201-.LVL177
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL202-.LVL177
	.uleb128 .LVL203-.LVL177
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL204-.LVL177
	.uleb128 .LVL205-.LVL177
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL206-.LVL177
	.uleb128 .LVL207-.LVL177
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL208-.LVL177
	.uleb128 .LVL210-.LVL177
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL211-.LVL177
	.uleb128 .LVL217-.LVL177
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS46:
	.uleb128 .LVU517
	.uleb128 .LVU519
.LLST46:
	.byte	0x8
	.quad	.LVL177
	.uleb128 .LVL177-.LVL177
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS40:
	.uleb128 .LVU490
	.uleb128 .LVU501
	.uleb128 .LVU501
	.uleb128 .LVU502
	.uleb128 .LVU504
	.uleb128 0
.LLST40:
	.byte	0x6
	.quad	.LVL162
	.byte	0x4
	.uleb128 .LVL162-.LVL162
	.uleb128 .LVL167-.LVL162
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0x4
	.uleb128 .LVL167-.LVL162
	.uleb128 .LVL168-.LVL162
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL170-.LVL162
	.uleb128 .LFE41-.LVL162
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0
.LVUS42:
	.uleb128 .LVU491
	.uleb128 .LVU492
	.uleb128 .LVU504
	.uleb128 0
.LLST42:
	.byte	0x6
	.quad	.LVL163
	.byte	0x4
	.uleb128 .LVL163-.LVL163
	.uleb128 .LVL164-.LVL163
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL170-.LVL163
	.uleb128 .LFE41-.LVL163
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS35:
	.uleb128 0
	.uleb128 .LVU427
	.uleb128 .LVU427
	.uleb128 0
.LLST35:
	.byte	0x6
	.quad	.LVL138
	.byte	0x4
	.uleb128 .LVL138-.LVL138
	.uleb128 .LVL141-.LVL138
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL141-.LVL138
	.uleb128 .LFE40-.LVL138
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS36:
	.uleb128 .LVU426
	.uleb128 .LVU428
	.uleb128 .LVU487
	.uleb128 0
.LLST36:
	.byte	0x6
	.quad	.LVL140
	.byte	0x4
	.uleb128 .LVL140-.LVL140
	.uleb128 .LVL142-.LVL140
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL160-.LVL140
	.uleb128 .LFE40-.LVL140
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS37:
	.uleb128 .LVU447
	.uleb128 .LVU450
	.uleb128 .LVU450
	.uleb128 .LVU453
	.uleb128 .LVU453
	.uleb128 .LVU454
	.uleb128 .LVU454
	.uleb128 .LVU457
	.uleb128 .LVU457
	.uleb128 .LVU458
	.uleb128 .LVU458
	.uleb128 .LVU461
	.uleb128 .LVU461
	.uleb128 .LVU462
	.uleb128 .LVU462
	.uleb128 .LVU467
	.uleb128 .LVU469
	.uleb128 .LVU487
.LLST37:
	.byte	0x6
	.quad	.LVL144
	.byte	0x4
	.uleb128 .LVL144-.LVL144
	.uleb128 .LVL145-.LVL144
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0x4
	.uleb128 .LVL145-.LVL144
	.uleb128 .LVL146-.LVL144
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL146-.LVL144
	.uleb128 .LVL147-.LVL144
	.uleb128 0x1d
	.byte	0x91
	.sleb128 -96
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0xa4
	.uleb128 0x536
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -88
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL147-.LVL144
	.uleb128 .LVL148-.LVL144
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL148-.LVL144
	.uleb128 .LVL149-.LVL144
	.uleb128 0x2d
	.byte	0x91
	.sleb128 -96
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0xa4
	.uleb128 0x536
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -88
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -80
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -72
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL149-.LVL144
	.uleb128 .LVL150-.LVL144
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL150-.LVL144
	.uleb128 .LVL151-.LVL144
	.uleb128 0x3b
	.byte	0x91
	.sleb128 -96
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0xa4
	.uleb128 0x536
	.byte	0x8
	.long	0
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -88
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -80
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -72
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -64
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x91
	.sleb128 -56
	.byte	0xa6
	.byte	0x8
	.uleb128 0x536
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL151-.LVL144
	.uleb128 .LVL153-.LVL144
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL154-.LVL144
	.uleb128 .LVL160-.LVL144
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS38:
	.uleb128 .LVU428
	.uleb128 .LVU431
	.uleb128 .LVU431
	.uleb128 .LVU433
	.uleb128 .LVU433
	.uleb128 .LVU435
	.uleb128 .LVU435
	.uleb128 .LVU437
	.uleb128 .LVU437
	.uleb128 .LVU439
	.uleb128 .LVU439
	.uleb128 .LVU441
	.uleb128 .LVU441
	.uleb128 .LVU443
	.uleb128 .LVU443
	.uleb128 .LVU445
	.uleb128 .LVU445
	.uleb128 .LVU447
.LLST38:
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
	.uleb128 .LVL143-.LVL142
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL143-.LVL142
	.uleb128 .LVL143-.LVL142
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL143-.LVL142
	.uleb128 .LVL143-.LVL142
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL143-.LVL142
	.uleb128 .LVL143-.LVL142
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL143-.LVL142
	.uleb128 .LVL143-.LVL142
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL143-.LVL142
	.uleb128 .LVL143-.LVL142
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL143-.LVL142
	.uleb128 .LVL143-.LVL142
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL143-.LVL142
	.uleb128 .LVL144-.LVL142
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0
.LVUS39:
	.uleb128 .LVU447
	.uleb128 .LVU449
.LLST39:
	.byte	0x8
	.quad	.LVL144
	.uleb128 .LVL144-.LVL144
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS32:
	.uleb128 .LVU393
	.uleb128 .LVU395
	.uleb128 .LVU395
	.uleb128 .LVU396
	.uleb128 .LVU398
	.uleb128 .LVU417
	.uleb128 .LVU417
	.uleb128 0
.LLST32:
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
	.uleb128 .LVL131-.LVL128
	.uleb128 .LVL137-.LVL128
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL137-.LVL128
	.uleb128 .LFE39-.LVL128
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0
.LVUS34:
	.uleb128 .LVU393
	.uleb128 .LVU395
	.uleb128 .LVU417
	.uleb128 0
.LLST34:
	.byte	0x6
	.quad	.LVL128
	.byte	0x4
	.uleb128 .LVL128-.LVL128
	.uleb128 .LVL129-.LVL128
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL137-.LVL128
	.uleb128 .LFE39-.LVL128
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS30:
	.uleb128 0
	.uleb128 .LVU372
	.uleb128 .LVU372
	.uleb128 0
.LLST30:
	.byte	0x6
	.quad	.LVL118
	.byte	0x4
	.uleb128 .LVL118-.LVL118
	.uleb128 .LVL123-.LVL118
	.uleb128 0x2
	.byte	0x72
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL123-.LVL118
	.uleb128 .LFE36-.LVL118
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.byte	0
.LVUS31:
	.uleb128 .LVU363
	.uleb128 .LVU365
	.uleb128 .LVU365
	.uleb128 .LVU368
	.uleb128 .LVU368
	.uleb128 .LVU370
	.uleb128 .LVU370
	.uleb128 .LVU372
	.uleb128 .LVU372
	.uleb128 .LVU373
.LLST31:
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
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL121-.LVL119
	.uleb128 .LVL122-.LVL119
	.uleb128 0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL122-.LVL119
	.uleb128 .LVL123-.LVL119
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL123-.LVL119
	.uleb128 .LVL124-.LVL119
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS29:
	.uleb128 .LVU327
	.uleb128 .LVU328
	.uleb128 .LVU357
	.uleb128 0
.LLST29:
	.byte	0x6
	.quad	.LVL111
	.byte	0x4
	.uleb128 .LVL111-.LVL111
	.uleb128 .LVL112-.LVL111
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL117-.LVL111
	.uleb128 .LFE35-.LVL111
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS23:
	.uleb128 0
	.uleb128 .LVU287
	.uleb128 .LVU287
	.uleb128 .LVU318
	.uleb128 .LVU318
	.uleb128 .LVU323
	.uleb128 .LVU323
	.uleb128 .LVU324
	.uleb128 .LVU324
	.uleb128 0
.LLST23:
	.byte	0x6
	.quad	.LVL99
	.byte	0x4
	.uleb128 .LVL99-.LVL99
	.uleb128 .LVL102-.LVL99
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL102-.LVL99
	.uleb128 .LVL105-.LVL99
	.uleb128 0x1
	.byte	0x64
	.byte	0x4
	.uleb128 .LVL105-.LVL99
	.uleb128 .LVL107-.LVL99
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x11
	.uleb128 0x540
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL107-.LVL99
	.uleb128 .LVL109-.LVL99
	.uleb128 0x1
	.byte	0x64
	.byte	0x4
	.uleb128 .LVL109-.LVL99
	.uleb128 .LFE34-.LVL99
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS24:
	.uleb128 0
	.uleb128 .LVU286
	.uleb128 .LVU286
	.uleb128 0
.LLST24:
	.byte	0x6
	.quad	.LVL99
	.byte	0x4
	.uleb128 .LVL99-.LVL99
	.uleb128 .LVL101-.LVL99
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL101-.LVL99
	.uleb128 .LFE34-.LVL99
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS25:
	.uleb128 0
	.uleb128 .LVU323
	.uleb128 .LVU323
	.uleb128 0
.LLST25:
	.byte	0x6
	.quad	.LVL99
	.byte	0x4
	.uleb128 .LVL99-.LVL99
	.uleb128 .LVL107-.LVL99
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.byte	0x4
	.uleb128 .LVL107-.LVL99
	.uleb128 .LFE34-.LVL99
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LVUS27:
	.uleb128 .LVU283
	.uleb128 .LVU287
	.uleb128 .LVU324
	.uleb128 0
.LLST27:
	.byte	0x6
	.quad	.LVL100
	.byte	0x4
	.uleb128 .LVL100-.LVL100
	.uleb128 .LVL102-.LVL100
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL109-.LVL100
	.uleb128 .LFE34-.LVL100
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS20:
	.uleb128 0
	.uleb128 .LVU264
	.uleb128 .LVU264
	.uleb128 .LVU269
	.uleb128 .LVU269
	.uleb128 0
.LLST20:
	.byte	0x6
	.quad	.LVL85
	.byte	0x4
	.uleb128 .LVL85-.LVL85
	.uleb128 .LVL90-.LVL85
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL90-.LVL85
	.uleb128 .LVL92-.LVL85
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x11
	.uleb128 0x540
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL92-.LVL85
	.uleb128 .LFE33-.LVL85
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS22:
	.uleb128 .LVU236
	.uleb128 .LVU237
	.uleb128 .LVU269
	.uleb128 .LVU272
	.uleb128 .LVU272
	.uleb128 .LVU274
	.uleb128 .LVU274
	.uleb128 .LVU277
	.uleb128 .LVU277
	.uleb128 .LVU279
	.uleb128 .LVU280
	.uleb128 0
.LLST22:
	.byte	0x6
	.quad	.LVL86
	.byte	0x4
	.uleb128 .LVL86-.LVL86
	.uleb128 .LVL87-.LVL86
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL92-.LVL86
	.uleb128 .LVL93-.LVL86
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL93-.LVL86
	.uleb128 .LVL94-.LVL86
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL94-.LVL86
	.uleb128 .LVL95-.LVL86
	.uleb128 0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL95-.LVL86
	.uleb128 .LVL96-.LVL86
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL98-.LVL86
	.uleb128 .LFE33-.LVL86
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS17:
	.uleb128 0
	.uleb128 .LVU227
	.uleb128 .LVU227
	.uleb128 .LVU232
	.uleb128 .LVU232
	.uleb128 0
.LLST17:
	.byte	0x6
	.quad	.LVL75
	.byte	0x4
	.uleb128 .LVL75-.LVL75
	.uleb128 .LVL80-.LVL75
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL80-.LVL75
	.uleb128 .LVL82-.LVL75
	.uleb128 0x7
	.byte	0xa3
	.uleb128 0x4
	.byte	0xa5
	.uleb128 0x11
	.uleb128 0x540
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL82-.LVL75
	.uleb128 .LFE32-.LVL75
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS19:
	.uleb128 .LVU199
	.uleb128 .LVU200
	.uleb128 .LVU233
	.uleb128 0
.LLST19:
	.byte	0x6
	.quad	.LVL76
	.byte	0x4
	.uleb128 .LVL76-.LVL76
	.uleb128 .LVL77-.LVL76
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL84-.LVL76
	.uleb128 .LFE32-.LVL76
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS13:
	.uleb128 0
	.uleb128 .LVU139
	.uleb128 .LVU139
	.uleb128 0
.LLST13:
	.byte	0x6
	.quad	.LVL49
	.byte	0x4
	.uleb128 .LVL49-.LVL49
	.uleb128 .LVL51-.LVL49
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL51-.LVL49
	.uleb128 .LFE31-.LVL49
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS14:
	.uleb128 .LVU140
	.uleb128 .LVU141
	.uleb128 .LVU141
	.uleb128 .LVU142
	.uleb128 .LVU142
	.uleb128 .LVU144
	.uleb128 .LVU144
	.uleb128 .LVU145
	.uleb128 .LVU166
	.uleb128 .LVU168
	.uleb128 .LVU196
	.uleb128 0
.LLST14:
	.byte	0x6
	.quad	.LVL52
	.byte	0x4
	.uleb128 .LVL52-.LVL52
	.uleb128 .LVL53-.LVL52
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL53-.LVL52
	.uleb128 .LVL54-.LVL52
	.uleb128 0x3
	.byte	0x79
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL54-.LVL52
	.uleb128 .LVL55-.LVL52
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL55-.LVL52
	.uleb128 .LVL56-.LVL52
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL63-.LVL52
	.uleb128 .LVL64-.LVL52
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL74-.LVL52
	.uleb128 .LFE31-.LVL52
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS15:
	.uleb128 .LVU145
	.uleb128 .LVU149
	.uleb128 .LVU149
	.uleb128 .LVU152
	.uleb128 .LVU152
	.uleb128 .LVU154
	.uleb128 .LVU154
	.uleb128 .LVU157
	.uleb128 .LVU159
	.uleb128 .LVU162
	.uleb128 .LVU164
	.uleb128 .LVU169
	.uleb128 .LVU171
	.uleb128 .LVU176
	.uleb128 .LVU178
	.uleb128 0
.LLST15:
	.byte	0x6
	.quad	.LVL56
	.byte	0x4
	.uleb128 .LVL56-.LVL56
	.uleb128 .LVL57-.LVL56
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x4
	.uleb128 .LVL57-.LVL56
	.uleb128 .LVL58-.LVL56
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL58-.LVL56
	.uleb128 .LVL59-.LVL56
	.uleb128 0x49
	.byte	0x91
	.sleb128 -160
	.byte	0xa6
	.byte	0x4
	.uleb128 0x540
	.byte	0xa4
	.uleb128 0x540
	.byte	0x4
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -156
	.byte	0xa6
	.byte	0x4
	.uleb128 0x540
	.byte	0x22
	.byte	0x91
	.sleb128 -152
	.byte	0xa6
	.byte	0x4
	.uleb128 0x540
	.byte	0x22
	.byte	0x91
	.sleb128 -148
	.byte	0xa6
	.byte	0x4
	.uleb128 0x540
	.byte	0x22
	.byte	0x91
	.sleb128 -144
	.byte	0xa6
	.byte	0x4
	.uleb128 0x540
	.byte	0x22
	.byte	0x91
	.sleb128 -140
	.byte	0xa6
	.byte	0x4
	.uleb128 0x540
	.byte	0x22
	.byte	0x91
	.sleb128 -136
	.byte	0xa6
	.byte	0x4
	.uleb128 0x540
	.byte	0x22
	.byte	0x91
	.sleb128 -132
	.byte	0xa6
	.byte	0x4
	.uleb128 0x540
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL59-.LVL56
	.uleb128 .LVL60-.LVL56
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL61-.LVL56
	.uleb128 .LVL62-.LVL56
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL63-.LVL56
	.uleb128 .LVL65-.LVL56
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL66-.LVL56
	.uleb128 .LVL67-.LVL56
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL68-.LVL56
	.uleb128 .LFE31-.LVL56
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS16:
	.uleb128 .LVU145
	.uleb128 .LVU147
.LLST16:
	.byte	0x8
	.quad	.LVL56
	.uleb128 .LVL56-.LVL56
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS10:
	.uleb128 .LVU108
	.uleb128 .LVU128
	.uleb128 .LVU128
	.uleb128 .LVU129
	.uleb128 .LVU129
	.uleb128 .LVU130
	.uleb128 .LVU132
	.uleb128 0
.LLST10:
	.byte	0x6
	.quad	.LVL39
	.byte	0x4
	.uleb128 .LVL39-.LVL39
	.uleb128 .LVL44-.LVL39
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x4
	.uleb128 .LVL44-.LVL39
	.uleb128 .LVL45-.LVL39
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL45-.LVL39
	.uleb128 .LVL46-.LVL39
	.uleb128 0x25
	.byte	0x91
	.sleb128 -48
	.byte	0xa6
	.byte	0x4
	.uleb128 0x540
	.byte	0xa4
	.uleb128 0x540
	.byte	0x4
	.long	0
	.byte	0x22
	.byte	0x91
	.sleb128 -44
	.byte	0xa6
	.byte	0x4
	.uleb128 0x540
	.byte	0x22
	.byte	0x91
	.sleb128 -40
	.byte	0xa6
	.byte	0x4
	.uleb128 0x540
	.byte	0x22
	.byte	0x91
	.sleb128 -36
	.byte	0xa6
	.byte	0x4
	.uleb128 0x540
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL48-.LVL39
	.uleb128 .LFE30-.LVL39
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0
.LVUS12:
	.uleb128 .LVU109
	.uleb128 .LVU110
	.uleb128 .LVU132
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
	.uleb128 .LVL48-.LVL40
	.uleb128 .LFE30-.LVL40
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS4:
	.uleb128 0
	.uleb128 .LVU46
	.uleb128 .LVU46
	.uleb128 0
.LLST4:
	.byte	0x6
	.quad	.LVL18
	.byte	0x4
	.uleb128 .LVL18-.LVL18
	.uleb128 .LVL21-.LVL18
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL21-.LVL18
	.uleb128 .LFE29-.LVL18
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS5:
	.uleb128 .LVU42
	.uleb128 .LVU47
	.uleb128 .LVU74
	.uleb128 .LVU76
	.uleb128 .LVU104
	.uleb128 .LVU105
	.uleb128 .LVU105
	.uleb128 0
.LLST5:
	.byte	0x6
	.quad	.LVL20
	.byte	0x4
	.uleb128 .LVL20-.LVL20
	.uleb128 .LVL22-.LVL20
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL25-.LVL20
	.uleb128 .LVL26-.LVL20
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL36-.LVL20
	.uleb128 .LVL37-.LVL20
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL37-.LVL20
	.uleb128 .LFE29-.LVL20
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS6:
	.uleb128 .LVU68
	.uleb128 .LVU72
	.uleb128 .LVU72
	.uleb128 .LVU77
	.uleb128 .LVU79
	.uleb128 .LVU84
	.uleb128 .LVU86
	.uleb128 .LVU104
	.uleb128 .LVU105
	.uleb128 0
.LLST6:
	.byte	0x6
	.quad	.LVL24
	.byte	0x4
	.uleb128 .LVL24-.LVL24
	.uleb128 .LVL25-.LVL24
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x4
	.uleb128 .LVL25-.LVL24
	.uleb128 .LVL27-.LVL24
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL28-.LVL24
	.uleb128 .LVL29-.LVL24
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL30-.LVL24
	.uleb128 .LVL36-.LVL24
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL37-.LVL24
	.uleb128 .LFE29-.LVL24
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS8:
	.uleb128 .LVU47
	.uleb128 .LVU52
	.uleb128 .LVU52
	.uleb128 .LVU54
	.uleb128 .LVU54
	.uleb128 .LVU56
	.uleb128 .LVU56
	.uleb128 .LVU58
	.uleb128 .LVU58
	.uleb128 .LVU60
	.uleb128 .LVU60
	.uleb128 .LVU62
	.uleb128 .LVU62
	.uleb128 .LVU64
	.uleb128 .LVU64
	.uleb128 .LVU66
	.uleb128 .LVU66
	.uleb128 .LVU68
.LLST8:
	.byte	0x6
	.quad	.LVL22
	.byte	0x4
	.uleb128 .LVL22-.LVL22
	.uleb128 .LVL23-.LVL22
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL22
	.uleb128 .LVL23-.LVL22
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL22
	.uleb128 .LVL23-.LVL22
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL22
	.uleb128 .LVL23-.LVL22
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL22
	.uleb128 .LVL23-.LVL22
	.uleb128 0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL22
	.uleb128 .LVL23-.LVL22
	.uleb128 0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL22
	.uleb128 .LVL23-.LVL22
	.uleb128 0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL22
	.uleb128 .LVL23-.LVL22
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL22
	.uleb128 .LVL24-.LVL22
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0
.LVUS9:
	.uleb128 .LVU68
	.uleb128 .LVU70
.LLST9:
	.byte	0x8
	.quad	.LVL24
	.uleb128 .LVL24-.LVL24
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS0:
	.uleb128 0
	.uleb128 .LVU5
	.uleb128 .LVU5
	.uleb128 0
.LLST0:
	.byte	0x6
	.quad	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL2-.LVL0
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL2-.LVL0
	.uleb128 .LFE28-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS1:
	.uleb128 .LVU2
	.uleb128 .LVU7
	.uleb128 .LVU7
	.uleb128 .LVU8
	.uleb128 .LVU10
	.uleb128 .LVU12
	.uleb128 .LVU13
	.uleb128 .LVU14
	.uleb128 .LVU16
	.uleb128 .LVU34
	.uleb128 .LVU34
	.uleb128 .LVU36
	.uleb128 .LVU36
	.uleb128 .LVU37
	.uleb128 .LVU37
	.uleb128 0
.LLST1:
	.byte	0x6
	.quad	.LVL1
	.byte	0x4
	.uleb128 .LVL1-.LVL1
	.uleb128 .LVL3-.LVL1
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x4
	.uleb128 .LVL3-.LVL1
	.uleb128 .LVL4-.LVL1
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL5-.LVL1
	.uleb128 .LVL6-.LVL1
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL7-.LVL1
	.uleb128 .LVL8-.LVL1
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL9-.LVL1
	.uleb128 .LVL14-.LVL1
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL14-.LVL1
	.uleb128 .LVL15-.LVL1
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x4
	.uleb128 .LVL15-.LVL1
	.uleb128 .LVL17-.LVL1
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL17-.LVL1
	.uleb128 .LFE28-.LVL1
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0
.LVUS3:
	.uleb128 .LVU2
	.uleb128 .LVU7
	.uleb128 .LVU34
	.uleb128 .LVU36
	.uleb128 .LVU37
	.uleb128 0
.LLST3:
	.byte	0x6
	.quad	.LVL1
	.byte	0x4
	.uleb128 .LVL1-.LVL1
	.uleb128 .LVL3-.LVL1
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL14-.LVL1
	.uleb128 .LVL15-.LVL1
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL17-.LVL1
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
.LLRL2:
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
	.byte	0x4
	.uleb128 .LBB5-.LBB2
	.uleb128 .LBE5-.LBB2
	.byte	0
.LLRL7:
	.byte	0x5
	.quad	.LBB7
	.byte	0x4
	.uleb128 .LBB7-.LBB7
	.uleb128 .LBE7-.LBB7
	.byte	0x4
	.uleb128 .LBB8-.LBB7
	.uleb128 .LBE8-.LBB7
	.byte	0
.LLRL11:
	.byte	0x5
	.quad	.LBB11
	.byte	0x4
	.uleb128 .LBB11-.LBB11
	.uleb128 .LBE11-.LBB11
	.byte	0x4
	.uleb128 .LBB14-.LBB11
	.uleb128 .LBE14-.LBB11
	.byte	0
.LLRL18:
	.byte	0x5
	.quad	.LBB19
	.byte	0x4
	.uleb128 .LBB19-.LBB19
	.uleb128 .LBE19-.LBB19
	.byte	0x4
	.uleb128 .LBB20-.LBB19
	.uleb128 .LBE20-.LBB19
	.byte	0
.LLRL21:
	.byte	0x5
	.quad	.LBB21
	.byte	0x4
	.uleb128 .LBB21-.LBB21
	.uleb128 .LBE21-.LBB21
	.byte	0x4
	.uleb128 .LBB22-.LBB21
	.uleb128 .LBE22-.LBB21
	.byte	0x4
	.uleb128 .LBB23-.LBB21
	.uleb128 .LBE23-.LBB21
	.byte	0
.LLRL26:
	.byte	0x5
	.quad	.LBB24
	.byte	0x4
	.uleb128 .LBB24-.LBB24
	.uleb128 .LBE24-.LBB24
	.byte	0x4
	.uleb128 .LBB25-.LBB24
	.uleb128 .LBE25-.LBB24
	.byte	0x4
	.uleb128 .LBB26-.LBB24
	.uleb128 .LBE26-.LBB24
	.byte	0
.LLRL28:
	.byte	0x5
	.quad	.LBB27
	.byte	0x4
	.uleb128 .LBB27-.LBB27
	.uleb128 .LBE27-.LBB27
	.byte	0x4
	.uleb128 .LBB28-.LBB27
	.uleb128 .LBE28-.LBB27
	.byte	0
.LLRL33:
	.byte	0x5
	.quad	.LBB30
	.byte	0x4
	.uleb128 .LBB30-.LBB30
	.uleb128 .LBE30-.LBB30
	.byte	0x4
	.uleb128 .LBB31-.LBB30
	.uleb128 .LBE31-.LBB30
	.byte	0x4
	.uleb128 .LBB32-.LBB30
	.uleb128 .LBE32-.LBB30
	.byte	0
.LLRL41:
	.byte	0x5
	.quad	.LBB36
	.byte	0x4
	.uleb128 .LBB36-.LBB36
	.uleb128 .LBE36-.LBB36
	.byte	0x4
	.uleb128 .LBB39-.LBB36
	.uleb128 .LBE39-.LBB36
	.byte	0
.LLRL45:
	.byte	0x5
	.quad	.LBB41
	.byte	0x4
	.uleb128 .LBB41-.LBB41
	.uleb128 .LBE41-.LBB41
	.byte	0x4
	.uleb128 .LBB45-.LBB41
	.uleb128 .LBE45-.LBB41
	.byte	0x4
	.uleb128 .LBB46-.LBB41
	.uleb128 .LBE46-.LBB41
	.byte	0
.LLRL50:
	.byte	0x5
	.quad	.LBB48
	.byte	0x4
	.uleb128 .LBB48-.LBB48
	.uleb128 .LBE48-.LBB48
	.byte	0x4
	.uleb128 .LBB49-.LBB48
	.uleb128 .LBE49-.LBB48
	.byte	0
.LLRL55:
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
.LLRL59:
	.byte	0x5
	.quad	.LBB53
	.byte	0x4
	.uleb128 .LBB53-.LBB53
	.uleb128 .LBE53-.LBB53
	.byte	0x4
	.uleb128 .LBB54-.LBB53
	.uleb128 .LBE54-.LBB53
	.byte	0x4
	.uleb128 .LBB55-.LBB53
	.uleb128 .LBE55-.LBB53
	.byte	0
.LLRL62:
	.byte	0x5
	.quad	.LBB56
	.byte	0x4
	.uleb128 .LBB56-.LBB56
	.uleb128 .LBE56-.LBB56
	.byte	0x4
	.uleb128 .LBB57-.LBB56
	.uleb128 .LBE57-.LBB56
	.byte	0
.LLRL69:
	.byte	0x5
	.quad	.LBB59
	.byte	0x4
	.uleb128 .LBB59-.LBB59
	.uleb128 .LBE59-.LBB59
	.byte	0x4
	.uleb128 .LBB60-.LBB59
	.uleb128 .LBE60-.LBB59
	.byte	0x4
	.uleb128 .LBB61-.LBB59
	.uleb128 .LBE61-.LBB59
	.byte	0
.LLRL75:
	.byte	0x5
	.quad	.LBB63
	.byte	0x4
	.uleb128 .LBB63-.LBB63
	.uleb128 .LBE63-.LBB63
	.byte	0x4
	.uleb128 .LBB64-.LBB63
	.uleb128 .LBE64-.LBB63
	.byte	0
.LLRL79:
	.byte	0x5
	.quad	.LBB66
	.byte	0x4
	.uleb128 .LBB66-.LBB66
	.uleb128 .LBE66-.LBB66
	.byte	0x4
	.uleb128 .LBB69-.LBB66
	.uleb128 .LBE69-.LBB66
	.byte	0
.LLRL84:
	.byte	0x5
	.quad	.LBB71
	.byte	0x4
	.uleb128 .LBB71-.LBB71
	.uleb128 .LBE71-.LBB71
	.byte	0x4
	.uleb128 .LBB74-.LBB71
	.uleb128 .LBE74-.LBB71
	.byte	0
.LLRL87:
	.byte	0x5
	.quad	.LBB76
	.byte	0x4
	.uleb128 .LBB76-.LBB76
	.uleb128 .LBE76-.LBB76
	.byte	0x4
	.uleb128 .LBB77-.LBB76
	.uleb128 .LBE77-.LBB76
	.byte	0
.LLRL90:
	.byte	0x5
	.quad	.LBB78
	.byte	0x4
	.uleb128 .LBB78-.LBB78
	.uleb128 .LBE78-.LBB78
	.byte	0x4
	.uleb128 .LBB79-.LBB78
	.uleb128 .LBE79-.LBB78
	.byte	0x4
	.uleb128 .LBB80-.LBB78
	.uleb128 .LBE80-.LBB78
	.byte	0
.LLRL95:
	.byte	0x5
	.quad	.LBB81
	.byte	0x4
	.uleb128 .LBB81-.LBB81
	.uleb128 .LBE81-.LBB81
	.byte	0x4
	.uleb128 .LBB82-.LBB81
	.uleb128 .LBE82-.LBB81
	.byte	0x4
	.uleb128 .LBB83-.LBB81
	.uleb128 .LBE83-.LBB81
	.byte	0
.LLRL97:
	.byte	0x5
	.quad	.LBB84
	.byte	0x4
	.uleb128 .LBB84-.LBB84
	.uleb128 .LBE84-.LBB84
	.byte	0x4
	.uleb128 .LBB85-.LBB84
	.uleb128 .LBE85-.LBB84
	.byte	0
.LLRL107:
	.byte	0x5
	.quad	.LBB87
	.byte	0x4
	.uleb128 .LBB87-.LBB87
	.uleb128 .LBE87-.LBB87
	.byte	0x4
	.uleb128 .LBB88-.LBB87
	.uleb128 .LBE88-.LBB87
	.byte	0x4
	.uleb128 .LBB92-.LBB87
	.uleb128 .LBE92-.LBB87
	.byte	0x4
	.uleb128 .LBB93-.LBB87
	.uleb128 .LBE93-.LBB87
	.byte	0
.LLRL109:
	.byte	0x5
	.quad	.LBB89
	.byte	0x4
	.uleb128 .LBB89-.LBB89
	.uleb128 .LBE89-.LBB89
	.byte	0x4
	.uleb128 .LBB94-.LBB89
	.uleb128 .LBE94-.LBB89
	.byte	0
.LLRL111:
	.byte	0x5
	.quad	.LBB90
	.byte	0x4
	.uleb128 .LBB90-.LBB90
	.uleb128 .LBE90-.LBB90
	.byte	0x4
	.uleb128 .LBB91-.LBB90
	.uleb128 .LBE91-.LBB90
	.byte	0
.LLRL121:
	.byte	0x5
	.quad	.LBB97
	.byte	0x4
	.uleb128 .LBB97-.LBB97
	.uleb128 .LBE97-.LBB97
	.byte	0x4
	.uleb128 .LBB98-.LBB97
	.uleb128 .LBE98-.LBB97
	.byte	0x4
	.uleb128 .LBB102-.LBB97
	.uleb128 .LBE102-.LBB97
	.byte	0x4
	.uleb128 .LBB103-.LBB97
	.uleb128 .LBE103-.LBB97
	.byte	0
.LLRL123:
	.byte	0x5
	.quad	.LBB99
	.byte	0x4
	.uleb128 .LBB99-.LBB99
	.uleb128 .LBE99-.LBB99
	.byte	0x4
	.uleb128 .LBB104-.LBB99
	.uleb128 .LBE104-.LBB99
	.byte	0
.LLRL125:
	.byte	0x5
	.quad	.LBB100
	.byte	0x4
	.uleb128 .LBB100-.LBB100
	.uleb128 .LBE100-.LBB100
	.byte	0x4
	.uleb128 .LBB101-.LBB100
	.uleb128 .LBE101-.LBB100
	.byte	0
.LLRL127:
	.byte	0x5
	.quad	.LBB105
	.byte	0x4
	.uleb128 .LBB105-.LBB105
	.uleb128 .LBE105-.LBB105
	.byte	0x4
	.uleb128 .LBB107-.LBB105
	.uleb128 .LBE107-.LBB105
	.byte	0
.LLRL129:
	.byte	0x5
	.quad	.LBB106
	.byte	0x4
	.uleb128 .LBB106-.LBB106
	.uleb128 .LBE106-.LBB106
	.byte	0x4
	.uleb128 .LBB108-.LBB106
	.uleb128 .LBE108-.LBB106
	.byte	0
.LLRL131:
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
