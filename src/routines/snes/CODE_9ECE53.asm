; Unidentified routine.
CODE_9ECE53:
	cmp.w #$0061
	bcc CODE_9ECE60
	cmp.w #$007B
	bcs CODE_9ECE60
	adc.w #$FFE0
CODE_9ECE60:
	sec
	sbc.w #$0020
	bne CODE_9ECE69
	jmp.w $CF0E
