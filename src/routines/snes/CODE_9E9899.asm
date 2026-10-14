; Unidentified routine.
CODE_9E9899:
	lda.w position,y
	beq CODE_9E98FB
	lda.w Xpos,y
	sec
	sbc.w $0D71
	bit.w #$8000
	beq .1
	eor.w #$FFFF
	inc a
.1:
	cmp.w #$0009
	bcs CODE_9E98EC
	sta.b d0
	lda.w Ypos,y
	sec
	sbc.w pucky
	bit.w #$8000
	beq .2
	eor.w #$FFFF
	inc a
.2:
	cmp.w #$0009
	bcs CODE_9E98EC
	sta.b d1
	lda.b d0
	tax
	jsl.l CODE_808F4C
	sta.b d0
	lda.b d1
	tax
	jsl.l CODE_808F4C
	clc
	adc.b d0
	sta.b d0
	ldx.b a3
	cmp.w #$0041
	bcs CODE_9E98EC
	jsl.l CODE_9EEF7F
CODE_9E98EC:
	stx.b xsave
	ldx.w #$001A
.loop:
	pla
	sta.b d0,x
	dex
	dex
	bpl .loop
	ldx.b xsave
	rtl
