; Unidentified routine.
CODE_9E843B:
	rtl
	cpx.w $0AD9
	beq CODE_9E845A
	ldy.w $0AD9
	bmi CODE_9E8462
	lda.w pfteam,x
	cmp.w pfteam,y
	beq CODE_9E8462
	lda.w #$0005
	sta.b d0
	jmp.w assreplace
