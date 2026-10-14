; Player X skates to the puck, slowing down near it
skatetopuck:
	jsl.l skatetopuckinit
	lda.w temp2,x
	sec
	sbc.b d7
	sta.w temp2,x
	bmi .t1
	jmp.w CODE_9EB070

.t1:
	adc.w #$0005
	sta.w temp2,x
	jsl.l CODE_9EAB74
	lda.b d1
	pha
	lda.b d0
	pha
	txa
	jsl.l CODE_9BC002
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
	sta.w temp2b,x
	lda.w position,x
	beq CODE_9EB070
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
	beq CODE_9EB070
.3:
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b d1
	pha
	lda.w puckx
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
	beq CODE_9EB079
CODE_9EB070:
	lda.w temp2b,x
	sta.b d0
	jml.l doplayeracc
