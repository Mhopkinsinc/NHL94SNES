; Unidentified routine.
puckfaceoff2:
	lda.w pflags,x
	bit.w #$0002
	bne CODE_9FA840
	jmp.w $AEB1
