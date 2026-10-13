; Unidentified routine.
CODE_9EDAA1:
	stz.w $0BA1
CODE_9EDAA4:
	lda.b $AD
	sta.b $A9
	pha
	lda.b $A5
	pha
	lda.w Xvel,x
	xba
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EDABB
	ora.w #$FF00
CODE_9EDABB:
	eor.w #$FFFF
	inc a
	sta.b $A5
	pla
	clc
	adc.b $A5
	sec
	sbc.w Xpos,x
	sta.b $A5
	lda.w Yvel,x
	xba
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EDADA
	ora.w #$FF00
CODE_9EDADA:
	eor.w #$FFFF
	inc a
	sta.b $A9
	pla
	clc
	adc.b $A9
	sec
	sbc.w Ypos,x
	sta.b $A9
	lda.w #$0005
	sta.b $C5
	cpx.w puckc
	bne CODE_9EDAF6
	asl.b $C5
CODE_9EDAF6:
	lda.b $A5
	bit.w #$8000
	beq CODE_9EDB01
	eor.w #$FFFF
	inc a
CODE_9EDB01:
	cmp.b $C5
	bcs CODE_9EDB18
	lda.b $A9
	bit.w #$8000
	beq CODE_9EDB10
	eor.w #$FFFF
	inc a
CODE_9EDB10:
	cmp.b $C5
	bcs CODE_9EDB18
	stz.b $A5
	stz.b $A9
CODE_9EDB18:
	jsl.l vtoa
	lda.b $A5
	sta.w temp2b,x
CODE_9EDB21:
	ldy.w $19D4,x
	bpl CODE_9EDB3D
	lda.w temp2b,x
	sta.b $AD
	sec
	sbc.w #$0007
	beq CODE_9EDB36
	bmi CODE_9EDB36
	jmp.w $A539
