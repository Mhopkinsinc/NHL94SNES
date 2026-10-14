; Unidentified routine.
CODE_9F9CFB:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF849
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l PrintPerLabel
	lda.b d1
	pha
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF84E
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $178E
	sta.b d0
	jsl.l CODE_9F9E15
	jsl.l PushNumber
	jsl.l CODE_9F9DFB
	jsl.l CODE_9ECE15
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF853
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $1790
	sta.b d0
	jsl.l CODE_9F9E15
	jsl.l PushNumber
	jsl.l CODE_9F9DFB
	jsl.l CODE_9ECE15
	pla
	sta.b d1
	jmp.w CODE_9F9CD8
