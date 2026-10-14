; Unidentified routine.
CODE_9EC6AA:
	ldy.w $0AD9
	lda.w Ypos,y
	bmi CODE_9EC6E6
	clc
	adc.w #$0004
	sta.b d0
	ldy.w #$0000
	lda.w $0AD9
	cmp.w #$000C
	bpl CODE_9EC6C6
	ldy.w #$000C
CODE_9EC6C6:
	lda.w #$0006
	sta.b d2
CODE_9EC6CB:
	lda.w position,y
	bmi CODE_9EC6DA
	beq CODE_9EC6DA
	lda.b d0
	sec
	sbc.w Ypos,y
	bmi CODE_9EC6E6
CODE_9EC6DA:
	iny
	iny
	dec.b d2
	bpl CODE_9EC6CB
CODE_9EC6E0:
	stz.w $1638
	inc.w $1638
CODE_9EC6E6:
	rtl
