; Unidentified routine.
CODE_9EC6AA:
	ldy.w puckc
	lda.w Ypos,y
	bmi CODE_9EC6E6
	clc
	adc.w #$0004
	sta.b $A5
	ldy.w #$0000
	lda.w puckc
	cmp.w #$000C
	bpl CODE_9EC6C6
	ldy.w #$000C
CODE_9EC6C6:
	lda.w #$0006
	sta.b $AD
CODE_9EC6CB:
	lda.w position,y
	bmi CODE_9EC6DA
	beq CODE_9EC6DA
	lda.b $A5
	sec
	sbc.w Ypos,y
	bmi CODE_9EC6E6
CODE_9EC6DA:
	iny
	iny
	dec.b $AD
	bpl CODE_9EC6CB
CODE_9EC6E0:
	stz.w $1638
	inc.w $1638
CODE_9EC6E6:
	rtl
