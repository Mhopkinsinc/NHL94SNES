; Unidentified routine.
DecompressRLE:		; run-length data at Y to WRAM: literal runs and repeats, of bytes if its header word is $0101,
		;   else of byte pairs
	iny
	iny
	iny
	lda.w $0000,y
	iny
	cmp.w #$0101
	bne CODE_80C32F
	lda.w #$0000
	sep #$20
	bra CODE_80C313
