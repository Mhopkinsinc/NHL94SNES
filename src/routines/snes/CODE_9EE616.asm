; Unidentified routine.
CODE_9EE616:
	lda.w #$FFD3
CODE_9EE619:
	ldy.w pfgoal,x
	bne .2
.1:
	eor.w #$FFFF
	inc a
.2:
	sta.w $1EA9
	sta.w $1EA1
	lda.w #$0028
	sta.w $1EA3
	lda.w #$001E
	sta.w $1EA5
	rts
