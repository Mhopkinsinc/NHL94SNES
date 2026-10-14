; Unidentified routine.
CODE_9ED271:
	adc.w #$0005
	sta.w $1023,x
	lda.w puckvx
	xba
	and.w #$00FF
	bit.w #$0080
	beq CODE_9ED286
	ora.w #$FF00
CODE_9ED286:
	clc
	adc.w $0D71
	sta.b d0
	lda.w puckvy
	xba
	and.w #$00FF
	bit.w #$0080
	beq CODE_9ED29B
	ora.w #$FF00
CODE_9ED29B:
	clc
	adc.w pucky
	sta.b d1
	jsl.l CODE_9EAB74
	lda.b d1
	pha
	lda.b d0
	pha
	txa
	jsl.l CODE_9BC002
	lda.b d0
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
	sta.b d0
	lda.b d1
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
	sta.b d1
	pla
	pla
	jsl.l vtoa
	lda.b d0
	sta.w $10A3,x
CODE_9ED2F7:
	lda.w $10A3,x
	sta.b d0
	jml.l CODE_9EA8A9
