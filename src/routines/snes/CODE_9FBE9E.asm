; Unidentified routine.
CODE_9FBE9E:
	ldy.w #$0000
	lda.w #$009A
	sta.b $93
	lda.w #$E9A3
	sta.b a2
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	asl a
	adc.w printm
	tax
	lda.w #$0009
	sta.b tmp0
	sta.b tmp1
CODE_9FBEC2:
	lda.b [a2],y
	clc
	adc.l $7E35CE
	clc
	adc.l printfontset
	clc
	adc.b $14
	sta.l textmap,x
	iny
	iny
	inx
	inx
	dec.b tmp0
	bne CODE_9FBEC2
CODE_9FBEDD:
	lda.b [a2],y
	clc
	adc.l $7E35CE
	clc
	adc.l printfontset
	clc
	adc.b $14
	sta.l $7E3822,x
	iny
	iny
	inx
	inx
	dec.b tmp1
	bne CODE_9FBEDD
CODE_9FBEF8:
	plx
	pla
	sta.b a2
	rtl
