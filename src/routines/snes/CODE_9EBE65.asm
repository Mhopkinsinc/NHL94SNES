; Unidentified routine.
CODE_9EBE65:
	iny
	iny
	cpy.w #$000A
	bne CODE_9EBE6F
	ldy.w #$0000
CODE_9EBE6F:
	lda.w $19F6,y
	cmp.b a2
	bne CODE_9EBE65
	ora.w #$FF00
	sta.w $19F6,y
	lda.w #$0000
	sta.w $1C84,y
	phy
	iny
	iny
	cpy.w #$000A
	bne .1
	ldy.w #$0000
.1:
	tya
	sta.w $0AF9,x
	ply
	ldx.w $19EC,y
	lda.w #$FFFF
	sta.w $19EC,y
	sta.w $19D4,x
	jmp.w CODE_9EBE24
