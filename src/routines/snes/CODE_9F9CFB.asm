; Unidentified routine.
CODE_9F9CFB:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF849
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l PrintPerLabel
	lda.b $A9
	pha
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF84E
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $178E
	sta.b $A5
	jsl.l CODE_9F9E15
	jsl.l PushNumber
	jsl.l CODE_9F9DFB
	jsl.l CODE_9ECE15
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF853
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1790
	sta.b $A5
	jsl.l CODE_9F9E15
	jsl.l PushNumber
	jsl.l CODE_9F9DFB
	jsl.l CODE_9ECE15
	pla
	sta.b $A9
	jmp.w CODE_9F9CD8
