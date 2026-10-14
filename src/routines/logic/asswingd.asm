; Unidentified routine.
asswingd:
	ldy.w puckc
	bmi CODE_9E8981
	lda.w pfteam,x
	cmp.w pfteam,y
	bne CODE_9E8981
	lda.w #$0004
	sta.b d0
	jmp.w assreplace
