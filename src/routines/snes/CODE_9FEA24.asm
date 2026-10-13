; Unidentified routine.
CODE_9FEA24:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8FD
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $0D13
	sta.b $A5
	lda.w $1EB7
	beq CODE_9FEA5E
	cmp.w #$0001
	beq CODE_9FEA76
	cmp.w #$0002
	beq CODE_9FEA82
	cmp.w #$0003
	beq CODE_9FEA8E
	cmp.w #$0004
	beq CODE_9FEA9A
	bra CODE_9FEA6A
