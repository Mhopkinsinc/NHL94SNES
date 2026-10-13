; Unidentified routine.
CODE_9DA462:
	lda.b $AB
	bne CODE_9DA486
	lda.w #$0002
	sta.w $1C84,x
	bra CODE_9DA486
