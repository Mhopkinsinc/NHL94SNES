; Unidentified routine.
CODE_9FB1DE:
	pha
	lda.w #$0006
	sta.b $A5
	pla
CODE_9FB1E5:
	cmp.w position,y
	beq CODE_9FB1F3
	iny
	iny
	dec.b $A5
	bne CODE_9FB1E5
	ldy.w #$FFFF
CODE_9FB1F3:
	cpy.w #$0000
	rts
