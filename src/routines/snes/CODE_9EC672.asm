; Unidentified routine.
CODE_9EC672:
	ldy.w $0AD9
	lda.w Ypos,y
	bpl CODE_9EC6E6
	sec
	sbc.w #$0004
	sta.b d0
	ldy.w #$0000
	lda.w $0AD9
	cmp.w #$000C
	bpl CODE_9EC68E
	ldy.w #$000C
CODE_9EC68E:
	lda.w #$0006
	sta.b d2
CODE_9EC693:
	lda.w position,y
	bmi CODE_9EC6A2
	beq CODE_9EC6A2
	lda.b d0
	sec
	sbc.w Ypos,y
	bpl CODE_9EC6E6
CODE_9EC6A2:
	iny
	iny
	dec.b d2
	bpl CODE_9EC693
	bra CODE_9EC6E0
