; HeapCompactBank for both banks
HeapCompact:
	pha
	phx
	phy
	lda.w #$007E
	sta.b p0+2
	stz.b p0
	ldy.w HeapStart7E
	jsr.w HeapCompactBank
	lda.w #$007F
	sta.b p0+2
	stz.b p0
	ldy.w HeapStart7F
	jsr.w HeapCompactBank
	ply
	plx
	pla
	rtl
