; Unidentified routine.
CODE_9EEDEA:
	lda.w position,x
	bne CODE_9EEDFD
CODE_9EEDEF:
	tya
	asl a
	adc.w $0BA5
	sta.w $0BA5
	lda.w $1163,x
	sta.w passdir
CODE_9EEDFD:
	jsl.l CODE_9EEE04
	jmp.w CODE_9E8BE6
