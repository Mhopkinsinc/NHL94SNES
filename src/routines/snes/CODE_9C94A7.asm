; Unidentified routine.
CODE_9C94A7:
	cmp.w #$0030
	bcc CODE_9C94BB
	cmp.w #$003A
	bcs CODE_9C94BB
	sec
	sbc.w #$0030
	clc
	adc.w #$001C
	bra CODE_9C94C2
