; Unidentified routine.
CODE_9EF9C5:
	sta.b $A5
	inc.w RefStep
	inc.w RefStep
	lda.w $162E
	sta.b $A9
	tax
	lda.l DATA8_80D3EB,x
	inc a
	inc a
	tax
	clc
	adc.l DATA8_80D3EB,x
	adc.b $A5
	tax
	lda.l DATA8_80D3EB,x
	sta.b $A5
	bpl CODE_9EF9F6
	eor.w #$FFFF
	inc a
	sta.b $A5
	lda.w #$FFFF
	sta.w RefStep
CODE_9EF9F6:
	lda.b $A5
	and.w #$00FF
	asl a
	asl a
	asl a
	sta.b $A9
	sta.w RefCnt
	lda.b $A5
	xba
	and.w #$00FF
	sta.b $A5
	jsl.l CODE_9EFA36
CODE_9EFA0F:
	pla
	sta.b $8F
	pla
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $AF
	pla
	sta.b $AD
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
	plx
	rtl
