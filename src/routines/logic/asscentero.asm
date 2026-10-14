; Unidentified routine.
asscentero:
	cpx.w puckc
	beq CODE_9E845A
	ldy.w puckc
	bmi CODE_9E8462
	lda.w pfteam,x
	cmp.w pfteam,y
	beq CODE_9E8462
	lda.w #$0005
	sta.b d0
	jmp.w assreplace
