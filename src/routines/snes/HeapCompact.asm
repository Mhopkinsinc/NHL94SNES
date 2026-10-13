; Unidentified routine.
HeapCompact:		; HeapCompactBank for both banks
	pha
	phx
	phy
	lda.w #$007E
	sta.b $0E
	stz.b $0C
	ldy.w HeapStart7E
	jsr.w HeapCompactBank
	lda.w #$007F
	sta.b $0E
	stz.b $0C
	ldy.w HeapStart7F
	jsr.w HeapCompactBank
	ply
	plx
	pla
	rtl
