; Unidentified routine.
CODE_9D9977:
	jsl.l GetShifter
	lda.w #$007E
	sta.b $8B
	lda.w #$34D2
	sta.b $89
	lda.l $7E34F2
	tay
	lda.b [$89],y
	and.w #$00FF
	sta.b $AD
	lda.b $A9
	asl a
	sta.b $8D
	lda.w #$FFFF
	sta.l $7E35D6
	stz.b $A5
CODE_9D999F:
	lda.b $AD
	ldx.b $8D
	cmp.l $7E3528,x
	beq CODE_9D99C7
	cmp.l $7E3538,x
	beq CODE_9D99B8
	dec.b $8D
	dec.b $8D
	dec.b $A9
	bpl CODE_9D999F
	rtl
