; Unidentified routine.
CODE_9FB601:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.w #$0000
	sta.b $8B
	lda.w #$15DE
	sta.b $89
CODE_9FB623:
	lda.b [$89]
	jsl.l CODE_9FB64A
	inc.b $89
	inc.b $89
	lda.b [$89]
	bne CODE_9FB623
	pla
	sta.b $8F
	pla
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
	rtl
