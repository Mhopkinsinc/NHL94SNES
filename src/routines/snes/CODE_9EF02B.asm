; Unidentified routine.
CODE_9EF02B:
	ldy.b $91
	lda.w pfalock,y
	bne CODE_9EF02A
	inc a
	sta.w pf2aip,y
	lda.w #DATA8_9DF896
	ldx.b $91
	jsl.l CODE_9EA3F1
	ldx.b $95
	rtl
