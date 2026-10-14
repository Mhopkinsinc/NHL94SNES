; Unidentified routine.
CODE_9EAFC7:
	adc.w #$0005
	sta.w $1023,x
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
	beq CODE_9EAFF1
	ora.w #$FF00
CODE_9EAFF1:
	clc
	adc.b $01,s
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.b d1
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
	sta.b d1
	pla
	pla
	jsl.l vtoa
	lda.b d0
	sta.w $10A3,x
	lda.w position,x
	beq CODE_9EB070
	lda.w puckvx
	sta.b d0
	lda.w puckvy
	sta.b d1
	jsl.l vtoa
	lda.b d0
	cmp.w #$0008
	beq CODE_9EB045
	eor.w #$0004
	cmp.w facedir,x
	beq CODE_9EB070
CODE_9EB045:
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b d1
	pha
	lda.w $0D71
	sec
	sbc.w Xpos,x
	sta.b d0
	pha
	jsl.l vtoa
	lda.b d0
	sta.b tmp0
	pla
	sta.b d0
	sta.b $00
	pla
	sta.b d1
	lda.w facedir,x
	cmp.b tmp0
	beq CODE_9EB079
CODE_9EB070:
	lda.w $10A3,x
	sta.b d0
	jml.l CODE_9EA8A9
