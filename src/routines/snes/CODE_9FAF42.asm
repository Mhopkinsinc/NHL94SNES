; Unidentified routine.
CODE_9FAF42:
	lda.w $1E9B
	bne CODE_9FAF97
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8CD
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.l $7E3126
	sec
	sbc.w #$002E
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9FAF74
CODE_9FAF71:
	ora.w #$E000
CODE_9FAF74:
	sta.w printx
	lda.l $7E3128
	sec
	sbc.w #$0044
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9FAF8A
CODE_9FAF87:
	ora.w #$E000
CODE_9FAF8A:
	sta.w printy
	lda.w #$000C
	sta.b d0
	inc a
	sta.b d1
	bra CODE_9FAFAD
