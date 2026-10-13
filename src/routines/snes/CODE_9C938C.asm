; Unidentified routine.
CODE_9C938C:
	cmp.w #$0030
	bcc CODE_9C93A0
	cmp.w #$003A
	bcs CODE_9C93A0
	sec
	sbc.w #$0030
	clc
	adc.w #$001A
	bra CODE_9C93C0
