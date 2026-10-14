; Unidentified routine.
CODE_9E955F:
	ldy.b $91
	lda.w $0EC3,x
	sec
	sbc.w $0EC3,y
	sta.b $A5
	lda.w $0EE3,x
	sec
	sbc.w $0EE3,y
	sta.b $A9
	lda.b $A5
	ora.b $A9
	bne CODE_9E957C
	jmp.w CODE_9E976E
