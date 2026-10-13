; Unidentified routine.
CODE_9FBE9E:
	ldy.w #$0000
	lda.w #$009A
	sta.b $93
	lda.w #$E9A3
	sta.b $91
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	asl a
	adc.w $0CD9
	tax
	lda.w #$0009
	sta.b $C5
	sta.b $C7
CODE_9FBEC2:
	lda.b [$91],y
	clc
	adc.l $7E35CE
	clc
	adc.l $7E35A8
	clc
	adc.b $14
	sta.l $7E37F4,x
	iny
	iny
	inx
	inx
	dec.b $C5
	bne CODE_9FBEC2
CODE_9FBEDD:
	lda.b [$91],y
	clc
	adc.l $7E35CE
	clc
	adc.l $7E35A8
	clc
	adc.b $14
	sta.l $7E3822,x
	iny
	iny
	inx
	inx
	dec.b $C7
	bne CODE_9FBEDD
CODE_9FBEF8:
	plx
	pla
	sta.b $91
	rtl
