; Unidentified routine.
CODE_9DBC8B:
	ldx.w #$0000
	ldy.w #$0000
.loop:
	tya
	jsr.w CODE_9DB8A1
	sta.l $7F8000,x
	tya
	jsr.w CODE_9DB8E6
	sta.l $7F8A00,x
	tya
	jsr.w CODE_9DB934
	sta.l $7F9400,x
	inx
	inx
	iny
	cpy.w #$0500
	bcc .loop
	rts
