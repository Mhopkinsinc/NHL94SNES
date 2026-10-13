; Unidentified routine.
CODE_9D9ECB:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF45F
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $0D43
	sta.b $A5
	lda.w #$009D
	sta.b $8F
	lda.w #RosterLineNames
	sta.b $8D
	jsl.l AdvanceStringPtr
	jsl.l CODE_9EC7BE
	lda.w #$0011
	sta.w printx
	lda.w #$0009
	sta.w printy
CODE_9D9F08:
	lda.w #$0080
	sta.b $8F
	lda.w #AttribMenuSkater
	sta.b $8D
	lda.w $0D47
	sta.b $A5
	lda.w $0D43
	bne CODE_9D9F32
	lda.w #$0080
	sta.b $8F
	lda.w #AttribMenuGoalie
	sta.b $8D
	bra CODE_9D9F32
