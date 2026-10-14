; Unidentified routine.
CODE_9C8F9B:
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldx.w #$4D80
	lda.l $7E35B6
	clc
	adc.l $7E35A8
	jsl.l CODE_808EDF
	lda.w #$0000
	sta.w printy
	lda.w #$0000
	sta.w $1DB9
	lda.w $1DA3
	sta.b $B5
CODE_9C8FC6:
	jsr.w CODE_9C8FD7
	inc.w printy
	inc.w printy
	inc.w $1DB9
	dec.b $B5
	bpl CODE_9C8FC6
	rts
