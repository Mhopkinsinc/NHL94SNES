; Unidentified routine.
CODE_9B9334:
	lda.b $97
	pha
	lda.b $95
	pha
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.b $A5
	pha
	phy
	jsl.l CODE_9B9320
	ldy.b $91
	lda.w #$009C
	sta.b $8F
	lda.w tmdata,y
	sta.b $8D
	ldy.w #$0006
	clc
	adc.b [$8D],y
	sta.b $8D
	lda.w #$0000
	sta.b $A5
CODE_9B9361:
	sep #$20
	lda.b [$8D]
	sta.b [$95]
	rep #$20
	inc.b $8D
	inc.b $95
	lda.b $A5
	inc a
	sta.b $A5
	cmp.w #$0038
	bmi CODE_9B9361
	lda.l $7E34C6
	bne CODE_9B93B0
	jsl.l CODE_9B9320
	ldy.b $91
	lda.w #$009C
	sta.b $8F
	lda.w tmdata,y
	sta.b $8D
	ldy.w #$000C
	clc
	adc.b [$8D],y
	sta.b $8D
	lda.w #$0000
	sta.b $A5
CODE_9B939A:
	sep #$20
	lda.b [$8D]
	sta.b [$95]
	rep #$20
	inc.b $8D
	inc.b $95
	lda.b $A5
	inc a
	sta.b $A5
	cmp.w #$0008
	bmi CODE_9B939A
CODE_9B93B0:
	ply
	pla
	sta.b $A5
	pla
	sta.b $8D
	pla
	sta.b $8F
	pla
	sta.b $95
	pla
	sta.b $97
	rtl
