; Unidentified routine.
CODE_9DCB37:
	jsl.l CODE_9DCB53
	bne CODE_9DCB44
	lda.w #$0005
	sta.b $A9
	bra CODE_9DCB49
