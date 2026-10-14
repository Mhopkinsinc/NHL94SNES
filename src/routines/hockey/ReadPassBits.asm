; Turn the password bits back into the playoff state
ReadPassBits:
	lda.w #$0200
	sta.b d0
	jsl.l SuperDiv
	lda.b d0
	pha
	stz.b d7
	lda.w #$0007
	sta.b d2
	lda.w #$000E
	sta.b a1
.0:
	ldx.b a1
	lda.l $7E3598,x
	and.w #$FFFB
	sta.l $7E3598,x
	lda.w #$0005
	sta.b d0
	jsl.l .sd
	lda.b d0
	ldx.b a1
	sta.l $7E3558,x
	cmp.w #$0004
	bne .nsf0
	lda.l $7E3598,x
	ora.w #$0004
	sta.l $7E3598,x
.nsf0:
	lda.w #$0005
	sta.b d0
	jsl.l .sd
	ldx.b a1
	lda.b d0
	sta.l $7E3548,x
	cmp.w #$0004
	bne .nsf1
	lda.l $7E3598,x
	ora.w #$0004
	sta.l $7E3598,x
.nsf1:
	dec.b a1
	dec.b a1
	dec.b d2
	bpl .0
	lda.w #$4000
	sta.b d0
	jsl.l .sd
	lda.b d0
	sta.w $0AD5
	lda.w #$0004
	sta.b d0
	jsl.l .sd
	lda.b d0
	sta.l $7E34CE
	lda.w #$0010
	sta.b d0
	jsl.l .sd
	lda.b d0
	sta.l $7E34F2
	lda.w #$0004
	sta.b d0
	jsl.l .sd
	lda.b d0
	sta.l $7E35D4
	lda.w #$0008
	sta.b d0
	jsl.l .sd
	lda.b d0
	sta.w $0ACF
	lda.w #$0020
	sta.b d0
	jsl.l .sd
	lda.b d0
	sta.l $7E34D0
	lda.b d7
	and.w #$01FF
	sta.b tmp0
	pla
	cmp.b tmp0
	beq .rtl
	lda.w #$FFFF
	sta.l $7E34D0
.rtl:
	rtl
.sd:		;d0 = passbits mod d0, added to the checksum d7
	jsl.l SuperDiv
	lda.b d7
	clc
	adc.b d0
	sta.b d7
	rtl
