; Unidentified routine.
CODE_80B41D:
	lda.b [$0C],y
	clc
	adc.w #$0003
	and.w #$FFFC
	lsr a
	lsr a
	sta.b $14
	cmp.w #$0009
	bcc CODE_80B432
	jmp.w CODE_80B52C
