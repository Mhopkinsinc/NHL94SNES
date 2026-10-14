; Unidentified routine.
CODE_9DBE5B:
	lda.b $91
	eor.w #$0002
	sta.b $91
	stz.w $1DB9
	jsl.l GetPlayerCount
	lda.b $A5
	clc
	adc.w #$0006
	sta.w $1DC1
	jsl.l CODE_9DBE79
	jmp.w CODE_9DBD7B
