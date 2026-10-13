; Unidentified routine.
CODE_9C99B1:
	lda.l $7E35E6
	cmp.l $7E35EA
	beq CODE_9C99CA
CODE_9C99BB:
	jsl.l SPCCmd02
	cmp.w #$0015
	bcc CODE_9C99E5
CODE_9C99C4:
	jsl.l SPCCmd04
	bra CODE_9C99BB
