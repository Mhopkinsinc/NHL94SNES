; Unidentified routine.
CODE_9F88D6:
	lda.w pfgoal,x
	beq CODE_9F88F6
CODE_9F88DB:
	lda.w $0DF9
	cmp.w #$000D
	bcs CODE_9F88F6
	lda.w puckvy
	cmp.w #$2400
	bcs CODE_9F88F6
	cmp.w #$DC00
	bmi CODE_9F88F6
	lda.w #$0005
	trb.w iflags
CODE_9F88F6:
	jsl.l vtoa
	sta.w $0B5D,x
	dex
	dex
	bmi CODE_9F8904
	jmp.w $86A4
