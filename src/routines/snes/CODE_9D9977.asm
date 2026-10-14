; Unidentified routine.
CODE_9D9977:
	jsl.l GetShifter
	lda.w #$007E
	sta.b $8B
	lda.w #$34D2
	sta.b a0
	lda.l $7E34F2
	tay
	lda.b [a0],y
	and.w #$00FF
	sta.b d2
	lda.b d1
	asl a
	sta.b a1
	lda.w #$FFFF
	sta.l $7E35D6
	stz.b d0
CODE_9D999F:
	lda.b d2
	ldx.b a1
	cmp.l $7E3528,x
	beq CODE_9D99C7
	cmp.l $7E3538,x
	beq CODE_9D99B8
	dec.b a1
	dec.b a1
	dec.b d1
	bpl CODE_9D999F
	rtl
