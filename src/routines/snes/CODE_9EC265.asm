; Unidentified routine.
CODE_9EC265:
	jsl.l CODE_9EC913
	lda.b d0
	bmi CODE_9EC2AE
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF739
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b a1
	ldy.b d0
	lda.b [a1],y
	clc
	adc.b a1
	inc a
	inc a
	sta.b a1
	lda.b [a1]
	lsr a
	sta.b d0
	lda.w printx
	sec
	sbc.b d0
	sta.w printx
	jsl.l print
CODE_9EC2AE:
	pla
	sta.b $8F
	pla
	sta.b a1
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
	rtl
