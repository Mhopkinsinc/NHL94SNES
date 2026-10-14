; Unidentified routine.
CODE_9E94DE:
	lda.w OOlistpos,x
	beq CODE_9E9527
	sta.b d1
CODE_9E94E5:
	ldy.b d1
	lda.w $15C2,y
	and.w #$00FF
	tay
	lda.b d3
	sec
	sbc.w Ylist,y
	sec
	sbc.w #$000E
	bpl CODE_9E9527
	lda.w position,y
	bmi CODE_9E9523
	lda.w Xpos,y
	sec
	sbc.b d2
	cmp.w #$FFF1
	bmi CODE_9E9523
	cmp.w #$000F
	bpl CODE_9E9523
	lda.w pflags,y
	and.w #$8000
	ora.w $1563,y
	bne CODE_9E9523
	cpy.w #$0018
	bcs CODE_9E9523
	jsl.l CODE_9E9528
CODE_9E9523:
	dec.b d1
	bne CODE_9E94E5
CODE_9E9527:
	rtl
