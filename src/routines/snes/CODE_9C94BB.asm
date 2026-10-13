; Unidentified routine.
CODE_9C94BB:
	and.w #$00DF
	sec
	sbc.w #$0041
CODE_9C94C2:
	tax
	lda.l DATA8_9C9623,x
	and.w #$00FF
CODE_9C94CA:
	clc
	adc.b $14
	sta.b $14
CODE_9C94CF:
	iny
	bra CODE_9C9479
