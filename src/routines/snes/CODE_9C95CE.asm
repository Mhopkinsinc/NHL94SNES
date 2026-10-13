; Unidentified routine.
CODE_9C95CE:
	cmp.w #$0061
	bcc CODE_9C95DE
	cmp.w #$007B
	bcs CODE_9C95DE
	sec
	sbc.w #$0061
	bra CODE_9C95EE
