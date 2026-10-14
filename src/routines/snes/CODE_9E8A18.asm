; Unidentified routine.
CODE_9E8A18:
	lda.w #$009E
	sta.b d1
	lda.w #$004E
	sta.b d2
	lda.w position,y
	beq CODE_9E8A4B
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne CODE_9E8A4B
	lda.b d2
	sec
	sbc.w pucky
	bmi CODE_9E8A40
	lda.w pucky
	sta.b d1
	bra CODE_9E8A4F
