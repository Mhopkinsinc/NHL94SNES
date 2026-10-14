; Unidentified routine.
CODE_9E9EC2:
	lda.b d0
	sta.b d5
	lda.w Xpos,y
	sta.b d2
	lda.w Ypos,y
	sta.b d3
	ldx.w #$0048
	ldy.w #$00EA
	lda.b d2
	bpl .1
	ldx.w #$FFB8
.1:
	lda.b d3
	bpl .2
	ldy.w #$FF16
.2:
	stx.b $A7
	sty.b $AB
	lda.b d2
	sec
	sbc.b $A7
	sta.b d0
	lda.b d3
	sec
	sbc.b $AB
	sta.b d1
	ldy.b d0
	jsl.l CODE_9CA554
	ldy.b a2
	sta.b d4
	cmp.w #$0014
	bcs .t1
	ldx.b a3
	jmp.w CODE_9E9D0D

.t1:
	lda.b d0
	xba
	tax
	lda.b d4
	jsl.l DivX8S
	lsr a
	lsr a
	bit.w #$2000
	beq .1x
	ora.w #$C000
.1x:
	sta.b d0
	bit.w #$8000
	beq .2x
	eor.w #$FFFF
	inc a
.2x:
	sta.b $AF
	lda.b d1
	xba
	tax
	lda.b d4
	jsl.l DivX8S
	ldx.b a3
	lsr a
	lsr a
	bit.w #$2000
	beq .3
	ora.w #$C000
.3:
	sta.b d1
	bit.w #$8000
	beq .4
	eor.w #$FFFF
	inc a
.4:
	cmp.b $AF
	bcs CODE_9E9FA6
	lda.b $A7
	bpl CODE_9E9F7F
	lda.b d5
	dec a
	cmp.w #$0003
	bcs CODE_9E9F7C
	lda.b d0
	clc
	adc.w #$0006
	clc
	adc.b $A7
	sta.w Xpos,y
	lda.b d1
	clc
	adc.b $AB
	sta.w Ypos,y
	lda.w #$0000
	sta.w Xvel,y
	sta.w Yvel,y
	jmp.w CODE_9E9C71
