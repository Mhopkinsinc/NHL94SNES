; After a playoff game, work out the winners and the new password
EncodePW:
	lda.l $7E34BC
	bne CODE_9BC767
	jmp.w CODE_9BC7FA
