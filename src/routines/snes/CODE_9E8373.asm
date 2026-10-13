; Unidentified routine.
CODE_9E8373:
	rtl
	lda.b $A5
	and.w #$00FF
	bit.w #$0080
	beq CODE_9E8381
CODE_9E837E:
	ora.w #$FF00
CODE_9E8381:
	sta.b $A5
	lda.w $0EC4,x
	and.w #$00FF
	bit.w #$0080
	beq CODE_9E8391
	ora.w #$FF00
CODE_9E8391:
	clc
	adc.w puckx
	sta.b $AD
	lda.w $0EE4,x
	and.w #$00FF
	bit.w #$0080
	beq CODE_9E83A5
	ora.w #$FF00
CODE_9E83A5:
	clc
	adc.w pucky
	sta.b $B1
	stz.w $0D2D
	lda.w #$0005
	sta.b $B5
	stz.b $89
	cpx.w #$000C
	bcs CODE_9E83BF
CODE_9E83BA:
	lda.w #$000C
	sta.b $89
CODE_9E83BF:
	ldy.b $89
	lda.w $0EC4,y
	and.w #$00FF
	bit.w #$0080
	beq CODE_9E83CF
	ora.w #$FF00
CODE_9E83CF:
	clc
	adc.w Xpos,y
	sec
	sbc.b $AD
	cmp.w #$FFEB
	bmi CODE_9E8430
	cmp.w #$0015
	bpl CODE_9E8430
	lda.w $0EE4,y
	and.w #$00FF
	bit.w #$0080
	beq CODE_9E83EE
	ora.w #$FF00
CODE_9E83EE:
	clc
	adc.w Ypos,y
	sec
	sbc.b $B1
	cmp.w #$FFEB
	bmi CODE_9E8430
	cmp.w #$0015
	bpl CODE_9E8430
	inc.w $0D2D
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b $A5
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b $A9
	jsl.l vtoa
	lda.w facedir,x
	eor.w #$0004
	cmp.b $A5
	bne CODE_9E8430
	lda.w $0794
	and.w #$0001
	clc
	adc.b $A5
	and.w #$0007
	sta.b $A5
CODE_9E8430:
	inc.b $89
	inc.b $89
	dec.b $B5
	bmi CODE_9E843B
	jmp.w $83BF
