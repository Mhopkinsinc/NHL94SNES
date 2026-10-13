; Unidentified routine.
CODE_9E97FD:
	stx.b $87
	ldx.w #$0000
CODE_9E9802:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$001C
	bne CODE_9E9802
	ldx.b $87
	lda.w pflags,y
	bit.w #$1000
	bne CODE_9E97F7
	lda.w position,y
	beq CODE_9E97FA
	lda.w $0DF9
	cmp.w #$0005
	bpl CODE_9E97F7
	lda.w $0E01
	cmp.w #$0100
	bpl CODE_9E97F7
	tya
	jsl.l CODE_9BC002
	ldy.b $91
	lda.b $A5
	clc
	adc.w Xpos,y
	sec
	sbc.w $0D71
	bit.w #$8000
	beq CODE_9E9845
	eor.w #$FFFF
	inc a
CODE_9E9845:
	cmp.w #$000F
	bcs CODE_9E9899
	sta.b $A5
	lda.b $A9
	clc
	adc.w Ypos,y
	sec
	sbc.w pucky
	bit.w #$8000
	beq CODE_9E985F
	eor.w #$FFFF
	inc a
CODE_9E985F:
	cmp.w #$000F
	bcs CODE_9E9899
	sta.b $A9
	lda.b $A5
	tax
	jsl.l CODE_808F4C
	sta.b $A5
	lda.b $A9
	tax
	jsl.l CODE_808F4C
	ldx.b $E4
	clc
	adc.b $A5
	sta.b $A5
	lda.w #$00C4
	sta.b $A9
	lda.w $121F
	bmi CODE_9E988D
	beq CODE_9E988D
	lsr.b $A9
	lsr.b $A9
CODE_9E988D:
	lda.b $A9
	cmp.b $A5
	bcc CODE_9E9899
	jsl.l CODE_9EF5DA
	bra CODE_9E98EC
