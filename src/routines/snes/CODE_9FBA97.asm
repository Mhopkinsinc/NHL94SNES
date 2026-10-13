; Unidentified routine.
CODE_9FBA97:
	lda.w Vpos
	sta.w $0D4D
	lda.w Hpos
	sta.w $0D4B
	lda.w #$0040
	tsb.w sflags
	rtl
