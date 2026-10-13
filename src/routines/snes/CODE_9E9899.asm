; Unidentified routine.
CODE_9E9899:
	lda.w position,y
	beq CODE_9E98FB
	lda.w Xpos,y
	sec
	sbc.w puckx
	bit.w #$8000
	beq CODE_9E98AE
	eor.w #$FFFF
	inc a
CODE_9E98AE:
	cmp.w #$0009
	bcs CODE_9E98EC
	sta.b $A5
	lda.w Ypos,y
	sec
	sbc.w pucky
	bit.w #$8000
	beq CODE_9E98C5
	eor.w #$FFFF
	inc a
CODE_9E98C5:
	cmp.w #$0009
	bcs CODE_9E98EC
	sta.b $A9
	lda.b $A5
	tax
	jsl.l CODE_808F4C
	sta.b $A5
	lda.b $A9
	tax
	jsl.l CODE_808F4C
	clc
	adc.b $A5
	sta.b $A5
	ldx.b $95
	cmp.w #$0041
	bcs CODE_9E98EC
	jsl.l CODE_9EEF7F
CODE_9E98EC:
	stx.b $87
	ldx.w #$001A
CODE_9E98F1:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9E98F1
	ldx.b $87
	rtl
