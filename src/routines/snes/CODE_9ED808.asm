; Unidentified routine.
CODE_9ED808:
	lda.b d0
	inc a
	sta.b d2
	lda.w #$0014
	sta.b d4
	lda.w sflags
	bit.w #$0008
	beq CODE_9ED81F
	lda.w #$001C
	sta.b d4
CODE_9ED81F:
	pla
	sta.b d0
	pla
	sta.b d1
	tax
	lda.b d4
	jsl.l CODE_808FC9
	lda.b d2
	sta.b $04
	jsl.l Div32S
	lda.b $00
	sta.b d1
	lda.b d4
	adc.w #$0006
	sta.b d4
	ldx.b d0
	jsl.l CODE_808FC9
	lda.b d2
	sta.b $04
	jsl.l Div32S
	lda.b $00
	sta.b d0
	ldx.b $E4
CODE_9ED853:
	lda.b d1
	clc
	adc.b d3
	sta.b d1
	sta.b d2
	ldy.w $19D4,x
	bmi CODE_9ED871
	cpx.w $0AD9
	beq CODE_9ED86E
	lda.w JoyPad,y
	bit.w #$0080
	bne CODE_9ED8A4
CODE_9ED86E:
	jmp.w CODE_9EDA2C
