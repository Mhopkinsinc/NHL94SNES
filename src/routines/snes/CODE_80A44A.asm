; Unidentified routine.
CODE_80A44A:
	lda.w APUIO0
	bne CODE_80A44A
	lda.b $5B
	sta.w APUIO2
	sty.w APUIO1
	lda.b #$0C
	sta.w APUIO0
.loop:
	cmp.w APUIO0
	bne .loop
	stz.w APUIO0
	rts
