; Unidentified routine.
CODE_9FE780:
	ldx.w #$76FE
	ldy.w #$007F
	lda.w #$FFFF
	sta.l $7F76DE
CODE_9FE78D:
	jsl.l CODE_9D96A9
	bra CODE_9FE79E
