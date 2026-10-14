; Unidentified routine.
CODE_9E8054:
	adc.w $1323,x
	bpl CODE_9E805C
	lda.w #$0000
CODE_9E805C:
	sta.w $1003,x
	ldy.w $0AD9
	bmi CODE_9E8076
	lda.w position,y
	beq CODE_9E8076
	sty.b a1
	lda.w pfteam,y
	eor.w pfteam,x
	bne CODE_9E8076
	jmp.w CODE_9E8086
