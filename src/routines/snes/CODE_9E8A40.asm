; Unidentified routine.
CODE_9E8A40:
	lda.w #$0108
	sta.b $AD
	sec
	sbc.w pucky
	bpl CODE_9E8A4F
CODE_9E8A4B:
	lda.b $AD
	sta.b $A9
CODE_9E8A4F:
	lda.w #$009E
	sta.b $8B
	lda.w #rtss
	sta.b $89
	lda.w puckx
	eor.b $A5
	sta.b $AD
	bmi CODE_9E8A67
	lda.w puckx
	sta.b $A5
CODE_9E8A67:
	jmp.w $A5A4
