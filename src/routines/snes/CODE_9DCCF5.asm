; Unidentified routine.
CODE_9DCCF5:
	sta.w $1DED
	stx.w $1DEF
	lda.w #$00C4
	sta.w $07D4
	lda.w #$CD0F
	ldx.w #$009D
	ldy.w $1DED
	jsl.l SetIRQ
	rtl
	sep #$20
	lda.b #$FC
	sta.w BG1HOFS
	lda.b #$FF
	sta.w BG1HOFS
	lda.b #$FB
	sta.w BG1VOFS
	lda.b #$FF
	sta.w BG1VOFS
	rep #$20
	lda.w #$CD34
	sta.w $078F
	lda.w $1DEF
	sta.w VTIMEL
	rtl
	sep #$20
	stz.w BG1HOFS
	stz.w BG1HOFS
	lda.b #$FF
	sta.w BG1VOFS
	sta.w BG1VOFS
	rep #$20
	lda.w #$CD0F
	sta.w $078F
	lda.w $1DED
	sta.w VTIMEL
	rtl
