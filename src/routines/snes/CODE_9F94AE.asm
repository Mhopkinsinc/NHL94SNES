; Unidentified routine.
CODE_9F94AE:
	lda.l $7E35D6
	asl a
	sta.b $A5
	stz.b $89
	tax
	lda.w tmscore
	sta.l $7E3578,x
	lda.w $1790
	sta.l $7E3588,x
	jsl.l GetShifter
	lda.b $A9
	asl a
	sta.b $89
	lda.w $0ACF
	cmp.w #$0007
	bne CODE_9F94DA
	jmp.w $961F
