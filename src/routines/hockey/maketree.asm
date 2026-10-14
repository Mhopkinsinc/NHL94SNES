; Build the playoff tree from the seeds and the series wins
maketree:
	stx.b xsave
	ldx.w #$0000
CODE_9D9788:
	lda.b d0,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9D9788
	ldx.b xsave
	stx.b xsave
	ldx.w #$0000
CODE_9D9799:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9D9799
	ldx.b xsave
	lda.l $7E34D0
	asl a
	asl a
	asl a
	asl a
	sta.b d1
	lda.w #$007E
	sta.b $8B
	lda.w #$34D2
	sta.b a0
	lda.w #$ED59
	clc
	adc.b d1
	sta.b a1
	lda.w #$009C
	sta.b $8F
	ldy.w #$000E
	sty.b d2
CODE_9D97CB:
	lda.b [a1],y
	sta.b [a0],y
	dey
	dey
	bpl CODE_9D97CB
	lda.w #$34E2
	sta.b a1
	lda.b $8B
	sta.b $8F
	lda.w $0AD5
	sta.b d0
CODE_9D97E1:
	lda.b d0
	and.w #$0001
	sta.b d1
	tay
	sep #$20
	lda.b [a0],y
	sta.b [a1]
	rep #$20
	inc.b a1
	inc.b a0
	inc.b a0
	lsr.b d0
	dec.b d2
	bpl CODE_9D97E1
	jsl.l GetShifter
	lda.b d1
	bmi CODE_9D9840
	lda.b d2
	asl a
	adc.w #$34D2
	sta.b a0
	lda.w #$007E
	sta.b $8B
	stz.b a1
CODE_9D9814:
	ldx.b a1
	lda.w #$0000
	sta.l $7E3578,x
	sta.l $7E3588,x
	sta.l $7E3568,x
	lda.l $7E3598,x
	and.w #$FFFD
	sta.l $7E3598,x
	jsl.l CODE_9D985F
	inc.b a1
	inc.b a1
	dec.b d1
	bpl CODE_9D9814
	jsl.l CODE_9D995D
CODE_9D9840:
	stx.b xsave
	ldx.w #$000E
CODE_9D9845:
	pla
	sta.b a0,x
	dex
	dex
	bpl CODE_9D9845
	ldx.b xsave
	stx.b xsave
	ldx.w #$0012
CODE_9D9853:
	pla
	sta.b d0,x
	dex
	dex
	bpl CODE_9D9853
	ldx.b xsave
	ldx.b a3
	rtl
