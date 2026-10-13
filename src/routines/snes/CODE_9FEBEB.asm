; Unidentified routine.
CODE_9FEBEB:
	lda.w #$009F
	sta.b $97
	lda.w #$EC8A
	sta.b $95
	lda.w $1EB7
	asl a
	clc
	adc.b $95
	sta.b $95
	lda.b [$95]
	cmp.b $A5
	beq CODE_9FEC07
	jmp.w $EBA5
