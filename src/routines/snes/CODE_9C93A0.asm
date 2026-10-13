; Unidentified routine.
CODE_9C93A0:
	cmp.w #$0061
	bcc CODE_9C93B0
	cmp.w #$007B
	bcs CODE_9C93B0
	sec
	sbc.w #$0061
	bra CODE_9C93C0
