; Turn the playoff state into the password bits, with a checksum
WritePassBits:
	jsl.l ClrPassBits
	stz.b d7
	lda.l $7E34D0
	sta.b d0
	lda.w #$0020
	sta.b d1
	jsl.l .t1
	lda.w $0ACF
	sta.b d0
	lda.w #$0008
	sta.b d1
	jsl.l .t1
	lda.l $7E35D4
	sta.b d0
	lda.w #$0004
	sta.b d1
	jsl.l .t1
	lda.l $7E34F2
	sta.b d0
	lda.w #$0010
	sta.b d1
	jsl.l .t1
	lda.l $7E34CE
	sta.b d0
	lda.w #$0004
	sta.b d1
	jsl.l .t1
	lda.w $0AD5
	sta.b d0
	lda.w #$4000
	sta.b d1
	jsl.l .t1
	lda.w #$0005
	sta.b d1
	lda.w #$0007
	sta.b d2
	stz.b a1
.loop:
	ldx.b a1
	lda.l $7E3548,x
	sta.b d0
	jsl.l .t1
	ldx.b a1
	lda.l $7E3558,x
	sta.b d0
	jsl.l .t1
	inc.b a1
	inc.b a1
	dec.b d2
	bpl .loop
	lda.b d7
	and.w #$01FF
	sta.b d0
	lda.w #$0200
	sta.b d1
	jsl.l CODE_9BCDB3
	rtl

.t1:
	lda.b d7
	clc
	adc.b d0
	sta.b d7
	jml.l CODE_9BCDB3
