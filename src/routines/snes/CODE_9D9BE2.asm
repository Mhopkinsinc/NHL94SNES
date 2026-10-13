; Unidentified routine.
CODE_9D9BE2:
	and.w #$00DF
	sec
	sbc.w #$0041
CODE_9D9BE9:
	tax
	lda.l DATA8_9C9623,x
	and.w #$00FF
CODE_9D9BF1:
	clc
	adc.b $14
	sta.b $14
CODE_9D9BF6:
	iny
	bra CODE_9D9BA0
