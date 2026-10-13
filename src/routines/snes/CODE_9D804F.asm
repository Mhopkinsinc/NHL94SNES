; Unidentified routine.
CODE_9D804F:
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	asl a
	adc.w $0CD9
	sta.b $C9
	tax
	lda.b [$0C]
	clc
	adc.b $C5
	sta.l $7E37F4,x
	inc.b $0C
	inc.b $0C
	lda.b [$0C]
	clc
	adc.b $C5
	ldy.b $A5
	dey
	dey
CODE_9D8077:
	inx
	inx
	sta.l $7E37F4,x
	dey
	bne CODE_9D8077
	inc.b $0C
	inc.b $0C
	lda.b [$0C]
	clc
	adc.b $C5
	sta.l $7E37F6,x
	inc.w printy
	rts
