; Unidentified routine.
CODE_9C95BA:
	cmp.w #$0030
	bcc CODE_9C95CE
	cmp.w #$003A
	bcs CODE_9C95CE
	sec
	sbc.w #$0030
	clc
	adc.w #$001A
	bra CODE_9C95EE
