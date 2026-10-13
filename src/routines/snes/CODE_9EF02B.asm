; Unidentified routine.
CODE_9EF02B:
	ldy.b $91
	lda.w $14E3,y
	bne CODE_9EF02A
	inc a
	sta.w $1543,y
	lda.w #$F896
	ldx.b $91
	jsl.l CODE_9EA3F1
	ldx.b $95
	rtl
