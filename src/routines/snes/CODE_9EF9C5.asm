; Unidentified routine.
CODE_9EF9C5:
	sta.b d0
	inc.w RefStep
	inc.w RefStep
	lda.w RefPen
	sta.b d1
	tax
	lda.l DATA8_80D3EB,x
	inc a
	inc a
	tax
	clc
	adc.l DATA8_80D3EB,x
	adc.b d0
	tax
	lda.l DATA8_80D3EB,x
	sta.b d0
	bpl CODE_9EF9F6
	eor.w #$FFFF
	inc a
	sta.b d0
	lda.w #$FFFF
	sta.w RefStep
CODE_9EF9F6:
	lda.b d0
	and.w #$00FF
	asl a
	asl a
	asl a
	sta.b d1
	sta.w RefCnt
	lda.b d0
	xba
	and.w #$00FF
	sta.b d0
	jsl.l CODE_9EFA36
CODE_9EFA0F:
	pla
	sta.b $8F
	pla
	sta.b a1
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $AF
	pla
	sta.b d2
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
	pla
	sta.b d0
	plx
	rtl
