; Unidentified routine.
CODE_9E9492:
	lda.w OOlistpos,x
	sta.b $A9
CODE_9E9497:
	ldy.b $A9
	cpy.w #$000F
	beq CODE_9E94DE
	lda.w $15C4,y
	and.w #$00FF
	tay
	lda.w Ylist,y
	sec
	sbc.b $B1
	sec
	sbc.w #$000E
	bpl CODE_9E94DE
	lda.w position,y
	bmi CODE_9E94DA
	lda.w Xpos,y
	sec
	sbc.b $AD
	cmp.w #$FFF1
	bmi CODE_9E94DA
	cmp.w #$000F
	bpl CODE_9E94DA
	lda.w pflags,y
	and.w #$8000
	ora.w pfnc,y
	bne CODE_9E94DA
	cpy.w #$0018
	bcs CODE_9E94DA
	jsl.l CODE_9E9528
CODE_9E94DA:
	inc.b $A9
	bra CODE_9E9497
