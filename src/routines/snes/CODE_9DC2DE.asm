; Unidentified routine.
CODE_9DC2DE:
	ldx.w #$00CE
	lda.b a2
	bne .1
	ldx.w #$00EE
.1:
	lda.l $7F7500,x
	sta.l $7F759C
	inx
	inx
	lda.l $7F7500,x
	sta.l $7F759E
	rtl
