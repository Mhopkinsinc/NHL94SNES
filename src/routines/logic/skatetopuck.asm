; Player X skates to the puck, slowing down near it
skatetopuck:
	jsl.l skatetopuckinit
	lda.w $1023,x
	sec
	sbc.b d7
	sta.w $1023,x
	bmi .t1
	jmp.w .4

.t1:
	adc.w #$0005
	sta.w $1023,x
	jsl.l avdgoal
	lda.b d1
	pha
	lda.b d0
	pha
	txa
	jsl.l GetHot
	lda.b d0
	eor.w #$FFFF
	inc a
	sec
	sbc.w $0EC4,x
	and.w #$00FF
	bit.w #$0080
	beq .1
	ora.w #$FF00
.1:
	clc
	adc.b $01,s
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.b d1
	eor.w #$FFFF
	inc a
org $9EB000
	sec
	sbc.w $0EE4,x
	and.w #$00FF
	bit.w #$0080
	beq .2
	ora.w #$FF00
.2:
	clc
	adc.b $03,s
	sec
	sbc.w Ypos,x
	sta.b d1
	pla
	pla
	jsl.l vtoa
	lda.b d0
	sta.w $10A3,x
	lda.w position,x
	beq .4
	lda.w puckvx
	sta.b d0
	lda.w puckvy
	sta.b d1
	jsl.l vtoa
	lda.b d0
	cmp.w #$0008
	beq .3
	eor.w #$0004
	cmp.w facedir,x
	beq .4
.3:
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b d1
	pha
	lda.w $0D71
	sec
	sbc.w Xpos,x
	sta.b d0
	pha
	jsl.l vtoa
	lda.b d0
	sta.b tmp0
	pla
	sta.b d0
	sta.b $00
	pla
	sta.b d1
	lda.w facedir,x
	cmp.b tmp0
	beq .5
.4:
	lda.w $10A3,x
	sta.b d0
	jml.l doplayeracc
.5:
	lda.w puckc
	bmi .4
	lda.b $00
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq .1x
	ora.w #$E000
.1x:
	tax
	jsl.l Mul8S
	sta.b d0
	lda.b d1
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq .2x
	ora.w #$E000
.2x:
	tax
	jsl.l Mul8S
	ldx.b a3
	clc
	adc.b d0
	cmp.w #$000E
	bcc .4
	cmp.w #$0028
	bcs .t1x
	jmp.w Sweepcheck

.t1x:
	bra .4
