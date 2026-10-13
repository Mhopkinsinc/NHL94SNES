; Unidentified routine.
CODE_9EBEDF:
	lda.w #$0010
	sta.b $A5
	lda.w pfteam,x
	beq CODE_9EBEEE
	lda.w #$0001
	sta.b $A5
CODE_9EBEEE:
	lda.w PBnum
	clc
	adc.b $A5
	sta.w PBnum
	lda.w #$FFFF
	sta.w position,x
	lda.w sfhormode
	bne CODE_9EBF0A
	lda.w #$0171
	sta.w $0D97,x
	bra CODE_9EBF10
