; Unidentified routine.
CODE_9EBE35:
	cpy.w #$0003
	bne CODE_9EBE5E
	ldx.b $91
	ldy.w $0AF9,x
CODE_9EBE3F:
	iny
	iny
	cpy.w #$000A
	bne CODE_9EBE49
	ldy.w #$0000
CODE_9EBE49:
	lda.w $19F6,y
	bpl CODE_9EBE3F
	and.w #$00FF
	cmp.b $91
	bne CODE_9EBE3F
	sta.w $19F6,y
	inc a
	inc a
	lsr a
	sta.w $1C84,y
CODE_9EBE5E:
	ldx.b $91
	ldy.w $0AF9,x
	bra CODE_9EBE6F
