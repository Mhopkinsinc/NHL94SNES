; Unidentified routine.
CODE_9EE022:
	lda.w $0EC4,y
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EE030
	ora.w #$FF00
CODE_9EE030:
	pha
	asl a
	pla
	ror a
	clc
	adc.w Xpos,y
	sec
	sbc.w $0D71
	sta.b d0
	lda.w $0EE4,y
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EE04C
	ora.w #$FF00
CODE_9EE04C:
	pha
	asl a
	pla
	ror a
	clc
	adc.w Ypos,y
	sec
	sbc.w pucky
	sta.b d1
	ldy.b d0
	jsl.l CODE_9CA554
	sta.b d2
	lda.w #$0012
	sta.b d3
	ldy.w #$0108
	lda.w pfgoal,x
	bne CODE_9EE072
	ldy.w #$FEF8
CODE_9EE072:
	sty.b d4
	tya
	pha
	lda.b d3
	pha
	jsr.w CODE_9EE0CD
	lda.b d4
	sta.b d5
	pla
	eor.w #$FFFF
	inc a
	sta.b d3
	pla
	sta.b d4
	jsr.w CODE_9EE0CD
	lda.b d4
	clc
	adc.b d5
	sta.b d4
	ldx.b a3
	stz.b d0
	lda.b d4
	cmp.w #$FFD3
	bmi CODE_9EE0C7
	cmp.w #$002D
	bpl CODE_9EE0C7
	lda.w pfgoal,x
	beq CODE_9EE0B1
	lda.w #$0000
	sec
	sbc.b d4
	sta.b d4
CODE_9EE0B1:
	jsl.l RandomWord
	and.w #$0003
	inc a
	sta.b d0
	lda.b d4
	bpl CODE_9EE0C7
	lda.b d0
	clc
	adc.w #$0004
	sta.b d0
CODE_9EE0C7:
	lda.b d0
	sta.w passdir
CODE_9EE0CC:
	rtl
