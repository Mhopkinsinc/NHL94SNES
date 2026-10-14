; Unidentified routine.
CODE_9EDAA1:
	stz.w $0BA1
CODE_9EDAA4:
	lda.b d2
	sta.b d1
	pha
	lda.b d0
	pha
	lda.w $0EC3,x
	xba
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EDABB
	ora.w #$FF00
CODE_9EDABB:
	eor.w #$FFFF
	inc a
	sta.b d0
	pla
	clc
	adc.b d0
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w $0EE3,x
	xba
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EDADA
	ora.w #$FF00
CODE_9EDADA:
	eor.w #$FFFF
	inc a
	sta.b d1
	pla
	clc
	adc.b d1
	sec
	sbc.w Ypos,x
	sta.b d1
	lda.w #$0005
	sta.b tmp0
	cpx.w $0AD9
	bne CODE_9EDAF6
	asl.b tmp0
CODE_9EDAF6:
	lda.b d0
	bit.w #$8000
	beq CODE_9EDB01
	eor.w #$FFFF
	inc a
CODE_9EDB01:
	cmp.b tmp0
	bcs CODE_9EDB18
	lda.b d1
	bit.w #$8000
	beq CODE_9EDB10
	eor.w #$FFFF
	inc a
CODE_9EDB10:
	cmp.b tmp0
	bcs CODE_9EDB18
	stz.b d0
	stz.b d1
CODE_9EDB18:
	jsl.l vtoa
	lda.b d0
	sta.w $10A3,x
CODE_9EDB21:
	ldy.w $19D4,x
	bpl CODE_9EDB3D
	lda.w $10A3,x
	sta.b d2
	sec
	sbc.w #$0007
	beq CODE_9EDB36
	bmi CODE_9EDB36
	jmp.w CODE_9EA539
