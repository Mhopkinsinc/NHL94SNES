; Unidentified routine.
CODE_9ECC71:
	inc.b a2
	lda.w $1E43
	bne .t1
	jmp.w CODE_9ECAB7

.t1:
	lda.w #$009E
	sta.b $8F
	lda.w #DATA8_9ECC88
	sta.b a1
	jmp.w CODE_9ECD19
