; Unidentified routine.
CODE_9B9B6B:
	lda.w gsp
	cmp.w #$0003
	beq .rtl
	stz.b $00
	lda.l $7E34BC
	cmp.w #$0000
	beq .1
	cmp.w #$0004
	beq .1
	inc.b $00
	lda.l playoffRoundIdx
	cmp.w #$0002
	bmi .1
	inc.b $00
	lda.l playoffRoundIdx
	cmp.w #$0003
	bmi .1
	inc.b $00
.1:
	lda.b $00
	asl a
	asl a
	asl a
	asl a
	sta.w $19BE
.rtl:
	rtl
