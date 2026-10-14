; Unidentified routine.
CODE_9DC9B3:
	phy
	phx
	lda.b a2
	beq CODE_9DC9C1
	lda.w #$2400
	sta.w $1E87
	bra CODE_9DC9C7
