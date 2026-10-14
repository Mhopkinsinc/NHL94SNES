; Unidentified routine.
CODE_9EA5B3:
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
	beq CODE_9EA5D4
	ora.w #$FF00
CODE_9EA5D4:
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
	beq CODE_9EA5F2
	ora.w #$FF00
CODE_9EA5F2:
	eor.w #$FFFF
	inc a
	sta.b $16
	clc
	adc.b d1
	sec
	sbc.w Ypos,x
	sta.b d1
	lda.w position,x
	bne CODE_9EA60E
	lda.w $0B05,x
	bit.w #$0002
	beq CODE_9EA65A
CODE_9EA60E:
	lda.b d0
	pha
	lda.b d1
	pha
	ldy.w $0EC3,x
	lda.w $0EE3,x
	jsl.l CODE_9CA554
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
	jsl.l CODE_9CA554
	tay
	pla
	sta.b $14
	pla
	sta.b d1
	pla
	sta.b d0
	lda.b $14
	cmp.w #$1000
	bcs CODE_9EA64E
	cpy.w #$0005
	bpl CODE_9EA65A
	bra CODE_9EA653
