; Unidentified routine.
CODE_80A96C:
	ldy.b $5A
	cpy.b #$07
	beq CODE_80A95E
CODE_80A972:
	cpy.b #$40
	bne CODE_80A9A4
	sep #$20
	ldx.b $4A
	lda.b $5E
	sta.w $08D0,x
	bne CODE_80A99F
	ldx.b #$07
CODE_80A983:
	lda.w $08FA,x
	cmp.b $4A
	bne CODE_80A99C
	lda.w $08F2,x
	beq CODE_80A99C
	phx
	txy
	txa
	asl a
	tax
	rep #$20
	jsr.w CODE_80ABF7
	sep #$20
	plx
CODE_80A99C:
	dex
	bpl CODE_80A983
CODE_80A99F:
	rep #$20
	jmp.w CODE_80ABA5
