; Unidentified routine.
CODE_9ED7CA:
	lda.w seed
	and.w #$0380
	beq CODE_9ED793
CODE_9ED7D2:
	lda.w puckvx
	xba
	and.w #$00FF
	bit.w #$0080
	beq .1
	ora.w #$FF00
.1:
	clc
	adc.w puckx
	sta.b d0
CODE_9ED7E7:
	jsl.l CODE_9EDBC0
	lda.b d1
	pha
	lda.b d0
	pha
CODE_9ED7F1:
	lda.b d0
	ldy.b d1
	jsl.l CODE_9CA554
	sta.b d0
	cmp.w #$001E
	bcs .t1
	pla
	sta.b d0
	pla
	sta.b d1
	bra CODE_9ED853

.t1:
	lda.b d0
	inc a
	sta.b d2
	lda.w #$0014
	sta.b d4
	lda.w sflags
	bit.w #$0008
	beq .1
	lda.w #$001C
	sta.b d4
.1:
	pla
	sta.b d0
	pla
	sta.b d1
	tax
	lda.b d4
	jsl.l CODE_808FC9
	lda.b d2
	sta.b $04
	jsl.l Div32S
	lda.b $00
	sta.b d1
	lda.b d4
	adc.w #$0006
	sta.b d4
	ldx.b d0
	jsl.l CODE_808FC9
	lda.b d2
	sta.b $04
	jsl.l Div32S
	lda.b $00
	sta.b d0
	ldx.b $E4
CODE_9ED853:
	lda.b d1
	clc
	adc.b d3
	sta.b d1
	sta.b d2
	ldy.w $19D4,x
	bmi .t1
	cpx.w puckc
	beq .1
	lda.w JoyPad,y
	bit.w #$0080
	bne .t3
.1:
	jmp.w CODE_9EDA2C

.t1:
	ldy.w #$0002
	lda.b [a0],y
	cmp.w #$0023
	bcc .t2
	jmp.w CODE_9EDA51

.t2:
	lda.b [a0]
	cmp.w #$FFE7
	bmi .t1x
	cmp.w #$0019
	bpl .t1x
	lda.b [a0],y
	cmp.w #$0013
	bcs .1x
	lda.w pucky
	cmp.w #$FEF7
	bmi .1x
	cmp.w #$0109
	bmi .t3
.1x:
	jmp.w CODE_9EDA2C

.t1x:
	jmp.w CODE_9EDB3E

.t3:
	lda.w Xvel,x
	cmp.w #$8000
	ror a
	sta.w Xvel,x
	lda.w Yvel,x
	cmp.w #$8000
	ror a
	sta.w Yvel,x
	lda.w $0B05,x
	bit.w #$0002
	beq .t1x2
	jmp.w CODE_9ED992

.t1x2:
	lda.w puckvx
	xba
	lsr a
	lsr a
	and.w #$003F
	bit.w #$0020
	beq .1x2
	ora.w #$FFC0
.1x2:
	clc
	adc.w puckx
	sec
	sbc.w Xpos,x
	sta.b d0
	sta.b $02
	bit.w #$8000
	beq .2
	eor.w #$FFFF
	inc a
.2:
	sta.b $00
	lda.w puckvy
	xba
	lsr a
	lsr a
	and.w #$003F
	bit.w #$0020
	beq .3
	ora.w #$FFC0
.3:
	clc
	adc.w pucky
	sec
	sbc.w Ypos,x
	sta.b d1
	bit.w #$8000
	beq .4
	eor.w #$FFFF
	inc a
.4:
	sta.b $04
	jsl.l vtoa
	lda.b d0
	cmp.w #$0008
	beq CODE_9ED93F
	sec
	sbc.w facedir,x
	and.w #$0007
	sta.b d3
	beq CODE_9ED93F
	jmp.w CODE_9ED9A0
