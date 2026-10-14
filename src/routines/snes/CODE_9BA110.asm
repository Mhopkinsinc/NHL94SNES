; Unidentified routine.
CODE_9BA110:
	lda.w $0C7F,x
	sec
	sbc.w $0ADB
	sta.w $0C7F,x
	bpl CODE_9BA106
	ldy.w $0C2B,x
	lda.b [$10],y
	sta.b $0C
	lda.w #$009B
	sta.b $0E
	ldy.w $0C55,x
	lda.b [$0C],y
	bmi CODE_9BA13C
	iny
	iny
	lda.b [$0C],y
	bmi CODE_9BA13C
	tya
	sta.w $0C55,x
	jmp.w CODE_9BA0A2
