; Unidentified routine.
CODE_9EC1C2:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF734
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b a1
	ldy.b d0
	lda.l $7E344C
	beq CODE_9EC20E
	cpy.w #$0006
	bne CODE_9EC1F6
	jmp.w CODE_80C2AE
