; Unidentified routine.
CODE_9DAC22:
	stx.b $91
	lda.l $7E345E
	jsl.l CODE_9DC973
	jsl.l CODE_9FC4D0
	cpx.w #$0000
	bne CODE_9DAC4E
	lda.b $8F
	sta.b $0E
	lda.b $8D
	sta.b $0C
	lda.w #$0000
	sta.b $12
	lda.w #$0A5C
	sta.b $10
	ldx.w #$0031
	jsl.l CODE_808F2F
CODE_9DAC4E:
	rts
