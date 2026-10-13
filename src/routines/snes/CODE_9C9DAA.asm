; Unidentified routine.
CODE_9C9DAA:
	jsl.l CODE_9C9EC5
	lda.b $A7
	sec
	sbc.w $1E33
	bmi CODE_9C9DBA
	bvc CODE_9C9DBC
	bra CODE_9C9DD6
