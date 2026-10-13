; Unidentified routine.
CODE_9EAEB1:
	cmp.w #$0026
	bpl CODE_9EAEBB
	lda.w #$0026
	sta.b $A5
CODE_9EAEBB:
	rts
