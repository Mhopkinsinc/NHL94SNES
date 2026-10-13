; Unidentified routine.
; The heap. Each bank holds a chain of blocks from HeapStart7E / HeapStart7F up to $FFF8. A block is a header of words
; (size, flags, next, previous) and its data. Flags 0 = free, bit 15 = used, bit 14 = locked (compaction does not move it).
; Callers keep handles: HandleTable entries that point at the data, so blocks can move.
HeapInit:		; start the heaps at X in bank $7E (at least $E68C) and Y in bank $7F: one free block each, all handles free
	cpx.w #$E68C
	bcs .base
	ldx.w #$E68C
.base:
	stx.w HeapStart7E
	sty.w HeapStart7F
	lda.w #$FFFF
	sta.l $7E0006,x
	lda.w #$0000
	sta.l $7E0004,x
	sta.l $7E0002,x
	lda.w #$FFF8
	sec
	sbc.w HeapStart7E
	sta.l $7E0000,x
	tyx
	lda.w #$FFFF
	sta.l $7F0006,x
	lda.w #$0000
	sta.l $7F0004,x
	sta.l $7F0002,x
	lda.w #$FFF8
	sec
	sbc.w HeapStart7F
	sta.l $7F0000,x
	ldx.w #$00FE
	lda.w #$0000
.clear:
	sta.l HandleTable,x
	dex
	dex
	bpl .clear
	rtl
