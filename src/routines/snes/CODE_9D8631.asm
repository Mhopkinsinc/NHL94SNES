; Unidentified routine.
CODE_9D8631:
	lda.w HomeTeam
	sta.l $7E3452
	lda.w VisTeam
	sta.l $7E3454
	jsl.l CODE_9DDDB3
	jsl.l CODE_9DE0D4
	lda.w #$0002
	sta.b $91
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3C7
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9D87B5
	lda.b $A5
	pha
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
	stz.b $91
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3D6
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9D87B5
	lda.b $A5
	pha
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
CODE_9D86AA:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3E5
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1DB9
	sta.b $A5
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9D875A
	sta.b $8D
	jsl.l AdvanceStringPtr
	jsl.l CODE_9EC7BE
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3EA
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	pla
	sta.b $A5
	pla
	cmp.b $A5
	beq CODE_9D8737
	bmi CODE_9D871B
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3F8
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9D8751
