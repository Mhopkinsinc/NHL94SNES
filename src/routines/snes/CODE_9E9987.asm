; Unidentified routine.
CODE_9E9987:
	tya
	jsl.l CODE_9BC074
	lda.b d0
	bit.w #$8000
	beq CODE_9E9997
	eor.w #$FFFF
	inc a
CODE_9E9997:
	sta.b d2
	asl a
	tax
	lda.l DATA8_9E9927,x
	sta.b d4
	lda.b d1
	bit.w #$8000
	beq CODE_9E99AC
	eor.w #$FFFF
	inc a
CODE_9E99AC:
	asl a
	tax
	lda.l DATA8_9E9927,x
	sta.b d3
	ldx.b $E4
	lda.b a2
	jsl.l CODE_9BC002
	ldy.b a2
	lda.b d0
	clc
	adc.w Xpos,y
	sec
	sbc.w $0D71
	bit.w #$8000
	beq CODE_9E99D1
	eor.w #$FFFF
	inc a
CODE_9E99D1:
	cmp.b d2
	bcs CODE_9E9A0E
	sta.b d0
	lda.b d1
	clc
	adc.w Ypos,y
	sec
	sbc.w pucky
	bit.w #$8000
	beq CODE_9E99EA
	eor.w #$FFFF
	inc a
CODE_9E99EA:
	cmp.b d2
	bcs CODE_9E9A0E
	sta.b d1
	lda.b d3
	clc
	adc.b d4
	cmp.w #$0005
	bpl CODE_9E99FD
	lda.w #$0005
CODE_9E99FD:
	cmp.w $0DF9
	bcc CODE_9E9A0E
	lda.b d3
	sec
	sbc.b d4
	bmi CODE_9E9A11
	cmp.w $0DF9
	bcc CODE_9E9A11
CODE_9E9A0E:
	jmp.w CODE_9E98FB
