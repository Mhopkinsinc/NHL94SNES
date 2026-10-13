; Unidentified routine.
CODE_9EEDC0:
	ldy.w #$0000
	lda.w passdir
	cmp.w $1163,x
	beq CODE_9EEDEA
	iny
	dec a
	and.w #$0007
	cmp.w $1163,x
	beq CODE_9EEDEA
	iny
	inc a
	inc a
	and.w #$0007
	cmp.w $1163,x
	beq CODE_9EEDEA
	lda.w passdir
	sta.b $A5
	jsl.l CODE_9EDC06
	rtl
