; the shootout: both shooter lists, then a turn for each team every round, until after five rounds
CODE_80C81C:		; the shootout: both shooter lists, then a turn for each team every round, until after five rounds
		;   $178E and $1790 differ
	lda.l $7E34C6
	pha
	lda.w #$0000
	sta.l $7E34C6
	lda.w #$0001
	sta.w $1D81
	stz.b a2
	jsl.l InitShooters
	lda.w #$0002
	sta.b a2
	jsl.l InitShooters
	jsl.l CODE_9F833C
	jsl.l CODE_9F8433
	jsl.l CODE_9F937B
	lda.w #$0001
	sta.w shootoutround
	stz.b d1
CODE_80C851:
	stz.w $1D89
	lda.w #$0002
	sta.b a2
	stz.b a1
	jsl.l CODE_80C898
	lda.w shootoutround
	cmp.w #$0005
	bmi CODE_80C86D
	lda.w #$0001
	sta.w $1D89
CODE_80C86D:
	stz.b a2
	lda.w #$0002
	sta.b a1
	jsl.l CODE_80C898
	jsl.l CODE_80CA0A
	inc.w shootoutround
	lda.w shootoutround
	cmp.w #$0006
	bmi CODE_80C851
	lda.w $178E
	cmp.w $1790
	beq CODE_80C851
	stz.w $1D81
	pla
	sta.l $7E34C6
	rtl
