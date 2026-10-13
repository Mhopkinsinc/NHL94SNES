; Unidentified routine.
Decompress:		; unpack the data at [$0C] to WRAM at [$10] by its format word ($FB10 LZ, $FB46 pairs, $FB30 Huffman,
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
	bne CODE_80C3A0
	jsr.w DecompressLZ
	bra CODE_80C3C5
