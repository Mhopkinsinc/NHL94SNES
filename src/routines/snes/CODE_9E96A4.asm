; Unidentified routine.
CODE_9E96A4:
	lda.b $AD
	ldx.b $A9
	jsl.l CODE_808FEB
	lda.b $0A
	sta.b $AB
	lda.b $08
	sta.b $A9
	lda.b $B1
	ldx.b $A5
	jsl.l CODE_808FEB
	lda.b $08
	sec
	sbc.b $A9
	sta.b $A9
	lda.b $0A
	sbc.b $AB
	sta.b $AB
	lda.b $AA
	sta.b $B9
	ldx.b $95
	lda.w $12C3,x
	clc
	adc.w #$008C
	sta.b $A5
	ldy.b $91
	lda.w $12C3,y
	clc
	adc.w #$008C
	sta.b $A9
	lda.b $A9
	clc
	adc.b $A5
	sta.b $A9
	lda.b $A5
	ldx.b $B5
	jsl.l CODE_808FC9
	lda.b $A9
	sta.b $04
	jsl.l Div32S
	lda.b $00
	sta.b $A5
	sta.b $A9
	lda.b $B1
	ldx.b $B9
	jsl.l CODE_808FEB
	lda.b $08
	sta.b $C5
	lda.b $AD
	ldx.b $A5
	jsl.l CODE_808FEB
	lda.b $08
	clc
	adc.b $C5
	ldx.b $95
	clc
	adc.w Xvel,y
	sta.w Xvel,x
	lda.b $AD
	ldx.b $B9
	jsl.l CODE_808FEB
	lda.b $08
	sta.b $C5
	lda.b $B1
	ldx.b $A5
	jsl.l CODE_808FEB
	lda.b $08
	sec
	sbc.b $C5
	ldx.b $95
	clc
	adc.w Yvel,y
	sta.w Yvel,x
	lda.b $AD
	ldx.b $A9
	jsl.l CODE_808FEB
	lda.b $08
	clc
	adc.w Xvel,y
	sta.w Xvel,y
	lda.b $B1
	ldx.b $A9
	jsl.l CODE_808FEB
	lda.b $08
	clc
	adc.w Yvel,y
	sta.w Yvel,y
	ldx.b $95
	lda.w #$FFFF
	sta.w $0CDB
CODE_9E976E:
	pla
	sta.b $B9
	pla
	sta.b $B5
	pla
	sta.b $B1
	pla
	sta.b $AD
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A5
	rtl
