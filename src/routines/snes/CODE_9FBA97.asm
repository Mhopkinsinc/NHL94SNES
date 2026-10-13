; Unidentified routine.
CODE_9FBA97:
	lda.w $0D37
	sta.w $0D4D
	lda.w $0CEB
	sta.w $0D4B
	lda.w #$0040
	tsb.w sflags
	rtl
