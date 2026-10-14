; Unidentified routine.
CODE_9C94D2:
	ldy.w #$0000
	lda.b $16
	beq CODE_9C94EA
	lda.b a2
	bmi CODE_9C94EA
	bne CODE_9C94F8
	lda.w #$00F8
	sec
	sbc.b $14
	sta.w $1E17
	bra CODE_9C94F8
