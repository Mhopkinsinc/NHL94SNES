; Unidentified routine.
asswingo:
	cpx.w puckc
	beq CODE_9E8A88
	ldy.w puckc
	bmi CODE_9E8A90
	lda.w pfteam,x
	cmp.w pfteam,y
	beq CODE_9E8A90
	lda.w #$0003
	sta.b d0
	jmp.w assreplace
