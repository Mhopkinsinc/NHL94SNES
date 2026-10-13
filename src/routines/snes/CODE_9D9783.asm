; Unidentified routine.
CODE_9D9783:
	stx.b $87
	ldx.w #$0000
CODE_9D9788:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9D9788
	ldx.b $87
	stx.b $87
	ldx.w #$0000
CODE_9D9799:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9D9799
	ldx.b $87
	lda.l $7E34D0
	asl a
	asl a
	asl a
	asl a
	sta.b $A9
	lda.w #$007E
	sta.b $8B
	lda.w #$34D2
	sta.b $89
	lda.w #$ED59
	clc
	adc.b $A9
	sta.b $8D
	lda.w #$009C
	sta.b $8F
	ldy.w #$000E
	sty.b $AD
CODE_9D97CB:
	lda.b [$8D],y
	sta.b [$89],y
	dey
	dey
	bpl CODE_9D97CB
	lda.w #$34E2
	sta.b $8D
	lda.b $8B
	sta.b $8F
	lda.w $0AD5
	sta.b $A5
CODE_9D97E1:
	lda.b $A5
	and.w #$0001
	sta.b $A9
	tay
	sep #$20
	lda.b [$89],y
	sta.b [$8D]
	rep #$20
	inc.b $8D
	inc.b $89
	inc.b $89
	lsr.b $A5
	dec.b $AD
	bpl CODE_9D97E1
	jsl.l GetShifter
	lda.b $A9
	bmi CODE_9D9840
	lda.b $AD
	asl a
	adc.w #$34D2
	sta.b $89
	lda.w #$007E
	sta.b $8B
	stz.b $8D
CODE_9D9814:
	ldx.b $8D
	lda.w #$0000
	sta.l $7E3578,x
	sta.l $7E3588,x
	sta.l $7E3568,x
	lda.l $7E3598,x
	and.w #$FFFD
	sta.l $7E3598,x
	jsl.l CODE_9D985F
	inc.b $8D
	inc.b $8D
	dec.b $A9
	bpl CODE_9D9814
	jsl.l CODE_9D995D
CODE_9D9840:
	stx.b $87
	ldx.w #$000E
CODE_9D9845:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9D9845
	ldx.b $87
	stx.b $87
	ldx.w #$0012
CODE_9D9853:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9D9853
	ldx.b $87
	ldx.b $95
	rtl
