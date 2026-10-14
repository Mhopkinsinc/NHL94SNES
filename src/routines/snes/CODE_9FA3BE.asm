; Unidentified routine.
CODE_9FA3BE:
	lda.w $0D31
	bmi CODE_9FA3C9
	ora.l $7E35D6
	bne CODE_9FA3D4
CODE_9FA3C9:
	jsl.l GetShifter
	lda.b d1
	sta.w $0D31
	bmi CODE_9FA3BA
CODE_9FA3D4:
	jmp.w NewTicker2
