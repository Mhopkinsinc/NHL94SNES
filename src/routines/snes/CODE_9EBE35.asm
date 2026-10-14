; Unidentified routine.
CODE_9EBE35:
	cpy.w #$0003
	bne .2
	ldx.b a2
	ldy.w $0AF9,x
.loop:
	iny
	iny
	cpy.w #$000A
	bne .1
	ldy.w #$0000
.1:
	lda.w $19F6,y
	bpl .loop
	and.w #$00FF
	cmp.b a2
	bne .loop
	sta.w $19F6,y
	inc a
	inc a
	lsr a
	sta.w $1C84,y
.2:
	ldx.b a2
	ldy.w $0AF9,x
	bra CODE_9EBE6F
