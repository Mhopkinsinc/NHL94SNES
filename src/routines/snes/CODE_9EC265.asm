; Unidentified routine.
CODE_9EC265:
	jsl.l CODE_9EC913
	lda.b $A5
	bmi CODE_9EC2AE
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF739
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b $8D
	ldy.b $A5
	lda.b [$8D],y
	clc
	adc.b $8D
	inc a
	inc a
	sta.b $8D
	lda.b [$8D]
	lsr a
	sta.b $A5
	lda.w printx
	sec
	sbc.b $A5
	sta.w printx
	jsl.l CODE_9EC7BE
CODE_9EC2AE:
	pla
	sta.b $8F
	pla
	sta.b $8D
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
	rtl
