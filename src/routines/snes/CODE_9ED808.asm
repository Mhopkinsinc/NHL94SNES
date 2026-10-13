; Unidentified routine.
CODE_9ED808:
	lda.b $A5
	inc a
	sta.b $AD
	lda.w #$0014
	sta.b $B5
	lda.w sflags
	bit.w #$0008
	beq CODE_9ED81F
	lda.w #$001C
	sta.b $B5
CODE_9ED81F:
	pla
	sta.b $A5
	pla
	sta.b $A9
	tax
	lda.b $B5
	jsl.l CODE_808FC9
	lda.b $AD
	sta.b $04
	jsl.l Div32S
	lda.b $00
	sta.b $A9
	lda.b $B5
	adc.w #$0006
	sta.b $B5
	ldx.b $A5
	jsl.l CODE_808FC9
	lda.b $AD
	sta.b $04
	jsl.l Div32S
	lda.b $00
	sta.b $A5
	ldx.b $E4
CODE_9ED853:
	lda.b $A9
	clc
	adc.b $B1
	sta.b $A9
	sta.b $AD
	ldy.w $19D4,x
	bmi CODE_9ED871
	cpx.w puckc
	beq CODE_9ED86E
	lda.w $0776,y
	bit.w #$0080
	bne CODE_9ED8A4
CODE_9ED86E:
	jmp.w $DA2C
