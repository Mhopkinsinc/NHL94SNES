; Unidentified routine.
CODE_9E8054:
	adc.w aioff,x
	bpl CODE_9E805C
	lda.w #$0000
CODE_9E805C:
	sta.w temp1,x
	ldy.w puckc
	bmi CODE_9E8076
	lda.w position,y
	beq CODE_9E8076
	sty.b $8D
	lda.w pfteam,y
	eor.w pfteam,x
	bne CODE_9E8076
	jmp.w $8086
