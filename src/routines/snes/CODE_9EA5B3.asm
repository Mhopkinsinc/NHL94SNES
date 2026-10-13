; Unidentified routine.
CODE_9EA5B3:
	adc.w #$000C
	sta.w temp2,x
	lda.b $A5
	sta.b $A7
	lda.b $A9
	sta.b $AB
	jsl.l CODE_9EAB74
	lda.w Xvel,x
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
	adc.b $A5
	sec
	sbc.w Xpos,x
	sta.b $A5
	lda.w Yvel,x
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
	adc.b $A9
	sec
	sbc.w Ypos,x
	sta.b $A9
	lda.w position,x
	bne CODE_9EA60E
	lda.w $0B05,x
	bit.w #$0002
	beq CODE_9EA65A
CODE_9EA60E:
	lda.b $A5
	pha
	lda.b $A9
	pha
	ldy.w Xvel,x
	lda.w Yvel,x
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
	sta.b $A9
	pla
	sta.b $A5
	lda.b $14
	cmp.w #$1000
	bcs CODE_9EA64E
	cpy.w #$0005
	bpl CODE_9EA65A
	bra CODE_9EA653
