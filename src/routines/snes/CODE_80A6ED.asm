; Unidentified routine.
CODE_80A6ED:
	lda.b $5E
CODE_80A6EF:
	dec a
	sta.w $091A,x
	stz.w $096A,x
	stz.w $097A,x
	stz.w $098A,x
	ldy.b #$1C
	lda.b ($4E),y
	sta.w $099A,x
	stz.w $09AA,x
	ldy.b #$20
	lda.b ($4E),y
	sta.w $09BA,x
	stz.w $09CA,x
	ldy.b #$1E
	lda.b ($4E),y
	sta.w $09DA,x
	stz.w $09EA,x
	ldy.b #$2D
	lda.b ($4E),y
	bmi CODE_80A725
	lda.w #$FFFF
	bra CODE_80A728
