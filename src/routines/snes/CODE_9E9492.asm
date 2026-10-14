; Unidentified routine.
CODE_9E9492:
	lda.w OOlistpos,x
	sta.b d1
CODE_9E9497:
	ldy.b d1
	cpy.w #$000F
	beq CODE_9E94DE
	lda.w $15C4,y
	and.w #$00FF
	tay
	lda.w Ylist,y
	sec
	sbc.b d3
	sec
	sbc.w #$000E
	bpl CODE_9E94DE
	lda.w position,y
	bmi CODE_9E94DA
	lda.w Xpos,y
	sec
	sbc.b d2
	cmp.w #$FFF1
	bmi CODE_9E94DA
	cmp.w #$000F
	bpl CODE_9E94DA
	lda.w pflags,y
	and.w #$8000
	ora.w $1563,y
	bne CODE_9E94DA
	cpy.w #$0018
	bcs CODE_9E94DA
	jsl.l CODE_9E9528
CODE_9E94DA:
	inc.b d1
	bra CODE_9E9497
