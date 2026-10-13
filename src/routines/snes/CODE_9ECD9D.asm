; Unidentified routine.
CODE_9ECD9D:
	stz.w $0D47
	inc.w $0D49
	lda.w $0D49
	sec
	sbc.w #$0008
	bmi CODE_9ECDB1
	bvc CODE_9ECDB3
CODE_9ECDAE:
	jmp.w $C9B0
