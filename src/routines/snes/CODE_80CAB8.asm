; Unidentified routine.
CODE_80CAB8:
	lda.w $1DB9
	beq CODE_80CA9A
	dec.w $1DB9
	jsl.l CODE_80CC89
	bra CODE_80CA9A
