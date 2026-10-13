; Unidentified routine.
CODE_9DAEC9:
	lda.l $7E3460
	beq CODE_9DAF29
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
CODE_9DAEF3:
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
	bne CODE_9DAEF3
CODE_9DAF0E:
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
	bne CODE_9DAF0E
CODE_9DAF29:
	lda.b $A9
	asl a
	tax
	lda.l TeamPlaceNames,x
	sta.b $0C
	lda.w #$009C
	sta.b $0E
	lda.w printx
	pha
	lda.w #$005C
	sta.w $1D59
	lda.w #$9C76
	sta.w $1D5A
	lda.w #$009D
	sta.w $1D5C
	jsl.l CODE_9D9A5C
	pla
	sta.w printx
	plx
	pla
	sta.b $91
	rts
