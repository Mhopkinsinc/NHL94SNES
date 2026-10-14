; Unidentified routine.
CODE_9D8631:
	lda.w HomeTeam
	sta.l $7E3452
	lda.w VisTeam
	sta.l $7E3454
	jsl.l CODE_9DDDB3
	jsl.l CODE_9DE0D4
	lda.w #$0002
	sta.b a2
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3C7
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9D87B5
	lda.b d0
	pha
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
	stz.b a2
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3D6
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9D87B5
	lda.b d0
	pha
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
CODE_9D86AA:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3E5
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $1DB9
	sta.b d0
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9D875A
	sta.b a1
	jsl.l AdvanceStringPtr
	jsl.l print
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3EA
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	pla
	sta.b d0
	pla
	cmp.b d0
	beq CODE_9D8737
	bmi CODE_9D871B
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3F8
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra CODE_9D8751
