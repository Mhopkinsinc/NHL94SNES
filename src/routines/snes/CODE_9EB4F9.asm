; Unidentified routine.
CODE_9EB4F9:
	lda.b [a0]
	and.w #$00FF
	sta.b d0
	tay
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b a1
	lda.b [a1],y
	clc
	adc.b a1
	sta.b a1
	cmp.w #$D4AD
	bne CODE_9EB51A
	jmp.w CODE_9EB6A1
