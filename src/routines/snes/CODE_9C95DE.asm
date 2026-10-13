; Unidentified routine.
CODE_9C95DE:
	cmp.w #$0041
	bcc CODE_9C961E
	cmp.w #$005B
	bcs CODE_9C961E
	sec
	sbc.w #$0041
	bra CODE_9C95EE
