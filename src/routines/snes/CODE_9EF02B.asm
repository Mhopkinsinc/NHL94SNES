; Unidentified routine.
CODE_9EF02B:
	ldy.b a2
	lda.w pfalock,y
	bne CODE_9EF02A
	inc a
	sta.w $1543,y
	lda.w #$F896
	ldx.b a2
	jsl.l SetSPAFromA
	ldx.b a3
	rtl
