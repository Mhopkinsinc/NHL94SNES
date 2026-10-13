; Unidentified routine.
CODE_9D9BCE:
	cmp.w #$0030
	bcc CODE_9D9BE2
	cmp.w #$003A
	bcs CODE_9D9BE2
	sec
	sbc.w #$0030
	clc
	adc.w #$001C
	bra CODE_9D9BE9
