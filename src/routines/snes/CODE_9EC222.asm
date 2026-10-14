; Unidentified routine.
CODE_9EC222:
	inc a
	lsr a
	sta.b d0
	lda.w printx
	sec
	sbc.b d0
	sta.w printx
	bpl CODE_9EC234
	stz.w printx
CODE_9EC234:
	lda.b [a1]
	sta.b d0
	tay
	dec.b a1
	lda.b [a1],y
	inc.b a1
	and.w #$00FF
	bne CODE_9EC246
	dec.b d0
CODE_9EC246:
	lda.w #$0001
	sta.l $7E344C
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9D8000
	dec.w printy
	dec.w printy
	inc.w printx
	jsl.l print
	bra CODE_9EC2AE
