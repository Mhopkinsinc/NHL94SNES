; Unidentified routine.
CODE_9EDD71:
	lda.w puckvy
	dec a
	bpl CODE_9EDD89
CODE_9EDD77:
	lda.l $7E3450
	inc a
	sta.l $7E3450
	cmp.w #$0030
	bcc CODE_9EDD90
	jsl.l CODE_9EC791
CODE_9EDD89:
	lda.w #$0000
	sta.l $7E3450
CODE_9EDD90:
	lda.w $0D71
	cmp.w $0E5F
	bne CODE_9EDDB7
	lda.w pucky
	cmp.w $0E9F
	bne CODE_9EDDB7
	lda.w #$0006
	sta.b d0
	dec.w $10BF
	bpl CODE_9EDDBD
.1:
	jsl.l CODE_9EB88A
	bra CODE_9EDDBD
