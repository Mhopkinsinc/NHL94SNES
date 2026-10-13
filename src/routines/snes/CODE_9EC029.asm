; Unidentified routine.
CODE_9EC029:
	bit.w #$1000
	bne CODE_9EC038
	lda.w #$1000
	sta.w tmpdst,y
	jml.l RemovePlayerFromList
