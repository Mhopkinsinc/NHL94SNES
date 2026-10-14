; Unidentified routine.
CODE_9BC382:
	sec
	sbc.w #$0004
	sec
	sbc.w $1DE9
	cmp.l $7E35D6
	bne CODE_9BC3A8
CODE_9BC390:
	clc
	adc.w #$0005
	clc
	adc.w $1DE9
	cmp.w $1DC1
	bmi CODE_9BC3A0
	jmp.w CODE_9BC2E4
