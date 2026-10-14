; Assignment: the face off and the setup for play
puckfaceoff2:
	lda.w pflags,x
	bit.w #$0002
	bne CODE_9FA840
	jmp.w CODE_9FAEB1
