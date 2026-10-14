; Find a free voice, starting after the last one used
FindFreeVoice:
	lda.b $66
	inc a
	and.b #$07
	sta.b $66
	ldy.b #$07
	tax
.1:
	lda.w $08F2,x
	beq .5
.2:
	inx
	txa
	and.b #$07
	tax
	dey
	bpl .1
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
.3:
	lda.b ($4E)
	and.l ByteBitMasks,x
	beq .4
	lda.w $07FE
	cmp.w $0912,x
	bcc .4
	lda.w $08F2,x
	cmp.w $07FD
	bcc .4
	bne .t1
	rep #$20
	lda.w $096A,y
	cmp.w $07FB
	bcc .4
	stx.b $4B
	sta.w $07FB
	bra .4

.t1:
	stx.b $4B
	sta.w $07FD
	rep #$20
	lda.w $096A,y
	sta.w $07FB
.4:
	sep #$20
	inx
	txa
	and.b #$07
	tax
	dey
	dey
	dec.b $68
	bne .3
	ldx.b $4B
	txy
	jmp.w SeqCmd0C
.5:
	lda.b ($4E)
	and.l ByteBitMasks,x
	beq .2
	rts
