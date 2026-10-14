; Swap line slot bytes d0+2 and d0+4
SwapLineSlots:
	lda.b d0
.1:
	inc a
	inc a
	sta.b a3
	jsr.w ReadLineSlot
	sta.w $1D93
	inc.b a3
	inc.b a3
	jsr.w ReadLineSlot
	dec.b a3
	dec.b a3
	jsr.w WriteLineSlot
	inc.b a3
	inc.b a3
	lda.w $1D93
	jsr.w WriteLineSlot
	rts

ReadLineSlot:
	sep #$20
	lda.b [a3]
	rep #$20
	and.w #$00FF
	rts
