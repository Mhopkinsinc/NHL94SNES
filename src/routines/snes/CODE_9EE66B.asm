; Unidentified routine.
CODE_9EE66B:
	lda.w #$FFD4
CODE_9EE66E:
	ldy.w pfgoal,x
	bne CODE_9EE677
	eor.w #$FFFF
	inc a
CODE_9EE677:
	sta.w $1EA9
	sta.w $1EA1
CODE_9EE67D:
	lda.w #$0002
	sta.w $1EA7
	lda.w #$0097
	sta.w $1EA3
	lda.w #$0086
	sta.w $1EA5
	rts
