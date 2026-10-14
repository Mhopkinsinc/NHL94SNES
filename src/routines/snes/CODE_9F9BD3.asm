; Unidentified routine.
CODE_9F9BD3:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF826
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0006
	sta.w printx
	lda.w $1D85
	sta.b $A5
	lda.w #$0002
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
CODE_9F9C05:
	lda.w sflags3
	bit.w #$0001
	beq CODE_9F9C10
	jmp.w CODE_9F9CD8
