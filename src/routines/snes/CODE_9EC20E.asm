; Unidentified routine.
CODE_9EC20E:
	lda.b [$8D],y
	clc
	adc.b $8D
	inc a
	inc a
	sta.b $8D
	lda.b [$8D]
	dec a
	dec a
	sta.b $A5
	bne CODE_9EC222
	jmp.w CODE_80C2AE
