; Unidentified routine.
CODE_9EB4F9:
	lda.b [$89]
	and.w #$00FF
	sta.b $A5
	tay
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b $8D
	lda.b [$8D],y
	clc
	adc.b $8D
	sta.b $8D
	cmp.w #$D4AD
	bne CODE_9EB51A
	jmp.w $B6A1
