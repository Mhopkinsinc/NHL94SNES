; Unidentified routine.
CODE_9EAFC7:
	adc.w #$0005
	sta.w temp2,x
	jsl.l CODE_9EAB74
	lda.b $A9
	pha
	lda.b $A5
	pha
	txa
	jsl.l CODE_9BC002
	lda.b $A5
	eor.w #$FFFF
	inc a
	sec
	sbc.w $0EC4,x
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EAFF1
	ora.w #$FF00
CODE_9EAFF1:
	clc
	adc.b $01,s
	sec
	sbc.w Xpos,x
	sta.b $A5
	lda.b $A9
	eor.w #$FFFF
	inc a
org $9EB000
	sec
	sbc.w $0EE4,x
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EB00F
	ora.w #$FF00
CODE_9EB00F:
	clc
	adc.b $03,s
	sec
	sbc.w Ypos,x
	sta.b $A9
	pla
	pla
	jsl.l vtoa
	lda.b $A5
	sta.w temp2b,x
	lda.w position,x
	beq CODE_9EB070
	lda.w puckvx
	sta.b $A5
	lda.w puckvy
	sta.b $A9
	jsl.l vtoa
	lda.b $A5
	cmp.w #$0008
	beq CODE_9EB045
	eor.w #$0004
	cmp.w facedir,x
	beq CODE_9EB070
CODE_9EB045:
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b $A9
	pha
	lda.w puckx
	sec
	sbc.w Xpos,x
	sta.b $A5
	pha
	jsl.l vtoa
	lda.b $A5
	sta.b $C5
	pla
	sta.b $A5
	sta.b $00
	pla
	sta.b $A9
	lda.w facedir,x
	cmp.b $C5
	beq CODE_9EB079
CODE_9EB070:
	lda.w temp2b,x
	sta.b $A5
	jml.l doplayeracc
