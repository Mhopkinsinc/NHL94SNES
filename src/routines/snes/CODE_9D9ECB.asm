; Unidentified routine.
CODE_9D9ECB:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF45F
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w SelectedPlayerIdx
	sta.b d0
	lda.w #$009D
	sta.b $8F
	lda.w #RosterLineNames
	sta.b a1
	jsl.l AdvanceStringPtr
	jsl.l print
	lda.w #$0011
	sta.w printx
	lda.w #$0009
	sta.w printy
CODE_9D9F08:
	lda.w #$0080
	sta.b $8F
	lda.w #AttribMenuSkater
	sta.b a1
	lda.w $0D47
	sta.b d0
	lda.w SelectedPlayerIdx
	bne CODE_9D9F32
	lda.w #$0080
	sta.b $8F
	lda.w #AttribMenuGoalie
	sta.b a1
	bra CODE_9D9F32
