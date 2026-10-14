; Unidentified routine.
SPCIPLUpload:		; send the stream at [$0C] through the boot loader: blocks of length, sound RAM address and data;
		;   length 0 ends it with the start address
	rep #$30
	ldy.w #$0000
	lda.w #$BBAA
.loop:
	cmp.w APUIO0
	bne .loop
	sep #$20
	lda.b #$CC
	bra CODE_80AEB4
