; Unidentified routine.
CODE_9C94EA:
	lda.b $14
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w $1E17
	sta.w $1E17
CODE_9C94F8:
	lda.b (d1),y
	and.w #$00FF
	bne CODE_9C9502
	jmp.w CODE_9C958B
