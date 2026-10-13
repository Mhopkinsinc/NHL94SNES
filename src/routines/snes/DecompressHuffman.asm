; Unidentified routine.
DecompressHuffman:	; Huffman data at [$0C] to WRAM at [$10]
	sep #$10
	lda.b $0C
	clc
	adc.w #$0005
	sta.b $0C
	lda.b ($0C)
	sta.b $73
	inc.b $0C
	lda.b ($0C)
	inc.b $0C
	inc.b $0C
	xba
	sta.b $6C
	ldy.b #$08
	stz.b $77
	stz.b $75
	lda.w #$0010
	sta.b $14
	ldx.b #$FE
CODE_80BBD9:
	inx
	inx
	dec.b $14
	asl.b $75
	lda.b $75
	sec
	sbc.b $77
	sta.w $0720,x
	jsr.w CODE_80C1B0
	sta.w $0700,x
	clc
	adc.b $77
	sta.b $77
	lda.b $6F
	clc
	adc.b $75
	sta.b $75
	lda.b $6F
	bne CODE_80BC02
	stz.w $0740,x
	bra CODE_80BBD9
