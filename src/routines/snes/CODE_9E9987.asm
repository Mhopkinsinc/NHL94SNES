; Unidentified routine.
CODE_9E9987:
	tya
	jsl.l CODE_9BC074
	lda.b $A5
	bit.w #$8000
	beq CODE_9E9997
	eor.w #$FFFF
	inc a
CODE_9E9997:
	sta.b $AD
	asl a
	tax
	lda.l DATA8_9E9927,x
	sta.b $B5
	lda.b $A9
	bit.w #$8000
	beq CODE_9E99AC
	eor.w #$FFFF
	inc a
CODE_9E99AC:
	asl a
	tax
	lda.l DATA8_9E9927,x
	sta.b $B1
	ldx.b $E4
	lda.b $91
	jsl.l CODE_9BC002
	ldy.b $91
	lda.b $A5
	clc
	adc.w Xpos,y
	sec
	sbc.w puckx
	bit.w #$8000
	beq CODE_9E99D1
	eor.w #$FFFF
	inc a
CODE_9E99D1:
	cmp.b $AD
	bcs CODE_9E9A0E
	sta.b $A5
	lda.b $A9
	clc
	adc.w Ypos,y
	sec
	sbc.w pucky
	bit.w #$8000
	beq CODE_9E99EA
	eor.w #$FFFF
	inc a
CODE_9E99EA:
	cmp.b $AD
	bcs CODE_9E9A0E
	sta.b $A9
	lda.b $B1
	clc
	adc.b $B5
	cmp.w #$0005
	bpl CODE_9E99FD
	lda.w #$0005
CODE_9E99FD:
	cmp.w $0DF9
	bcc CODE_9E9A0E
	lda.b $B1
	sec
	sbc.b $B5
	bmi CODE_9E9A11
	cmp.w $0DF9
	bcc CODE_9E9A11
CODE_9E9A0E:
	jmp.w $98FB
