; Unidentified routine.
CODE_9ED8C3:
	lda.w puckvx
	xba
	lsr a
	lsr a
	and.w #$003F
	bit.w #$0020
	beq CODE_9ED8D4
	ora.w #$FFC0
CODE_9ED8D4:
	clc
	adc.w $0D71
	sec
	sbc.w Xpos,x
	sta.b d0
	sta.b $02
	bit.w #$8000
	beq CODE_9ED8E9
	eor.w #$FFFF
	inc a
CODE_9ED8E9:
	sta.b $00
	lda.w puckvy
	xba
	lsr a
	lsr a
	and.w #$003F
	bit.w #$0020
	beq CODE_9ED8FC
	ora.w #$FFC0
CODE_9ED8FC:
	clc
	adc.w pucky
	sec
	sbc.w Ypos,x
	sta.b d1
	bit.w #$8000
	beq CODE_9ED90F
	eor.w #$FFFF
	inc a
CODE_9ED90F:
	sta.b $04
	jsl.l vtoa
	lda.b d0
	cmp.w #$0008
	beq CODE_9ED93F
	sec
	sbc.w facedir,x
	and.w #$0007
	sta.b d3
	beq CODE_9ED93F
	jmp.w CODE_9ED9A0
