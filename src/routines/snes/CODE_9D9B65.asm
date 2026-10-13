; Unidentified routine.
CODE_9D9B65:
	lda.l DATA8_9C9623,x
	and.w #$00FF
CODE_9D9B6C:
	clc
	adc.b $14
	and.w #$0007
	sta.b $14
	ply
	iny
	jmp.w $9A94
