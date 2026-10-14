; unpack the data at [$0C] to WRAM at [$10] by its format word ($FB10 LZ, $FB46 pairs, $FB30 Huffman,
Decompress:
		;   $FB7A run-length); X = the unpacked size from the header, or 1 for an unknown format
	php
	phb
	rep #$30
	jsl.l WaitDMAQueue
	lda.b $11
	sta.w WMADDM
	lda.b $10
	sta.w WMADDL
	lda.b $0D
	pha
	plb
	plb
	ldy.b $0C
	lda.w $0003,y
	xba
	pha
	lda.w $0000,y
	iny
	iny
	cmp.w #$FB10
	bne .t3
	jsr.w DecompressLZ
	bra .t4

.t3:
	cmp.w #$FB46
	bne .t1
	jsr.w DecompressPairs
	bra .t4

.t1:
	cmp.w #$FB30
	bne .t2
	jsr.w DecompressHuffman
	bra .t4

.t2:
	cmp.w #$FB7A
	bne .t1x
	jsr.w DecompressRLE
	bra .t4

.t1x:
	plx
	ldx.w #$0001
	plb
	plp
	rtl

.t4:
	rep #$30
	plx
	plb
	plp
	rtl
