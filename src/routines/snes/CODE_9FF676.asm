; Unidentified routine.
CODE_9FF676:
	ldx.b $BB
	bne .t1
	jsr.w CODE_9FF992
	bne .t1
	jsr.w CODE_9FF992
	bne .t1
	jsr.w CODE_9FF992
	bne .t1
	lda.w #$0008
	tsb.b $C3
	bra .1

.t1:
	lda.w #$4000
	sta.b $10
	lda.w #$007F
	sta.b $12
	jsr.w CODE_9FFA08
	lda.w #$0008
	tsb.b $C3
	lda.b d5
	sta.b $B7
.1:
	jmp.w CODE_9FF898
