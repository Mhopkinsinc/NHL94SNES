; Unidentified routine.
CODE_9FBFA6:
	lda.w Vscroll
	clc
	adc.w #$0170
	lsr a
	lsr a
	lsr a
	tax
	sec
	sbc.w $0D23
	bne CODE_9FBFBA
	jmp.w CODE_9FC072
