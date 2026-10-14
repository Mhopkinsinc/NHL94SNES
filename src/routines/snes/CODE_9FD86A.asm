; Unidentified routine.
CODE_9FD86A:
	jsl.l check4bench
	lda.w pflags,x
	bit.w #$4000
	beq CODE_9FD87A
CODE_9FD876:
	jml.l CODE_9E8BE6
