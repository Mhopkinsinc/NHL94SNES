; Unidentified routine.
CODE_9EA4DF:
	lda.w #$FF78
	sta.w Xpos,x
	lda.w #$0002
	sta.w facedir,x
	sta.w pfalock,x
	lda.w #SPAwallright
	jsl.l CODE_9EA403
	bra CODE_9EA4DD
