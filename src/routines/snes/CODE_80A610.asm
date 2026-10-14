; Unidentified routine.
CODE_80A610:
	lda.b $66
	inc a
	and.b #$07
	sta.b $66
	ldy.b #$07
	tax
CODE_80A61A:
	lda.w $08F2,x
	beq CODE_80A68E
CODE_80A61F:
	inx
	txa
	and.b #$07
	tax
	dey
	bpl CODE_80A61A
	lda.b #$FF
	sta.b $4B
	stz.w $07FB
	stz.w $07FC
	stz.w $07FD
	ldy.b #$2A
	lda.b ($4E),y
	sta.w $07FE
	lda.b #$08
	sta.b $68
	ldx.b $66
	ldy.b #$0E
CODE_80A643:
	lda.b ($4E)
	and.l ByteBitMasks,x
	beq CODE_80A67B
	lda.w $07FE
	cmp.w $0912,x
	bcc CODE_80A67B
	lda.w $08F2,x
	cmp.w $07FD
	bcc CODE_80A67B
	bne .t1
	rep #$20
	lda.w $096A,y
	cmp.w $07FB
	bcc CODE_80A67B
	stx.b $4B
	sta.w $07FB
	bra CODE_80A67B

.t1:
	stx.b $4B
	sta.w $07FD
	rep #$20
	lda.w $096A,y
	sta.w $07FB
CODE_80A67B:
	sep #$20
	inx
	txa
	and.b #$07
	tax
	dey
	dey
	dec.b $68
	bne CODE_80A643
	ldx.b $4B
	txy
	jmp.w CODE_80A44A
