; Unidentified routine.
CODE_9FC4D0:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $91
	pha
	lda.b $93
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	jsl.l GetPlayerRecord
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	lda.w #$0002
	sta.b [$8D]
	inc.b $8D
	inc.b $8D
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.b $89
	clc
	adc.b [$89]
	sta.b $89
	lda.b [$89]
	and.w #$00FF
	sta.b $A5
	jsl.l PutDigits2
	lda.w #$0020
	sta.b [$8D]
	inc.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	lda.b [$89]
	sta.b $A5
	clc
	adc.b $89
	sta.b $91
	lda.b $8B
	sta.b $93
	inc.b $89
	inc.b $89
	lda.b [$89]
	inc.b $89
	sta.b [$8D]
	inc.b $8D
	lda.w #$002E
	sta.b [$8D]
	inc.b $8D
	lda.w #$0020
	sta.b [$8D]
	inc.b $8D
CODE_9FC545:
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	cmp.w #$0020
	bne CODE_9FC545
CODE_9FC551:
	lda.b [$89]
	inc.b $89
	sta.b [$8D]
	inc.b $8D
	lda.b $89
	cmp.b $91
	bne CODE_9FC551
	jsl.l CODE_9ECE06
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $93
	pla
	sta.b $91
	pla
	sta.b $A7
	pla
	sta.b $A5
	rtl
