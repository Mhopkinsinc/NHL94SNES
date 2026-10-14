; Unidentified routine.
CODE_9F9BD3:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF826
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0006
	sta.w printx
	lda.w shootoutround
	sta.b d0
	lda.w #$0002
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
CODE_9F9C05:
	lda.w sflags3
	bit.w #$0001
	beq CODE_9F9C10
	jmp.w CODE_9F9CD8
