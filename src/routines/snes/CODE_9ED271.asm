; Unidentified routine.
CODE_9ED271:
	adc.w #$0005
	sta.w temp2,x
	lda.w puckvx
	xba
	and.w #$00FF
	bit.w #$0080
	beq CODE_9ED286
	ora.w #$FF00
CODE_9ED286:
	clc
	adc.w puckx
	sta.b $A5
	lda.w puckvy
	xba
	and.w #$00FF
	bit.w #$0080
	beq CODE_9ED29B
	ora.w #$FF00
CODE_9ED29B:
	clc
	adc.w pucky
	sta.b $A9
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
	beq CODE_9ED2C5
	ora.w #$FF00
CODE_9ED2C5:
	clc
	adc.b $01,s
	sec
	sbc.w Xpos,x
	sta.b $A5
	lda.b $A9
	eor.w #$FFFF
	inc a
	sec
	sbc.w $0EE4,x
	and.w #$00FF
	bit.w #$0080
	beq CODE_9ED2E3
	ora.w #$FF00
CODE_9ED2E3:
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
CODE_9ED2F7:
	lda.w temp2b,x
	sta.b $A5
	jml.l doplayeracc
