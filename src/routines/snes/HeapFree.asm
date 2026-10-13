; free bytes of both heaps in X:A
HeapFree:		; free bytes of both heaps in X:A
	stz.b $14
	stz.b $16
	stz.b $0C
	lda.w #$007E
	sta.b $0E
	ldy.w HeapStart7E
	jsr.w HeapFreeBank
	lda.w #$007F
	sta.b $0E
	ldy.w HeapStart7F
	jsr.w HeapFreeBank
	ldx.b $16
	lda.b $14
	rtl
