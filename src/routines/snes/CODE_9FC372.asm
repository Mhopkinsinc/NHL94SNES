; Unidentified routine.
CODE_9FC372:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $91
	pha
	lda.b $93
	pha
	lda.b $95
	pha
	lda.b $97
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	jsl.l GetPlayerRecord
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.w #$0A2A
	sta.b $95
	inc a
	inc a
	sta.b $8D
	lda.w #$0000
	sta.b $97
	sta.b $8F
	lda.w #$0004
	sta.b [$95]
	lda.b $89
	clc
	adc.b [$89]
	sta.b $89
	lda.b [$89]
	and.w #$00FF
	sta.b $A5
	jsl.l PutDigits2
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8D7
	sta.b $8D
	jsl.l appstring
	pla
	sta.b $8F
	pla
	sta.b $8D
	jsl.l appstring
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $97
	pla
	sta.b $95
	pla
	sta.b $93
	pla
	sta.b $91
	pla
	sta.b $A7
	pla
	sta.b $A5
	ldx.b $95
	rtl
