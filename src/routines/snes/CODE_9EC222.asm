; Unidentified routine.
CODE_9EC222:
	inc a
	lsr a
	sta.b $A5
	lda.w printx
	sec
	sbc.b $A5
	sta.w printx
	bpl CODE_9EC234
	stz.w printx
CODE_9EC234:
	lda.b [$8D]
	sta.b $A5
	tay
	dec.b $8D
	lda.b [$8D],y
	inc.b $8D
	and.w #$00FF
	bne CODE_9EC246
	dec.b $A5
CODE_9EC246:
	lda.w #$0001
	sta.l $7E344C
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9D8000
	dec.w printy
	dec.w printy
	inc.w printx
	jsl.l CODE_9EC7BE
	bra CODE_9EC2AE
