; Unidentified routine.
CODE_9EF3A3:
	ldy.b a2
	bne CODE_9EF3AE
CODE_9EF3A7:
	lda.w $1762,y
	inc a
	sta.w $1762,y
CODE_9EF3AE:
	lda.w $1E9B
	bne CODE_9EF3C3
	lda.w $1E8B
	beq CODE_9EF3CC
	ldy.b a2
	lda.w $17C6,y
	inc a
	sta.w $17C6,y
	bra CODE_9EF3CC
