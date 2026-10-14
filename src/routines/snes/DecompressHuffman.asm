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
	bne .t1
	stz.w $0740,x
	bra CODE_80BBD9

.t1:
	lda.b $75
	sta.b $00
	lda.b $14
	clc
	beq .1
.loop:
	asl.b $00
	dec a
	bne .loop
.1:
	lda.b $00
	sta.w $0740,x
	bcc CODE_80BBD9
	txa
	lsr a
	sta.b $79
	ldx.b #$3E
.loop2:
	stz.w $0500,x
	stz.w $0540,x
	stz.w $0580,x
	stz.w $05C0,x
	dex
	dex
	bpl .loop2
	ldx.b #$7E
	stx.w WMADDH
	lda.w #$0100
	sta.w WMADDL
	ldx.b #$FF
.loop3:
	jsr.w CODE_80C1B0
	sep #$20
	inc a
.loop4:
	inx
	bit.w $0500,x
	bmi .loop4
	dec a
	bne .loop4
	dec.w $0500,x
	rep #$20
	stx.w WMDATA
	dec.b $77
	bne .loop3
	tya
	asl a
	sta.b $71
	sep #$20
	ldx.b #$00
	txy
	stz.b $7B
CODE_80BC60:
	stx.b $00
	lda.b $7B
	asl a
	tax
	cpx.b #$10
	beq CODE_80BCBF
	lda.w $0700,x
	sta.b $77
	ldx.b $7B
	lda.l DATA8_80BC7B,x
	sta.b $7D
	ldx.b $00
	bra CODE_80BCB1
