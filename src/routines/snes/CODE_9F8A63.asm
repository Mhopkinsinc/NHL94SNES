; Unidentified routine.
CODE_9F8A63:
	jsl.l CODE_9E8C35
	cpx.w #$0018
	bcs CODE_9F8AD1
	lda.w position,x
	beq CODE_9F8AD1
	lda.w pflags,x
	and.w #$8000
	ora.w sfhormode
	bne CODE_9F8AD1
	lda.w Xpos,x
	cmp.w #$FFE7
	bmi CODE_9F8AD1
	cmp.w #$0019
	bpl CODE_9F8AD1
	lda.w Ypos,x
	bit.w #$8000
	beq CODE_9F8A95
	eor.w #$FFFF
	inc a
CODE_9F8A95:
	sec
	sbc.w #$010D
	sta.b $00
	lda.w $0E83,x
	bit.w #$8000
	beq CODE_9F8AA7
	eor.w #$FFFF
	inc a
CODE_9F8AA7:
	sec
	sbc.w #$010D
	eor.b $00
	bmi CODE_9F8AC5
	lda.w Ypos,x
	bit.w #$8000
	beq CODE_9F8ABB
	eor.w #$FFFF
	inc a
CODE_9F8ABB:
	cmp.w #$0103
	bcc CODE_9F8AD1
	cmp.w #$0117
	bcs CODE_9F8AD1
CODE_9F8AC5:
	lda.w $0E43,x
	sta.w Xpos,x
	lda.w $0E83,x
	sta.w Ypos,x
CODE_9F8AD1:
	lda.w $0F23,x
	sec
	sbc.w $0CDD
	bpl CODE_9F8ADD
	lda.w #$0000
CODE_9F8ADD:
	sta.w $0F23,x
	inx
	inx
	cpx.w #$0020
	beq CODE_9F8AEA
	jmp.w CODE_9F8947
