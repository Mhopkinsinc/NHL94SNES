; Unidentified routine.
CODE_9FEB32:
	lda.w #$009F
	sta.b $97
	lda.w #DATA8_9FEC72
	sta.b $95
	lda.w $1EB7
	asl a
	clc
	adc.b $95
	sta.b $95
	lda.b [$95]
	cmp.b $A5
	beq CODE_9FEB4E
	jmp.w $EBA5
