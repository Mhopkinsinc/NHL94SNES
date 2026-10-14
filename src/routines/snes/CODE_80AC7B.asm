; Unidentified routine.
CODE_80AC7B:
	ldx.b #$00
	txy
.3:
	sty.b $4B
	stx.w $0800
	lda.w $08F2,y
	bne .t1
	jmp.w .6

.t1:
	pha
	lda.w $08FA,y
	cmp.b #$10
	bcc .1
	jsr.w CODE_80A51C
.1:
	rep #$20
	lda.w $092A,x
	sta.b $4E
	lda.w $094A,x
	sta.b $60
	lda.w $093A,x
	sta.b $5A
	lda.w $096A,x
	inc a
	sta.w $096A,x
	ldy.b #$1A
	cmp.b ($4E),y
	bcs .2
	ldy.b #$18
	cmp.b ($4E),y
	bcc .2
	dec.w $097A,x
	bmi .t3
.2:
	jmp.w .5

.t3:
	ldy.b #$2A
	lda.b ($4E),y
	clc
	adc.w $09AA,x
	sta.w $09AA,x
	iny
	iny
	lda.b ($4E),y
	adc.w $099A,x
	sta.w $099A,x
	sta.w $097A,x
	ldy.b #$26
	lda.b ($4E),y
	clc
	adc.w $09CA,x
	sta.w $09CA,x
	iny
	iny
	lda.b ($4E),y
	adc.w $09BA,x
	sta.w $09BA,x
	ldy.b #$22
	lda.b ($4E),y
	clc
	adc.w $09EA,x
	sta.w $09EA,x
	iny
	iny
	lda.b ($4E),y
	adc.w $09DA,x
	sta.w $09DA,x
	bit.w $09FA,x
	bmi .t2
	clc
	adc.w $098A,x
	sta.w $098A,x
	bmi .4
	cmp.w $09BA,x
	bcc .4
	ldy.b #$2D
	lda.b ($4E),y
	and.w #$4000
	bne .t1x
.1x:
	stz.w $098A,x
	bra .4

.t1x:
	dec.w $09FA,x
	bra .4

.t2:
	lda.w $098A,x
	sec
	sbc.w $09DA,x
	sta.w $098A,x
	bpl .4
	eor.w #$FFFF
	inc a
	cmp.w $09BA,x
	bcc .4
	ldy.b #$2D
	lda.b ($4E),y
	bmi .t1xx
	stz.w $098A,x
	bra .4

.t1xx:
	inc.w $09FA,x
.4:
	lda.w $098A,x
	clc
	adc.b $60
	sta.b $60
.5:
	ply
	cpy.b #$02
	bne .7
	sep #$20
	ldy.b $4B
	jsr.w CODE_80A4FD
.6:
	jmp.w .8
.7:
	cpy.b #$04
	bne .t2x
	rep #$20
	ldy.b #$10
	lda.w $093A,x
	sec
	sbc.b ($4E),y
	sta.w $093A,x
	bcs .t1xxx
	sep #$20
	ldy.b $4B
	jsr.w CODE_80ABC7
	bra .8

.t1xxx:
	sep #$20
	ldy.b $4B
	jsr.w CODE_80A4FD
	bra .8

.t2x:
	sep #$20
	ldy.b $4B
	jsr.w CODE_80A4E3
.8:
	sep #$20
	inx
	inx
	iny
	cpy.b #$08
	bcs .t1xxxx
	jmp.w .3

.t1xxxx:
	rts
