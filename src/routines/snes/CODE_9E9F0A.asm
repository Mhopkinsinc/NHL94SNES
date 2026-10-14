; Unidentified routine.
CODE_9E9F0A:
	lda.b d0
	xba
	tax
	lda.b d4
	jsl.l DivX8S
	lsr a
	lsr a
	bit.w #$2000
	beq CODE_9E9F1E
	ora.w #$C000
CODE_9E9F1E:
	sta.b d0
	bit.w #$8000
	beq CODE_9E9F29
	eor.w #$FFFF
	inc a
CODE_9E9F29:
	sta.b $AF
	lda.b d1
	xba
	tax
	lda.b d4
	jsl.l DivX8S
	ldx.b a3
	lsr a
	lsr a
	bit.w #$2000
	beq CODE_9E9F41
	ora.w #$C000
CODE_9E9F41:
	sta.b d1
	bit.w #$8000
	beq CODE_9E9F4C
	eor.w #$FFFF
	inc a
CODE_9E9F4C:
	cmp.b $AF
	bcs CODE_9E9FA6
	lda.b $A7
	bpl CODE_9E9F7F
	lda.b d5
	dec a
	cmp.w #$0003
	bcs CODE_9E9F7C
	lda.b d0
	clc
	adc.w #$0006
	clc
	adc.b $A7
	sta.w Xpos,y
	lda.b d1
	clc
	adc.b $AB
	sta.w Ypos,y
	lda.w #$0000
	sta.w $0EC3,y
	sta.w $0EE3,y
	jmp.w CODE_9E9C71
