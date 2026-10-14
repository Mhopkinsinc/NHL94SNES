; Unidentified routine.
CODE_9EB2B5:
	lda.w #$0008
	tsb.w gmode
	bne CODE_9EB2B1
	lda.w #$0030
	sta.b d0
	jsl.l SetPA
	jmp.w CODE_9EB1F2
