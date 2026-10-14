; Unidentified routine.
CODE_9EE51F:
	jsl.l RandomWord
	and.w #$0600
	bne CODE_9EE4D3
CODE_9EE528:
	jsl.l RandomWord
	and.w #$0001
	inc a
	inc a
	sta.b d0
	ldy.w $1EA9
	bpl CODE_9EE540
	lda.b d0
	clc
	adc.w #$0003
	sta.b d0
CODE_9EE540:
	lda.b d0
	sta.w passdir
	lda.w #$0014
	sta.w passspeed
	lda.w #$0000
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w pfgoal,x
	bne CODE_9EE564
	lda.w #$FEF8
	sec
	sbc.w Ypos,x
	sta.b d1
	bra CODE_9EE56D
