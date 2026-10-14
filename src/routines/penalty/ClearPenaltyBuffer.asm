; Clear the list of called penalties
ClearPenaltyBuffer:
	lda.w #$001F
	sta.b d0
	lda.w #$0000
	sta.b a0+2
	lda.w #PenBuf
	sta.b a0
.loop:
	lda.w #$0000
	sta.b [a0]
	inc.b a0
	inc.b a0
	dec.b d0
	bpl .loop
	rtl
