; Unidentified routine.
CODE_9EB198:
	stz.b $A9
	lda.w pucky
	sec
	sbc.w #$0058
	bpl CODE_9EB1B0
	inc.b $A9
	inc.b $A9
	lda.w pucky
	sec
	sbc.w #$FFA8
	bpl CODE_9EB1C8
CODE_9EB1B0:
	lda.w gmode
	bit.w #$0002
	beq CODE_9EB1BF
	lda.b $A9
	eor.w #$0002
	sta.b $A9
CODE_9EB1BF:
	ldy.b $A9
	lda.w $1752,y
	inc a
	sta.w $1752,y
CODE_9EB1C8:
	rtl
