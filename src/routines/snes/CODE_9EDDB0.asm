; Unidentified routine.
CODE_9EDDB0:
	lda.w #$0000
	sta.l $7E3450
CODE_9EDDB7:
	lda.w #$0078
	sta.w $10BF
CODE_9EDDBD:
	lda.w $0E01
	and.w #$FF00
	ora.w $0DF9
	beq .t1
	jmp.w checkpuckcoll

.t1:
	jsl.l pucknothing
	jmp.w checkpuckcoll
