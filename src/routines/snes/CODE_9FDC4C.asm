; Unidentified routine.
CODE_9FDC4C:
	lda.w pflags,x
	bit.w #$4000
	bne CODE_9FDC8E
	lda.w newpos,x
	bpl CODE_9FDC5E
	lda.w newpnum,x
	bmi CODE_9FDC8E
CODE_9FDC5E:
	lda.w newpnum,x
	cmp.w pnum,x
	beq CODE_9FDC8F
	lda.w $0B7D,x
	cmp.w #$000C
	beq CODE_9FDC8E
	cpx.w $0AD9
	beq CODE_9FDC8E
	sep #$20
	pla
	rep #$30
	pla
	lda.w pflags,x
	ora.w #$1000
	sta.w pflags,x
	stz.w $1003,x
	lda.w #$000C
	sta.b $A5
	jml.l CODE_9E8C18
