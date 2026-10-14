; Unidentified routine.
CODE_9FB1DE:
	pha
	lda.w #$0006
	sta.b d0
	pla
.loop:
	cmp.w position,y
	beq .1
	iny
	iny
	dec.b d0
	bne .loop
	ldy.w #$FFFF
.1:
	cpy.w #$0000
	rts
