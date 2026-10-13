; Unidentified routine.
assdefo:
	cpx.w puckc
	beq CODE_9E8822
	ldy.w puckc
	bmi CODE_9E882A
	lda.w pfteam,x
	cmp.w pfteam,y
	beq CODE_9E882A
	lda.w #$0002
	sta.b $A5
	jmp.w $8C18
