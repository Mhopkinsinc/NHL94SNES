; Unidentified routine.
CODE_9EEDC0:
	ldy.w #$0000
	lda.w passdir
	cmp.w facedir,x
	beq CODE_9EEDEA
	iny
	dec a
	and.w #$0007
	cmp.w facedir,x
	beq CODE_9EEDEA
	iny
	inc a
	inc a
	and.w #$0007
	cmp.w facedir,x
	beq CODE_9EEDEA
	lda.w passdir
	sta.b d0
	jsl.l CODE_9EDC06
	rtl
