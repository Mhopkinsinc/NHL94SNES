; Unidentified routine.
CODE_9FAF42:
	lda.w $1E9B
	bne CODE_9FAF97
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8CD
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
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
	sta.b $A5
	inc a
	sta.b $A9
	bra CODE_9FAFAD
