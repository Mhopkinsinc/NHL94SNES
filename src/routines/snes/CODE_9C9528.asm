; Unidentified routine.
CODE_9C9528:
	cmp.w #$0030
	bcc CODE_9C953D
	cmp.w #$003A
	bcs CODE_9C953D
	sec
	sbc.w #$0030
	clc
	adc.w #$001C
	tax
	bra CODE_9C9545
