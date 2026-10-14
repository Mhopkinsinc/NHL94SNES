; Unidentified routine.
CODE_9E8BD7:
	lda.w $19D4,x
	bpl CODE_9E8BE5
	lda.w #$0008
	sta.b d0
	jml.l CODE_9EA8A9
