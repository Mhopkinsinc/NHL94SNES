; Unidentified routine.
CODE_9EE022:
	lda.w $0EC4,y
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EE030
	ora.w #$FF00
CODE_9EE030:
	pha
	asl a
	pla
	ror a
	clc
	adc.w Xpos,y
	sec
	sbc.w puckx
	sta.b $A5
	lda.w $0EE4,y
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EE04C
	ora.w #$FF00
CODE_9EE04C:
	pha
	asl a
	pla
	ror a
	clc
	adc.w Ypos,y
	sec
	sbc.w pucky
	sta.b $A9
	ldy.b $A5
	jsl.l CODE_9CA554
	sta.b $AD
	lda.w #$0012
	sta.b $B1
	ldy.w #$0108
	lda.w pfgoal,x
	bne CODE_9EE072
	ldy.w #$FEF8
CODE_9EE072:
	sty.b $B5
	tya
	pha
	lda.b $B1
	pha
	jsr.w $E0CD
	lda.b $B5
	sta.b $B9
	pla
	eor.w #$FFFF
	inc a
	sta.b $B1
	pla
	sta.b $B5
	jsr.w $E0CD
	lda.b $B5
	clc
	adc.b $B9
	sta.b $B5
	ldx.b $95
	stz.b $A5
	lda.b $B5
	cmp.w #$FFD3
	bmi CODE_9EE0C7
	cmp.w #$002D
	bpl CODE_9EE0C7
	lda.w pfgoal,x
	beq CODE_9EE0B1
	lda.w #$0000
	sec
	sbc.b $B5
	sta.b $B5
CODE_9EE0B1:
	jsl.l RandomWord
	and.w #$0003
	inc a
	sta.b $A5
	lda.b $B5
	bpl CODE_9EE0C7
	lda.b $A5
	clc
	adc.w #$0004
	sta.b $A5
CODE_9EE0C7:
	lda.b $A5
	sta.w passdir
CODE_9EE0CC:
	rtl
