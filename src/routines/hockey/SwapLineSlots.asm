; Swap line slot bytes d0+2 and d0+4
SwapLineSlots:
	lda.b d0
.1:
	inc a
	inc a
	sta.b a3
	jsr.w ReadLineSlot
	sta.w lineswap
	inc.b a3
	inc.b a3
	jsr.w ReadLineSlot
	dec.b a3
	dec.b a3
	jsr.w WriteLineSlot
	inc.b a3
	inc.b a3
	lda.w lineswap
	jsr.w WriteLineSlot
	rts
; A = the byte at [a3]
ReadLineSlot:
	sep #$20
	lda.b [a3]
	rep #$20
	and.w #$00FF
	rts
