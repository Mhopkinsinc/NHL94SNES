; Unidentified routine.
CODE_80A549:
	ldx.b #$00
	txy
.loop:
	sty.b $4B
	stx.w $0800
	lda.w $08F2,y
	beq .1
	lda.w $08FA,y
	cmp.b #$10
	bcs .1
	jsr.w CODE_80A51C
.1:
	inx
	inx
	iny
	cpy.b #$08
	bcc .loop
	rts
