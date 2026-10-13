; Unidentified routine.
CODE_9EA4DF:
	lda.w #$FF78
	sta.w Xpos,x
	lda.w #$0002
	sta.w $1163,x
	sta.w $14E3,x
	lda.w #$E8F4
	jsl.l CODE_9EA403
	bra CODE_9EA4DD
