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
	lda.b ($A9),y
	and.w #$00FF
	bne CODE_9C9502
	jmp.w $958B
