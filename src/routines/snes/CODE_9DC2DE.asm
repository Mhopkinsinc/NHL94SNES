; Unidentified routine.
CODE_9DC2DE:
	ldx.w #$00CE
	lda.b a2
	bne CODE_9DC2E8
	ldx.w #$00EE
CODE_9DC2E8:
	lda.l $7F7500,x
	sta.l $7F759C
	inx
	inx
	lda.l $7F7500,x
	sta.l $7F759E
	rtl
