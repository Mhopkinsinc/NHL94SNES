; Unidentified routine.
CODE_9E955F:
	ldy.b a2
	lda.w $0EC3,x
	sec
	sbc.w $0EC3,y
	sta.b d0
	lda.w $0EE3,x
	sec
	sbc.w $0EE3,y
	sta.b d1
	lda.b d0
	ora.b d1
	bne CODE_9E957C
	jmp.w CODE_9E976E
