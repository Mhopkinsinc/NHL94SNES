; Skate toward d0 / d1, with a routine in a0 for avoiding others; slow down near the target
skateto:
	lda.w $1023,x
	sec
	sbc.w $0ADB
	sta.w $1023,x
	bmi .t2
	jmp.w .7

.t2:
	adc.w #$000C
	sta.w $1023,x
	lda.b d0
	sta.b $A7
	lda.b d1
	sta.b $AB
	jsl.l CODE_9EAB74
	lda.w $0EC3,x
	xba
	and.w #$00FF
	bit.w #$0080
	beq .1
	ora.w #$FF00
.1:
	eor.w #$FFFF
	inc a
	sta.b $14
	clc
	adc.b d0
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w $0EE3,x
	xba
	and.w #$00FF
	bit.w #$0080
	beq .2
	ora.w #$FF00
.2:
	eor.w #$FFFF
	inc a
	sta.b $16
	clc
	adc.b d1
	sec
	sbc.w Ypos,x
	sta.b d1
	lda.w position,x
	bne .3
	lda.w $0B05,x
	bit.w #$0002
	beq .5
.3:
	lda.b d0
	pha
	lda.b d1
	pha
	ldy.w $0EC3,x
	lda.w $0EE3,x
	jsl.l ApproxLength
	pha
	lda.b $14
	clc
	adc.b $A7
	sec
	sbc.w Xpos,x
	tay
	lda.b $16
	clc
	adc.b $AB
	sec
	sbc.w Ypos,x
	jsl.l ApproxLength
	tay
	pla
	sta.b $14
	pla
	sta.b d1
	pla
	sta.b d0
	lda.b $14
	cmp.w #$1000
	bcs .t1
	cpy.w #$0005
	bpl .5
	bra .4

.t1:
	cpy.w #$000C
	bpl .5
.4:
	lda.w #$0009
	sta.b d0
	bra .6
.5:
	jsl.l vtoa
.6:
	lda.b a0
	sta.w $1D5A
	lda.b $8A
	sta.w $1D5B
	jsl.l $001D59
	lda.b d0
	sta.w $10A3,x
	cmp.w #$0008
	bcc .7
	lda.w $0EC3,x
	ora.w $0EE3,x
	bne .7
	lda.w $0D71
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b d1
	jsl.l vtoa
.7:
	lda.w $10A3,x
	sta.b d0
	jml.l doplayeracc
