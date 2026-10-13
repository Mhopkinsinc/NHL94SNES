; Unidentified routine.
CODE_80AD2A:
	lda.w $098A,x
	sec
	sbc.w $09DA,x
	sta.w $098A,x
	bpl CODE_80AD4D
	eor.w #$FFFF
	inc a
	cmp.w $09BA,x
	bcc CODE_80AD4D
	ldy.b #$2D
	lda.b ($4E),y
	bmi CODE_80AD4A
	stz.w $098A,x
	bra CODE_80AD4D
