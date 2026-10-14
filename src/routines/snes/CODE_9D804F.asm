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
	adc.w printm
	sta.b tmp2
	tax
	lda.b [$0C]
	clc
	adc.b tmp0
	sta.l textmap,x
	inc.b $0C
	inc.b $0C
	lda.b [$0C]
	clc
	adc.b tmp0
	ldy.b d0
	dey
	dey
.loop:
	inx
	inx
	sta.l textmap,x
	dey
	bne .loop
	inc.b $0C
	inc.b $0C
	lda.b [$0C]
	clc
	adc.b tmp0
	sta.l $7E37F6,x
	inc.w printy
	rts
