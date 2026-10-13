; Unidentified routine.
CODE_9E955F:
	ldy.b $91
	lda.w Xvel,x
	sec
	sbc.w Xvel,y
	sta.b $A5
	lda.w Yvel,x
	sec
	sbc.w Yvel,y
	sta.b $A9
	lda.b $A5
	ora.b $A9
	bne CODE_9E957C
	jmp.w $976E
