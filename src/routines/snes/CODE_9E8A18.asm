; Unidentified routine.
CODE_9E8A18:
	lda.w #$009E
	sta.b $A9
	lda.w #$004E
	sta.b $AD
	lda.w position,y
	beq CODE_9E8A4B
	ldy.b $91
	lda.w tmflags,y
	bit.w #$0010
	bne CODE_9E8A4B
	lda.b $AD
	sec
	sbc.w pucky
	bmi CODE_9E8A40
	lda.w pucky
	sta.b $A9
	bra CODE_9E8A4F
