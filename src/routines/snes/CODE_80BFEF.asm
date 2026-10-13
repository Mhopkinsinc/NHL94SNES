; Unidentified routine.
CODE_80BFEF:
	cmp.w $0750
	bcc CODE_80BF8F
	cmp.w $0752
	bcc CODE_80BFA9
	cmp.w $0754
	bcc CODE_80C069
	cmp.w $0756
org $80C001
	bcc CODE_80C080
	jmp.w CODE_80C09C
