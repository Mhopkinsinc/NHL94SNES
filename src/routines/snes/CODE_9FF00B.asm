; Unidentified routine.
CODE_9FF00B:
	lda.w #$0000
	sta.w $1DB9
CODE_9FF011:
	jsl.l CODE_9FF063
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	lda.b d1
	bit.w #$1000
	bne CODE_9FF055
	bit.w #$8080
	bne CODE_9FF05B
	bit.w #$0800
	bne CODE_9FF03D
	bit.w #DMA_OAM
	bne CODE_9FF045
	bra CODE_9FF011
