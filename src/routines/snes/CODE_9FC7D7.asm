; Unidentified routine.
CODE_9FC7D7:
	lda.w #$001A
	sta.b $A5
	jsl.l randomd0
	jsr.w CODE_9FC7EC
	lda.w $1EAF
	cmp.w #$0000
	bne CODE_9FC7D7
	rts
