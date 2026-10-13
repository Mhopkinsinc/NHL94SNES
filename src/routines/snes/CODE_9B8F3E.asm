; Unidentified routine.
CODE_9B8F3E:
	lda.w $1DA7
	sec
	sbc.w $1DAB
	clc
	adc.w $1DAF
	cmp.w $1DA3
	bpl CODE_9B8F28
	inc.w $1DA7
	jsl.l CODE_9B8F7B
	lda.w #$FFFF
	sta.w $07E0
	bra CODE_9B8F28
