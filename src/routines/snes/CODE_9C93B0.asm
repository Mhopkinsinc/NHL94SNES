; Unidentified routine.
CODE_9C93B0:
	cmp.w #$0041
	bcc CODE_9C93EC
	cmp.w #$005B
	bcs CODE_9C93EC
	sec
	sbc.w #$0041
	bra CODE_9C93C0
