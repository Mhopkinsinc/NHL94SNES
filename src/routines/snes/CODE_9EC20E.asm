; Unidentified routine.
CODE_9EC20E:
	lda.b [a1],y
	clc
	adc.b a1
	inc a
	inc a
	sta.b a1
	lda.b [a1]
	dec a
	dec a
	sta.b d0
	bne CODE_9EC222
	jmp.w CODE_80C2AE
