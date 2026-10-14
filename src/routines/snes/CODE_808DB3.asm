; Unidentified routine.
CODE_808DB3:
	stx.b $0C
	ldx.b $3C
.loop:
	lda.b $0C
	sta.w $0101,x
	clc
	adc.b $18
	sta.b $0C
	lda.b $18
	sta.w $0104,x
	tya
	sta.w $0106,x
	clc
	adc.w #$0080
	tay
	sep #$20
	lda.b $0E
	sta.w $0103,x
	lda.b #$FB
	sta.w $0100,x
	rep #$20
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	dec.b $1A
	bne .loop
	stx.b $3C
	rtl

.t1:
	sta.b $26
	stx.b $1C
	tya
	asl a
	ldx.b $24
	jsl.l Mul16U
	lda.b $1C
	asl a
	clc
	adc.b $08
	adc.b $10
	sta.b $10
	ldx.b $22
	ldy.w #$0000
.loopx:
	lda.b [$0C]
	and.w #$00FF
	beq .2
	clc
	adc.b $26
	sta.b [$10],y
	iny
	iny
	inc.b $0C
	dex
	bne .loopx
.1:
	rtl
.2:
	dex
	bmi .1
	lda.w #$0020
	clc
	adc.b $26
	sta.b [$10],y
	iny
	iny
	inc.b $0C
	bra .2
