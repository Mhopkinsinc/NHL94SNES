; Unidentified routine.
CODE_80C232:
	stz.b $6F
	lda.b $6C
	asl a
	dex
	dex
	beq CODE_80C250
CODE_80C23B:
	bcc CODE_80C277
	asl a
	rol.b $6F
	dex
	dex
	beq CODE_80C25C
CODE_80C244:
	asl a
	rol.b $6F
	dex
	dex
	beq CODE_80C268
	sta.b $6C
	lda.b $6F
	rts
