; Unidentified routine.
CODE_9EBEDF:
	lda.w #$0010
	sta.b d0
	lda.w pfteam,x
	beq .1
	lda.w #$0001
	sta.b d0
.1:
	lda.w PBnum
	clc
	adc.b d0
	sta.w PBnum
	lda.w #$FFFF
	sta.w position,x
	lda.w sfhormode
	bne .t1
	lda.w #$0171
	sta.w $0D97,x
	bra CODE_9EBF10

.t1:
	lda.w #$0170
	sta.w $0D97,x
CODE_9EBF10:
	rtl
