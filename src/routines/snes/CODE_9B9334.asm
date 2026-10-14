; Unidentified routine.
CODE_9B9334:
	lda.b $97
	pha
	lda.b a3
	pha
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.b d0
	pha
	phy
	jsl.l CODE_9B9320
	ldy.b a2
	lda.w #$009C
	sta.b $8F
	lda.w tmdata,y
	sta.b a1
	ldy.w #$0006
	clc
	adc.b [a1],y
	sta.b a1
	lda.w #$0000
	sta.b d0
CODE_9B9361:
	sep #$20
	lda.b [a1]
	sta.b [a3]
	rep #$20
	inc.b a1
	inc.b a3
	lda.b d0
	inc a
	sta.b d0
	cmp.w #$0038
	bmi CODE_9B9361
	lda.l $7E34C6
	bne CODE_9B93B0
	jsl.l CODE_9B9320
	ldy.b a2
	lda.w #$009C
	sta.b $8F
	lda.w tmdata,y
	sta.b a1
	ldy.w #$000C
	clc
	adc.b [a1],y
	sta.b a1
	lda.w #$0000
	sta.b d0
CODE_9B939A:
	sep #$20
	lda.b [a1]
	sta.b [a3]
	rep #$20
	inc.b a1
	inc.b a3
	lda.b d0
	inc a
	sta.b d0
	cmp.w #$0008
	bmi CODE_9B939A
CODE_9B93B0:
	ply
	pla
	sta.b d0
	pla
	sta.b a1
	pla
	sta.b $8F
	pla
	sta.b a3
	pla
	sta.b $97
	rtl
